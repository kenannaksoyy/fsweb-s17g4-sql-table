CREATE TABLE `islem`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrenci_id` INT NOT NULL,
    `kitap_id` INT NOT NULL,
    `atarih` TEXT NOT NULL,
    `vtarih` TEXT NOT NULL
);
ALTER TABLE
    `islem` ADD PRIMARY KEY `islem_id_primary`(`id`);
CREATE TABLE `ogrenci`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL,
    `dtarih` TEXT NOT NULL,
    `cinsiyet` TEXT NOT NULL,
    `sinif` TEXT NOT NULL,
    `puan` INT NOT NULL
);
ALTER TABLE
    `ogrenci` ADD PRIMARY KEY `ogrenci_id_primary`(`id`);
CREATE TABLE `yazar`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL
);
ALTER TABLE
    `yazar` ADD PRIMARY KEY `yazar_id_primary`(`id`);
CREATE TABLE `kitap`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `sayfasayisi` INT NOT NULL,
    `puan` INT NOT NULL,
    `yazar_id` INT NOT NULL,
    `tur_id` INT NOT NULL
);
ALTER TABLE
    `kitap` ADD PRIMARY KEY `kitap_id_primary`(`id`);
CREATE TABLE `tur`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL
);
ALTER TABLE
    `tur` ADD PRIMARY KEY `tur_id_primary`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazar_id_foreign` FOREIGN KEY(`yazar_id`) REFERENCES `yazar`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitap_id_foreign` FOREIGN KEY(`kitap_id`) REFERENCES `kitap`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrenci_id_foreign` FOREIGN KEY(`ogrenci_id`) REFERENCES `ogrenci`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_tur_id_foreign` FOREIGN KEY(`tur_id`) REFERENCES `tur`(`id`);