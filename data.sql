use groupdb;

insert into role(id,role_name) values
(null,'ROLE_ADMIN'),
(nULL,'ROLE_USER');

--email->password
--admin@admin.com->admin
--user@user.com->user
insert into user(id,email,password,first_name,last_name,phone,enabled) values
(null,'admin@admin.com','$2y$10$JhDukeSeGX6DbYDTCXB5welaXEzGnB/tpDPkCj6GjPOpJmVcs11Ua','admin','admin','1234567890',1),
(null,'user@user.com','$2y$10$EvjTZTzs/eC/F7NubZFANOnN2nFOUoLdobIGbmrTVCtA0KjcWpnzm','user','user','1234567890',1);

insert into user_role(user_id,role_id) values (1,1),(2,2);

insert into brand values
(null,'Dell'),
(null,'HP'),
(null,'Asus'),
(null,'Xiaomi'), 
(null,'Samsung'), 
(null,'Nokia'),
(null,'JBL'),
(null,'Sony');

insert into category values
(null,'PC'), 
(null,'Laptop'), 
(null,'Mobile'), 
(null,'Mouse'), 
(null,'Keyboard'),
(null,'Headphone');

insert into product(id,name,description,price,stock,brand_id,category_id) values
-- pc Dell
(null,'Dell Inspiron 3881 MT (i5-10400/8GB/1TB + 256GB/W10 Pro)','CPU: 2.9GHz, DDR4, 256GB SSD + 1TB HDD, Γραφικά: Intel UHD Graphics 630',619,15,1,1),
(null,'Dell Optiplex 3080 MT (i3-10100/8GB/256GB/W10 Pro)','CPU: 3.6GHz, DDR4, 256GB SSD, Γραφικά: Intel UHD Graphics 630',540,6,1,1),
(null,'Dell Vostro 3888 MT (i5-10400/8GB/256GB/W10 Pro)','CPU: 2.9GHz, DDR4, 256GB SSD, Γραφικά: Intel UHD Graphics 630',563.50,4,1,1),
(null,'Dell Vostro 3888 MT (i5-10400/8GB/512GB/W10 Pro)','CPU: 2.9GHz, DDR4, 512GB SSD, Γραφικά: Intel UHD Graphics 630',643.70,8,1,1),
(null,'Dell OptiPlex 3080 MT (i5-10505/8GB/512GB/W10 Pro)','CPU: 3.2GHz, DDR4, 512GB SSD, Γραφικά: Intel UHD Graphics 630',731.80,3,1,1),
-- pc HP
(null,'HP ProDesk 400 G7 MT (i7-10700/16GB/512GB/W10)','CPU: 2.9GHz, DDR4, 512GB SSD, Γραφικά: Intel UHD Graphics 630',782,10,2,1),
(null,'HP ProDesk 400 G7 MT (i5-10500/16GB/512GB/W10)','CPU: 3.1GHz, DDR4, 512GB SSD, Γραφικά: Intel UHD Graphics 630',639,10,2,1),
(null,'HP ProDesk 400 G7 MT (i3-10100/8GB/256GB/W10)','CPU: 3.6GHz, DDR4, 256GB SSD, Γραφικά: Intel UHD Graphics 630',499,10,2,1),
(null,'HP 295 G6 (Ryzen 3-3200G/8GB/256GB/No OS)','CPU: 3.60GHz, DDR4, 256GB SSD, Γραφικά: AMD Radeon Vega 8',311,10,2,1),
(null,'HP Pro 300 G6 MT (i5-10400/8GB/256GB/W10 Pro)','CPU: 2.9GHz, DDR4, 256GB SSD, Γραφικά: Intel UHD Graphics 630',534.90,10,2,1),
-- pc Asus
(null,'Asus ExpertCenter D500MA (i3-10100/4GB/256GB/No OS)','CPU: 3.6GHz, DDR4, 256GB SSD, Γραφικά: Intel UHD Graphics 630',420,10,3,1),
(null,'Asus ExpertCenter D500MAES (i5-10400/8GB/256GB/W10 Pro)','CPU: 2.9GHz, DDR4, 256GB SSD, Γραφικά: Intel UHD Graphics 630',606,10,3,1),
(null,'Asus ExpertCenter D500MAES (i3-10100/8GB/256GB/W10 Pro)','CPU: 3.6GHz, DDR4, 256GB SSD, Γραφικά: Intel UHD Graphics 630',559,10,3,1),
(null,'Asus ROG Strix G10DK-21202T (Ryzen 5-5600X/8GB/1TB + 512GB/GeForce GTX 1660/W10','CPU: 3.7GHz, DDR4, 512GB SSD + 1TB HDD, Γραφικά: nVidia GeForce GTX ',1190,10,3,1),
(null,'Asus ExpertCenter D500MAES-7107000050 (i7-10700/8GB/512GB/No OS)','CPU: 2.90GHz, DDR4, 512GB SSD, Γραφικά: Intel UHD Graphics 630',727,10,3,1),
-- laptop Dell
(null,'Dell Inspiron 3505 (Ryzen 5-3450U/12GB/1TB + 256GB/FHD/W10 S)','Notebook, 15.6" IPS Panel 1920x1080, Touchscreen, CPU: AMD Ryzen 5',739,10,1,2),
(null,'Dell Vostro 3500 (i5-1135G7/8GB/256GB/FHD/W10 Pro) GR Keyboard','Notebook, 15.6" 1920x1080, CPU: Intel Core i5 2.4GHz, RAM: 8GB, 256GB',745.30,10,1,2),
(null,'Dell Vostro 5502 (i7-1165G7/16GB/512GB/GeForce MX330/FHD/W10 Pro)','Notebook, 15.6" 1920x1080, CPU: Intel Core i7 2.8GHz, RAM: 16GB, 512GB',1149,10,1,2),
(null,'Dell Inspiron 5505 (Ryzen 7-4700U/8GB/256GB/FHD/W10)','Notebook, 15.6" 1920x1080, CPU: AMD Ryzen 7 2GHz, RAM: 8GB,',707,10,1,2),
(null,'Dell Inspiron 5406 (i7-1165G7/16GB/512GB/FHD/W10 Pro) Gray','2 in 1 Convertible, 14" IPS Panel 1920x1080, Touchscreen, CPU: Intel',1049,10,1,2),
-- laptop HP
(null,'HP 255 G8 (Ryzen 5-3500U/8GB/256GB/FHD/No OS)','Notebook, 15.6" 1920x1080, CPU: AMD Ryzen 5 2.1GHz, RAM: 8GB, 256GB SSD, GPU: AMD Radeon',575,10,2,2),
(null,'HP 14s-fq0003nv (Athlon-3020e/4GB/128GB/FHD/W10 S) GR Keyboard','Notebook, 14" 1920x1080, CPU: AMD Athlon 1.2GHz, RAM: 4GB, 128GB',322,10,2,2),
(null,'HP 255 G8 (Ryzen 5-3500U/8GB/256GB/FHD/W10 Home) GR Keyboard Silver','Notebook, 15.6" IPS Panel 1920x1080, CPU: AMD Ryzen 5 2.1GHz, RAM: 8G',649,10,2,2),
(null,'HP Pavilion 15-cs3153cl (i5-1035G1/12GB/512GB/Full HD / Touchscreen/W10)','Notebook, 15.6" IPS Panel 1920x1080, Touchscreen, CPU: Intel Core i5 1GHz',695,10,2,2),
(null,'HP 255 G8 (Ryzen 3-3250U/8GB/256GB/FHD/W10) GR Keyboard Silver','Notebook, 15.6" IPS Panel 1920x1080, CPU: AMD Ryzen 3 2.6GHz, RAM:8GB',563.87,10,2,2),
-- laptop Asus
(null,'Asus VivoBook R564JA-UH51T (i5-1035G1/8GB/256GB/FHD/W10s) US Keyboard','Notebook, 15.6" 1920x1080, Touchscreen, CPU: Intel Core i5 1GH',601.10,10,3,2),
(null,'Asus TUF Gaming FX506LI-BI5N5 (i5-10300H/8GB/256GB/GeForce GTX 1650 Ti/FHD/W10) ','Gaming, 15.6" 1920x1080, CPU: Intel Core i5 2.5GHz, RAM: 8GB, 256GB',1119,10,3,2),
(null,'Asus VivoBook 15 X512DA-EJ121T (Ryzen 5-3500U/8GB/512GB/FHD/W10) US Keyboard','Notebook, 15.6" 1920x1080, CPU: AMD Ryzen 5 2.10GHz, RAM: 8GB',589,10,3,2),
(null,'Asus ROG Zephyrus G14 GA401IV-BR9N6 (Ryzen 9-4900HS/16GB/1TB/GeForce','Gaming, 14" 1920x1080, CPU: AMD Ryzen 9 3GHz, RAM: 16GB, 1TB SSD',1488,10,3,2),
(null,'Asus E410MA-EK211 (Celeron-N4020/4GB/256GB/FHD/No OS) Peacock Blue','Notebook, 14" 1920x1080, CPU: Intel Celeron Dual Core 1.1GHz, RAM: 4GB',301.38,10,3,2),
-- mobile Xiaomi
(null,'Xiaomi Poco X3 Pro (128GB) Phantom Black','Μοντέλο: 2021, Οθόνη: IPS 6.67", RAM: 6GB, 5160mAh',199.99,10,4,3),
(null,'Xiaomi Poco F3 (128GB) Night Black','Μοντέλο: 2021, Οθόνη: AMOLED 6.67", RAM: 6GB, 4520mAh',302.61,10,4,3),
(null,'Xiaomi Poco X3 Pro (256GB) Phantom Black','Μοντέλο: 2021, Οθόνη: IPS 6.67", RAM: 8GB, 5160mAh',235,10,4,3),
(null,'Xiaomi Poco X3 NFC (128GB) Shadow Gray','Μοντέλο: 2020, Οθόνη: IPS 6.67", RAM: 6GB, 5160mAh',209,10,4,3),
(null,'Xiaomi Mi Note 10 Lite (64GB) Midnight Black','Μοντέλο: 2020, Οθόνη: AMOLED 6.47", RAM: 6GB, 5260mAh',351.72,10,4,3),
-- mobile Samsung
(null,'Samsung Galaxy S21 Ultra 5G (256GB) Phantom Black','Μοντέλο: 2021, Οθόνη: Super AMOLED 6.8", RAM: 12GB, 5000mAh',1086.74,10,5,3),
(null,'Samsung Galaxy A21s (32GB) Black','Μοντέλο: 2020, Οθόνη: IPS 6.5", RAM: 3GB, 5000mAh',149.86,10,5,3),
(null,'Samsung Galaxy S21 Ultra 5G (128GB) Phantom Black','Μοντέλο: 2021, Οθόνη: Super AMOLED 6.8", RAM: 12GB, 5000mAh',994.96,10,5,3),
(null,'Samsung Galaxy S21 Ultra 5G (128GB) Phantom Silver','Μοντέλο: 2021, Οθόνη: Super AMOLED 6.8", RAM: 12GB, 5000mAh',1024.44,10,5,3),
(null,'Samsung Galaxy A12 (128GB) Black','Μοντέλο: 2020, Οθόνη: PLS TFT LCD 6.5", RAM: 4GB, 5000mAh',171.58,10,5,3),
-- mobile Nokia
(null,'Nokia 8.3 (64GB) Polar Night','Μοντέλο: 2020, Οθόνη: IPS 6.81", RAM: 6GB, 4500mAh',519.80,10,6,3),
(null,'Nokia 105 (2019) Black','Μοντέλο: 2019, Οθόνη: 1.77", 800mAh',17.28,10,6,3),
(null,'Nokia 3.4 (4GB/64GB) Fjord','Μοντέλο: 2020, Οθόνη: IPS 6.39", RAM: 4GB, 4000mAh',142.89,10,6,3),
(null,'Nokia 5.4 (128GB) Polar Night','Μοντέλο: 2021, Οθόνη: IPS 6.39", RAM: 4GB, 4000mAh',183,10,6,3),
(null,'Nokia 5.3 (4GB/64GB) Charcoal','Μοντέλο: 2020, Οθόνη: IPS 6.55", RAM: 4GB, 4000mAh',164.99,10,6,3),
-- mouse HP
(null,'HP Wireless Mouse X200 Ποντίκι Μαύρο','Ασύρματο ποντίκι βάρους 60 γραμμαρίων. Συμβατό με όλους τους υπολογιστές.',6.49,10,2,4),
(null,'HP 300 Dual Mode Ασύρματο Bluetooth Ποντίκι Black','Χάρη στο ασύρματο ποντίκι διπλής λειτουργίας HP Dual Mode 300, μπορείτε να συνδέσετε δύο υπολογιστές εύκολα μέσω Bluetooth ή ασύρματης σύνδεσης 2,4 GHz. Μεταβείτε εύκολα από τη μία λειτουργία στην άλλη με ένα μόνο κλικ και χειριστείτε μια δεύτερη συσκευή χωρίς να χρειάζεται δεύτερο ποντίκι.',12.99,10,2,4),
(null,'HP 220 Ασύρματο Ποντίκι Λευκό','Κομψό και συμπαγές με πλευρικές λαβές για σταθερό κράτημα, διαθέτει εργονομικό αμφιδέξιο σχεδιασμό για άνετη χρήση είτε από δεξιόχειρες είτε από αριστερόχειρες, ενώ διακρίνεται από εύκολη φορητότητα με τον νανοδέκτη να αποθηκεύεται εντός του ποντικιού για να μην σε προβληματίζει κατά τη μεταφορά του. ',6.48,10,2,4),
(null,'HP Z3700 Ασύρματο Ποντίκι Κόκκινο','Συμβατότητα με όλες τις πλατφόρμες φορητών και επιτραπέζιων υπολογιστών με Windows Vista/7/8/10 και διαθέσιμες θύρες USB.',10.48 ,10,2,4),
(null,'HP 200 Ασύρματο Ποντίκι Κόκκινο','Ασύρματο οπτικό ποντίκι της HP με εργονομικό σχεδιασμό, τεχνολογία Red LED και αιθητήρα με μέγιστη ανάλυση στα 1000 DPI, για ακρίβεια κίνησης σε όλες τις επιφάνειες. Είναι κατάλληλο και για τα 2 χέρια.',9.98,10,2,4),
(null,'HP 220 Ασύρματο Ποντίκι Lumiere Blue','Κομψό και συμπαγές με πλευρικές λαβές για σταθερό κράτημα, διαθέτει εργονομικό αμφιδέξιο σχεδιασμό για άνετη χρήση είτε από δεξιόχειρες είτε από αριστερόχειρες, ενώ διακρίνεται από εύκολη φορητότητα με τον νανοδέκτη να αποθηκεύεται εντός του ποντικιού για να μην σε προβληματίζει κατά τη μεταφορά του.',12.59 ,10,2,4),
(null,'HP Silent 280M Ασύρματο Ποντίκι Μαύρο','Το HP Silent 280M είναι ένα ενσύρματο ποντίκι, το οποίο συνδέεται στον υπολογιστή με USB καλώδιο. Έχει οπτικό αισθητήρα που προσφέρει καλή ακρίβεια και το καθιστά ιδανικό για καθημερινή χρήση. Εφόσον χρησιμοποιηθεί σε γυαλιστερές επιφάνειες (πχ. γυάλινο γραφείο), είναι απαραίτητη η χρήση mousepad.',24.98,10,2,4),
(null,'HP 6SP30AA Ασύρματο Bluetooth Ποντίκι Black','Το HP 6SP30AA είναι ένα ενσύρματο ποντίκι, το οποίο συνδέεται στον υπολογιστή απευθείας με Bluetooth ή με dongle (πομποδέκτη) που τοποθετείται στη θύρα USB. Έχει οπτικό αισθητήρα που προσφέρει καλή ακρίβεια και το καθιστά ιδανικό για καθημερινή χρήση. Εφόσον χρησιμοποιηθεί σε γυαλιστερές επιφάνειες (πχ. γυάλινο γραφείο), είναι απαραίτητη η χρήση mousepad.', 22.99,10,2,4),
(null,'HP 220 Ασύρματο Ποντίκι Μαύρο','Κομψό και συμπαγές με πλευρικές λαβές για σταθερό κράτημα, διαθέτει εργονομικό αμφιδέξιο σχεδιασμό για άνετη χρήση είτε από δεξιόχειρες είτε από αριστερόχειρες, ενώ διακρίνεται από εύκολη φορητότητα με τον νανοδέκτη να αποθηκεύεται εντός του ποντικιού για να μην σε προβληματίζει κατά τη μεταφορά του.', 9.99,10,2,4),
(null,'HP Spectre 500 Ασύρματο Bluetooth Ποντίκι Black','Το HP Spectre 500 είναι ένα ενσύρματο ποντίκι, το οποίο συνδέεται στον υπολογιστή απευθείας με Bluetooth ή με dongle (πομποδέκτη) που τοποθετείται στη θύρα USB. Έχει οπτικό αισθητήρα που προσφέρει καλή ακρίβεια και το καθιστά ιδανικό για καθημερινή χρήση. Εφόσον χρησιμοποιηθεί σε γυαλιστερές επιφάνειες (πχ. γυάλινο γραφείο), είναι απαραίτητη η χρήση mousepad.',38 ,10,2,4),
-- mouse Xiaomi
(null,'Xiaomi Mi Dual Mode Ασύρματο Bluetooth Mini Ποντίκι Μαύρο','Το Mi Dual Mode είναι ένα ασύρματο ποντίκι με εργονομικό σχεδιασμό  και εντοπισμό ακρίβειας στα 1300DPI. Επιτρέπει τη χρήση σε δύο υπολογιστές με το πάτημα ενός κουμπιού στο επάνω μέρος του, για εναλλαγή Bluetooth 4.2 και RF χάρη στον USB δέκτη (2.4 GHz) που διαθέτει.',11.57,10,4,4),
(null,'Xiaomi Mi Dual Mode Ασύρματο Bluetooth Mini Ποντίκι Λευκό','Το Mi Dual Mode είναι ένα ασύρματο ποντίκι με εργονομικό σχεδιασμό  και εντοπισμό ακρίβειας στα 1300DPI. Επιτρέπει τη χρήση σε δύο υπολογιστές με το πάτημα ενός κουμπιού στο επάνω μέρος του, για εναλλαγή Bluetooth 4.2 και RF χάρη στον USB δέκτη (2.4 GHz) που διαθέτει.',10.07,10,4,4),
(null,'Xiaomi Mi Mouse Ασύρματο Bluetooth Mini Ποντίκι Gold','Ασύρματο mouse Xiaomi που συνδυάζει κομψότητα και κορυφαία απόδοση.',15.40 ,10,4,4),
(null,'Xiaomi Mi Mouse 2 Black','Το ασύρματο ποντίκι Xiaomi Mi είναι η πιο ταιριαστή παρέα για τον υπολογιστή σας. Παρέχει γρήγορη κύλιση',16.23,10,4,4),
(null,'Xiaomi MWWM01 Ασύρματο Ποντίκι Black','Ασύρματο αθόρυβο φορητό ποντίκι με δέκτη USB. Διαθέτει κουμπί σίγασης, άνετο κράτημα και 3 τρόπους ρύθμισης DPI. Πατενταρισμένο βιδωτό καπάκι, αντιολισθητική υφή. Απλώς συνδέστε το και ξεκινήστε.',12,10,4,4),
(null,'Xiaomi MIIIW MWWM01 Ασύρματο Ποντίκι Black','Βασικά χαρακτηριστικά: Οπτικός αισθητήρας, 3 πλήκτρα, Ασύρματη σύνδεση με δέκτη USB, Βάρος 70gr', 16.90,10,4,4),
(null,'Xiaomi Mi Mouse 2 Ασύρματο Ποντίκι Λευκό','Το ασύρματο ποντίκι Xiaomi Mi είναι η πιο ταιριαστή παρέα για τον υπολογιστή σας. Παρέχει γρήγορη κύλιση',16.23 ,10,4,4),
(null,'Xiaomi Mi Lite Ασύρματο Ποντίκι Wireless','Το Xiaomi Mi Lite είναι ένα ενσύρματο ποντίκι, το οποίο συνδέεται στον υπολογιστή με USB καλώδιο. Έχει οπτικό αισθητήρα που προσφέρει καλή ακρίβεια και το καθιστά ιδανικό για καθημερινή χρήση. Εφόσον χρησιμοποιηθεί σε γυαλιστερές επιφάνειες (πχ. γυάλινο γραφείο), είναι απαραίτητη η χρήση mousepad.', 15,10,4,4),
(null,'Xiaomi Mi Mouse Ασύρματο Bluetooth Mini Ποντίκι Gold - White','Ασύρματο mouse Xiaomi που συνδυάζει κομψότητα και κορυφαία απόδοση.', 18.84,10,4,4),
(null,'Xiaomi Mi Mouse Youth Edition Ασύρματο Mini Ποντίκι Λευκό','Το Xiaomi Mi Mouse Youth Edition είναι ένα ενσύρματο mini ποντίκι, το οποίο συνδέεται στον υπολογιστή με USB καλώδιο. Έχει οπτικό αισθητήρα που προσφέρει καλή ακρίβεια και το καθιστά ιδανικό για καθημερινή χρήση. Εφόσον χρησιμοποιηθεί σε γυαλιστερές επιφάνειες (πχ. γυάλινο γραφείο), είναι απαραίτητη η χρήση mousepad.',16.90 ,10,4,4),
-- keyboard Dell
(null,'Dell KB216 Πληκτρολόγιο Ελληνικό Black','Multimedia keyboard για καθημερινή χρήση στο σπίτι ή στο γραφείο!',11.20,10,1,5),
(null,'Dell KB-522 Πληκτρολόγιο Αγγλικό US','Αυτό το πληκτρολόγιο για επαγγελματική χρήση και πολυμέσα διαθέτει ένα στιβαρό και ανθεκτικό σχεδιασμό καθώς και καπάκια πλήκτρων μεσαίου προφίλ για μια ιδανική εμπειρία πληκτρολόγησης, αθόρυβη λειτουργία, και ανθεκτικότητα στην καθημερινή επαγγελματική χρήση.',17.63,10,1,5),
(null,'Dell KM717 Premier Ασύρματο Σετ Πληκτρολόγιο & Ποντίκι Αγγλικό US','Βελτιώστε την καθημερινή απόδοση και την παραγωγικότητά σας με το ασύρματο πληκτρολόγιο και ποντίκι Dell Premier - KM717, που διαθέτει κομψή σχεδίαση, κατάλληλη για όλους τους χώρους εργασίας. Απολαύστε την ελευθερία να επιλέγετε την ασύρματη σύνδεσή σας μεταξύ Dell Universal Pairing ή Bluetooth LE.',64.26,10,1,5),
(null,'Dell KB216 Πληκτρολόγιο Αγγλικό US Black','Multimedia keyboard για καθημερινή χρήση στο σπίτι ή στο γραφείο!',11.50,10,1,5),
(null,'Dell KB216 Πληκτρολόγιο Αγγλικό US Grey','Multimedia keyboard για καθημερινή χρήση στο σπίτι ή στο γραφείο!',12.90,10,1,5),
(null,'Dell KB216 Πληκτρολόγιο Αγγλικό UK Black','Multimedia keyboard για καθημερινή χρήση στο σπίτι ή στο γραφείο!',18.70,10,1,5),
(null,'Dell KB-522 Πληκτρολόγιο Αγγλικό UK','Αυτό το πληκτρολόγιο για επαγγελματική χρήση και πολυμέσα διαθέτει ένα στιβαρό και ανθεκτικό σχεδιασμό καθώς και καπάκια πλήκτρων μεσαίου προφίλ για μια ιδανική εμπειρία πληκτρολόγησης, αθόρυβη λειτουργία, και ανθεκτικότητα στην καθημερινή επαγγελματική χρήση.',18.83,10,1,5),
(null,'Dell KM636 Ασύρματο Σετ Πληκτρολόγιο & Ποντίκι Αγγλικό US','Το ασύρματο πληκτρολόγιο και το ποντίκι, σχεδιασμένα με κομψές γραμμές, συμπαγή μεγέθη και πλήκτρα chiclet, προσφέρουν μια σύγχρονη και άνετη εμπειρία χρήσης.',25.68,10,1,5),
-- keyboard HP
(null,'HP Pavilion 600 Ασύρματο Πληκτρολόγιο Ελληνικό','Ένα εντυπωσιακό σχέδιο κάνει την εμφάνισή του σε ένα λεπτό ασύρματο πληκτρολόγιο που ταιριάζει απόλυτα στον γρήγορο τρόπο ζωής σας.',31.58,10,2,5),
(null,'HP Pavilion 800 Ασύρματο Σετ Πληκτρολόγιο & Ποντίκι Αγγλικό US','Ένα εντυπωσιακό σχέδιο κάνει την εμφάνισή του στο λεπτό ασύρματο πληκτρολόγιο και ποντίκι που συνδυάζονται άψογα με τις συσκευές σας.',45.78,10,2,5),
(null,'HP Pavilion Wireless Keyboard and Mouse 800 Black','Ένα εντυπωσιακό σχέδιο κάνει την εμφάνισή του στο λεπτό ασύρματο πληκτρολόγιο και ποντίκι που συνδυάζονται άψογα με τις συσκευές σας.',33.85,10,2,5),
(null,'HP Pavilion 600 White Ασύρματο Πληκτρολόγιο Ελληνικό','Ένα εντυπωσιακό σχέδιο κάνει την εμφάνισή του σε ένα λεπτό ασύρματο πληκτρολόγιο που ταιριάζει απόλυτα στον γρήγορο τρόπο ζωής σας.',31.57,10,2,5),
(null,'HP K2500 Ασύρματο Πληκτρολόγιο Ελληνικό','Ασύρματο πληκτρολόγιο συμβατό με Windows, το οποίο παρέχει πλήκτρα έντασης ήχου και λειτουργίες συντομεύσεων για να εκτελείτε γρήγορα καθημερινές εργασίες. Διαθέτει λεπτό προφίλ, άνετη ελαφριά κλίση και πλήρες αριθμητικό πληκτρολόγιο, που το καθιστούν ιδανικό αξεσουάρ για το γραφείο. Συνοδεύεται από plug-and-use USB Nano receiver.',19.39,10,2,5),
(null,'HP K2500 Ασύρματο Πληκτρολόγιο Αγγλικό US','Ασύρματο πληκτρολόγιο συμβατό με Windows, το οποίο παρέχει πλήκτρα έντασης ήχου και λειτουργίες συντομεύσεων για να εκτελείτε γρήγορα καθημερινές εργασίες. Διαθέτει λεπτό προφίλ, άνετη ελαφριά κλίση και πλήρες αριθμητικό πληκτρολόγιο, που το καθιστούν ιδανικό αξεσουάρ για το γραφείο. Συνοδεύεται από plug-and-use USB Nano receiver.',15.99,10,2,5),
(null,'HP 300 Ασύρματο Σετ Πληκτρολόγιο & Ποντίκι Αγγλικό UK','Φέρνει την ασφαλή παραγωγικότητα και την ψυχαγωγία στη διάθεσή σου, τα πλήκτρα ειδικής λειτουργίας, ένα ποντίκι εξαιρετικά υψηλής ακρίβειας και η κρυπτογράφηση δεδομένων που προστατεύει τις πληροφορίες σου. Συνδέονται στον υπολογιστή μέσω ενός κοινού ασύρματου USB δέκτη.',25,10,2,5),
(null,'HP Wired Keyboard and Mouse 160 Σετ Πληκτρολόγιο & Ποντίκι Ελληνικό','Σετ πληκτρολόγιο και ποντίκι με σύνδεση USB.',15.50,10,2,5),
-- headphone JBL
(null,'JBL Tune 500BT Ασύρματα On Ear Ακουστικά Μαύρα','Τα ακουστικά JBL Tune 500BT, σου δίνουν τη δυνατότητα να έχεις δυνατό ήχο για έως και 16 ώρες καθαρής απόλαυσης. Εύκολο στη χρήση, εξοπλισμένο με drivers 32mm της JBL και με καθαρό μπάσο JBL, αυτά τα ακουστικά, σου παρέχουν εξαιρετικό ήχο κάθε φορά. Και αν έχεις εισερχόμενη κλήση ενώ βλέπεις ένα video σε άλλη συσκευή.',33.95,10,7,6),
(null,'JBL Tune 510BT Ασύρματα On Ear Ακουστικά Μαύρα','Βασικά χαρακτηριστικά: On Ear, Bluetooth, Μικρόφωνο, Aπολαμβάνεις το δυναμικό ήχο της JBL χωρίς να χρειάζεσαι καλώδια.',37.69,10,7,6),
(null,'JBL Tune 500 Ενσύρματα On Ear Ακουστικά Μαύρα','Τα ακουστικά JBL Tune500 προσφέρουν ποιότητα και δυναμικό ήχο, για να αδράξεις τη μέρα σου. Έρχονται με επίπεδο καλώδιο που δε μπλέκεται στα χέρια σου. Τα συνδέεις και φεύγεις, για να ξεκινήσεις την πολυάσχολη ημέρα σου.',20.87,10,7,6),
(null,'JBL Tune 600BTNC Ασύρματα On Ear Ακουστικά Μαύρα','Τα ακουστικά JBL Tune 600BTNC προσφέρουν θρυλικό ήχο με πλούσιο και καθαρό μπάσο, διαθέτουν ενεργή ακύρωση θορύβου και ασύρματη σύνδεση μέσω Bluetooth. Με 12 ώρες αυτονομίας μπαταρίας με χρήση Bluetooth & Noise Cancelling.',67.80,10,7,6),
(null,'JBL Tune 700BT Ασύρματα Over Ear Ακουστικά Μαύρα','Με το δυνατό JBL Pure Bass sound, τα JBL Tune 700BT παίζουν έντονο ήχο, ασύρματα. Ελαφρύς over-ear σχεδιασμός για μέγιστη άνεση και εστίαση στον ήχο.',69.90,10,7,6),
(null,'JBL Tune 500BT Ασύρματα On Ear Ακουστικά Μπλε','Τα ακουστικά JBL Tune 500BT, σου δίνουν τη δυνατότητα να έχεις δυνατό ήχο για έως και 16 ώρες καθαρής απόλαυσης. Εύκολο στη χρήση, εξοπλισμένο με drivers 32mm της JBL και με καθαρό μπάσο JBL, αυτά τα ακουστικά, σου παρέχουν εξαιρετικό ήχο κάθε φορά. Και αν έχεις εισερχόμενη κλήση ενώ βλέπεις ένα video σε άλλη συσκευή.',34,10,7,6),
(null,'JBL T460BT Ασύρματα On Ear Ακουστικά Μαύρα','Βασικά χαρακτηριστικά: On Ear, Bluetooth, Μικρόφωνο, Aπολαμβάνεις το δυναμικό ήχο της JBL χωρίς να χρειάζεσαι καλώδια.',32.90,10,7,6),
(null,'JBL Tune 510BT Ασύρματα On Ear Ακουστικά Μπλε','Βασικά χαρακτηριστικά: On Ear, Bluetooth, Μικρόφωνο, Aπολαμβάνεις το δυναμικό ήχο της JBL χωρίς να χρειάζεσαι καλώδια.',37.84,10,7,6),
-- headphone Sony
(null,'Sony WH-1000XM3 Ασύρματα Over Ear Ακουστικά Μαύρα','Τα ακουστικά WH-1000XM3, σου προσφέρουν ακόμα βαθύτερη "σιωπή", με επιπλέον βελτιώσεις στην κορυφαία τεχνολογία εξουδετέρωσης θορύβου της Sony και έξυπνη εμπειρία ακρόασης που προσαρμόζεται στις συνθήκες.',224.90,10,8,6),
(null,'Sony WH-1000XM4 Ασύρματα Over Ear Ακουστικά Μαύρα','Βασικά χαρακτηριστικά: Over-ear, Σύνδεση Bluetooth, Λειτουργία hands-free, Πλήκτρα έντασης/κλήσεων. Με τα ακουστικά Sony WH-1000XM4 απολαμβάνεις λιγότερο θόρυβο και πιο καθαρό ήχο, με έξυπνη τεχνολογία ακρόασης που εξατομικεύει την εμπειρία σου.',289,10,8,6),
(null,'Sony MDR-ZX110 Ενσύρματα On Ear Ακουστικά Μαύρα','Ενσύρματα ακουστικά MDRZX110B.AE με μονάδα οδηγού 30 mm, μαγνήτες νεοδυμίου υψηλής ισχύος που προσφέρουν δυνατό ήχο και μειώνουν το θόρυβο του περιβάλλοντος κατα 95%.',8.94,10,8,6),
(null,'Sony MDR-ZX310 Ενσύρματα On Ear Ακουστικά Μπλε','Ακουστικά κεφαλής ZX Series ενσύρματα με αναδιπλούμενο σχέδιο για απόλυτη φορητότητα.',15.88,10,8,6),
(null,'Sony WH-XB900N Ασύρματα Over Ear Ακουστικά Μαύρα','Διασκέδασε σε ένα πάρτι μόνο για εσένα, με ήχο EXTRA BASS. Με ισχύ για ολόκληρη την ημέρα, ασύρματη τεχνολογία Bluetooth, άνεση πολύωρης ακρόασης και εύκολη καθημερινή χρήση, τα ακουστικά εξουδετέρωσης θορύβου Sony WH-XB900N, σου προσφέρουν την απολαυστική μουσική εμπειρία που αναζητάς.',145.98,10,8,6),
(null,'Sony MDR-XB550AP Ενσύρματα On Ear Ακουστικά Μαύρα','Άφησε τη ροή της μουσικής να σε κατακλύσει, χάρη στην ισχύ του Extra Bass και βυθίσου στα απολαυστικά, δυνατά μπάσα. Η λειτουργία Extra Bass ενισχύει όλες τις χαμηλές συχνότητες για βαθύ, εκστατικό ήχο.',28,10,8,6),
(null,'Sony MDR-XB550AP Ενσύρματα On Ear Ακουστικά Λευκά','Βασικά χαρακτηριστικά: On-ear, Σύνδεση 3.5mm, Λειτουργία hands-free, Περιστρεφόμενες κάψες. Απόλαυσε τη μουσική σου με τα ακουστικά Extra Bass Sony MDR-XB550AP για ατελείωτες ώρες εντυπωσιακού ήχου.',28,10,8,6),
(null,'Sony MDR-ZX310AP Ενσύρματα On Ear Ακουστικά Μαύρα','Τα ακουστικά Sony MDR-ZX310 διαθέτουν άριστη σχέση απόδοσης/τιμής, εξασφαλίζοντας πολύ καλή αναπαραγωγή και την γνωστή αξιοπιστία που διακρίνει τα προϊόντα Sony. Ακουστικά με στήριγμα κεφαλής και φινίρισμα αλουμινίου, διαθέσιμα σε μια ποικιλία χρωμάτων για κάθε γούστο. Καθαρός, πανίσχυρος ήχος με μονάδα οδήγησης νεοδυμίου 30mm.',14.84,10,8,6);

