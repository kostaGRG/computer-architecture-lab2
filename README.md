### Computer Architecture: Lab 2

#### Μέρος 1
1) Για να βρούμε τις ζητούμενες παραμέτρους, χρησιμοποιήσαμε τα αρχεία stats.txt που δημιουργήθηκαν κατά την εκτέλεση των προσομοιώσεων και συγκεκριμένα τις εξής γραμμές:
1. sim_insts για τον αριθμό των εντολών που προσομοιώθηκαν
2. system.cpu.committedInsts για τον αριθμό των εντολών που καταχωρήθηκαν
3. system.cpu.dcache.replacements για το πλήθος των block replacements της L1 Data Cache.
4. system.l2.overall_accesses::total για το πλήθος των προσβάσεων στην L2 cache.
5. sim_seconds για τον χρόνο που διήρκησε η προσομοίωση στον επεξεργαστή της προσομοίωσης
6. system.cpu.cpi για το CPI της προσομοίωσης
7. system.cpu.dcache.overall_miss_rate::total για το miss rate της L1 Data Cache.
8. system.cpu.icache.overall_miss_rate::total για το miss rate της L1 Instruction Cache.
9. system.l2.overall_miss_rate::total για το miss rate της L2 Cache.

Σχηματίζουμε λοιπόν τον παρακάτω πίνακα με βάση τα αποτελέσματα των προσομοιώσεων:

| |SPECBZIP|SPECMCF|SPECHMMER|SPECSJENG|SPECLIBM|
|:-----------:|:---------:|:----------:|:----------:|:-----:|:-----:|
|simulated instructions|100000000|100000000|	|100000000|100000000|
|committed instructions|100000000|100000000|	|100000000|100000000|
|L1 data cache replacements|681759|55092|	|5262346|1486606|
|L2 accesses|683562|190604|	|5264008|1488197|
|simulation seconds|0.058458|0.000058|	|0.513833|0.174763|
|CPI|1.673271|1.169160|	|10.276660|3.495270|
|L1 data cache miss rate|0.014311|0.002124|	|0.121831|0.060971|
|L1 instruction cache miss rate|0.000076|0.004844|	|0.000015|0.000094|
|L2 miss rate|0.295248|0.209015|	|0.999978|0.999943|
