### Computer Architecture: Lab 2

#### Μέρος 1
1) Για να βρούμε τις ζητούμενες παραμέτρους, χρησιμοποιήσαμε τα αρχεία stats.txt που δημιουργήθηκαν κατά την εκτέλεση των προσομοιώσεων και συγκεκριμένα τις εξής γραμμές:
1. _sim_insts_ για τον αριθμό των εντολών που προσομοιώθηκαν
2. _system.cpu.committedInsts_ για τον αριθμό των εντολών που καταχωρήθηκαν
3. _system.cpu.dcache.replacements_ για το πλήθος των block replacements της L1 Data Cache.
4. _system.l2.overall_accesses::total_ για το πλήθος των προσβάσεων στην L2 cache.
5. _sim_seconds_ για τον χρόνο που διήρκησε η προσομοίωση στον επεξεργαστή της προσομοίωσης
6. _system.cpu.cpi_ για το CPI της προσομοίωσης
7. _system.cpu.dcache.overall_miss_rate::total_ για το miss rate της L1 Data Cache.
8. _system.cpu.icache.overall_miss_rate::total_ για το miss rate της L1 Instruction Cache.
9. _system.l2.overall_miss_rate::total_ για το miss rate της L2 Cache.

Σχηματίζουμε λοιπόν τον παρακάτω πίνακα με βάση τα αποτελέσματα των προσομοιώσεων: (πίνακας 1)

| |SPECBZIP|SPECMCF|SPECSJENG|SPECLIBM|
|:-----------:|:---------:|:----------:|:-----:|:-----:|
|simulated instructions|100000000|100000000|100000000|100000000|
|committed instructions|100000000|100000000|100000000|100000000|
|L1 data cache replacements|681759|55092|5262346|1486606|
|L2 accesses|683562|190604|5264008|1488197|
|simulation seconds|0.083664|0.058458|0.513833|0.174763|
|CPI|1.673271|1.169160|10.276660|3.495270|
|L1 data cache miss rate|0.014311|0.002124|0.121831|0.060971|
|L1 instruction cache miss rate|0.000076|0.004844|0.000015|0.000094|
|L2 miss rate|0.295248|0.209015|0.999978|0.999943|

Α) Σύμφωνα με τα στοιχεία του παραπάνω πίνακα, βρήκαμε ίδιο αριθμό committed και simulated instructions.  
Β) Στον προηγούμενο πίνακα φαίνεται το πλήθος των αντικαταστάσεων στην L1 data cache, όπου έχει τη μεγαλύτερη τιμή στο benchmark specsjeng.
Γ) Ο αριθμός των προσβάσεων στην L2 cache θα μπορούσε να υπολογιστεί και από την πρόσθεση των icache misses και dcache misses, δηλαδή τον αριθμό των συνολικών misses στην L1 cache.

2) Για τα παραπάνω benchmarks δημιουργήθηκαν γραφήματα για:  
i) τον χρόνο εκτέλεσης
ii) CPI
iii) miss rates

![Simulation seconds](./images/partA/sim_seconds.png)
![CPI](./images/partA/CPI.png)
![Miss rates](./images/partA/miss_rates.png)



3) Επιλέξαμε να τρέξουμε το benchmark specmcf με την επιπλέον παράμετρο --cpu-clock=1.5GHz. Έπειτα πήγαμε στα αρχεία stats.txt για την αρχική αλλά και για την αλλαγμένη προσομοίωση και πήραμε τα αποτελέσματα που φαίνονται στον επόμενο πίνακα για τις τιμές των system.clk_domain.clock και cpu_cluster.clk_domain.clock:

|	|CPU FREQ:DEFAULT|CPU FREQ:1.5GHz|
|:----:|:----:|:-----:|
|SYSTEM CLOCK|1000|1000|
|CPU CLOCK|500|667|

>Οι τιμές στον παραπάνω πίνακα είναι μετρημένες σε ticks per clock period. (1 tick = 1ms)

* Εύκολα γίνεται αντιληπτό πως η παραπάνω παράμετρος επηρεάζει μόνο το cpu clock. Η ταχύτητα του ρολογιού του επεξεργαστή αυξήθηκε κατα 33.3%.
* Προσθέτοντας και δεύτερο επεξεργαστή, λογικά θα πρέπει να αποκτήσει συχνότητα ίση με 1,5GHz, εφόσον το έχουμε τοποθετήσει ως παράμετρο.

Προσομοιώνοντας κάθε benchmark με τη καινούρια συχνότητα προκύπτει ο παρακάτω πίνακας με τους χρόνους εκτέλεσης πριν και μετά την αλλαγή:
| |SPECBZIP|SPECMCF|SPECSJENG|SPECLIBM|
|:-----------:|:---------:|:----------:|:-----:|:-----:|
|CPU FREQ:DEFAULT|0.0838|0.0555|0.5138|0.1748|
|CPU FREQ:1.5GHz|0.1096|0.0733|0.5821|0.2051|
|PERCENTAGE OF TIME'S INCREASE|30.79%|32.07%|13.29%|17.33%|

Το scaling όπως μας δείχνει ο προηγούμενος πίνακας δεν είναι τέλειο. Σε ορισμένα benchmarks πλησιάζει το τέλειο scaling(specbzip,specmcf)
ενώ σε άλλα απέχει πολύ(specsjeng,speclibm). Μία πιθανή εξήγηση για το γεγονός πως το scaling είναι ατελές θα  μπορούσε να είναι το μεγάλο miss rate στη L2 cache σε αυτά τα benchmarks, 0.999979 και 0.999927 αντίστοιχα, γεγονός που οδηγεί σε  πολλές καθυστερήσεις του επεξεργαστή εξαιτίας των προσπελάσεων στη μνήμη.