insert into image(id,url,product_id) values
(null,'https://d.scdn.gr/images/sku_images/034939/34939528/20201007140441_408b20f0.jpeg',1),
(null,'https://c.scdn.gr/images/sku_images/034939/34939530/20201007140441_918736e6.jpeg',1),
(null,'https://a.scdn.gr/images/sku_images/034939/34939527/20201007140441_9d6dc329.jpeg',1),

(null,'https://d.scdn.gr/images/sku_main_images/028222/28222841/20210412103329_dell_optiplex_3080_mt_i3_10100_8gb_256gb_w10_pro.jpeg',2),
(null,'https://d.scdn.gr/images/sku_images/044186/44186390/20210419132338_257b146a.jpeg',2),
(null,'https://c.scdn.gr/images/sku_images/044186/44186388/20210419132338_f86ce1b4.jpeg',2),

(null,'https://d.scdn.gr/images/sku_main_images/024597/24597267/20201215163839_dell_vostro_3888_mt_i5_10400_8gb_256gb_w10.jpeg',3),
(null,'https://d.scdn.gr/images/sku_images/036772/36772104/20201215163839_9c6b731a.jpeg',3),
(null,'https://b.scdn.gr/images/sku_images/036772/36772108/20201215163839_874cb421.jpeg',3),

