# SQL Sorgu Alıştırmaları

Bu hafta SQL sorguları üzerine çalışıyorsunuz. Bugünkü alıştırmada sıfırdan bir veritabanı oluşturacak ve aşağıda istenenleri SQL sorgu olarak oluşturacaksınız.

# Proje Kurulumu
Projeyi forklayın ve clonlayın. Tamamladığınızda da pushlayın.

## Görev 1: Kütüphane Bilgi Sistemi için Tablo Tasarımı

Bu veritabanı, bir okulun kütüphanesinden öğrencilerin aldıkları kitapların bilgisini barındıracak. 
Aşağıda tablolar ve şemaları verilmiş. 

[ ] Bu tabloların tasarımını online olarak veya bilgisayarınızda bir yazılım kullanarak dizayn ediniz. (örn: [drawsql.app](https://drawsql.app/)
[ ] Resim olarak proje dosyasına ekleyiniz.

-- Tablolar 

`ogrenci` tablosu öğrencilerin listesini tutar.

| field        | data type        | metadata                                           |
| :----------- | :--------------- | :------------------------------------------------- |
| id      	   | unsigned integer | primary key, auto-increments, generated by db      |
| ad 		      | string           | required                                           |
| soyad 	      | string           | required                                           |
| dtarih 	   | string           | required                                           |
| cinsiyet     | string           | required                                           |
| sinif        | string           | required                                           |
| puan         | unsigned integer | required                                           |


`islem` tablosu öğrencilerin kütüphaneden aldıkları kitapların bilgilerini tutar

| field        | data type        | metadata                                           |
| :----------- | :--------------- | :------------------------------------------------- |
| id      	   | unsigned integer | primary key, auto-increments, generated by db      |
| ogrenci_id   | unsigned integer | foreign key referencing ogrenci.id, required       |
| kitap_id     | unsigned integer | foreign key referencing kitap.id, required	       |
| atarih 	   | string           | required                                           |
| vtarih 	   | string           | required                                           |


`kitap` tablosu kütüphanedeki kitapların bilgisini tutar

| field        | data type        | metadata                                           |
| :----------- | :--------------- | :------------------------------------------------- |
| id      	   | unsigned integer | primary key, auto-increments, generated by db      |
| ad 		      | string           | required                                           |
| sayfasayisi  | unsigned integer | required                                           |
| puan         | unsigned integer | required                                           |
| yazar_id     | unsigned integer | foreign key referencing yazar.id, required 		   |
| tur_id       | unsigned integer | foreign key referencing tur.id, required 		   |


`yazar` tablosu kitapların yazarları bilgisini tutar

| field        | data type        | metadata                                           |
| :----------- | :--------------- | :------------------------------------------------- |
| id      	   | unsigned integer | primary key, auto-increments, generated by db      |
| ad 		      | string           | required                                           |
| soyad 	      | string           | required                                           |


`tur` tablosu kitapların türlerini tutar.

| field        | data type        | metadata                                           |
| :----------- | :--------------- | :------------------------------------------------- |
| id      	   | unsigned integer | primary key, auto-increments, generated by db      |
| ad 		      | string           | required                                           |




### Görev 2: SQL İfadeleri

[ ] Görev 1'de tasarımını yaptığınız tabloları DB'de oluşturan komutları kutuphane_bilgi_sistemi.sql dosyasında oluşturunuz.


#### Görev 3: 

[ ] veriler.sql içindeki hataları düzelterek, verileri veritabanınıza ekleyiniz.


##### Görev 4: 

[ ] Aşağıda istenen değişiklikleri tablolarda yapacak SQL ifadeleri yazınız.

   1- öğrenci tablosuna 'sehir' alanı ekleyiniz.
   
		alter table ogrenci add column sehir varchar(30);
		alter table ogrenci add column ilce varchar(30) after puan;


   2- tablolarda veri olarak tarih geçen alanlarda veri tipini string yerine DateTime olarak ayarlayınız.
   
		alter table ogrenci change column dtarih dtarih datetime;
		alter table islem
		modify column atarih datetime,
		modify column vtarih datetime;


   3- öğrenci tablosuna 'dogum_yeri' alanı ekleyiniz ve default değerini 'Türkiye' yapınız.
   
		alter table ogrenci add column dogum_yeri varchar(30) default "Turkiye";
		select * from ogrenci;


   4- öğrenci tablosundan 'puan' alanını siliniz.
   
		alter table ogrenci drop puan;


   5- öğrenciler tablosundaki kiz öğrencileri alarak kiz_ogrenciler tablosu oluşturunuz.
   
		create table `kizogrenciler` as (
		select * from ogrenci where cinsiyet="K"
		);
		select * from kizogrenciler;
   
   6- kiz_ogrenciler tablosunu siliniz.
   
		drop table kizogrenciler;


   7- kiz_yurdu tablosu oluşturunuz(sadece 'ad' alanı olsun). 1 kayıt ekleyiniz.
      öğrenci tablosundaki kız öğrencileri kullanarak kiz_yurdunda_kalanlar tablosu oluşturunuz
	  
		create table `kizyurdu` (
			id int primary key auto_increment,
			ad text not null 
		);
		insert into kizyurdu (ad) values ("vadi");
		select * from kizyurdu;
		
		create table `kiz_yurdu_ogrenciler` as (
		select 1 as yurt_id, id as ogrenciid from kizogrenciler
		);
		select * from kiz_yurdu_ogrenciler;


   8- kiz_ogrenciler tablosunun adını kogrenciler olarak değiştiriniz
   
		alter table kiz_yurdu_ogrenciler rename to `kogrenciler`;


   9- yazar tablosundaki 'ad' alanının adını 'name' olarak güncelleyiniz.
   
		alter table yazar change column ad name varchar(30) not null;
		alter table yazar change column name isim varchar(30) not null;


   10- yazar tablosuna 'ulke' ve 'universite' alanları ekleyiniz 'ulke'nin default değeri 'Türkiye' olsun.
		
		alter table yazar add column ulke varchar(30) default "Turkiye";
		alter table yazar add column universite varchar(30);
		select * from yazar;

   11- tablo ilişkilerine 5'er tane örnek veriniz (1-1, 1-n, n-n)
		1-1 TC kimlik, TC ehliyet, türkiyede isen ev araba
		1-n saat, yurtdışında ev araba, vatandaşlık, kitap, çalışan, çift anadal
		n-n workintech bootcamp