#### Μέρος 2
Για να γίνουν τα παρακάτω διαγράμματα έγιναν πολλές προσομοιώσεις αλλάζοντας κάθε φορά μια παράμετρο (σύνολο 6 παράμετροι) και κρατώντας τις υπόλοιπες σταθερές, για κάθε ένα από τα 5 διαφορετικά benchmarks. Οι τιμές που δοκιμάσαμε ήταν οι εξής:
L1 data cache size = 32kB, 64kB, 128kB, 256kB
L1 instruction cache size = 32kB, 64kB, 128kB, 256kB
L2 cache size = 256kB, 512kB, 1MB, 2MB, 4MB
L1 data cache associativity = 1, 2, 4
L1 instruction cache associativity = 1, 2, 4
L2 cache associativity = 1, 2, 4

1. Για το benchmark **specbzip** προέκυψαν τα εξής διαγράμματα:

![SPECBZIP cache sizes](./images/partB/specbzip/cache_sizes.png)
![SPECBZIP associativities](./images/partB/specbzip/associativities.png)

2. Για το benchmark **specmcf**:

![SPECMCF cache sizes](./images/partB/specmcf/cache_sizes.png)
![SPECMCF associativities](./images/partB/specmcf/associativities.png)

3. Για το benchmark **speclibm** προέκυψαν τα εξής διαγράμματα:

![SPECLIBM cache sizes](./images/partB/speclibm/cache_sizes.png)
![SPECLIBM associativities](./images/partB/speclibm/associativities.png)

4. Για το benchmark **specsjeng**:

![SPECSJENG cache sizes](./images/partB/specsjeng/cache_sizes.png)
![SPECSJENG associativities](./images/partB/specsjeng/associativities.png)


#### Μέρος 3
Προσπαθήσαμε σε αυτό το σημείο να υπολογίσουμε μια συνάρτηση κόστους για τη κάθε δυνατή επιλογή.
* Η L1 cache έχει διαφορετικές απαιτήσεις συγκριτικά με την L2 cache. Πιο συγκεκριμένα, η L1 cache θέλουμε να είναι πολύ γρήγορη και περιορισμένη σε φυσικό χώρο καθώς βρίσκεται στον επεξεργαστή. Η L2 cache από την άλλη μπορεί να καταλαμβάνει μεγαλύτερο χώρο, οπότε έχει και μεγαλύτερη χωρητικότητα, ωστόσο οι απαιτήσεις σε ταχύτητα προσπέλασης είναι μικρότερες.
* Ένας συμβιβασμός που μπορούμε να κάνουμε είναι να θεωρήσουμε ως μονάδα κόστους την 32kB L2 direct mapped cache memory (one-way associative) και επίσης πως για την ίδια χωρητικότητα, η L1 cache έχει 4 φορές μεγαλύτερο κόστος. Έτσι για παράδειγμα αν χρησιμοποιήσουμε στο σύστημα μας 64kB L1 cache 1-way associative και 256kB L2 cache 1-way associative το συνολικό κόστος θα είναι: Κ = 8+8=16.
* Όσο αυξάνουμε το associativity αυξάνουμε και το κόστος της μνήμης, καθώς η πολυπλοκότητα του σχεδιασμού της μεγαλώνει. Θα κάνουμε λοιπόν την υπόθεση πως το κόστος αυξάνει ανάλογα, δηλαδή μία  4-way associative memory έχει τετραπλάσιο κόστος απότι μια 1-way.
* Λαμβάνοντας υπόψη όλα τα παραπάνω μπορούμε να καταλήξουμε στον εξής τύπο:
Κ = 4*N\_L1I*ASSOC\_L1I + 4*N\_L1D*ASSOC\_L1D + N\_L2*ASSOC\_L2
όπου:
-->Ν\_L1I = SIZE\_L1I/32 και ούτω καθεξής.

Εφόσον έχουμε τη συνάρτηση κόστους θα προσπαθήσουμε να επιλέξουμε το κατάλληλο configuration με βάση και τα προηγούμενα γραφήματα. Σχηματίζουμε τον παρακάτω πίνακα, όπου στην προτελευταία γραμμή υπολογίζουμε το κόστος των επιλογών και στην τελευταία γραμμή είναι το CPI που προκύπτει:

| |SPECBZIP|SPECMCF|SPECSJENG|SPECLIBM|
|:-----------:|:---------:|:----------:|:-----:|:-----:|
|L1 data cache size|	|	|128kB|32 kB|
|L1 instruction cache size|	|	|64kB|64 kB|
|L2 cache size|	|	|512kB|256 kB|
|L1 data cache associativity|	|	|1|2|
|L1 instruction cache associativity|	|	|1|1|
|L2 cache associativity|	|	|1|1|
|cache line size|	|	|256|256|
|cost|	|	|40|24|
|CPI|	|	|5.181|1.655|

#### Πηγές
[Cache memory cost](https://superuser.com/questions/808830/why-is-cache-memory-so-expensive.com)
[Cache memory sizes](https://stackoverflow.com/questions/4666728/why-is-the-size-of-l1-cache-smaller-than-that-of-the-l2-cache-in-most-of-the-pro.com)
[Set associative cache](https://www.sciencedirect.com/topics/computer-science/set-associative-cache.com)