(null,'https://b.scdn.gr/images/sku_main_images/024649/24649476/20201105163859_dell_vostro_3888_mt_i5_10400_8gb_512gb_w10.jpeg',4),
(null,'https://d.scdn.gr/images/sku_images/035704/35704954/20201105163859_e704b46b.jpeg',4),

(null,'https://d.scdn.gr/images/sku_main_images/029748/29748935/20210629105128_dell_optiplex_3080_mt_i5_10505_8gb_512gb_w10_pro.jpeg',5),
(null,'https://d.scdn.gr/images/sku_images/048322/48322138/20210705090238_6efc89c2.jpeg',5),

(null,'https://b.scdn.gr/images/sku_main_images/026368/26368892/20210205161835_hp_prodesk_400_g7_mt_i7_10700_16gb_512gb_w10.jpeg',6),
(null,'https://b.scdn.gr/images/sku_images/038587/38587066/20210205161835_9a982f4c.jpeg',6),

(null,'https://a.scdn.gr/images/sku_main_images/026384/26384829/xlarge_20201224123517_hp_prodesk_400_g7_mt_i5_10500_16gb_512gb_w10.jpeg',7),
(null,'https://a.scdn.gr/images/sku_images/038587/38587067/20210205161835_17d703e9.jpeg',7),

(null,'https://b.scdn.gr/images/sku_main_images/026810/26810557/20210127111536_hp_prodesk_400_g7_mt_i3_10100_8gb_256gb_w10.jpeg',8),
(null,'https://a.scdn.gr/images/sku_images/037997/37997725/20210127111536_7cb8c242.jpeg',8),
(null,'https://b.scdn.gr/images/sku_images/037997/37997732/20210127111536_e26ff482.jpeg',8),
(null,'https://c.scdn.gr/images/sku_images/037997/37997734/20210127111537_123250f9.jpeg',8),

(null,'https://a.scdn.gr/images/sku_main_images/028382/28382113/xlarge_20210419151154_hp_295_g6_ryzen_3_3200g_8gb_256gb_no_os.jpeg',9),
(null,'https://c.scdn.gr/images/sku_images/044626/44626299/20210426161028_66b479bc.jpeg',9),

(null,'https://b.scdn.gr/images/sku_main_images/027352/27352241/20210226134351_hp_pro_300_g6_mt_i5_10400_8gb_256gb_w10_pro.jpeg',10),
(null,'https://b.scdn.gr/images/sku_images/040388/40388048/20210226134350_036267a7.jpeg',10),
(null,'https://c.scdn.gr/images/sku_images/040388/40388049/20210226134351_1c2a0bf1.jpeg',10),

(null,'https://b.scdn.gr/images/sku_main_images/029589/29589419/20210621130057_asus_expertcenter_d500ma_i3_10100_4gb_256gb_no_os.jpeg',11),
(null,'https://b.scdn.gr/images/sku_images/047890/47890041/20210621130059_b0bcc6ec.jpeg',11),

(null,'https://d.scdn.gr/images/sku_main_images/029589/29589389/20210621125952_asus_expertcenter_d500maes_i5_10400_8gb_256gb_w10_pro.jpeg',12),
(null,'https://c.scdn.gr/images/sku_images/047890/47890015/20210621125951_0f28454b.jpeg',12),


(null,'https://c.scdn.gr/images/sku_main_images/029589/29589350/20210621125844_asus_expertcenter_d500maes_i3_10100_8gb_256gb_w10_pro.jpeg',13),
(null,'https://d.scdn.gr/images/sku_images/047889/47889975/20210621125840_695eb5a6.jpeg',13),

(null,'https://c.scdn.gr/images/sku_main_images/029725/29725875/20210628124647_asus_rog_strix_g10dk_21202t_ryzen_5_5600x_8gb_1tb_512gb_geforce_gtx_1660_w10_home.jpeg',14),
(null,'https://d.scdn.gr/images/sku_images/048097/48097111/20210628124647_74bfe563.jpeg',14),
(null,'https://c.scdn.gr/images/sku_images/048097/48097110/20210628124647_14184576.jpeg',14),

(null,'https://c.scdn.gr/images/sku_main_images/029645/29645530/20210623145407_asus_expertcenter_d500maes_7107000050_i7_10700_8gb_512gb_no_os.jpeg',15),
(null,'https://b.scdn.gr/images/sku_images/048076/48076875/20210628094804_3c78fbbe.jpeg',15),


(null,'https://b.scdn.gr/images/sku_main_images/026507/26507787/20210111120241_dell_inspiron_3505_ryzen_5_3450u_12gb_1tb_256gb_fhd_w10_s.jpeg',16),
(null,'https://d.scdn.gr/images/sku_images/037358/37358481/20210111120240_f98b1889.jpeg',16),
(null,'https://c.scdn.gr/images/sku_images/037358/37358482/20210111120241_8c35005f.jpeg',16),

(null,'https://c.scdn.gr/images/sku_images/041881/41881053/20210318135534_d524b1f6.jpeg',17),
(null,'https://d.scdn.gr/images/sku_images/041881/41881056/20210318135534_c4b805ac.jpeg',17),
(null,'https://d.scdn.gr/images/sku_images/041881/41881054/20210318135534_07ddafee.jpeg',17),

(null,'https://b.scdn.gr/images/sku_main_images/027927/27927462/20210329122922_dell_vostro_5502_i7_1165g7_16gb_512gb_geforce_mx330_fhd_w10_pro.jpeg',18),
(null,'https://a.scdn.gr/images/sku_images/042633/42633182/20210329122923_cce441c3.jpeg',18),
(null,'https://d.scdn.gr/images/sku_images/042633/42633181/20210329122922_5fcdac6b.jpeg',18),

(null,'https://d.scdn.gr/images/sku_main_images/027147/27147837/20210215162643_dell_inspiron_5505_ryzen_7_4700u_8gb_256gb_fhd_w10.jpeg',19),
(null,'https://c.scdn.gr/images/sku_images/039517/39517585/20210215162643_cdc73f43.jpeg',19),
(null,'https://c.scdn.gr/images/sku_images/039517/39517587/20210215162644_8e0a3842.jpeg',19),

(null,'https://a.scdn.gr/images/sku_main_images/028476/28476981/20210422101110_dell_inspiron_5406_i7_1165g7_16gb_512gb_fhd_w10_pro.jpeg',20),
(null,'https://b.scdn.gr/images/sku_images/044394/44394589/20210422101111_be8c4462.jpeg',20),
(null,'https://c.scdn.gr/images/sku_images/044394/44394586/20210422101110_ea69134a.jpeg',20),

(null,'https://d.scdn.gr/images/sku_main_images/027434/27434085/20210303132623_hp_255_g8_ryzen_5_3500u_8gb_256gb_fhd_no_os.jpeg',21),
(null,'https://a.scdn.gr/images/sku_images/040787/40787782/20210303132622_ee66ab22.jpeg',21),
(null,'https://d.scdn.gr/images/sku_images/040787/40787783/20210303132623_a2ad68cc.jpeg',21),

(null,'https://c.scdn.gr/images/sku_main_images/028019/28019939/20210401101648_hp_14s_fq0003nv_athlon_3020e_4gb_128gb_fhd_w10_s.jpeg',22),
(null,'https://a.scdn.gr/images/sku_images/042778/42778845/20210401101651_0ec823c6.jpeg',22),
(null,'https://b.scdn.gr/images/sku_images/042778/42778843/20210401101650_7028c22e.jpeg',22),

(null,'https://b.scdn.gr/images/sku_main_images/027282/27282700/20210318134142_hp_255_g8_ryzen_5_3500u_8gb_256gb_fhd_w10_home.jpeg',23),
(null,'https://d.scdn.gr/images/sku_images/041879/41879983/20210318134132_1ba7af58.jpeg',23),
(null,'https://b.scdn.gr/images/sku_images/041879/41879988/20210318134136_e90f3d21.jpeg',23),

(null,'https://b.scdn.gr/images/sku_main_images/025386/25386839/20201026122146_hp_pavilion_15_cs3153cl_i5_1035g1_12gb_512gb_full_hd_touchscreen_w10.jpeg',24),
(null,'https://c.scdn.gr/images/sku_images/048602/48602800/20210719104339_ac0755af.jpeg',24),

(null,'https://c.scdn.gr/images/sku_main_images/026813/26813649/20210127122756_hp_255_g8_ryzen_3_3250u_8gb_256gb_fhd_w10.jpeg',25),
(null,'https://c.scdn.gr/images/sku_images/038002/38002075/20210127122756_825c5292.jpeg',25),
(null,'https://b.scdn.gr/images/sku_images/038002/38002077/20210127122756_48eac04f.jpeg',25),

(null,'https://b.scdn.gr/images/sku_main_images/025771/25771974/20201123131709_asus_vivobook_r564ja_uh51t_i5_1035g1_8gb_256gb_fhd_w10.jpeg',26),
(null,'https://a.scdn.gr/images/sku_images/036018/36018813/20201123131709_0fc8c019.jpeg',26),

(null,'https://c.scdn.gr/images/sku_main_images/025491/25491179/20201103102128_asus_tuf_gaming_fx505dt_bq051t_i5_10300h_8gb_256gb_geforce_gtx_1650_ti_fhd_w10.jpeg',27),
(null,'https://d.scdn.gr/images/sku_images/035655/35655226/20201103101957_c75b9b8a.jpeg',27),
(null,'https://a.scdn.gr/images/sku_images/035655/35655222/20201103101957_5aed2512.jpeg',27),

(null,'https://c.scdn.gr/images/sku_main_images/024823/24823058/20200918104158_asus_vivobook_15_x512da_ej121t_ryzen_5_3500u_8gb_512gb_fhd_w10.jpeg',28),
(null,'https://a.scdn.gr/images/sku_images/034529/34529716/20200918104159_9bba888f.jpeg',28),
(null,'https://c.scdn.gr/images/sku_images/034529/34529717/20200918104159_e19f3875.jpeg',28),

(null,'https://a.scdn.gr/images/sku_main_images/025043/25043996/20201002110644_asus_rog_zephyrus_g14_ga401iv_br9n6_r7_4800hs_16gb_1tb_geforce_rtx_2060_fhd_w10.jpeg',29),
(null,'https://a.scdn.gr/images/sku_images/034853/34853478/20201002110644_633ac293.jpeg',29),
(null,'https://d.scdn.gr/images/sku_images/034853/34853479/20201002110644_3d8bdd3b.jpeg',29),

(null,'https://d.scdn.gr/images/sku_main_images/028702/28702273/20210505162013_asus_e410ma_ek211_celeron_n4020_4gb_256gb_fhd_no_os_peacock_blue.jpeg',30),
(null,'https://b.scdn.gr/images/sku_images/045145/45145801/20210505162013_09db72b3.jpeg',30),
(null,'https://d.scdn.gr/images/sku_images/045145/45145804/20210505162013_4b2f76dc.jpeg',30),

(null,'https://b.scdn.gr/images/sku_main_images/028056/28056290/20210402110211_xiaomi_poco_x3_pro_128gb_phantom_black.jpeg',31),
(null,'https://c.scdn.gr/images/sku_images/042868/42868109/20210402110210_4bca5694.jpeg',31),
(null,'https://d.scdn.gr/images/sku_images/042868/42868106/20210402110210_a9dd8318.jpeg',31),
(null,'https://d.scdn.gr/images/sku_images/042868/42868107/20210402110210_227d35d5.jpeg',31),

(null,'https://d.scdn.gr/images/sku_main_images/028198/28198217/20210409123512_xiaomi_poco_f3_128gb_night_black.jpeg',32),
(null,'https://b.scdn.gr/images/sku_images/043391/43391126/20210409123511_5639d63b.jpeg',32),
(null,'https://d.scdn.gr/images/sku_images/043391/43391118/20210409123511_a02b0c62.jpeg',32),


(null,'https://c.scdn.gr/images/sku_main_images/028082/28082121/20210405113837_xiaomi_poco_x3_pro_256gb_phantom_black.jpeg',33),
(null,'https://b.scdn.gr/images/sku_images/043066/43066353/20210405113836_4f1e06e5.jpeg',33),
(null,'https://b.scdn.gr/images/sku_images/043068/43068198/20210405115156_21ce4811.jpeg',33),


(null,'https://b.scdn.gr/images/sku_main_images/024678/24678558/20200916101811_xiaomi_poco_x3_nfc.jpeg',34),
(null,'https://c.scdn.gr/images/sku_images/038039/38039081/20210128121207_45d0a621.jpeg',34),
(null,'https://a.scdn.gr/images/sku_images/034464/34464291/20200916101703_864fbeac.jpeg',34),


(null,'https://a.scdn.gr/images/sku_main_images/023193/23193757/20200515172439_xiaomi_mi_note_10_lite_64gb_midnight_black.jpeg',35),
(null,'https://a.scdn.gr/images/sku_images/032390/32390675/20200515172437_0bb4f01d.jpeg',35),
(null,'https://a.scdn.gr/images/sku_images/032390/32390691/20200515172443_04401e9f.jpeg',35),


(null,'https://a.scdn.gr/images/sku_main_images/026604/26604998/20210115095041_samsung_galaxy_s21_ultra_5g_256gb_phantom_black.jpeg',36),
(null,'https://d.scdn.gr/images/sku_images/037463/37463368/20210115095042_d60ed812.jpeg',36),
(null,'https://b.scdn.gr/images/sku_images/037460/37460370/20210115093722_47d99c4d.jpeg',36),

(null,'https://a.scdn.gr/images/sku_main_images/023567/23567276/20200610103509_samsung_galaxy_a21s_32gb_black.jpeg',37),
(null,'https://c.scdn.gr/images/sku_images/032957/32957620/20200610103508_2f31bff6.jpeg',37),
(null,'https://d.scdn.gr/images/sku_images/032957/32957625/20200610103510_6472f39f.jpeg',37),

(null,'https://c.scdn.gr/images/sku_main_images/026603/26603948/20210115095109_samsung_galaxy_s21_ultra_5g_128gb_phantom_black.jpeg',38),
(null,'https://b.scdn.gr/images/sku_images/037463/37463380/20210115095110_6c2f7f27.jpeg',38),
(null,'https://d.scdn.gr/images/sku_images/037456/37456823/20210114175115_129d9d61.jpeg',38),

(null,'https://d.scdn.gr/images/sku_main_images/026604/26604966/20210115095155_samsung_galaxy_s21_ultra_5g_128gb_phantom_silver.jpeg',39),
(null,'https://b.scdn.gr/images/sku_images/037460/37460335/20210115093525_5a660f72.jpeg',39),
(null,'https://d.scdn.gr/images/sku_images/037460/37460337/20210115093525_f6b0347f.jpeg',39),

(null,'https://d.scdn.gr/images/sku_main_images/026535/26535305/20210112105459_samsung_galaxy_a12_128gb_black.jpeg',40),
(null,'https://c.scdn.gr/images/sku_images/037384/37384036/20210112105459_4c7bae23.jpeg',40),
(null,'https://c.scdn.gr/images/sku_images/037384/37384037/20210112105459_0d449092.jpeg',40),

(null,'https://b.scdn.gr/images/sku_main_images/025512/25512966/20201104104558_nokia_8_3_64gb_polar_night.jpeg',41),
(null,'https://a.scdn.gr/images/sku_images/035675/35675754/20201104104558_18c4a6b3.jpeg',41),
(null,'https://a.scdn.gr/images/sku_images/035675/35675753/20201104104558_336a9927.jpeg',41),

(null,'https://a.scdn.gr/images/sku_main_images/023154/23154139/20200513160833_nokia_105_black.jpeg',42),
(null,'https://c.scdn.gr/images/sku_images/032350/32350914/20200513160833_ee64f6a6.jpeg',42),
(null,'https://b.scdn.gr/images/sku_images/032350/32350915/20200513160834_ff3b4a71.jpeg',42),

(null,'https://d.scdn.gr/images/sku_main_images/029048/29048380/20210524100443_nokia_3_4_4gb_64gb_fjord.jpeg',43),
(null,'https://a.scdn.gr/images/sku_images/046332/46332777/20210524100442_39ca8143.jpeg',43),
(null,'https://a.scdn.gr/images/sku_images/046332/46332778/20210524100443_72ad95f8.jpeg',43),

(null,'https://b.scdn.gr/images/sku_main_images/026580/26580789/20210113163613_nokia_5_4_128gb_polar_night.jpeg',44),
(null,'https://d.scdn.gr/images/sku_images/037424/37424036/20210113163613_bbab5cb8.jpeg',44),
(null,'https://d.scdn.gr/images/sku_images/037424/37424035/20210113163612_50e92c5a.jpeg',44),

(null,'https://a.scdn.gr/images/sku_main_images/023226/23226348/20200519124625_nokia_5_3_64gb_charcoal.jpeg',45),
(null,'https://d.scdn.gr/images/sku_images/032426/32426389/20200519124627_3c587c1f.jpeg',45),

(null,'https://b.scdn.gr/images/sku_main_images/023848/23848371/20200701130647_hp_wireless_mouse_x200.jpeg',46),
(null,'https://d.scdn.gr/images/sku_images/033489/33489712/20200701130648_8fc3c0ab.jpeg',46),
(null,'https://b.scdn.gr/images/sku_images/033489/33489710/20200701130648_755adb07.jpeg',46),

(null,'https://d.scdn.gr/images/sku_main_images/024140/24140037/20200724093415_hp_300_dual_mode_mouse_black.jpeg',47),
(null,'https://b.scdn.gr/images/sku_images/033815/33815907/20200724093416_77b91191.jpeg',47),

(null,'https://a.scdn.gr/images/sku_main_images/021903/21903752/20200207141347_hp_220_leyko.jpeg',48),
(null,'https://d.scdn.gr/images/sku_images/030379/30379568/20200207141347_c6a6bd90.jpeg',48),

(null,'https://a.scdn.gr/images/sku_main_images/021962/21962651/20200212152504_hp_z3700_red.jpeg',49),
(null,'https://d.scdn.gr/images/sku_images/030491/30491943/20200212152505_db455228.jpeg',49),
(null,'https://a.scdn.gr/images/sku_images/030491/30491942/20200212152505_e20ddbdc.jpeg',49),

(null,'https://d.scdn.gr/images/sku_main_images/013206/13206007/20171101110815_hp_200.jpeg',50),
(null,'https://b.scdn.gr/images/sku_images/030746/30746753/20200226130536_c68d30dd.jpeg',50),

(null,'https://d.scdn.gr/images/sku_main_images/021563/21563709/20200422153109_hp_220_blue.jpeg',51),
(null,'https://b.scdn.gr/images/sku_images/032082/32082332/20200422153108_b53df422.jpeg',51),

(null,'https://c.scdn.gr/images/sku_main_images/027481/27481723/xlarge_20210305133311_hp_silent_280m_asyrmato_pontiki_optical_mayro.jpeg',52),
(null,'https://a.scdn.gr/images/sku_images/040934/40934264/20210305133312_4e7bf4ea.jpeg',52),
(null,'https://d.scdn.gr/images/sku_images/040934/40934262/20210305133311_35ff6d22.jpeg',52),

(null,'https://b.scdn.gr/images/sku_main_images/024475/24475877/20200824112842_hp_6sp30aa_black.jpeg',53),
(null,'https://d.scdn.gr/images/sku_images/040805/40805842/20210303155559_bb3ad435.jpeg',53),
(null,'https://d.scdn.gr/images/sku_images/040805/40805823/20210303155558_d1231dbd.jpeg',53),

(null,'https://a.scdn.gr/images/sku_main_images/020390/20390796/20191004110939_hp_220.jpeg',54),
(null,'https://a.scdn.gr/images/sku_images/027954/27954553/20191004110936_9b61fdc6.jpeg',54),

(null,'https://b.scdn.gr/images/sku_main_images/013294/13294995/20171221102325_hp_spectre_bluetooth_mouse_500.jpeg',55),
(null,'https://d.scdn.gr/images/sku_images/018801/18801784/20171221102317_b7aeef03.jpeg',55),
(null,'https://a.scdn.gr/images/sku_images/018801/18801777/20171221102150_f4e83e57.jpeg',55),

(null,'https://b.scdn.gr/images/sku_main_images/023123/23123626/20200511212000_xiaomi_mi_dual_mode_silent_black.jpeg',56),
(null,'https://b.scdn.gr/images/sku_images/032317/32317210/20200511212000_09a7d693.jpeg',56),
(null,'https://d.scdn.gr/images/sku_images/032317/32317209/20200511212000_d3479ba8.jpeg',56),

(null,'https://a.scdn.gr/images/sku_main_images/023123/23123627/20200511212212_xiaomi_mi_dual_mode_silent_white.jpeg',57),
(null,'https://c.scdn.gr/images/sku_images/032317/32317300/20200511212212_fb8107c0.jpeg',57),
(null,'https://d.scdn.gr/images/sku_images/032317/32317301/20200511212212_91337a1f.jpeg',57),

(null,'https://d.scdn.gr/images/sku_main_images/021463/21463479/20191227124702_xiaomi_mi_mouse_gold.jpeg',58),
(null,'https://a.scdn.gr/images/sku_images/029761/29761848/20191227124702_d6e00b3c.jpeg',58),
(null,'https://b.scdn.gr/images/sku_images/029761/29761849/20191227124711_e7fba59f.jpeg',58),

(null,'https://a.scdn.gr/images/sku_main_images/021463/21463556/20191227125753_xiaomi_mi_mouse_2_black.jpeg',59),
(null,'https://a.scdn.gr/images/sku_images/029761/29761884/20191227125526_a57fb998.jpeg',59),
(null,'https://b.scdn.gr/images/sku_images/029761/29761885/20191227125527_699cb4d9.jpeg',59),

(null,'https://d.scdn.gr/images/sku_main_images/026528/26528000/20210111160516_xiaomi_mwwm01_black.jpeg',60),

(null,'https://d.scdn.gr/images/sku_main_images/028510/28510983/20210422145614_xiaomi_miiiw_mwwm01_asyrmato_pontiki_optical_mayro.jpeg',61),
(null,'https://a.scdn.gr/images/sku_images/044428/44428482/20210422145617_edc01b26.jpeg',61),
(null,'https://a.scdn.gr/images/sku_images/044428/44428480/20210422145616_ed6aba2d.jpeg',61),

(null,'https://d.scdn.gr/images/sku_main_images/013826/13826117/20191227125647_xiaomi_mi_mouse_2_white.jpeg',62),
(null,'https://d.scdn.gr/images/sku_images/019170/19170929/20191227125306_260a0341.jpeg',62),
(null,'https://b.scdn.gr/images/sku_images/029761/29761878/20191227125303_6903acfe.jpeg',62),

(null,'https://c.scdn.gr/images/sku_main_images/023970/23970109/20200710093926_xiaomi_mi_lite_wireless.jpeg',63),
(null,'https://a.scdn.gr/images/sku_images/033625/33625964/20200710093926_4678c477.jpeg',63),
(null,'https://b.scdn.gr/images/sku_images/033625/33625965/20200710093926_a2af47a6.jpeg',63),

(null,'https://a.scdn.gr/images/sku_main_images/022084/22084313/20200221151508_xiaomi_mi_mouse_gold_white.jpeg',64),
(null,'https://b.scdn.gr/images/sku_images/030663/30663171/20200221151538_782fd9c7.jpeg',64),
(null,'https://a.scdn.gr/images/sku_images/030663/30663172/20200221151547_095493ab.jpeg',64),

(null,'https://b.scdn.gr/images/sku_main_images/015538/15538650/20180801131810_xiaomi_mi_mouse_youth_edition.jpeg',65),
(null,'https://b.scdn.gr/images/sku_images/040805/40805768/20210303155556_831a013c.jpeg',65),

(null,'https://a.scdn.gr/images/sku_main_images/007534/7534168/20200708122630_dell_kb216_black.jpeg',66),
(null,'https://a.scdn.gr/images/sku_images/033602/33602620/20200708122631_956654a4.jpeg',66),
(null,'https://c.scdn.gr/images/sku_images/040026/40026661/20210222144942_710cfe50.jpeg',66),

(null,'https://a.scdn.gr/images/sku_main_images/005598/5598543/20180321145146_dell_kb_522.jpeg',67),
(null,'https://d.scdn.gr/images/sku_images/019855/19855086/20180321145137_8272f5d7.jpeg',67),
(null,'https://a.scdn.gr/images/sku_images/019855/19855087/20180321145141_4b70b7ae.jpeg',67),

(null,'https://c.scdn.gr/images/sku_main_images/012975/12975171/20180320145212_dell_km717_premier.jpeg',68),
(null,'https://c.scdn.gr/images/sku_images/019839/19839078/20180320145137_0576b9e8.jpeg',68),
(null,'https://d.scdn.gr/images/sku_images/043241/43241935/20210407144737_772de46a.jpeg',68),

(null,'https://d.scdn.gr/images/sku_main_images/027258/27258203/20210222144429_dell_kb216_pliktrologio_agliko_us.jpeg',69),
(null,'https://d.scdn.gr/images/sku_images/040026/40026334/20210222144429_7b22b00f.jpeg',69),
(null,'https://b.scdn.gr/images/sku_images/040026/40026333/20210222144429_595c24b3.jpeg',69),

(null,'https://a.scdn.gr/images/sku_main_images/022154/22154074/20210406123503_dell_kb216_pliktrologio_agliko_us_grey.jpeg',70),
(null,'https://a.scdn.gr/images/sku_images/043117/43117365/20210406123435_8b3ffa95.jpeg',70),
(null,'https://a.scdn.gr/images/sku_images/043117/43117367/20210406123441_cdb8163f.jpeg',70),

(null,'https://a.scdn.gr/images/sku_main_images/027258/27258322/20210222144809_dell_kb216_pliktrologio_agliko_uk.jpeg',71),
(null,'https://d.scdn.gr/images/sku_images/040026/40026526/20210222144809_bfca7a29.jpeg',71),

(null,'https://d.scdn.gr/images/sku_main_images/028048/28048744/20210401173733_dell_kb_522_pliktrologio_agliko_uk.jpeg',72),
(null,'https://d.scdn.gr/images/sku_images/042817/42817151/20210401173733_a85f93e1.jpeg',72),
(null,'https://d.scdn.gr/images/sku_images/042817/42817154/20210401173734_5f1821c6.jpeg',72),

(null,'https://a.scdn.gr/images/sku_main_images/027258/27258738/20210222145723_dell_km636_asyrmato_set_pliktrologio_pontiki_agliko_us.jpeg',73),
(null,'https://a.scdn.gr/images/sku_images/040027/40027250/20210222145723_4e781c21.jpeg',73),
(null,'https://a.scdn.gr/images/sku_images/040027/40027250/20210222145723_4e781c21.jpeg',73),

(null,'https://c.scdn.gr/images/sku_main_images/017051/17051295/20200916163341_hp_pavilion_600_black.jpeg',74),

(null,'https://b.scdn.gr/images/sku_main_images/017051/17051151/20200323171802_hp_pavilion_wireless_keyboard_and_mouse_800_white.jpeg',75),
(null,'https://c.scdn.gr/images/sku_images/031379/31379453/20200323171802_5cbd0ea7.jpeg',75),

(null,'https://d.scdn.gr/images/sku_main_images/018075/18075782/20190408140746_hp_pavilion_800.jpeg',76),
(null,'https://d.scdn.gr/images/sku_images/025102/25102965/20190408140747_d0cabacc.jpeg',76),

(null,'https://a.scdn.gr/images/sku_main_images/018077/18077594/xlarge_20190408150321_hp_pavilion_600_white.jpeg',77),
(null,'https://a.scdn.gr/images/sku_images/025103/25103993/20190408150321_70da5bba.jpeg',77),

(null,'https://c.scdn.gr/images/sku_main_images/028045/28045796/20210401163719_hp_k2500_asyrmato_pliktrologio_elliniko.jpeg',78),
(null,'https://c.scdn.gr/images/sku_images/042812/42812234/20210401163719_a8bccb3d.jpeg',78),

(null,'https://b.scdn.gr/images/sku_main_images/004768/4768354/20161125094536_hp_k2500.jpeg',79),
(null,'https://b.scdn.gr/images/sku_images/016405/16405769/20161125094624_5496c2e9.jpeg',79),

(null,'https://a.scdn.gr/images/sku_main_images/028048/28048149/20210401172159_hp_300_hp_wireless_keyboard_and_mouse_300_asyrmato_set_pliktrologio_pontiki_agliko_uk.jpeg',80),
(null,'https://c.scdn.gr/images/sku_images/042816/42816154/20210401172200_d623b0c7.jpeg',80),

(null,'https://c.scdn.gr/images/sku_main_images/026769/26769762/20210125143502_hp_wired_keyboard_and_mouse_160.jpeg',81),
(null,'https://d.scdn.gr/images/sku_images/037894/37894156/20210125143503_c50fe0b8.jpeg',81),

(null,'https://c.scdn.gr/images/sku_main_images/016096/16096607/20181011123549_jbl_tune_500bt.jpeg',82),
(null,'https://a.scdn.gr/images/sku_images/022721/22721337/20181011123548_55d72669.jpeg',82),
(null,'https://b.scdn.gr/images/sku_images/022721/22721336/20181011123548_0f8e6646.jpeg',82),

(null,'https://b.scdn.gr/images/sku_main_images/027239/27239772/20210219164906_jbl_tune_510bt_black.jpeg',83),
(null,'https://a.scdn.gr/images/sku_images/039839/39839180/20210219164906_d5e85fcd.jpeg',83),
(null,'https://a.scdn.gr/images/sku_images/039839/39839181/20210219164906_5abb1bcf.jpeg',83),

(null,'https://d.scdn.gr/images/sku_main_images/016096/16096982/20181011125052_jbl_tune_500.jpeg',84),
(null,'https://a.scdn.gr/images/sku_images/022722/22722347/20181011125053_2b3a85a9.jpeg',84),
(null,'https://b.scdn.gr/images/sku_images/022722/22722346/20181011125051_d3d96970.jpeg',84),

(null,'https://d.scdn.gr/images/sku_main_images/015850/15850845/20180918120029_jbl_tune_600btnc.jpeg',85),
(null,'https://b.scdn.gr/images/sku_images/022251/22251358/20180918120034_f3b62342.jpeg',85),
(null,'https://d.scdn.gr/images/sku_images/022251/22251357/20180918120034_9317c548.jpeg',85),

(null,'https://a.scdn.gr/images/sku_main_images/022322/22322822/20200312114924_jbl_tune_700bt_black.jpeg',86),
(null,'https://c.scdn.gr/images/sku_images/031052/31052928/20200312114924_5da2a81f.jpeg',86),
(null,'https://c.scdn.gr/images/sku_images/031052/31052931/20200312114925_f7823cfc.jpeg',86),

(null,'https://a.scdn.gr/images/sku_main_images/018570/18570391/20190516110602_jbl_tune_500bt_blue.jpeg',87),
(null,'https://a.scdn.gr/images/sku_images/025802/25802985/20190516110603_882a4e83.jpeg',87),
(null,'https://a.scdn.gr/images/sku_images/025802/25802987/20190516110603_a4d9f25a.jpeg',87),

(null,'https://b.scdn.gr/images/sku_main_images/015669/15669030/xlarge_20180827133607_jbl_t460bt.jpeg',88),
(null,'https://c.scdn.gr/images/sku_images/021901/21901849/20180827133607_f0aba02d.jpeg',88),
(null,'https://d.scdn.gr/images/sku_images/021901/21901850/20180827133608_17d51eec.jpeg',88),

(null,'https://d.scdn.gr/images/sku_main_images/027286/27286225/20210308161124_jbl_tune_510bt_blue.jpeg',89),

(null,'https://d.scdn.gr/images/sku_main_images/015872/15872626/20190516102131_sony_wh_1000xm3.jpeg',90),
(null,'https://c.scdn.gr/images/sku_images/025800/25800614/20190516102126_feb2d631.jpeg',90),
(null,'https://b.scdn.gr/images/sku_images/025800/25800622/20190516102127_b462884e.jpeg',90),

(null,'https://a.scdn.gr/images/sku_main_images/024562/24562857/20200918125452_sony_wh_1000xm4_black.jpeg',91),
(null,'https://a.scdn.gr/images/sku_images/039513/39513210/20210215160004_5d26e5c1.jpeg',91),
(null,'https://d.scdn.gr/images/sku_images/039513/39513204/20210215155956_0f319ecf.jpeg',91),

(null,'https://d.scdn.gr/images/sku_main_images/005527/5527848/20190528152902_sony_mdr_zx110_black.jpeg',92),
(null,'https://c.scdn.gr/images/sku_images/025779/25779762/20190515133624_57cf959b.jpeg',92),

(null,'https://b.scdn.gr/images/sku_main_images/018556/18556440/20190515143620_sony_mdr_zx310_blue.jpeg',93),
(null,'https://a.scdn.gr/images/sku_images/030112/30112893/20200122152001_a6cf37e1.jpeg',93),

(null,'https://d.scdn.gr/images/sku_main_images/019535/19535423/20190725113142_sony_wh_xb900n_black.jpeg',94),
(null,'https://c.scdn.gr/images/sku_images/026924/26924640/20190725113141_b0ee9340.jpeg',94),
(null,'https://c.scdn.gr/images/sku_images/026924/26924640/20190725113141_b0ee9340.jpeg',94),

(null,'https://c.scdn.gr/images/sku_main_images/018557/18557230/20190515150609_sony_mdr_xb550ap_black.jpeg',95),
(null,'https://b.scdn.gr/images/sku_images/030112/30112691/20200122151737_119add4e.jpeg',95),
(null,'https://a.scdn.gr/images/sku_images/030112/30112692/20200122151738_b719d335.jpeg',95),

(null,'https://d.scdn.gr/images/sku_main_images/011457/11457297/20190515145852_sony_mdr_xb550ap.jpeg',96),
(null,'https://d.scdn.gr/images/sku_images/025781/25781064/20190515145851_a29ef628.jpeg',96),
(null,'https://d.scdn.gr/images/sku_images/025781/25781065/20190515145857_ca7ba56a.jpeg',96),

(null,'https://c.scdn.gr/images/sku_main_images/004567/4567812/20170329172919_sony_mdr_zx310ap.jpeg',97),
(null,'https://b.scdn.gr/images/sku_images/016989/16989397/20170329172854_4ba60eb7.jpeg',97);

insert into rating(rating_num,product_id,user_id) values
(1,1,1),
(2,2,1),
(2,3,1),
(1,6,1),
(1,7,1),
(5,8,1),
(5,9,1),
(1,10,1),
(1,12,1),
(4,13,1),
(1,15,1),
(3,16,1),
(1,17,1),
(3,18,1),
(2,20,1),
(5,21,1),
(4,22,1),
(2,23,1),
(2,24,1),
(5,25,1),
(1,26,1),
(5,27,1),
(4,29,1),
(4,30,1),
(3,31,1),
(1,32,1),
(3,34,1),
(3,35,1),
(3,36,1),
(3,37,1),
(2,39,1),
(2,40,1),
(2,41,1),
(1,42,1),
(2,43,1),
(4,44,1),
(4,45,1),
(3,46,1),
(1,47,1),
(2,48,1),
(5,49,1),
(3,50,1),
(3,51,1),
(3,52,1),
(3,53,1),
(3,54,1),
(2,55,1),
(2,56,1),
(5,57,1),
(5,60,1),
(3,61,1),
(5,62,1),
(4,64,1),
(3,66,1),
(5,67,1),
(1,68,1),
(3,69,1),
(4,70,1),
(3,74,1),
(5,75,1),
(2,76,1),
(2,77,1),
(1,79,1),
(4,81,1),
(4,82,1),
(3,83,1),
(2,84,1),
(1,85,1),
(5,86,1),
(3,87,1),
(4,88,1),
(2,89,1),
(4,90,1),
(5,91,1),
(4,92,1),
(2,95,1),
(5,96,1);

UPDATE groupdb.product SET discount = '30', end_date = '2021-12-21' WHERE (id = '2');
UPDATE groupdb.product SET discount = '25', end_date = '2021-12-21' WHERE (id = '33');
UPDATE groupdb.product SET discount = '30', end_date = '2021-12-21' WHERE (id = '85');
UPDATE groupdb.product SET discount = '20', end_date = '2021-12-21' WHERE (id = '73');


UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '2');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '7');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '3');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '12');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '9');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '17');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '23');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '26');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '29');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '31');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '35');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '40');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '38');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '42');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '48');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '51');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '57');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '61');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '65');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '68');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '74');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '78');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '81');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '82');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '87');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '92');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '95');
UPDATE `groupdb`.`product` SET `new_arrival` = '1' WHERE (`id` = '89');