
--YORUM SATIRI YAPMAK İÇİN "--" KULLANILIR--
--SQL VERİ TABANI BÜYÜK KÜÇÜK HARF DUYARLILIĞINA SAHİP DEGİLDİR--
--DML DATA MANIPULATION LANGUAGE ANLAMINA GELİR--
--NORTHWİND VERİ TABANI ÜZERİNDE SORGULAMALAR YAPACAGIZ--
--USE YAZMAK YERİNE SOL ÜSTTENDE HANGİ VERİTABANINDA ÇALIŞMAK İSTEDİĞİMİZİ SEÇEBİLİRİZ--
--TABLOLARI SORGULAMAK İÇİN "SELECT" KOMUTU KULLANILIR.--
--SELECT SÜTUN ADI FROM TABLO ADI--
--SUTUN ADLARI ARASINDA VİERGÜL KULLANILIR--
--SELECT * FROM TABLO ADI YAZARSAK BÜTÜN KOLONLAR GELİR--


USE Northwind
SELECT * FROM Employees
-- *  FROM TABLO ADINI YAZARSAK O TABLONUN HEPSİNİ GETİRİR--
select FirstName,LastName,Title from Employees
-- SUTUN ADLARI NI YAZIP FROM HANGİ TABLODAN ÇEKMEK İSTİYORSAK 
--ONU YAZDUIĞIMIZDA İLGİLİ TABLONUN İLGİLİ SUTUNLARI GELİR.--
SELECT EmployeeID,OrderDate,ShippedDate FROM Orders


SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate],
 [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension],
  [Photo], [Notes], [ReportsTo], [PhotoPath] FROM Employees
--TABLO İÇİNDEN AÇTIKTAN SONRA COLON KLASÖRÜNÜ SÜRÜKLEYİP EKRANA BIRAKTIGIMIZDA TABLO EKRANA EKLENİR--


SELECT FirstName AS İSİM,LastName AS SOYISIM,Title AS BAŞLIK FROM Employees
--1.yol
-- sutun adından sonra as  boşluk isteiğimiz texti yazarsak sorguda
-- isdeğimiz sekilde karşımıza çıkarır.fakat tablodan değişiklik olmaz--
--üstte göründüğü sekilde--
--2.yol
--birden fazla kelimelik isimlendirme yapılacaksa köseli parantez içinde veya  tek tırnakla belirmek gerekir.--
--metinsel ifadelere tek tırnak içerisinde belirtilir.--
SELECT FirstName [İSİM],SOYISIM=LastName,Title AS BAŞLIK FROM Employees

select ad=FirstName,soyad=LastName,başlık=Title,'doğum tarihi'=BirthDate from Employees 
--tek tırnakla yazdıktan sonra eşittir  operatörü koyulup sutun adı yazılır.--

--3.yol
select FirstName as isim,LastName as [soyisim],Title as [başlık],BirthDate as [doğum tarihi] from Employees
--as yazdıktan sonra köseli parantez ilede ayrıyetten isimlendirme yapılabilir.--

--TEKİL KAYITLARI LİSTELEME

SELECT City FROM Employees
--aynı sehirler lişstelenir--
select distinct City from Employees
--tekrar eden sehirler (tekil değer olarak) sorgulanır.--
--select distinct komutu ile--


select distinct FirstName,City from Employees
--her isme karşılık bir sehir oldugundan yine isme karsılık gelen sehirleri aynı  olsa bile getirir.--
--eger aynı isimde ve sehirde aynı olsaydı birtanesini getirirdi.--



--metin birleştirme 
select [TitleOfCourtesy] [LastName], [FirstName] from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') AS [UNVAN İSİM SOYISIM] from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') as isim from  Employees
--sütünları birleştirmek için sütün ismi ve + oparatöruyle birleştırılır ' ' 
--ile kelimeler arasına bir boşluk bırakılır 
-- sütün başlığını değiştirmek içinde as komutuyla değiştirilir.


-- SORGULAMA (FİLTRELEME)
--YAZDIGIMIZ SORGULARIN BELİRLİ KOSULLLARA GÖRE FİLTRELEYEBİLİŞRİZ.BUNUN İÇİN WHERE KEYWORDU KULLANILIR.--
--MR. ÜNVANI OLANLARI FİLTRELETYİN.
SELECT FirstName,LastName,TitleOfCourtesy FROM Employees where TitleOfCourtesy ='mr.'
--aramak isteiğimiz krıter metinsel ifadeyse tırnak içinde yazılır.--


--EMPLOY ID 5 TEN BÜYÜK OLANLARI SORILAYIN.--
SELECT FirstName,LastName,EmployeeID FROM Employees where EmployeeID >5
--sayısal işlemleri filtrelerken tırnak kullanulmaz.

--1960yılında doğankların listelenmesi
SELECT FirstName,LastName,BirthDate FROM Employees where year(BirthDate)=1960

--year metoduyla sorgularsak yıl sorgulaması yapmış oluruz.


--doğum günü almak istersek mounth 
SELECT FirstName,LastName,BirthDate FROM Employees where day(BirthDate) =27


SELECT FirstName,LastName,BirthDate FROM Employees where month(BirthDate) =08

--doğum günü almak istersek day fonksıyonu yazmak gerekir.

--19650 ile 1961 arasında doğanları sorgulayınız.
SELECT FirstName,LastName,BirthDate FROM Employees where
year(BirthDate)>=1950 and year(BirthDate)<=1961


--ingilterede oturan bayanaklrın adı,soyadı,mesle,ünvanı,ülkesi ve doğum atarıhını lsitele

select * from Employees
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees
 where Country='uk' and (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.')

--üsteekiyle alttakı aynı sorgudur--
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees 
where (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.') and Country='uk' 
--işlem önceliğini kullanmak gerekir  baağlaçlara dikkat etmek gerekiyor. 
--bayanlar dediğimizde ms ve mrs birlikte sorgulamak için and bağlacı kullanılır.



--ünvanı mr. olanlar veya yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' or YEAR(BirthDate)<=1961

--ünvanı mr. olanlar ve yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' and YEAR(BirthDate)<=1961


--yaş hesabı fonsksıyonla  nasıl yapılır--
select FirstName as isim,LastName as soyısım,TitleOfCourtesy as ünvan,
 YEAR(getdate())-YEAR(BirthDate) as yaş from Employees where TitleOfCourtesy='mr.'
or (year(getdate())-YEAR(BirthDate)> 60)


--get date fonksiyonu güncel tarıh bilgisini verir.
--YEAR(getdate())-YEAR(BirthDate)

--.Year() fonksıyonuyla birlikte o tarıhe 
--ait olan yıl bilgisini ögereniyoruz.
--örneği yukarda yas olarak isimlendirdiğimiz 
--sütün ismini where ifadeysiyle birlite kullanmalıyız.


select * from Employees where Region is null
--null olan degerler gelir


select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is null

--ıs not null dersek null olanlar gelmez
select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is not null


--SIRALAMA İŞLEMLERİ YAPMA--


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8


 --asc yazmassak zaten defoulttan asc oldugu için  a dan z ye sıralar--
SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName asc 


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName desc
--tersten sıralama yapar.--



select FirstName,LastName,BirthDate,HireDate from Employees order by FirstName,LastName desc

--ELDE ETTĞİMİŞZ SONUÇ KUMESİNİN ADA GÖRE ARTAN SIRADA SIRALADIK
--EĞER AYNI ADA SHIP BİRDEN GFAZLA KAYIT VARSA BUNLARI SOOPYADA GÖRE AZALAN SIRADA YAPIYORUZ.


select FirstName,LastName,BirthDate from Employees order by YEAR(BirthDate) ASC

select FirstName,LastName,BirthDate,HireDate,Title,TitleOfCourtesy from Employees order by 6,4 desc

--sorguda yazdığımız sıralama işlemi ilk önce 6.sutunun değerleriini  yanı title of coyurstey 
--artan sıralama yaptı daha sonra 4.sıradanki hiredate e göre azalana göre sıralama yaptı.

-- çalısanlarını unvanları göre ünvanları aynıysa yaşlarına göre sıralama yapınız.

select FirstName,LastName,TitleOfCourtesy as ünvan,YEAR(getdate())-YEAR(BirthDate) as yaş from Employees 

order by TitleOfCourtesy,yaş desc



--order by sıralamasında as ile isimlendirdiğimiz kolon kulllanılabılır.


--product tablosunu listele

select * from Products


--ürünleri a dan z ye listele
select * from Products order by ProductName asc

--ürünleri a sırasına göre tersten listele
select * from Products order by ProductName desc


--catageorı ıd 3 olanları listele
select * from Products where CategoryID=3

--kategorı ıd 3 olanları artan sırala
select * from Products where CategoryID=3 order by ProductName

--employs çalışanların adı soyadı tek kolonda bastır
 

select (LastName+' '+FirstName) as isim from Employees 



--pruduct tablosuna unıtprice yuzde 18 kdv uygulama yap yazdır.

select unitprice as [ham birim fiyat],unitprice*0.18 as 'indirim miktari',unitprice-unitprice*0.18 as [indirimli fiyat] from Products          




--T-SQL ALT KAGEGORİLERİ
--DML DATA MANIPULATION LANGUAGE
--DDL DATA DEFİNİTİON LANGUAGE
--DCL DATA  DATA CONTOL LANGUAGE

--SELECT
--İNSERT 
--UPDATE
--DELETE
 

 --CREATE
 --ALTER
 --DROP


 --GRANY
 --DENY
 --REVOKE

 --BETWEEN VE AND KULLANIMI
 --ARALIK BİLDİRMEKTE KULLANILIR

 SELECT * FROM Employees WHERE year(BirthDate) BETWEEN 1948  and 1960 order by BirthDate asc

 --2.yol

 SELECT FirstName,LastName,YEAR(BirthDate) as yaş FROM Employees WHERE year(BirthDate)>1948 and YEAR(BirthDate)<1960 order by BirthDate asc



 --alfabetik olarak janet ve robert  arasında olanların listelenmesi


 select FirstName,LastName from Employees where FirstName>='janet' and FirstName<='robert' order by FirstName

 --where yazdıktan sonra her isim için kolon ismi yazılır  

 
 select FirstName,LastName from Employees where FirstName between 'janet' and 'robert' order by FirstName

 --where yazdıktan kolon ismi daha sonra between ve şartlar yazılır arasına and bağlacı konulur.
 --order by sorguda en sonda olmalıdır.




 --IN KEYWORDU  kullanımı


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy IN('DR.','MR.')


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy>='dr.' and TitleOfCourtesy<='mr.'


SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy='dr.' OR TitleOfCourtesy='mr.'




--1950 1955 VE 1960 YILLARINDA DOGANLARI LİSTELEYNİZİ.

--KISA YOL

SELECT FirstName,LastName,BirthDate FROM Employees WHERE YEAR(BirthDate) IN(1950,1955,1960)

-- TEK TEK SART YAZMAMAK İÇİN IN KEYWORDUYLA EŞİTLİK SATLARI YAN YANA AYAZILARAK YAPILIR.

--UZUN YOL 

SELECT FirstName,LastName,BirthDate  FROM Employees WHERE
YEAR(BirthDate)=1950 OR YEAR(BirthDate)=1955 OR YEAR(BirthDate)=1960


                                --TOP KULLANIMI--

--SIRALAMA YAPMAK İÇİN KULLANILIR.

--select yazıktan sonra top yazılıp boşluktan sonra kaç satır getireceğimz yazılır.

--BUNU YAZDIKTAN SONRA KAÇ DEGER GİRERSEK O KADAR KAYIT GETİRİR


SELECT * FROM Employees

SELECT TOP 5  * FROM Employees
--* yazıdımız için bütün tablonun ilk 5 sırasını getririr.

--EMPOLYS TABLOSUNUN ADI SOYADI BAS EK BİLGİLERİNİN İLK 5 SATIRI GETİR VE VE TITLE OfF COSRT Z DEN A YE SIRALAMA YAP

SELECT top 5  TitleOfCourtesy,FirstName,LastName  from Employees order by TitleOfCourtesy desc


-- bir sorguda en son çalışan kısımdır.
--yani öncelik sorgumuz çalışır ve oluşacak sıralama polan sonuç kumesının resuklt set ilk beş kaydı alınır.


--çalışan tablosunda yaşlarına göre azalan sıralama yaptıktan sonra oluşacak olan sonuç kumesinin %25lik jkısmını listeleyelım.

select top 25 percent  FirstName,LastName,year(getdate())-YEAR(BirthDate) as yas from Employees order by yas desc

--eger belirttiğimiz oran sonucu kendi hesapladıogı için sonuç 3.2 tane çıktaysa bu durumda bize ilk 4 sonucu sıralayacaktır.
--yanı uste yuvarlama işlemi yapacaktır.


--kulllanıcıları işe giriş tarıhıne göre tersten sıralayaarak ilk 3unu getiriniz.hiredate

select top 3 FirstName,LastName,HireDate as [İşe Giris Tarih] from Employees order by hiredate desc





--LİKE KULLANIMI 

SELECT FirstName,LastName,Title FROM Employees where FirstName='michael'

--eskiden böyle yapıyorduk

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'michael'


SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and LastName like 'f%'


SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%n' 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and FirstName like '%e'

--lik isaretiyle birlikte  tırnak içişnde yuzde işasretiyle birlikte kullanılır


--adının içinde e harfı gecenler

select FirstName from Employees where FirstName like '%e%'

--adının ilk harfı a veya l olnalr gelsın

--1.yol 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' or FirstName like 'l%'

--2.yol

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '[al]%' 

--adının içinde r veya t bulunan lar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%r%' or FirstName like '%t%'

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '%[rt]%' 


-- adının ilk harfı j ile r aralıgında olnalrı getir


SELECT FirstName,LastName,Title FROM Employees where FirstName like '[j-r]%'  order by FirstName


SELECT FirstName,LastName,Title FROM Employees where FirstName between 'j%' and 'r%' order by FirstName


--a ile e arasıdan tek karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a_e%'  order by FirstName

--a ile e arasıdan ıkı karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a__e%'  order by FirstName

--ilk harfı m olmayanlar 

SELECT FirstName,LastName,Title FROM Employees where FirstName not like 'm%' order by 1

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^m]%' order by 1

 
 -- adı t ile bitmeyenler

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%[^t]' order by 1
SELECT FirstName,LastName,Title FROM Employees where FirstName not like '%t' order by 1



--adının ilk harfı a ile ı arasında bulunmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a-ı]%'  order by FirstName

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a]%' and FirstName like '[^ı]%'


SELECT FirstName,LastName,Title FROM Employees where FirstName not like '[a-ı]%'  order by FirstName


--adının 2.harfı a veya t olmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '_[^at]%'

--adınıon ilk 2 harfı la  na aa an  olanlar

--uzun yol
SELECT FirstName,LastName,Title FROM Employees where FirstName like 'la%'  or FirstName like 'na%' 
or FirstName like 'aa%' or FirstName like 'an%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[la,na,aa,an]%' order by FirstName


--içerisinde _ gecen isimlerin listelenmesi
--normalde _karakterinin özel bir anlmaı vardır ve tek bir karatkter yerıne 
--ggeçer ancak [] işçinde belirttiğimzde siradan bir jkarakter gibi aratabilir.

select * from Employees where FirstName like '%\_%' escape '\'


select * from Employees where FirstName like '%[_]%'


--costomer tablosujdan costumer ıd sının 2.harfı a ,4.harfi t olanların %10luk kısmını getiren sorguyu yapınız

select top 10 percent  * from Customers where CustomerID like '_a%' and CustomerID like '___t%'


select top 10 percent  * from Customers where CustomerID like '_a_t%'








--insert işlemini tablodan yapmadan kod ile tabloya bilgi ekleme yapılabılır.

--VERİ TABANI İŞLEMLERİ 
--1 İNSERT:BİR VERİ TABANINDAKLI TABLOLARI BİRİNE YENİ VERİ EKELMEK İÇİN KULLNANILIR.

--İNSERT INTO  <TABLO ADI> (<SUTUN ISIMLERİ> VALUES <SUTUN DEGERLERİ>
--VALUES  


USE Northwind

insert INTO Categories (CategoryName,Description)
values ('baklagiller','güzeldir bunkların tadı:')

-- insert ıntodan sonra tablo adı parantyez aç colon adları  parantez kapat
-- values tekrar parantez tırnak aç degerleri yaz parantez kapat

select * from Categories


insert into Categories(Description)
values('kategori ıd  giriniz')

--executede hata verdi çünkü categoriname null geçilmesi aktıf
-- edilmeiği için null degeri  girdiğimzden dolayı hata verdi.
--insert işlemi sırasında bunlara deger atamalıyız.
--(eger ıdentıty özelliğinde bir sutun var ise (otomatık artan)
--bu sutun degeri sistem tarafından atanagağı için insert işlemşnde belirtmeye gerekk yoktur.

--bir tabloya veri ekelnecekse bunlar sıraasıyla yapılmalıdır.


--shippers tablosuna yeni veri ekleyın.
select * from Shippers

insert into Shippers values('mng kargo','216 015 42 65')


--customer tablosuna 'vadafone' sirketini ekleyın.

select * from  Customers 
insert into Customers(CustomerID,CompanyName) values ('ABCDE','vadafone')

--CUSTOMER ID BOŞ GEÇİLMELDİĞİ İÇİN ID DE GİRMEMİZ GEREKİYOR.



                                           --UPDATE KOMUTU--

-- bir tablodaki verileri güncellemek için kullanılır.
--DİKKAT ETMEMMİZ GEREKEBN OLAY NEREYİ GÜNCELLEMEK İSTEDİĞİNİ YAZMALISIN YOKSA 
--BÜTÜN KAYITLAR VERMİŞİ OLDUGUNUZ VERİ İLŞE GÜNCELLENİR.


--KULLANIMI
--UPDATE <TABLO_ADI>
--SET <KOLON ADI>=<YENİ DEGER>


SELECT * into ÇALISANLAR2 FROM Employees

select * from ÇALISANLAR2
--empyoes tablosundaki veriler yeni bir tabloya (çalısanlar tablosuna) kopyalanadı. toplu  insert yaptık.


update ÇALISANLAR2
set LastName='soyaadı'

select * from ÇALISANLAR2
--çalısanlar tablsundaki büğtün verileri soyadıyla değiştirilecektir.
--cünkü güncelleme yapmak için hangi kayıt üstünde güncelleme yapacagımızı belirtmedik.
--(istenmeyen durum)
 


 insert into Employees(LastName,FirstName) values ('ahmet','mahmut')
 select * from Employees

 update Employees set FirstName='muhammet',LastName='aydın' where EmployeeID=1

  select * from Employees


 --employeıd si 10 olan satırı bizim istediğimiz sekiklde degiştir.
 --bir kayıt güncelleme yaparken en güzel sekil ıdsi(pk) üzerinden degiklik yapmaktır.cünkü pk tek sefer kullanılır
 --firstname üzerinden yapılasaydı bu sefer aynı ada sahip molannların hepsi güncellecektir.
 --işlemklerde tekillik saglamak için primary key uzerınden işlem yapılnmadılırı.


 --prudect tablosundaki verileri üsürnler adında bir taablo oluştutrarak kopyalayınız.
 ---ürünlerin birim fişyatina yuzde 5 zam yaparak güncelleyiniz.

 select * into ürünler from Products

 select * from ürünler

 update ürünler set UnitPrice=UnitPrice*1.05

 --2.yol

 update ürünler set UnitPrice=UnitPrice+(UnitPrice*0.05)

 select * from ürünler
 --her seferinde fiyat güncellemesi yapar.


 --DELETE KOMUTU 

 --bir tablodan kayıt silmek için kullanılır.

 --aydnı updatedekiş gibi dikkatlı olunması gerekir cünkü birden fazala kayıt yanlışlıkla silinebilir.
 --delete from <tablo_adı>



  select * into ürünler2 from Products
 delete from ürünler2

--ürünler2 tablasundaki bütün verileri siler 
--bunden daolyı hangi satırda işlem yapacaksak ıd bilgisi yanı keywordu belirmemiz gerekir.
  
 --employ tablsundan 11 ıd sil

 delete from Employees where EmployeeID=11
select * from Employees

  select * into çalısanlar from Employees

  select * from çalısanlar

  delete from çalısanlar where FirstName='michael'


  --ünvanı mr. dr. olanları sil
    select * from çalısanlar
	delete from çalısanlar where TitleOfCourtesy='DR.' AND TitleOfCourtesy='MR.'
	delete from çalısanlar where TitleOfCourtesy IN ('DR.','MR.')
   select * from çalısanlar
--YORUM SATIRI YAPMAK İÇİN "--" KULLANILIR--
--SQL VERİ TABANI BÜYÜK KÜÇÜK HARF DUYARLILIĞINA SAHİP DEGİLDİR--
--DML DATA MANIPULATION LANGUAGE ANLAMINA GELİR--
--NORTHWİND VERİ TABANI ÜZERİNDE SORGULAMALAR YAPACAGIZ--
--USE YAZMAK YERİNE SOL ÜSTTENDE HANGİ VERİTABANINDA ÇALIŞMAK İSTEDİĞİMİZİ SEÇEBİLİRİZ--
--TABLOLARI SORGULAMAK İÇİN "SELECT" KOMUTU KULLANILIR.--
--SELECT SÜTUN ADI FROM TABLO ADI--
--SUTUN ADLARI ARASINDA VİERGÜL KULLANILIR--
--SELECT * FROM TABLO ADI YAZARSAK BÜTÜN KOLONLAR GELİR--


USE Northwind
SELECT * FROM Employees
-- *  FROM TABLO ADINI YAZARSAK O TABLONUN HEPSİNİ GETİRİR--
select FirstName,LastName,Title from Employees
-- SUTUN ADLARI NI YAZIP FROM HANGİ TABLODAN ÇEKMEK İSTİYORSAK 
--ONU YAZDUIĞIMIZDA İLGİLİ TABLONUN İLGİLİ SUTUNLARI GELİR.--
SELECT EmployeeID,OrderDate,ShippedDate FROM Orders


SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate],
 [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension],
  [Photo], [Notes], [ReportsTo], [PhotoPath] FROM Employees
--TABLO İÇİNDEN AÇTIKTAN SONRA COLON KLASÖRÜNÜ SÜRÜKLEYİP EKRANA BIRAKTIGIMIZDA TABLO EKRANA EKLENİR--


SELECT FirstName AS İSİM,LastName AS SOYISIM,Title AS BAŞLIK FROM Employees
--1.yol
-- sutun adından sonra as  boşluk isteiğimiz texti yazarsak sorguda
-- isdeğimiz sekilde karşımıza çıkarır.fakat tablodan değişiklik olmaz--
--üstte göründüğü sekilde--
--2.yol
--birden fazla kelimelik isimlendirme yapılacaksa köseli parantez içinde veya  tek tırnakla belirmek gerekir.--
--metinsel ifadelere tek tırnak içerisinde belirtilir.--
SELECT FirstName [İSİM burada],soyisim=LastName,Title AS BAŞLIK FROM Employees

select ad=FirstName,soyad=LastName,başlık=Title,'doğumtarihi'=BirthDate from Employees 
--tek tırnakla yazdıktan sonra eşittir  operatörü koyulup sutun adı yazılır.--

--3.yol
select FirstName as isim,LastName as [soyisim],Title as [başlık],BirthDate as [doğum tarihi] from Employees
--as yazdıktan sonra köseli parantez ilede ayrıyetten isimlendirme yapılabilir.--

--TEKİL KAYITLARI LİSTELEME

SELECT City FROM Employees
--aynı sehirler lişstelenir--
select distinct City from Employees
--tekrar eden sehirler (tekil değer olarak) sorgulanır.--
--select distinct komutu ile--


select distinct FirstName,City from Employees
--her isme karşılık bir sehir oldugundan yine isme karsılık gelen sehirleri aynı  olsa bile getirir.--
--eger aynı isimde ve sehirde aynı olsaydı birtanesini getirirdi.--



--metin birleştirme 
select [TitleOfCourtesy] [LastName], [FirstName] from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') as isim from  Employees
--sütünları birleştirmek için sütün ismi ve + oparatöruyle birleştırılır ' ' 
--ile kelimeler arasına bir boşluk bırakılır 
-- sütün başlığını değiştirmek içinde as komutuyla değiştirilir.


-- SORGULAMA (FİLTRELEME)
--YAZDIGIMIZ SORGULARIN BELİRLİ KOSULLLARA GÖRE FİLTRELEYEBİLİŞRİZ.BUNUN İÇİN WHERE KEYWORDU KULLANILIR.--
--MR. ÜNVANI OLANLARI FİLTRELETYİN.
SELECT FirstName,LastName,TitleOfCourtesy FROM Employees where TitleOfCourtesy ='mr.'
--aramak isteiğimiz krıter metinsel ifadeyse tırnak içinde yazılır.--


--EMPLOY ID 5 TEN BÜYÜK OLANLARI SORILAYIN.--
SELECT FirstName,LastName,EmployeeID  FROM Employees where EmployeeID >5
--sayısal işlemleri filtrelerken tırnak kullanulmaz.

--1960yılında doğankların listelenmesi
SELECT FirstName,LastName,BirthDate    FROM Employees where year(BirthDate) =1960

--year metoduyla sorgularsak yıl sorgulaması yapmış oluruz.


--doğum günü almak istersek mounth 
SELECT FirstName,LastName,BirthDate    FROM Employees where day(BirthDate) =27


SELECT FirstName,LastName,BirthDate    FROM Employees where month(BirthDate) =08

--doğum günü almak istersek day fonksıyonu yazmak gerekir.

--19650 ile 1961 arasında doğanları sorgulayınız.
SELECT FirstName,LastName,BirthDate FROM Employees where year(BirthDate)>=1950 and year(BirthDate)<=1961


--ingilterede oturan bayanaklrın adı,soyadı,mesle,ünvanı,ülkesi ve doğum atarıhını lsitele

select * from Employees
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees
 where Country='uk' and (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.')

--üsteekiyle alttakı aynı sorgudur--
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees 
where (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.') and Country='uk' 
--işlem önceliğini kullanmak gerekir  baağlaçlara dikkat etmek gerekiyor. 
--bayanlar dediğimizde ms ve mrs birlikte sorgulamak için and bağlacı kullanılır.



--ünvanı mr. olanlar veya yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' or YEAR(BirthDate)<=1961

--ünvanı mr. olanlar ve yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' and YEAR(BirthDate)<=1961


--yaş hesabı fonsksıyonla  nasıl yapılır--
select FirstName as isim,LastName as soyısım,TitleOfCourtesy as ünvan,
 YEAR(getdate())-YEAR(BirthDate) as yaş from Employees where TitleOfCourtesy='mr.'
or (year(getdate())-YEAR(BirthDate)> 60)


--get date fonksiyonu güncel tarıh bilgisini verir.
--YEAR(getdate())-YEAR(BirthDate)

--.Year() fonksıyonuyla birlikte o tarıhe 
--ait olan yıl bilgisini ögereniyoruz.
--örneği yukarda yas olarak isimlendirdiğimiz 
--sütün ismini where ifadeysiyle birlite kullanmalıyız.


select * from Employees where Region is null
--null olan degerler gelir


select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is null

--ıs not null dersek null olanlar gelmez
select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is not null


--SIRALAMA İŞLEMLERİ YAPMA--


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8


 --asc yazmassak zaten defoulttan asc oldugu için  a dan z ye sıralar--
SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName asc 


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName desc
--tersten sıralama yapar.--



select FirstName,LastName,BirthDate,HireDate from Employees order by FirstName,LastName desc

--ELDE ETTĞİMİŞZ SONUÇ KUMESİNİN ADA GÖRE ARTAN SIRADA SIRALADIK
--EĞER AYNI ADA SHIP BİRDEN GFAZLA KAYIT VARSA BUNLARI SOOPYADA GÖRE AZALAN SIRADA YAPIYORUZ.


select FirstName,LastName,BirthDate from Employees order by YEAR(BirthDate) ASC

select FirstName,LastName,BirthDate,HireDate,Title,TitleOfCourtesy from Employees order by 6,4 desc

--sorguda yazdığımız sıralama işlemi ilk önce 6.sutunun değerleriini  yanı title of coyurstey 
--artan sıralama yaptı daha sonra 4.sıradanki hiredate e göre azalana göre sıralama yaptı.

-- çalısanlarını unvanları göre ünvanları aynıysa yaşlarına göre sıralama yapınız.

select FirstName,LastName,TitleOfCourtesy as ünvan,YEAR(getdate())-YEAR(BirthDate) as yaş from Employees 

order by TitleOfCourtesy,yaş desc



--order by sıralamasında as ile isimlendirdiğimiz kolon kulllanılabılır.


--product tablosunu listele

select * from Products


--ürünleri a dan z ye listele
select * from Products order by ProductName asc

--ürünleri a sırasına göre tersten listele
select * from Products order by ProductName desc


--catageorı ıd 3 olanları listele
select * from Products where CategoryID=3

--kategorı ıd 3 olanları artan sırala
select * from Products where CategoryID=3 order by ProductName

--employs çalışanların adı soyadı tek kolonda bastır
 

select (LastName+' '+FirstName) as isim from Employees 



--pruduct tablosuna unıtprice yuzde 18 kdv uygulama yap yazdır.

select unitprice*0.18 as 'birim fiyat' from Products          




--T-SQL ALT KAGEGORİLERİ
--DML DATA MANIPULATION LANGUAGE
--DDL DATA DEFİNİTİON LANGUAGE
--DCL DATA  DATA CONTOL LANGUAGE

--SELECT
--İNSERT 
--UPDATE
--DELETE
 

 --CREATE
 --ALTER
 --DROP


 --GRANY
 --DENY
 --REVOKE

 --BETWEEN VE AND KULLANIMI
 --ARALIK BİLDİRMEKTE KULLANILIR

 SELECT * FROM Employees WHERE year(BirthDate) BETWEEN 1948  and 1960 order by BirthDate asc

 --2.yol

 SELECT FirstName,LastName,YEAR(BirthDate) as yaş FROM Employees WHERE year(BirthDate)>1948 and YEAR(BirthDate)<1960 order by BirthDate asc



 --alfabetik olarak janet ve robert  arasında olanların listelenmesi


 select FirstName,LastName from Employees where   FirstName>='janet' and FirstName<='robert' order by FirstName

 --where yazdıktan sonra her isim için kolon ismi yazılır  

 
 select FirstName,LastName from Employees where   FirstName between 'janet' and 'robert' order by FirstName

 --where yazdıktan kolon ismi daha sonra between ve şartlar yazılır arasına and bağlacı konulur.
 --order by sorguda en sonda olmalıdır.




 --IN KEYWORDU  kullanımı


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy IN('DR.','MR.')


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy>='dr.' and TitleOfCourtesy<='mr.'


SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy='dr.' OR TitleOfCourtesy='mr.'




--1950 1955 VE 1960 YILLARINDA DOGUNLARI LİSTELEYNİZİ.

--KISA YOL

SELECT FirstName,LastName,BirthDate FROM Employees WHERE YEAR(BirthDate) IN(1950,1955,1960)

-- TEK TEK SART YAZMAMAK İÇİN IN KEYWORDUYLA EŞİTLİK SATLARI YAN YANA AYAZILARAK YAPILIR.

--UZUN YOL 

SELECT FirstName,LastName,BirthDate  FROM Employees WHERE YEAR(BirthDate)=1950 OR YEAR(BirthDate)=1955 OR YEAR(BirthDate)=1960


                                --TOP KULLANIMI--

--SIRALAMA YAPMAK İÇİN KULLANILIR.

--select yazıktan sonra top yazılıp boşluktan sonra kaç satır getireceğimz yazılır.

--BUNU YAZDIKTAN SONRA KAÇ DEGER GİRERSEK O KADAR KAYIT GETİRİR


SELECT * FROM Employees

SELECT TOP 5  * FROM Employees
--* yazıdımız için bütün tablonun ilk 5 sırasını getririr.

--EMPOLYS TABLOSUNUN ADI SOYADI BAS EK BİLGİLERİNİN İLK 5 SATIRI GETİR VE VE TITLE OfF COSRT Z DEN A YE SIRALAMA YAP

SELECT top 5  TitleOfCourtesy,FirstName,LastName  from Employees order by TitleOfCourtesy desc


-- bir sorguda en son çalışan kısımdır.
--yani öncelik sorgumuz çalışır ve oluşacak sıralama polan sonuç kumesının resuklt set ilk beş kaydı alınır.


--çalışan tablosunda yaşlarına göre azalan sıralama yaptıktan sonra oluşacak olan sonuç kumesinin %25lik jkısmını listeleyelım.

select top 25 percent  FirstName,LastName,year(getdate())-YEAR(BirthDate) as yas from Employees order by yas desc

--eger belirttiğimiz oran sonucu kendi hesapladıogı için sonuç 3.2 tane çıktaysa bu durumda bize ilk 4 sonucu sıralayacaktır.
--yanı uste yuvarlama işlemi yapacaktır.


--kulllanıcıları işe giriş tarıhıne göre tersten sıralayaarak ilk 3unu getiriniz.hiredate

select top 3 FirstName,LastName,HireDate as işegiristarih from Employees order by hiredate desc





--LİKE KULLANIMI 

SELECT FirstName,LastName,Title FROM Employees where FirstName='michael'

--eskiden böyle yapıyorduk

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'michael'


SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and LastName like 'f%'


SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%n' 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and FirstName like '%e'

--lik isaretiyle birlikte  tırnak içişnde yuzde işasretiyle birlikte kullanılır


--adının içinde e harfı gecenler

select FirstName from Employees where FirstName like '%e%'

--adının ilk harfı a veya l olnalr gelsın

--1.yol 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' or FirstName like 'l%'

--2.yol

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '[al]%' 

--adının içinde r veya t bulunan lar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%r%' or FirstName like '%t%'

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '%[rt]%' 


-- adının ilk harfı j ile r aralıgında olnalrı getir


SELECT FirstName,LastName,Title FROM Employees where FirstName like '[j-r]%'  order by FirstName


SELECT FirstName,LastName,Title FROM Employees where FirstName between 'j%' and 'r%' order by FirstName


--a ile e arasıdan tek karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a_e%'  order by FirstName

--a ile e arasıdan ıkı karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a__e%'  order by FirstName

--ilk harfı m olmayanlar 

SELECT FirstName,LastName,Title FROM Employees where FirstName not like 'm%' order by 1

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^m]%' order by 1

 
 -- adı t ile bitmeyenler

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%[^t]' order by 1
SELECT FirstName,LastName,Title FROM Employees where FirstName not like '%t' order by 1



--adının ilk harfı a ile ı arasında bulunmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a-ı]%'  order by FirstName

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a]%' and FirstName like '[^ı]%'


SELECT FirstName,LastName,Title FROM Employees where FirstName not like '[a-ı]%'  order by FirstName


--adının 2.harfı a veya t olmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '_[^at]%'

--adınıon ilk 2 harfı la  na aa an  olanlar

--uzun yol
SELECT FirstName,LastName,Title FROM Employees where FirstName like 'la%'  or FirstName like 'na%' 
or FirstName like 'aa%' or FirstName like 'an%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[la,na,aa,an]%' order by FirstName


--içerisinde _ gecen isimlerin listelenmesi
--normalde _karakterinin özel bir anlmaı vardır ve tek bir karatkter yerıne 
--ggeçer ancak [] işçinde belirttiğimzde siradan bir jkarakter gibi aratabilir.

select * from Employees where FirstName like '%\_%' escape '\'


select * from Employees where FirstName like '%[_]%'


--costomer tablosujdan costumer ıd sının 2.harfı a ,4.harfi t olanların %10luk kısmını getiren sorguyu yapınız

select top 10 percent  * from Customers where CustomerID like '_a%' and CustomerID like '___t%'


select top 10 percent  * from Customers where CustomerID like '_a_t%'








--insert işlemini tablodan yapmadan kod ile tabloya bilgi ekleme yapılabılır.

--VERİ TABANI İŞLEMLERİ 
--1 İNSERT:BİR VERİ TABANINDAKLI TABLOLARI BİRİNE YENİ VERİ EKELMEK İÇİN KULLNANILIR.

--İNSERT INTO  <TABLO ADI> (<SUTUN ISIMLERİ> VALUES <SUTUN DEGERLERİ>
--VALUES  


USE Northwind

insert INTO Categories(CategoryName,Description)
values ('baklagiller','güzeldir bunkların tadı:')

-- insert ıntodan sonra tablo adı parantyez aç colon adları  parantez kapat
-- values tekrar parantez tırnak aç degerleri yaz parantez kapat

select * from Categories


insert into Categories(Description)
values('kategori ıd  giriniz')

--executede hata verdi çünkü categoriname null geçilmesi aktıf
-- edilmeiği için null degeri  girdiğimzden dolayı hata verdi.
--insert işlemi sırasında bunlara deger atamalıyız.
--(eger ıdentıty özelliğinde bir sutun var ise (otomatık artan)
--bu sutun degeri sistem tarafından atanagağı için insert işlemşnde belirtmeye gerekk yoktur.

--bir tabloya veri ekelnecekse bunlar sıraasıyla yapılmalıdır.


--shippers tablosuna yeni veri ekleyın.
select * from Shippers

insert into Shippers values('mng kargo','216 015 42 65')


--customer tablosuna 'vadafone' sirketini ekleyın.

select * from  Customers 
insert into Customers(CustomerID,CompanyName) values ('ABCDE','vadafone')

--CUSTOMER ID BOŞ GEÇİLMELDİĞİ İÇİN ID DE GİRMEMİZ GEREKİYOR.



                                           --UPDATE KOMUTU--

-- bir tablodaki verileri güncellemek için kullanılır.
--DİKKAT ETMEMMİZ GEREKEBN OLAY NEREYİ GÜNCELLEMEK İSTEDİĞİNİ YAZMALISIN YOKSA 
--BÜTÜN KAYITLAR VERMİŞİ OLDUGUNUZ VERİ İLŞE GÜNCELLENİR.


--KULLANIMI
--UPDATE <TABLO_ADI>
--SET <KOLON ADI>=<YENİ DEGER>


SELECT * into ÇALISANLAR FROM Employees
--empyoes tablosundaki veriler yeni bir tabloya (çalısanlar tablosuna) kopyalanadı. toplu  insert yaptık.


update ÇALISANLAR
set LastName='soyaadı'

select * from ÇALISANLAR
--çalısanlar tablsundaki büğtün verileri soyadıyla değiştirilecektir.
--cünkü güncelleme yapmak için hangi kayıt üstünde güncelleme yapacagımızı belirtmedik.
--(istenmeyen durum)
 


 insert into Employees(LastName,FirstName) values ('ahmet','mahmut')
 select * from Employees

 update Employees set FirstName='muhammet',LastName='aydın' where EmployeeID=10

  select * from Employees


 --employeıd si 10 olan satırı bizim istediğimiz sekiklde degiştir.
 --bir kayıt güncelleme yaparken en güzel sekil ıdsi(pk) üzerinden degiklik yapmaktır.cünkü pk tek sefer kullanılır
 --firstname üzerinden yapılasaydı bu sefer aynı ada sahip molannların hepsi güncellecektir.
 --işlemklerde tekillik saglamak için primary key uzerınden işlem yapılnmadılırı.


 --prudect tablosundaki verileri üsürnler adında bir taablo oluştutrarak kopyalayınız.
 ---ürünlerin birim fişyatina yuzde 5 zam yaparak güncelleyiniz.

 select * into ürünler from Products

 select * from ürünler

 update ürünler set UnitPrice=UnitPrice*1.05

 --2.yol

 update ürünler set UnitPrice=UnitPrice+(UnitPrice*0.05)

 select * from ürünler
 --her seferinde fiyat güncellemesi yapar.


 --DELETE KOMUTU 

 --bir tablodan kayıt silmek için kullanılır.

 --aydnı updatedekiş gibi dikkatlı olunması gerekir cünkü birden fazala kayıt yanlışlıkla silinebilir.
 --delete from <tablo_adı>



  select * into ürünler2 from Products
 delete from ürünler2

--ürünler2 tablasundaki bütün verileri siler 
--bunden daolyı hangi satırda işlem yapacaksak ıd bilgisi yanı keywordu belirmemiz gerekir.
  
 --employ tablsundan 11 ıd sil

 delete from Employees where EmployeeID=11
select * from Employees

  select * into çalısanlar from Employees

  select * from çalısanlar

  delete from çalısanlar where FirstName='michael'


  --ünvanı mr. dr. olanları sil
    select * from çalısanlar
	delete from çalısanlar where TitleOfCourtesy='DR.' AND TitleOfCourtesy='MR.'
	
--YORUM SATIRI YAPMAK İÇİN "--" KULLANILIR--
--SQL VERİ TABANI BÜYÜK KÜÇÜK HARF DUYARLILIĞINA SAHİP DEGİLDİR--
--DML DATA MANIPULATION LANGUAGE ANLAMINA GELİR--
--NORTHWİND VERİ TABANI ÜZERİNDE SORGULAMALAR YAPACAGIZ--
--USE YAZMAK YERİNE SOL ÜSTTENDE HANGİ VERİTABANINDA ÇALIŞMAK İSTEDİĞİMİZİ SEÇEBİLİRİZ--
--TABLOLARI SORGULAMAK İÇİN "SELECT" KOMUTU KULLANILIR.--
--SELECT SÜTUN ADI FROM TABLO ADI--
--SUTUN ADLARI ARASINDA VİERGÜL KULLANILIR--
--SELECT * FROM TABLO ADI YAZARSAK BÜTÜN KOLONLAR GELİR--


USE Northwind
SELECT * FROM Employees
-- *  FROM TABLO ADINI YAZARSAK O TABLONUN HEPSİNİ GETİRİR--
select FirstName,LastName,Title from Employees
-- SUTUN ADLARI NI YAZIP FROM HANGİ TABLODAN ÇEKMEK İSTİYORSAK 
--ONU YAZDUIĞIMIZDA İLGİLİ TABLONUN İLGİLİ SUTUNLARI GELİR.--
SELECT EmployeeID,OrderDate,ShippedDate FROM Orders


SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate],
 [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension],
  [Photo], [Notes], [ReportsTo], [PhotoPath] FROM Employees
--TABLO İÇİNDEN AÇTIKTAN SONRA COLON KLASÖRÜNÜ SÜRÜKLEYİP EKRANA BIRAKTIGIMIZDA TABLO EKRANA EKLENİR--


SELECT FirstName AS İSİM,LastName AS SOYISIM,Title AS BAŞLIK FROM Employees
--1.yol
-- sutun adından sonra as  boşluk isteiğimiz texti yazarsak sorguda
-- isdeğimiz sekilde karşımıza çıkarır.fakat tablodan değişiklik olmaz--
--üstte göründüğü sekilde--
--2.yol
--birden fazla kelimelik isimlendirme yapılacaksa köseli parantez içinde veya  tek tırnakla belirmek gerekir.--
--metinsel ifadelere tek tırnak içerisinde belirtilir.--
SELECT FirstName [İSİM burada],soyisim=LastName,Title AS BAŞLIK FROM Employees

select ad=FirstName,soyad=LastName,başlık=Title,'doğumtarihi'=BirthDate from Employees 
--tek tırnakla yazdıktan sonra eşittir  operatörü koyulup sutun adı yazılır.--

--3.yol
select FirstName as isim,LastName as [soyisim],Title as [başlık],BirthDate as [doğum tarihi] from Employees
--as yazdıktan sonra köseli parantez ilede ayrıyetten isimlendirme yapılabilir.--

--TEKİL KAYITLARI LİSTELEME

SELECT City FROM Employees
--aynı sehirler lişstelenir--
select distinct City from Employees
--tekrar eden sehirler (tekil değer olarak) sorgulanır.--
--select distinct komutu ile--


select distinct FirstName,City from Employees
--her isme karşılık bir sehir oldugundan yine isme karsılık gelen sehirleri aynı  olsa bile getirir.--
--eger aynı isimde ve sehirde aynı olsaydı birtanesini getirirdi.--



--metin birleştirme 
select [TitleOfCourtesy] [LastName], [FirstName] from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') as isim from  Employees
--sütünları birleştirmek için sütün ismi ve + oparatöruyle birleştırılır ' ' 
--ile kelimeler arasına bir boşluk bırakılır 
-- sütün başlığını değiştirmek içinde as komutuyla değiştirilir.


-- SORGULAMA (FİLTRELEME)
--YAZDIGIMIZ SORGULARIN BELİRLİ KOSULLLARA GÖRE FİLTRELEYEBİLİŞRİZ.BUNUN İÇİN WHERE KEYWORDU KULLANILIR.--
--MR. ÜNVANI OLANLARI FİLTRELETYİN.
SELECT FirstName,LastName,TitleOfCourtesy FROM Employees where TitleOfCourtesy ='mr.'
--aramak isteiğimiz krıter metinsel ifadeyse tırnak içinde yazılır.--


--EMPLOY ID 5 TEN BÜYÜK OLANLARI SORILAYIN.--
SELECT FirstName,LastName,EmployeeID  FROM Employees where EmployeeID >5
--sayısal işlemleri filtrelerken tırnak kullanulmaz.

--1960yılında doğankların listelenmesi
SELECT FirstName,LastName,BirthDate    FROM Employees where year(BirthDate) =1960

--year metoduyla sorgularsak yıl sorgulaması yapmış oluruz.


--doğum günü almak istersek mounth 
SELECT FirstName,LastName,BirthDate    FROM Employees where day(BirthDate) =27


SELECT FirstName,LastName,BirthDate    FROM Employees where month(BirthDate) =08

--doğum günü almak istersek day fonksıyonu yazmak gerekir.

--19650 ile 1961 arasında doğanları sorgulayınız.
SELECT FirstName,LastName,BirthDate FROM Employees where year(BirthDate)>=1950 and year(BirthDate)<=1961


--ingilterede oturan bayanaklrın adı,soyadı,mesle,ünvanı,ülkesi ve doğum atarıhını lsitele

select * from Employees
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees
 where Country='uk' and (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.')

--üsteekiyle alttakı aynı sorgudur--
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees 
where (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.') and Country='uk' 
--işlem önceliğini kullanmak gerekir  baağlaçlara dikkat etmek gerekiyor. 
--bayanlar dediğimizde ms ve mrs birlikte sorgulamak için and bağlacı kullanılır.



--ünvanı mr. olanlar veya yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' or YEAR(BirthDate)<=1961

--ünvanı mr. olanlar ve yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' and YEAR(BirthDate)<=1961


--yaş hesabı fonsksıyonla  nasıl yapılır--
select FirstName as isim,LastName as soyısım,TitleOfCourtesy as ünvan,
 YEAR(getdate())-YEAR(BirthDate) as yaş from Employees where TitleOfCourtesy='mr.'
or (year(getdate())-YEAR(BirthDate)> 60)


--get date fonksiyonu güncel tarıh bilgisini verir.
--YEAR(getdate())-YEAR(BirthDate)

--.Year() fonksıyonuyla birlikte o tarıhe 
--ait olan yıl bilgisini ögereniyoruz.
--örneği yukarda yas olarak isimlendirdiğimiz 
--sütün ismini where ifadeysiyle birlite kullanmalıyız.


select * from Employees where Region is null
--null olan degerler gelir


select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is null

--ıs not null dersek null olanlar gelmez
select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is not null


--SIRALAMA İŞLEMLERİ YAPMA--


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8


 --asc yazmassak zaten defoulttan asc oldugu için  a dan z ye sıralar--
SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName asc 


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName desc
--tersten sıralama yapar.--



select FirstName,LastName,BirthDate,HireDate from Employees order by FirstName,LastName desc

--ELDE ETTĞİMİŞZ SONUÇ KUMESİNİN ADA GÖRE ARTAN SIRADA SIRALADIK
--EĞER AYNI ADA SHIP BİRDEN GFAZLA KAYIT VARSA BUNLARI SOOPYADA GÖRE AZALAN SIRADA YAPIYORUZ.


select FirstName,LastName,BirthDate from Employees order by YEAR(BirthDate) ASC

select FirstName,LastName,BirthDate,HireDate,Title,TitleOfCourtesy from Employees order by 6,4 desc

--sorguda yazdığımız sıralama işlemi ilk önce 6.sutunun değerleriini  yanı title of coyurstey 
--artan sıralama yaptı daha sonra 4.sıradanki hiredate e göre azalana göre sıralama yaptı.

-- çalısanlarını unvanları göre ünvanları aynıysa yaşlarına göre sıralama yapınız.

select FirstName,LastName,TitleOfCourtesy as ünvan,YEAR(getdate())-YEAR(BirthDate) as yaş from Employees 

order by TitleOfCourtesy,yaş desc



--order by sıralamasında as ile isimlendirdiğimiz kolon kulllanılabılır.


--product tablosunu listele

select * from Products


--ürünleri a dan z ye listele
select * from Products order by ProductName asc

--ürünleri a sırasına göre tersten listele
select * from Products order by ProductName desc


--catageorı ıd 3 olanları listele
select * from Products where CategoryID=3

--kategorı ıd 3 olanları artan sırala
select * from Products where CategoryID=3 order by ProductName

--employs çalışanların adı soyadı tek kolonda bastır
 

select (LastName+' '+FirstName) as isim from Employees 



--pruduct tablosuna unıtprice yuzde 18 kdv uygulama yap yazdır.

select unitprice*0.18 as 'birim fiyat' from Products          




--T-SQL ALT KAGEGORİLERİ
--DML DATA MANIPULATION LANGUAGE
--DDL DATA DEFİNİTİON LANGUAGE
--DCL DATA  DATA CONTOL LANGUAGE

--SELECT
--İNSERT 
--UPDATE
--DELETE
 

 --CREATE
 --ALTER
 --DROP


 --GRANY
 --DENY
 --REVOKE

 --BETWEEN VE AND KULLANIMI
 --ARALIK BİLDİRMEKTE KULLANILIR

 SELECT * FROM Employees WHERE year(BirthDate) BETWEEN 1948  and 1960 order by BirthDate asc

 --2.yol

 SELECT FirstName,LastName,YEAR(BirthDate) as yaş FROM Employees WHERE year(BirthDate)>1948 and YEAR(BirthDate)<1960 order by BirthDate asc



 --alfabetik olarak janet ve robert  arasında olanların listelenmesi


 select FirstName,LastName from Employees where   FirstName>='janet' and FirstName<='robert' order by FirstName

 --where yazdıktan sonra her isim için kolon ismi yazılır  

 
 select FirstName,LastName from Employees where   FirstName between 'janet' and 'robert' order by FirstName

 --where yazdıktan kolon ismi daha sonra between ve şartlar yazılır arasına and bağlacı konulur.
 --order by sorguda en sonda olmalıdır.




 --IN KEYWORDU  kullanımı


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy IN('DR.','MR.')


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy>='dr.' and TitleOfCourtesy<='mr.'


SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy='dr.' OR TitleOfCourtesy='mr.'




--1950 1955 VE 1960 YILLARINDA DOGUNLARI LİSTELEYNİZİ.

--KISA YOL

SELECT FirstName,LastName,BirthDate FROM Employees WHERE YEAR(BirthDate) IN(1950,1955,1960)

-- TEK TEK SART YAZMAMAK İÇİN IN KEYWORDUYLA EŞİTLİK SATLARI YAN YANA AYAZILARAK YAPILIR.

--UZUN YOL 

SELECT FirstName,LastName,BirthDate  FROM Employees WHERE YEAR(BirthDate)=1950 OR YEAR(BirthDate)=1955 OR YEAR(BirthDate)=1960


                                --TOP KULLANIMI--

--SIRALAMA YAPMAK İÇİN KULLANILIR.

--select yazıktan sonra top yazılıp boşluktan sonra kaç satır getireceğimz yazılır.

--BUNU YAZDIKTAN SONRA KAÇ DEGER GİRERSEK O KADAR KAYIT GETİRİR


SELECT * FROM Employees

SELECT TOP 5  * FROM Employees
--* yazıdımız için bütün tablonun ilk 5 sırasını getririr.

--EMPOLYS TABLOSUNUN ADI SOYADI BAS EK BİLGİLERİNİN İLK 5 SATIRI GETİR VE VE TITLE OfF COSRT Z DEN A YE SIRALAMA YAP

SELECT top 5  TitleOfCourtesy,FirstName,LastName  from Employees order by TitleOfCourtesy desc


-- bir sorguda en son çalışan kısımdır.
--yani öncelik sorgumuz çalışır ve oluşacak sıralama polan sonuç kumesının resuklt set ilk beş kaydı alınır.


--çalışan tablosunda yaşlarına göre azalan sıralama yaptıktan sonra oluşacak olan sonuç kumesinin %25lik jkısmını listeleyelım.

select top 25 percent  FirstName,LastName,year(getdate())-YEAR(BirthDate) as yas from Employees order by yas desc

--eger belirttiğimiz oran sonucu kendi hesapladıogı için sonuç 3.2 tane çıktaysa bu durumda bize ilk 4 sonucu sıralayacaktır.
--yanı uste yuvarlama işlemi yapacaktır.


--kulllanıcıları işe giriş tarıhıne göre tersten sıralayaarak ilk 3unu getiriniz.hiredate

select top 3 FirstName,LastName,HireDate as işegiristarih from Employees order by hiredate desc





--LİKE KULLANIMI 

SELECT FirstName,LastName,Title FROM Employees where FirstName='michael'

--eskiden böyle yapıyorduk

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'michael'


SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and LastName like 'f%'


SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%n' 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and FirstName like '%e'

--lik isaretiyle birlikte  tırnak içişnde yuzde işasretiyle birlikte kullanılır


--adının içinde e harfı gecenler

select FirstName from Employees where FirstName like '%e%'

--adının ilk harfı a veya l olnalr gelsın

--1.yol 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' or FirstName like 'l%'

--2.yol

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '[al]%' 

--adının içinde r veya t bulunan lar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%r%' or FirstName like '%t%'

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '%[rt]%' 


-- adının ilk harfı j ile r aralıgında olnalrı getir


SELECT FirstName,LastName,Title FROM Employees where FirstName like '[j-r]%'  order by FirstName


SELECT FirstName,LastName,Title FROM Employees where FirstName between 'j%' and 'r%' order by FirstName


--a ile e arasıdan tek karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a_e%'  order by FirstName

--a ile e arasıdan ıkı karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a__e%'  order by FirstName

--ilk harfı m olmayanlar 

SELECT FirstName,LastName,Title FROM Employees where FirstName not like 'm%' order by 1

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^m]%' order by 1

 
 -- adı t ile bitmeyenler

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%[^t]' order by 1
SELECT FirstName,LastName,Title FROM Employees where FirstName not like '%t' order by 1



--adının ilk harfı a ile ı arasında bulunmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a-ı]%'  order by FirstName

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a]%' and FirstName like '[^ı]%'


SELECT FirstName,LastName,Title FROM Employees where FirstName not like '[a-ı]%'  order by FirstName


--adının 2.harfı a veya t olmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '_[^at]%'

--adınıon ilk 2 harfı la  na aa an  olanlar

--uzun yol
SELECT FirstName,LastName,Title FROM Employees where FirstName like 'la%'  or FirstName like 'na%' 
or FirstName like 'aa%' or FirstName like 'an%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[la,na,aa,an]%' order by FirstName


--içerisinde _ gecen isimlerin listelenmesi
--normalde _karakterinin özel bir anlmaı vardır ve tek bir karatkter yerıne 
--ggeçer ancak [] işçinde belirttiğimzde siradan bir jkarakter gibi aratabilir.

select * from Employees where FirstName like '%\_%' escape '\'


select * from Employees where FirstName like '%[_]%'


--costomer tablosujdan costumer ıd sının 2.harfı a ,4.harfi t olanların %10luk kısmını getiren sorguyu yapınız

select top 10 percent  * from Customers where CustomerID like '_a%' and CustomerID like '___t%'


select top 10 percent  * from Customers where CustomerID like '_a_t%'








--insert işlemini tablodan yapmadan kod ile tabloya bilgi ekleme yapılabılır.

--VERİ TABANI İŞLEMLERİ 
--1 İNSERT:BİR VERİ TABANINDAKLI TABLOLARI BİRİNE YENİ VERİ EKELMEK İÇİN KULLNANILIR.

--İNSERT INTO  <TABLO ADI> (<SUTUN ISIMLERİ>) VALUES (<SUTUN DEGERLERİ>)
--VALUES  


USE Northwind

insert INTO Categories(CategoryName,Description)
values ('baklagiller','güzeldir bunların tadı:')

-- insert ıntodan sonra tablo adı parantyez aç colon adları  parantez kapat
-- values tekrar parantez tırnak aç degerleri yaz parantez kapat

select * from Categories


insert into Categories(Description)
values('kategori ıd  giriniz')
--categoriname boş geçilebilir oldugu için ktegorı name boş geçip dicciriptıon kısmını doldurdu
-- eger null geçilmez olsaydı programı execute ettıgımızde hata vericekti.



--executede hata verdi çünkü categoriname null geçilmesi aktıf
-- edilmeiği için null degeri  girdiğimzden dolayı hata verdi.
--insert işlemi sırasında bunlara deger atamalıyız.
--(eger ıdentıty özelliğinde bir sutun var ise (otomatık artan)
--bu sutun degeri sistem tarafından atanagağı için insert işlemşnde belirtmeye gerekk yoktur.


--eger bir sutuna hepsine veri girilecekse verileri sırasıyla girilmesi gerekir.


insert into Shippers(ShipperID,CompanyName,Phone)







--YORUM SATIRI YAPMAK İÇİN "--" KULLANILIR--
--SQL VERİ TABANI BÜYÜK KÜÇÜK HARF DUYARLILIĞINA SAHİP DEGİLDİR--
--DML DATA MANIPULATION LANGUAGE ANLAMINA GELİR--
--NORTHWİND VERİ TABANI ÜZERİNDE SORGULAMALAR YAPACAGIZ--
--USE YAZMAK YERİNE SOL ÜSTTENDE HANGİ VERİTABANINDA ÇALIŞMAK İSTEDİĞİMİZİ SEÇEBİLİRİZ--
--TABLOLARI SORGULAMAK İÇİN "SELECT" KOMUTU KULLANILIR.--
--SELECT SÜTUN ADI FROM TABLO ADI--
--SUTUN ADLARI ARASINDA VİERGÜL KULLANILIR--
--SELECT * FROM TABLO ADI YAZARSAK BÜTÜN KOLONLAR GELİR--


USE Northwind
SELECT * FROM Employees
-- *  FROM TABLO ADINI YAZARSAK O TABLONUN HEPSİNİ GETİRİR--
select FirstName,LastName,Title from Employees
-- SUTUN ADLARI NI YAZIP FROM HANGİ TABLODAN ÇEKMEK İSTİYORSAK 
--ONU YAZDUIĞIMIZDA İLGİLİ TABLONUN İLGİLİ SUTUNLARI GELİR.--
SELECT EmployeeID,OrderDate,ShippedDate FROM Orders


SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate],
 [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension],
  [Photo], [Notes], [ReportsTo], [PhotoPath] FROM Employees
--TABLO İÇİNDEN AÇTIKTAN SONRA COLON KLASÖRÜNÜ SÜRÜKLEYİP EKRANA BIRAKTIGIMIZDA TABLO EKRANA EKLENİR--


SELECT FirstName AS İSİM,LastName AS SOYISIM,Title AS BAŞLIK FROM Employees
--1.yol
-- sutun adından sonra as  boşluk isteiğimiz texti yazarsak sorguda
-- isdeğimiz sekilde karşımıza çıkarır.fakat tablodan değişiklik olmaz--
--üstte göründüğü sekilde--
--2.yol
--birden fazla kelimelik isimlendirme yapılacaksa köseli parantez içinde veya  tek tırnakla belirmek gerekir.--
--metinsel ifadelere tek tırnak içerisinde belirtilir.--
SELECT FirstName [İSİM burada],soyisim=LastName,Title AS BAŞLIK FROM Employees

select ad=FirstName,soyad=LastName,başlık=Title,'doğumtarihi'=BirthDate from Employees 
--tek tırnakla yazdıktan sonra eşittir  operatörü koyulup sutun adı yazılır.--

--3.yol
select FirstName as isim,LastName as [soyisim],Title as [başlık],BirthDate as [doğum tarihi] from Employees
--as yazdıktan sonra köseli parantez ilede ayrıyetten isimlendirme yapılabilir.--

--TEKİL KAYITLARI LİSTELEME

SELECT City FROM Employees
--aynı sehirler lişstelenir--
select distinct City from Employees
--tekrar eden sehirler (tekil değer olarak) sorgulanır.--
--select distinct komutu ile--


select distinct FirstName,City from Employees
--her isme karşılık bir sehir oldugundan yine isme karsılık gelen sehirleri aynı  olsa bile getirir.--
--eger aynı isimde ve sehirde aynı olsaydı birtanesini getirirdi.--



--metin birleştirme 
select [TitleOfCourtesy] [LastName], [FirstName] from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') from Employees
select  (TitleOfCourtesy+' '+LastName+' '+FirstName+' ') as isim from  Employees
--sütünları birleştirmek için sütün ismi ve + oparatöruyle birleştırılır ' ' 
--ile kelimeler arasına bir boşluk bırakılır 
-- sütün başlığını değiştirmek içinde as komutuyla değiştirilir.


-- SORGULAMA (FİLTRELEME)
--YAZDIGIMIZ SORGULARIN BELİRLİ KOSULLLARA GÖRE FİLTRELEYEBİLİŞRİZ.BUNUN İÇİN WHERE KEYWORDU KULLANILIR.--
--MR. ÜNVANI OLANLARI FİLTRELETYİN.
SELECT FirstName,LastName,TitleOfCourtesy FROM Employees where TitleOfCourtesy ='mr.'
--aramak isteiğimiz krıter metinsel ifadeyse tırnak içinde yazılır.--


--EMPLOY ID 5 TEN BÜYÜK OLANLARI SORILAYIN.--
SELECT FirstName,LastName,EmployeeID  FROM Employees where EmployeeID >5
--sayısal işlemleri filtrelerken tırnak kullanulmaz.

--1960yılında doğankların listelenmesi
SELECT FirstName,LastName,BirthDate    FROM Employees where year(BirthDate) =1960

--year metoduyla sorgularsak yıl sorgulaması yapmış oluruz.


--doğum günü almak istersek mounth 
SELECT FirstName,LastName,BirthDate    FROM Employees where day(BirthDate) =27


SELECT FirstName,LastName,BirthDate    FROM Employees where month(BirthDate) =08

--doğum günü almak istersek day fonksıyonu yazmak gerekir.

--19650 ile 1961 arasında doğanları sorgulayınız.
SELECT FirstName,LastName,BirthDate FROM Employees where year(BirthDate)>=1950 and year(BirthDate)<=1961


--ingilterede oturan bayanaklrın adı,soyadı,mesle,ünvanı,ülkesi ve doğum atarıhını lsitele

select * from Employees
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees
 where Country='uk' and (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.')

--üsteekiyle alttakı aynı sorgudur--
select EmployeeID FirstName,LastName,Title,TitleOfCourtesy,BirthDate,Country from Employees 
where (TitleOfCourtesy='mrs.' or  TitleOfCourtesy='ms.') and Country='uk' 
--işlem önceliğini kullanmak gerekir  baağlaçlara dikkat etmek gerekiyor. 
--bayanlar dediğimizde ms ve mrs birlikte sorgulamak için and bağlacı kullanılır.



--ünvanı mr. olanlar veya yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' or YEAR(BirthDate)<=1961

--ünvanı mr. olanlar ve yaşı 60 tan büyük olanların listeleyin.
select * from Employees where TitleOfCourtesy='mr.' and YEAR(BirthDate)<=1961


--yaş hesabı fonsksıyonla  nasıl yapılır--
select FirstName as isim,LastName as soyısım,TitleOfCourtesy as ünvan,
 YEAR(getdate())-YEAR(BirthDate) as yaş from Employees where TitleOfCourtesy='mr.'
or (year(getdate())-YEAR(BirthDate)> 60)


--get date fonksiyonu güncel tarıh bilgisini verir.
--YEAR(getdate())-YEAR(BirthDate)

--.Year() fonksıyonuyla birlikte o tarıhe 
--ait olan yıl bilgisini ögereniyoruz.
--örneği yukarda yas olarak isimlendirdiğimiz 
--sütün ismini where ifadeysiyle birlite kullanmalıyız.


select * from Employees where Region is null
--null olan degerler gelir


select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is null

--ıs not null dersek null olanlar gelmez
select TitleOfCourtesy,FirstName,LastName,Region from Employees where Region is not null


--SIRALAMA İŞLEMLERİ YAPMA--


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8


 --asc yazmassak zaten defoulttan asc oldugu için  a dan z ye sıralar--
SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName asc 


SELECT * FROM Employees WHERE EmployeeID>2 AND EmployeeID<=8 
ORDER BY FirstName desc
--tersten sıralama yapar.--



select FirstName,LastName,BirthDate,HireDate from Employees order by FirstName,LastName desc

--ELDE ETTĞİMİŞZ SONUÇ KUMESİNİN ADA GÖRE ARTAN SIRADA SIRALADIK
--EĞER AYNI ADA SHIP BİRDEN GFAZLA KAYIT VARSA BUNLARI SOOPYADA GÖRE AZALAN SIRADA YAPIYORUZ.


select FirstName,LastName,BirthDate from Employees order by YEAR(BirthDate) ASC

select FirstName,LastName,BirthDate,HireDate,Title,TitleOfCourtesy from Employees order by 6,4 desc

--sorguda yazdığımız sıralama işlemi ilk önce 6.sutunun değerleriini  yanı title of coyurstey 
--artan sıralama yaptı daha sonra 4.sıradanki hiredate e göre azalana göre sıralama yaptı.

-- çalısanlarını unvanları göre ünvanları aynıysa yaşlarına göre sıralama yapınız.

select FirstName,LastName,TitleOfCourtesy as ünvan,YEAR(getdate())-YEAR(BirthDate) as yaş from Employees 

order by TitleOfCourtesy,yaş desc



--order by sıralamasında as ile isimlendirdiğimiz kolon kulllanılabılır.


--product tablosunu listele

select * from Products


--ürünleri a dan z ye listele
select * from Products order by ProductName asc

--ürünleri a sırasına göre tersten listele
select * from Products order by ProductName desc


--catageorı ıd 3 olanları listele
select * from Products where CategoryID=3

--kategorı ıd 3 olanları artan sırala
select * from Products where CategoryID=3 order by ProductName

--employs çalışanların adı soyadı tek kolonda bastır
 

select (LastName+' '+FirstName) as isim from Employees 



--pruduct tablosuna unıtprice yuzde 18 kdv uygulama yap yazdır.

select unitprice*0.18 as 'birim fiyat' from Products          




--T-SQL ALT KAGEGORİLERİ
--DML DATA MANIPULATION LANGUAGE
--DDL DATA DEFİNİTİON LANGUAGE
--DCL DATA  DATA CONTOL LANGUAGE

--SELECT
--İNSERT 
--UPDATE
--DELETE
 

 --CREATE
 --ALTER
 --DROP


 --GRANY
 --DENY
 --REVOKE

 --BETWEEN VE AND KULLANIMI
 --ARALIK BİLDİRMEKTE KULLANILIR

 SELECT * FROM Employees WHERE year(BirthDate) BETWEEN 1948  and 1960 order by BirthDate asc

 --2.yol

 SELECT FirstName,LastName,YEAR(BirthDate) as yaş FROM Employees WHERE year(BirthDate)>1948 and YEAR(BirthDate)<1960 order by BirthDate asc



 --alfabetik olarak janet ve robert  arasında olanların listelenmesi


 select FirstName,LastName from Employees where   FirstName>='janet' and FirstName<='robert' order by FirstName

 --where yazdıktan sonra her isim için kolon ismi yazılır  

 
 select FirstName,LastName from Employees where   FirstName between 'janet' and 'robert' order by FirstName

 --where yazdıktan kolon ismi daha sonra between ve şartlar yazılır arasına and bağlacı konulur.
 --order by sorguda en sonda olmalıdır.




 --IN KEYWORDU  kullanımı


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy IN('DR.','MR.')


 SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy>='dr.' and TitleOfCourtesy<='mr.'


SELECT TitleOfCourtesy+' '+FirstName+' '+LastName+' ' as İSİM FROM Employees WHERE TitleOfCourtesy='dr.' OR TitleOfCourtesy='mr.'




--1950 1955 VE 1960 YILLARINDA DOGUNLARI LİSTELEYNİZİ.

--KISA YOL

SELECT FirstName,LastName,BirthDate FROM Employees WHERE YEAR(BirthDate) IN(1950,1955,1960)

-- TEK TEK SART YAZMAMAK İÇİN IN KEYWORDUYLA EŞİTLİK SATLARI YAN YANA AYAZILARAK YAPILIR.

--UZUN YOL 

SELECT FirstName,LastName,BirthDate  FROM Employees WHERE YEAR(BirthDate)=1950 OR YEAR(BirthDate)=1955 OR YEAR(BirthDate)=1960


                                --TOP KULLANIMI--

--SIRALAMA YAPMAK İÇİN KULLANILIR.

--select yazıktan sonra top yazılıp boşluktan sonra kaç satır getireceğimz yazılır.

--BUNU YAZDIKTAN SONRA KAÇ DEGER GİRERSEK O KADAR KAYIT GETİRİR


SELECT * FROM Employees

SELECT TOP 5  * FROM Employees
--* yazıdımız için bütün tablonun ilk 5 sırasını getririr.

--EMPOLYS TABLOSUNUN ADI SOYADI BAS EK BİLGİLERİNİN İLK 5 SATIRI GETİR VE VE TITLE OfF COSRT Z DEN A YE SIRALAMA YAP

SELECT top 5  TitleOfCourtesy,FirstName,LastName  from Employees order by TitleOfCourtesy desc


-- bir sorguda en son çalışan kısımdır.
--yani öncelik sorgumuz çalışır ve oluşacak sıralama polan sonuç kumesının resuklt set ilk beş kaydı alınır.


--çalışan tablosunda yaşlarına göre azalan sıralama yaptıktan sonra oluşacak olan sonuç kumesinin %25lik jkısmını listeleyelım.

select top 25 percent  FirstName,LastName,year(getdate())-YEAR(BirthDate) as yas from Employees order by yas desc

--eger belirttiğimiz oran sonucu kendi hesapladıogı için sonuç 3.2 tane çıktaysa bu durumda bize ilk 4 sonucu sıralayacaktır.
--yanı uste yuvarlama işlemi yapacaktır.


--kulllanıcıları işe giriş tarıhıne göre tersten sıralayaarak ilk 3unu getiriniz.hiredate

select top 3 FirstName,LastName,HireDate as işegiristarih from Employees order by hiredate desc





--LİKE KULLANIMI 

SELECT FirstName,LastName,Title FROM Employees where FirstName='michael'

--eskiden böyle yapıyorduk

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'michael'


SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and LastName like 'f%'


SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%n' 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' and FirstName like '%e'

--lik isaretiyle birlikte  tırnak içişnde yuzde işasretiyle birlikte kullanılır


--adının içinde e harfı gecenler

select FirstName from Employees where FirstName like '%e%'

--adının ilk harfı a veya l olnalr gelsın

--1.yol 

SELECT FirstName,LastName,Title FROM Employees where FirstName like 'a%' or FirstName like 'l%'

--2.yol

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '[al]%' 

--adının içinde r veya t bulunan lar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%r%' or FirstName like '%t%'

SELECT FirstName,LastName,BirthDate FROM Employees WHERE FirstName like '%[rt]%' 


-- adının ilk harfı j ile r aralıgında olnalrı getir


SELECT FirstName,LastName,Title FROM Employees where FirstName like '[j-r]%'  order by FirstName


SELECT FirstName,LastName,Title FROM Employees where FirstName between 'j%' and 'r%' order by FirstName


--a ile e arasıdan tek karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a_e%'  order by FirstName

--a ile e arasıdan ıkı karakter varsa srala

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%a__e%'  order by FirstName

--ilk harfı m olmayanlar 

SELECT FirstName,LastName,Title FROM Employees where FirstName not like 'm%' order by 1

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^m]%' order by 1

 
 -- adı t ile bitmeyenler

SELECT FirstName,LastName,Title FROM Employees where FirstName like '%[^t]' order by 1
SELECT FirstName,LastName,Title FROM Employees where FirstName not like '%t' order by 1



--adının ilk harfı a ile ı arasında bulunmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a-ı]%'  order by FirstName

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[^a]%' and FirstName like '[^ı]%'


SELECT FirstName,LastName,Title FROM Employees where FirstName not like '[a-ı]%'  order by FirstName


--adının 2.harfı a veya t olmayanlar

SELECT FirstName,LastName,Title FROM Employees where FirstName like '_[^at]%'

--adınıon ilk 2 harfı la  na aa an  olanlar

--uzun yol
SELECT FirstName,LastName,Title FROM Employees where FirstName like 'la%'  or FirstName like 'na%' 
or FirstName like 'aa%' or FirstName like 'an%'

SELECT FirstName,LastName,Title FROM Employees where FirstName like '[la,na,aa,an]%' order by FirstName


--içerisinde _ gecen isimlerin listelenmesi
--normalde _karakterinin özel bir anlmaı vardır ve tek bir karatkter yerıne 
--ggeçer ancak [] işçinde belirttiğimzde siradan bir jkarakter gibi aratabilir.

select * from Employees where FirstName like '%\_%' escape '\'


select * from Employees where FirstName like '%[_]%'


--costomer tablosujdan costumer ıd sının 2.harfı a ,4.harfi t olanların %10luk kısmını getiren sorguyu yapınız

select top 10 percent  * from Customers where CustomerID like '_a%' and CustomerID like '___t%'


select top 10 percent  * from Customers where CustomerID like '_a_t%'








--insert işlemini tablodan yapmadan kod ile tabloya bilgi ekleme yapılabılır.

--VERİ TABANI İŞLEMLERİ 
--1 İNSERT:BİR VERİ TABANINDAKLI TABLOLARI BİRİNE YENİ VERİ EKELMEK İÇİN KULLNANILIR.

--İNSERT INTO  <TABLO ADI> (<SUTUN ISIMLERİ> VALUES <SUTUN DEGERLERİ>
--VALUES  


USE Northwind

insert INTO Categories(CategoryName,Description)
values ('baklagiller','güzeldir bunkların tadı:')

-- insert ıntodan sonra tablo adı parantyez aç colon adları  parantez kapat
-- values tekrar parantez tırnak aç degerleri yaz parantez kapat

select * from Categories


insert into Categories(Description)
values('kategori ıd  giriniz')

--executede hata verdi çünkü categoriname null geçilmesi aktıf
-- edilmeiği için null degeri  girdiğimzden dolayı hata verdi.
--insert işlemi sırasında bunlara deger atamalıyız.
--(eger ıdentıty özelliğinde bir sutun var ise (otomatık artan)
--bu sutun degeri sistem tarafından atanagağı için insert işlemşnde belirtmeye gerekk yoktur.

--bir tabloya veri ekelnecekse bunlar sıraasıyla yapılmalıdır.


--shippers tablosuna yeni veri ekleyın.
select * from Shippers

insert into Shippers values('mng kargo','216 015 42 65')


--customer tablosuna 'vadafone' sirketini ekleyın.

select * from  Customers 
insert into Customers(CustomerID,CompanyName) values ('ABCDE','vadafone')

--CUSTOMER ID BOŞ GEÇİLMELDİĞİ İÇİN ID DE GİRMEMİZ GEREKİYOR.



                                           --UPDATE KOMUTU--

-- bir tablodaki verileri güncellemek için kullanılır.
--DİKKAT ETMEMMİZ GEREKEBN OLAY NEREYİ GÜNCELLEMEK İSTEDİĞİNİ YAZMALISIN YOKSA 
--BÜTÜN KAYITLAR VERMİŞİ OLDUGUNUZ VERİ İLŞE GÜNCELLENİR.


--KULLANIMI
--UPDATE <TABLO_ADI>
--SET <KOLON ADI>=<YENİ DEGER>


SELECT * into ÇALISANLAR FROM Employees
--empyoes tablosundaki veriler yeni bir tabloya (çalısanlar tablosuna) kopyalanadı. toplu  insert yaptık.


update ÇALISANLAR
set LastName='soyaadı'

select * from ÇALISANLAR
--çalısanlar tablsundaki büğtün verileri soyadıyla değiştirilecektir.
--cünkü güncelleme yapmak için hangi kayıt üstünde güncelleme yapacagımızı belirtmedik.
--(istenmeyen durum)
 


 insert into Employees(LastName,FirstName) values ('ahmet','mahmut')
 select * from Employees

 update Employees set FirstName='muhammet',LastName='aydın' where EmployeeID=10

  select * from Employees


 --employeıd si 10 olan satırı bizim istediğimiz sekiklde degiştir.
 --bir kayıt güncelleme yaparken en güzel sekil ıdsi(pk) üzerinden degiklik yapmaktır.cünkü pk tek sefer kullanılır
 --firstname üzerinden yapılasaydı bu sefer aynı ada sahip molannların hepsi güncellecektir.
 --işlemklerde tekillik saglamak için primary key uzerınden işlem yapılnmadılırı.


 --prudect tablosundaki verileri üsürnler adında bir taablo oluştutrarak kopyalayınız.
 ---ürünlerin birim fişyatina yuzde 5 zam yaparak güncelleyiniz.

 select * into ürünler from Products

 select * from ürünler

 update ürünler set UnitPrice=UnitPrice*1.05

 --2.yol

 update ürünler set UnitPrice=UnitPrice+(UnitPrice*0.05)

 select * from ürünler
 --her seferinde fiyat güncellemesi yapar.


 --DELETE KOMUTU 

 --bir tablodan kayıt silmek için kullanılır.

 --aydnı updatedekiş gibi dikkatlı olunması gerekir cünkü birden fazala kayıt yanlışlıkla silinebilir.
 --delete from <tablo_adı>



  select * into ürünler2 from Products
 delete from ürünler2

--ürünler2 tablasundaki bütün verileri siler 
--bunden daolyı hangi satırda işlem yapacaksak ıd bilgisi yanı keywordu belirmemiz gerekir.
  
 --employ tablsundan 11 ıd sil

 delete from Employees where EmployeeID=11
select * from Employees

  select * into çalısanlar from Employees

  select * from çalısanlar

  delete from çalısanlar where FirstName='michael'


  --ünvanı mr. dr. olanları sil
    select * from çalısanlar
	delete from çalısanlar where TitleOfCourtesy='DR.' AND TitleOfCourtesy='MR.'
	
	 select * from çalısanlar
	

	--DML BİTTİ.

	---TARİH FONKSİYONLARI

	--DATEPART() BİR TARİH BİLGİSİNİN İSTENİLEN BÖLÜMÜNÜ VERİR.

	--KACINCI YILA GÖRE SIRALAMA
	SELECT FirstName,LastName,datepart(YY,BirthDate) as YEAR FROM Employees 
	order by year desc

	--YILIN KACINCI GÜNÜNE GÖRE SIRALAMA
	SELECT FirstName,LastName,datepart(DY,BirthDate) as [DAY OF YEAR] FROM Employees 
	
	--YILIN KACINCI AYINA GÖRE SIRALAMA
	SELECT FirstName,LastName,datepart(M,BirthDate) as MONTH FROM Employees 
	order by MONTH desc

   --YILIN KACINCI HASTASINA GÖRE SIRALAMA
	SELECT FirstName,LastName,datepart(WK,BirthDate) as [WEEK OF YEAR] FROM Employees 
	order by [WEEK OF YEAR] desc


   --HAFTANIN KACINCI GÜNÜNE GÖRE SIRALAMA
    SELECT FirstName,LastName,datepart(WEEKDAY,BirthDate) as [WEEKDAY] FROM Employees 
	order by [WEEKDAY] desc


	--SAAT BİLGİSİ
	    SELECT FirstName,LastName,datepart(HH,BirthDate) as HOUR FROM Employees 
	 order by HOUR desc

--DAKİKA
	 SELECT FirstName,LastName,datepart (MI,GETDATE()) as MINUTE FROM Employees 
	 order by MINUTE desc
 --SANİYE
    SELECT FirstName,LastName,datepart (SS,GETDATE()) as SECOND FROM Employees 
	 order by SECOND desc

--SALİSE
      SELECT FirstName,LastName,datepart (MS,GETDATE()) as SALİSE FROM Employees 
	 order by SALİSE desc



	 --datediff() İKİ TARİH ARASINDAKİ FARKI VERİR.

	 --
	 SELECT FirstName+' '+LastName as isim ,DATEDIFF(YEAR,BirthDate,GETDATE()) AS YAS 
	 ,DATEDIFF(DAY,HireDate,GETDATE()) AS [ÖDENEN PRİM]   FROM Employees 

	 --DOĞDUGUNDAN İTİBAREN KAC SAAT GEÇMİŞ
	 	 SELECT FirstName+' '+LastName as isim ,DATEDIFF(HOUR,BirthDate,GETDATE()) AS SAAT 
	 FROM Employees ORDER BY SAAT DESC





    --KAÇ SAATIR YASIYORUM.
	SELECT FirstName,LastName,BirthDate,DATEDIFF(HOUR,BirthDate,GETDATE()) AS SAAT FROM Employees where EmployeeID=10
	

	--MATEMATIKSEL İŞLEMLER


	--Pİ SATYISI VERİR
	SELECT PI() AS Pİ

	--ÜST ALMA
	SELECT POWER(2,5) AS [ÜSLÜ İŞLEMLER]

	--ABS MUTLAK DEGER ALIR

	SELECT ABS(-20)

	--KAREKÖK ALMA

   SELECT SQRT(25)

  -- RAND 0 İLE 1 ARASINDA SAYI URETIR.

  SELECT RAND()


  
  SELECT SIN(90)
  

  --YUVARLAMA
  SELECT FLOOR(RAND()*100)



  --STRİNG FONKSİYONLARI
  SELECT 'MERHABA C# EGİĞİMİNE HOSGELDİNİA' AS MESAJ
  PRINT 'MESAJ'


  --ASCIIYI VE KARSILIKLARINI ÖGRENME
  SELECT ASCII('D') AS [ASCII KODUNU VER]
   SELECT CHAR('88') AS [ASCII KODUNUN KARSILIGINI VER]


  -- CHARINDEX
  --TEXTİN İÇİN DE ARADCIGIMIZ SEYIN KACINDCI SIRADA OLDUGUN VERİR.

  SELECT CHARINDEX('@','TEST1@GMAİL.COM') AS KONUMBİLGİSİ

  --BURADA ET İŞARETİ 6. SIRADA OLDUGU İÇİN 6 VERDI.


  --BİLGİYİ VERİKTEN SONRA SAYI YAZILIR SOLDAN SAGA KACINCI SIRADA OLDUGUNU VERİR.
  SELECT LEFT('BİLGE ADAM','7')
  SELECT RIGHT('BİLGE ADAM','5')


  --LEN METODU

  SELECT LEN('BİLGE ADAM')
  --UZUNLUGUN SAYISWAL KARSILIGINI KARAKTER SAYISNI VERİR.


  --KÜÇÜK HARFE ÇEVİRİR.
   SELECT LOWER('BİLGE ADAM')

    SELECT UPPER('bilge adam') 


	select LTRIM(             'bilge adam')
	
	select RTRIM(     'bilge adam'     )
	 select LTRIM(RTRIM('             BİLGE ADAM            '))



--REPLACE 
--METİN İÇİNDEKİ YAZILARI DEİŞTİRİR.
	 SELECT REPLACE ('BİRBİRLERİNE','BİR','İKİ') 

--SUBSTRING 
--4.KARAKTERDEEN SONRA 6 KARAKTER DAHA YAZIDRI.
SELECT SUBSTRING('BİLGE ADAM YAZILIM ADKADEMİ EĞİTİMİ',4,6)



--REVERSE TERSTEN YAZAR
SELECT REVERSE('MUHAMMET AYDIN')



SELECT SUSER_NAME()

SELECT SUSER_ID()

SELECT 'BİLGE ADAM' +SPACE(30)+'HOSGELDİN' 
--BELİRTİLEN KADAR BOŞLUK BIRAKIR.

SELECT REPLICATE('BİLGEADAM',5)
--BELİRTİLEN KADAR YAN YANA YAZAR


--10\8\2021  TARİHLİ DERS (TOPLAM FONK VE GRUPLAMALI FONKSIYONLAR)

--GROUP BY KULLANIMI 


--ADET BULMAYA YARAR.
--(COUNT DAN SONRA PARANTEZ İÇİNDE SUTUN ADI VERİLİR)


SELECT COUNT(*)   FROM Employees

--TOPLAM KAYIT ADETİNİ VERİR.


SELECT COUNT(EmployeeID)   FROM Employees


SELECT COUNT(Region)   FROM Employees
--NULL VERİLER OLSA BİLE ONLARI DA SAYAR.

--REGİON SUTUNUNDAKI KAYIT SAYISI (REGION SUTUNUNUN BOŞ GEÇİLEBİLECEİĞİ İÇİN BİR TABLODAKİ KAYIT SAYISININ BU SUTUNDAN YOLA CIKARAK ÖGRENMEK YANLIS SONUICLAR YOL ACAR 
--CÜNKÜ AGGREGATİION FONKSİYONLARI NULL DEGERLERİ DIKKATA ALMAZ



--BU NEDENLE * İLE ALINIR YADA YADA NULL GEÇİLMEYEN SUTUNLARI BİRBİRİ ADINA KULLANMAK GEREKİR.




SELECT count(distinct City) FROM Employees
--kaç farklı sehir vardır.


select sum(EmployeeID) from Employees
--toplam sayıyı verir.epmloy ıd toplam sayısını verir.


select avg(EmployeeID) from Employees


--çalısanlar yasları toplamı.getdate fonknundan dogum tarıhını çıkarıp toplarız.


select sum(year(getdate())-YEAR(BirthDate)) as yaştoplamı from Employees

--2.yol

select sum(DATEDIFF(year,BirthDate,getdate()))  as yastoplam from Employees


select sum(FirstName) from Employees
--hata verir cünkü string degerler üzerinde işlem yapmaz.
--sum fonksıyonu sayısal sutunlar üzerinde işlem yaopar.


--ORTALAMA HESAPLAR

--null olanlar işleme katılmaz.
--bütün kişilerin sayısını hesaba katmaz.
--null olmayan kişilerin sayısına bölünür.

select avg(EmployeeID) from Employees

select avg(DATEDIFF(year,BirthDate,getdate()))  as yastoplam from Employees


select avg(year(getdate())-YEAR(BirthDate)) as yaştoplamı from Employees

select AVG(ShipVia) as ort from Orders

select avg(LastName) from Employees
--çalışmaz string ifade!!!!



--max (sutun adı) sutundaki en buyuk sayıyı getirir.

select max(EmployeeID) from Employees

--stringe duyarlı degildir.en büyük harfle baslayanı getirir.


select max(FirstName) from Employees

select   max(DATEDIFF(year,BirthDate,getdate()))  as yastoplam from Employees



select min(EmployeeID) from Employees

select min(LastName) from Employees

select   min(DATEDIFF(year,BirthDate,getdate()))  as yastoplam from Employees

--CASE,-WHEN,-THEN KULLANIMI


SELECT FirstName as isim,LastName as soyısım,TitleOfCourtesy as başlık, country as sehir FROM Employees


SELECT FirstName as isim,LastName as soyısım,TitleOfCourtesy as başlık,case(country) 
                                                                       when 'usa'  then 'amerika birleşik devletleri'
																	   when'uk'    then'ingiltere' 
                                                                       else 'ülke belirtilmedi.' 
																	   end as ülke
																	   FROM Employees

	 
	 
	
	   --employ ıd 5ten büyük ise küçükse küçük eşitse esit



 SELECT FirstName as isim,LastName as soyısım,TitleOfCourtesy as başlık,EmployeeID  FROM Employees


 
SELECT FirstName as isim,LastName as soyısım,EmployeeID,CASE(EmployeeID)
                                                        when 1 then 'BİR'
													 when 2  then 'İKİ'
												 when 3  then 'ÜÇ'
												when 4  then 'DÖRT'
												 when 5  then 'BEŞ'

                                                                         else  'YETERLİ'
																	   end as mesaj
														 		       FROM Employees

             






SELECT FirstName as isim,LastName as soyısım,TitleOfCourtesy as başlık,case
                                                                       when EmployeeID > 5  then 'employıd 5ten büyük'
																	   when EmployeeID < 5  then 'emloyıd 5ten küçük' 
                                                                       else  'employıd 5e eşittir.' 
																	   end as mesaj
														 		       FROM Employees

--case kı-smında emloy ıd belirtmememziin sebebi employ ıd ye gelen bilgi intr geldiği için karsılastırma 
--yapmak için case kısmına yazmaya gerek yok dıremk when kısmına yazabılkırız
		
		
--title of coursty açılımlarını ayrı bir satırda yaz


 SELECT FirstName as isim,LastName as soyısım,TitleOfCourtesy as başlık  FROM Employees



SELECT FirstName as isim,LastName as soyısım,TitleOfCourtesy as ünvan, case(TitleOfCourtesy) 
                                                                       when 'ms.'  then     'bekar bayan'
																	   when 'dr.'    then   'doktor' 
																	   when 'mrs.'    then 'evli bayan'
																	   when 'mr.'    then   'bay'
                                                                       else 'başlık belitrilmedi..' 
																	   end as açıklama
																	   FROM Employees



--GRUPLAMA İŞLEMLERİ
--BULUNDUKLARI YERE GÖRE AYNILAR BİER YERE AYNILAR BASKA BİR YERE KOYULMASIDIR.

SELECT country as ülke , count(*) as [kişi sayısı] from Employees where country  is  not null group by Country




--çalışankların yapmıs oldugu sipariş adetişni tersten sıralayın

select EmployeeID , count(*) as [sipariş sayısı] from Orders 
group by  EmployeeID  order by [sipariş sayısı]  desc



--ürün fiyati 35 dolardan az olanları kategorilerine göre grupladırılmasını adet bilgisine göre sıralayınız.

select  CategoryID, count(*) as [adet] from Products where UnitPrice<=35
group by CategoryID order by adet asc



--bas harfı a-k aralıgında olan ve stok mıktarı 5 ile 50 arasında olan urrunlerı kategorileriıdsıne  göre gruplayınız.


select  CategoryID,COUNT(*) as stok from Products where ProductName like '[a-k]%'  and UnitsInStock  between 5 and 50
group by CategoryID order by stok asc



--her bişr sıparısteki toplam urun adawetini bulunuz.

select OrderID,sum(Quantity)  as toplammıktar   from [Order Details] group by OrderID 


--her bie siparişin tuttarına göre listeleyiniz.
select OrderID,sum(UnitPrice*Quantity*(1-Discount)) as inidirimlitoplam  from [Order Details] group by OrderID order by inidirimlitoplam



--having kulanımı
-- sorgu sonucunda gelen sonuc kumesı uzerınde aggretıon fonksıyonlarına baglı olarak (sum avg vs) bir filtreleme işlemi yapılcaksa eger 
--where yerine cümleciği kullanılırbu sayede aggretıon fonksıyonlarında fıltreleme işlemine katabılırz.
--eger aggaregate fonksıyonları sorgumuzda yoksa havıng kulanımı
--where ile aynı filtreleme işlemi yapacaktır.
--gruplama sonucunda bir sarta baglı olarark işlem yapacaksak where kullanamazıyz havıng kullanımı yapmammız gerekir.



--her bir siparişteki toplam ürün sayısı 200den az olanları getir.


select OrderID,sum(Quantity) as toplam from [Order Details] group by OrderID having sum(Quantity)<200 order by  toplam desc

--gruplanmıs olan tabloya sorgu atmak istersek havıngle yapılır.


--karısık örnekler

--fiyati 25den küçük ürünlerin basıına tr ekleyerek gösteriniz
--productname kolonundakı verileerin hepsini büyükharfle yazın
--en ucuz 5 ürünün ortalama fıyatı nedir.

select 'tr'+ProductName from Products where UnitPrice<25

select upper(ProductName) from Products

select top 5  from Products group by UnitPrice


--group by atılmış veriye where işlemi yapılmaz.having işlemi yapılır.



--toğplam tutat 2500 3000 arasında olan sıpariş sıralaması

select OrderID as [sipariş kod],sum(UnitPrice*Quantity*1-Discount) as [toplam tutar ] from [Order Details] group by OrderID
 having sum(Quantity*UnitPrice*(1-Discount))  between 2500 and 3500  order by [toplam tutar ] desc
--where sum(Quantity*UnitPrice*(1-Discount))  between 2500 and 3500 ılede yapılabılır.


--her bir siparişteki toplam ürün sayısı 200 den az olanlar


select OrderID as [sipariş kodu], sum(Quantity) as [toplam miktar]  from  [Order Details] group by OrderID 
having sum(Quantity)<200 order by [toplam miktar] desc



--1000 adetten fazla satılan urunlerı bulunuz
select ProductID as [sipariş kodu], sum(Quantity) as [toplam miktar]  from  [Order Details] group by ProductID
having sum(Quantity)>1000 order by [toplam miktar] desc



--İDENTİTY  IDLER DAHİL HEPSINI SIFIRLAR
use Northwind

Truncate tablE ÇALISANLAR



--ALT SORGULAR İÇİN İÇ İÇE SORGULAR...--
--subquery



--unit price en buyuk getir.

select * from Products
where UnitPrice=(select max(UnitPrice) from Products)



--detaylı acıklama

declare @x money =(select max(UnitPrice) from Products)

select ProductID,ProductName,UnitPrice from Products where UnitPrice=@x


--minimum fıyatı bul

select * from Products
where UnitPrice=(select min(UnitPrice) from Products)



--fıyatı ortlama fiayatın ustunde olanları getiriniz.




--ortlama fiyatı bulma
select   avg(unitprice) from Products


--fıyatı ortlama fiayatın ustunde olanları azdan coga dogru getirme
select * from Products
where UnitPrice>(select avg(UnitPrice) from Products) order by UnitPrice asc




--ürünler tablsunda satılan urunlerın listesi

select * from Products WHERE ProductID IN
(select ProductID from [Order Details])
--SİPARİŞ DETAY TABLOSUNDA Kİ ÜRÜN IDLER  ÜRÜNLER TABLOSUNDA Kİ ÜRÜN ID İLE
 --İŞLEŞİYORMU.BUNU WHERE IN KOMUTUYLA YAPARIZ . 


 --SATILMAYANLARI LİSTEYELINIZ

 select * from Products WHERE ProductID NOT IN
(select ProductID from [Order Details])

--SUBQUERYLER TEK SUTUN CAGIRIR




--2TABLO USTUNDE İŞLEM YAPMAK

--pprudect tablıosundaki kategori ıdleri isimlere göre yazınız.


--kategori tablosundaki kategorııd ile ürün tablosundaki kategorııd 
--kolon bilgilier birbirine eşleşttirerek yazmıs oluruz.
--c. ve p. diye isimlendirmemizin sebebi wherede categori ıdlerı işleştirmek için kullanacagımızdan dolayı yapılır.


--employes taqblosunda title boş olnankları gösterme 

select FirstName,LastName,Title from Employees where Title in
(select Title from Employees where title is not null)



select FirstName,LastName,Title from Employees

--kargo sırketlerının tasıdıkları sıpariş sayılarını bulunuz.

SELECT 
(select CompanyName from  Shippers s  where o.ShipVia=s.ShipperID) as şirket,
shipvia ,count(*)
FROM orders o group by ShipVia






--orneklerü
--birazilde bulunan müşterilerin sirket adı temsilci adi adres sehir ülke bilgisigetir sırala
--brazilde olmayan musteriler
--ülkesi  ya spain ya france yada germany olan musteriler  gelsin alfabetik sıraa
--faks numarası bılınmehyenler gelsin


select c.CompanyName,c.ContactName,c.ContactTitle,c.City,c.[Address],c.Country   from Customers c where Country='brazil'
select *  from Customers  where Country !='brazil'
select *  from Customers  where country='spain' or country='france' or country='germany' order by country asc
select s.CompanyName,s.ContactName,s.Country  from Customers s  where country like 'spain' or country like  'france' or country like 'germany' order by country asc
select * from customers where fax is  null order by CompanyName



--londarada yada parıste bulunan musteriler
--hem mexıco d.f de ikmaet edern hemde concoacttitle bilgisi owner olan musteriler
--c ile başlayan ürünler ve fiyatları
---adı a harfi ile başlayan çalısanların ad soyad dogum tarıhı
--isminde restorurant geçen  sirket adlarını  getiriniz.

select * from Customers where City='london' or City='paris'
select * from Customers where City='México D.F.' AND ContactTitle='owner'
select ProductName,UnitPrice from Products where ProductName like 'c%'
select FirstName,LastName,BirthDate from Employees where FirstName like 'a%'
select   CompanyName from Customers where CompanyName like '%restaurant%'


--50dolar ıle 100dolar arasında buklunan tum 
--ürünlerin ad ve fıyatları

--1temmuz1996 ve 31 ralık 1996 arasında verilen sipeiş  ıd,sipariş tarihi bilgilerini getir.
--musterilerimizi ulkeye göre sırala ulke tekrar etmesin
--ürünlewri en bpahalaıdan en ucuza dogrusıralama counuc olarak urun adı ve fiyatını istiyoruz.




select ProductName,UnitPrice from Products where UnitPrice between 50 and 100
select OrderID,OrderDate from orders where OrderDate between  '1996-07-01' and'1996-12-31'
select distinct country  from customers order by Country asc
select ProductName,UnitPrice from Products  order by UnitPrice desc


--1 numaralı kategorıde kac urun vardır.

select count(*) Productname  from Products where CategoryID=1



--kaç farklı ulkeye ıhracat yapıyoruz
select count(distinct shipcountry) from orders 
select count(distinct country) from Customers


--categorıler tablosundaki ürüblerle ürünler tablosundaki kategroılerı aynı olanları supplarır olanlarla birleştirip getir.
select ProductName from Products p   inner join Categories c on p.CategoryID=c.CategoryID  
inner join Suppliers s on p.SupplierID=s.SupplierID 



--subquery ornekleri 

--en pahalı ürünün adı

select * from Products where UnitPrice=(select max(UnitPrice) from Products)


--exists yapısı:tabllonun dolu yada boş oldugunu dondurur.
--iflerle birlikte kullanılırlar


if exists(select * from Employees)
print 'dolu'
else 
print 'boş'
 


 --sipriş alan çalışanlarım


 select * from Employees e  where exists 
 (select EmployeeID from orders o  where e.EmployeeID=o.EmployeeID)


  --sipriş almayan çalışanlarım
   select * from Employees e  where  not exists
 (select EmployeeID from orders o  where e.EmployeeID=o.EmployeeID)

--iç içe yazılan subquery dönen tum kayıtlar içinde esleşme yaptıktan sonra ana sorgu
--çalışmasını ntamamalar.
--exists ise alt sorgu'ya eşlesme yapılan kayıtlara göre sonuçlandırır. ve ilave olarak gelen kayıtlar içinde 
--eşleşme yapmaya gerek kalmaz.zaten exists alt sogrudan ihitiyacı olan kayıtları getirmiş olur.
--exists condıtıon (ıf-else) içerisinde kullanılabılır.

  


  --JOINLER 
  --1 INNER JOIN BİR TABLODAKİ HER BİR KAYDIN DİGER TABLODA BİR KARSILIGI OLAN KAYITLAR LİSTELENİR.
  --inner jın ifadesini yazarken inner kelımesını kullanmasakta olur joın yazıncada anlasılır.



 

  select FirstName,LastName,HireDate,BirthDate from Employees e inner join Orders o on e.EmployeeID=o.EmployeeID
   


   select ProductName,CategoryName from Products inner join Categories
    on Categories.CategoryID=Products.CategoryID


	select ProductID,ProductName,Products.CategoryID,Categories.CategoryName,[Description] from Categories inner join Products 
	on Categories.CategoryID=Products.CategoryID
	--eger seçtiğimiz sutunlar her ıkı tablodada bulunuyorsa o sutunun hangı tablodan seçtiğimizi açıkca belirtmemiz gerekir.
	--products.categoriıd gibi

	--hangi sipariş ,hangi çalısan tarafından hangi musteriye yapılmıstır.

	select OrderID,FirstName+' '+ LastName as [çalışan isim soyısım],OrderDate as[sipariş tarihi],CompanyName as [şirket adı],Customers.ContactName from orders
    inner join Employees on Orders.EmployeeID=Employees.EmployeeID 
	inner join Customers on Orders.CustomerID=Customers.CustomerID



	--ornek
	select ProductName,ContactName,ContactTitle,CategoryName,c.[Description] from Products p 
	inner join Suppliers s on s.SupplierID=p.SupplierID 
	inner  join Categories c on c.CategoryID=p.CategoryID 

	--sorguyu kısaltmak amacıyla  tablo isimlerine 'de takma isim verilebilir.
	--ancak verilen takma isimde dikkat edilmesi gerekenn nokta bir tabloya takma isim verdıkten sonra 
	--arttık yer yerde o takma ismi kullabnılması gerektıgıdır.






	--supplıers tablosundan companyname contact name
	--product tablosundan product name ,unıtprice
	--categorıes tablsundan kategorı name alınız
	--companyname sutunune göre sıralayınız


	select CompanyName,ContactName,p.ProductName,p.UnitPrice,CategoryName  from Suppliers s
	 inner join Products p on s.SupplierID=p.SupplierID 
	 inner join Categories c on c.CategoryID=p.CategoryID order by s.CompanyName

--fromdan sonra sorguda geçen herhangi bir tabloyu belirtebilirsiniz,digerlierini 
--daha sonrada joın işlemlerini birleştiriyoruz.



--categorılere göre toplam stok mıktarı 

select c.CategoryName,sum(UnitsInStock) as [stok mıktarı]  from Categories c
 inner join Products p on c.CategoryID=p.CategoryID group by CategoryName order by [stok mıktarı] desc


 --her bir çalısan toplam ne kadarlık satıs yapmıştır.virgülden sonra 3 hane göstersin.onun ıcın cast işlemi yapılır.


 select e.EmployeeID,FirstName+' '+LastName as [isim soyisim],
 cast(sum(Quantity*UnitPrice*(1-Discount))as decimal (15,3)) as [indirimli toplam satiş]  from Employees e
  inner join orders o on e.EmployeeID=o.EmployeeID
  inner join [Order Details] od on o.OrderID=od.OrderID
 group by FirstName,LastName,e.EmployeeID

 --asagı yuvarla
 select e.EmployeeID,FirstName+' '+LastName as [isim soyisim],
 floor(sum(Quantity*UnitPrice*(1-Discount))) as [indirimli toplam satiş]  from Employees e
  inner join orders o on e.EmployeeID=o.EmployeeID
  inner join [Order Details] od on o.OrderID=od.OrderID
 group by FirstName,LastName,e.EmployeeID

 --yukarı yuvarla
  select e.EmployeeID,FirstName+' '+LastName as [isim soyisim],
 ceiling(sum(Quantity*UnitPrice*(1-Discount))) as [indirimli toplam satiş]  from Employees e
  inner join orders o on e.EmployeeID=o.EmployeeID
  inner join [Order Details] od on o.OrderID=od.OrderID
 group by FirstName,LastName,e.EmployeeID 

 
 
 
 --en pahalı bes urunu getiriniz.


 select top  5 * from Products order by UnitPrice desc

 --alfkı costumer ıdsıne sahıp müserimin sayısı
 select count(*)   from Orders where CustomerID='alfkı'


 --ürünlerin toplam makliyeti
 select sum(UnitPrice*UnitsInStock) from Products




 --sirket simdiye kadar ne kadar ciro yapmıs
  select sum(UnitPrice*Quantity*(1-Discount)) from [Order Details]


 --ortlama urun fiyatı

  select avg(UnitPrice*UnitsInStock) from Products

--  en pahalı urun
  select  Productname,UnitPrice from Products where  UnitPrice =(select max(UnitPrice) from Products)

  --bana en az kazandıran sipariş

select top 1 OrderID,sum(Quantity*UnitPrice) as [en az kazandıran ] from [Order Details] group by OrderID order by [en az kazandıran ] asc

  --müşterilerin içinde en uzun isim

  select top 1 CompanyName,len(CompanyName) as uzunluk from Customers order by  uzunluk desc


  --hangi üründen toplam kac adet alınmış
  select  OrderID,sum(Quantity) as toplam from [Order Details] group by OrderID order by toplam desc


  --16-08-2021	
  --LEFT VE RİGHT JOIN İŞLEMLERİ

  --2 TABLODA  ORTAK OLAN PK VE SECONDRY KEYLERİ EŞLEŞTİRERERK 2TABLO ARASINDA VERİ ÇEKMEYE YARAR.
  --VERDİĞİMİNİZ TAKMA İSME DIKKAT EDİNİZ.NE VERİRSEN ONU KULLNAMAK GEREKİR.


  --HERHANGİ BİR KATEGORI İÇİN ORTALAMA FİYATİ BULUNUZ.ORTLAMA FİYATİ 20DEN BÜYÜK OLAN KATEGORİLERİ GETİRİNİZ.
  
     select  CategoryName,AVG(UnitPrice) as ortlama from Products inner join Categories
	 on  Categories.CategoryID=Products.ProductID
     group by CategoryName having avg(UnitPrice)>20 order by ortlama desc
  
     --2.yol
     select  CategoryName,AVG(UnitPrice) as ortlama from Products inner join Categories
	 on  Categories.CategoryID=Products.ProductID
     where UnitPrice>20  group by CategoryName order by ortlama desc




	 --OUTER JOIN 
--2.1 LEFT OUTER JOIN
--2.2 RİGHT OUTER JOIN
--SORDUDA İSTENEN ORTAK KAYITLARI GETİRİR AMA SOLDA OLMAYAN BİLGİLER SAGDA YOKSA SOLU KOMPLE GETİRİR.
--SORDUDA İSTENEN ORTAK KAYITLARI GETİRİR AMA SAGDA OLMAYAN BİLGİLER SAGDA YOKSA SAGI KOMPLE GETİRİR.

SELECT ProductName,CategoryName FROM Products P LEFT OUTER JOIN Categories c   --LEFT OUTER JOIN İFADESİNİN SOLUNDA KALAN PRODUCTS TABLOSUNDA 
--TUM KAYITLAR GETİRİRLİRKEN SAGINDAKİ CATEGORIES TABLOSUNDAN İLİŞKİLİ KAITLAR GELECEKTİR. 
ON P.CategoryID=c.CategoryID

--her bşr çalısanaın rapor veridiği kişiyi birlite listeleyiniz.
select (e1.FirstName+' '+e1.LastName) as çalısanbilgisi,(e2.FirstName+' '+e2.LastName) as müdür 
 from Employees e1 inner join Employees e2
 on e1.ReportsTo=e2.EmployeeID

  
 select (e1.FirstName+' '+e1.LastName) as çalısanbilgisi,(e2.FirstName+' '+e2.LastName) as müdür  
  from Employees e1 left  join Employees e2
  on e1.ReportsTo=e2.EmployeeID





 select ProductName,CategoryName from Categories right join Products on Categories.CategoryID=Products.ProductID

 ---her bir çalısanı muduruyle birlikte listelenizi.
  select (e1.FirstName+' '+e1.LastName) as çalısanbilgisi,(e2.FirstName+' '+e2.LastName) as müdür  
  from Employees e1 right  join Employees e2
  on e2.ReportsTo=e1.EmployeeID


  SELECT CategoryName,ProductName FROM Products P right JOIN Categories c 
   ON c.CategoryID=P.CategoryID


   --2.3)full joın: left ve right birleşimidir

     SELECT CategoryName,ProductName FROM Products P FULL JOIN Categories c 
   ON c.CategoryID=P.CategoryID


  -- 2.4)CROSS JOİN:
  SELECT COUNT(*) FROM Categories
  --8TANE

  SELECT COUNT(*) FROM Products
  --77TANE

  SELECT CategoryName,ProductName FROM Categories CROSS JOIN Products
  --632TANE
  --HER ÜRÜNE KARSILIK KATEGORİLER KARSILIKLİ ÇIAKRTILIR.




  --250ADETTEN FAZLA satılan OLAN ÜRÜNLER

  SELECT OrderID,sum(Quantity) FROM [Order Details] group  by OrderID having sum(Quantity)>250


  --hangi musteri hiç sipariş vermmemiştir.

  select  c.CompanyName,C.CustomerID from Customers c left  join Orders o on c.CustomerID=o.CustomerID
  where o.OrderID is null 





  --YENİ KONU VİEW YAPISI 

  --KULLANM AMACI--
  --GENELLİKLE KARMASIK SORGULARINTEK BİR SORGU UZERINDEN ÇALISTIRILABİLMESİNİDİR
  --BU AMAÇ İLE GENELLLİKLE RAPORLAMA İŞLEMLERİNDE ULNAILIRLAR.
  --AYNI ZMAANDA GUVENLİK OLDUGU DURUMLARDA HERHAGİ BİR SPORGUNUN 
 -- 2. VE 3. SAHİSLARA GİZLENMESİ AMACI ILE LULLANILABILIR

 --VİEW YAPILARI NORMAL SORGULARDAN YAVAS ÇALISIRAR.
 --HERHANGİ BİR SORGUNUN SONUCUUNU TABLO OALRAK ELE ALIP ÜZERİNDE SORGU ÇEKİLEBİLMESİNE İZİN VERİR.




 --İNSERT DELETE UPDATE İŞLEMLERİ YAPILABİLİR.
 --FİZİKSEL TABLOLARA YANSITILIR.
 --VİEW YAPILARAI FİZİKSEL OLARAK OLUSTURULAN YAPILARDIR.


 CREATE VIEW PrdCtgSup
  --atı kırmızı cigili olmasının sebebi tanımlıview kalsorunun altında bulunmasıdır.
 as
select p.ProductName,p.UnitsInStock,c.CategoryName,s.CompanyName from dbo.Products p inner join dbo.Categories c on p.CategoryID=c.CategoryID 
 inner join dbo.Suppliers s on p.SupplierID=s.SupplierID

-- view sorgumuzu yazdıktan sonra execte ettıkten sonra veritaban alktında  view içinde görüünür. 


select * from PrdCtgSup


select * from PrdCtgSup where CategoryName='beverages'
select ProductName,UnitsInStock      from PrdCtgSup where ProductName>'c' order by 1


--satıs yaapan çalısanların satıs numaraları ıle  bilrikte ad soyad  getir.

CREATE VIEW OrdEmpFrsLst  
as

select OrderID,e.FirstName+' '+e.LastName as isimsoyisim  from orders o inner join Employees e
 on o.EmployeeID=e.EmployeeID


 --OLUSTURUALAN VİEW UZERINDE DEĞİŞKLİK YAPILACAKSA ALTER KOMUTU İLE YAPILIR.

ALTER VIEW OrdEmpFrsLst

AS

select OrderID,e.FirstName+' '+e.LastName as [isim soyisim]  from orders o inner join Employees e
 on o.EmployeeID=e.EmployeeID


 SELECT * FROM OrdEmpFrsLst


 ---WİTH ENCRYPTİION KOMUTU 
--- EGER YAZDIGINIZ VİEW KODLKARINI,OBJECT EXPLORER PENCERESİNDDEN VİEW KATEGORISINE SAG TIKLARAK DESİNG MODDA ACIP --GÖRÜNTULEMEK İSTEMİYORSAK "WİTH ENCRYPTION " KOMUTU İLE VİEW OLUSTURMALIYIZ.
--DIKKAT
--"WİTH ENCRYPTION "İŞLEMİNDEN SONRA VİEW OUSTURURAN KİŞİDE DAHİL OLMAK ÜZERE KIMSE KOMUTLARI GÖREMEZZ.GERİ DÖNÜŞÜ OLMAYAN BIR DURUMDUR.
 --ANCAK VİEW 'I OLUSTURAN SAHİŞ KOMUTLARIN YEDEGİNİ BULUNDURMASI GEREKMEKTEDİR.
 --DIKKAT
 -- BİŞR DIKAT EDİLMESİ GEREKEN DURUM ISE "WİTH ENCRPTION" İFADESİ "AS" KEYWORDUNDEN ONCE YAZILMASLIDIR

 CREATE VIEW ORNEKBİRVIEW
WITH encryption
as
select FirstName,LastName,Title  from Employees

--desing mod kapatılmıstır.


--hangi urunun hangi kategorıde oldugunu gösteren view yaz şifrele
--categorıname .,product name



create view PrdCat
with encryption
as
select CategoryName,ProductName from Products p inner join Categories c on p.CategoryID=c.CategoryID 


drop view PrdCat


select * from PrdCat order by CategoryName asc


--hangi tedarikci hangi ürünü saglıyor şifresiz yaz


create view SupPrd
as
select s.CompanyName,p.ProductName  from Suppliers s inner join Products p on s.SupplierID=p.SupplierID



alter view SupPrd
as
select s.CompanyName as [tedarikci firma ismi],p.ProductName as [ürün ismi]  from Suppliers s inner join Products p on s.SupplierID=p.SupplierID


--view silmeyi saglar
drop view SupPrd



--CRUD işlemleri için (başharflerıdir)
--tablo işlemlerinde Delete,Update,İnsert

--database üzerindeki yapılar için ,Drop ,Alter,Create komtutlları kullanılır.





--STORED PROSEDÜRED YAPISI (SAKLI YORDAMLAR)

--CREATE PROC VEYA PROCEDURE [İSİM]
--(









--) AS 
---YAIZLCAK SORGU,KODLAR,SARTLAR,FONSIYONLAR,KOMUTLAR




--17/08/2021

--STORED PROCEDUREDLER
--GENEL ÖZELLİKLERİ
--EXECUTION PLANI YOKTUR ONDAN DOLAYI COK HIZLI CALSIIRLAR
--TABLODAN VERİ ÇEKİLECEK HANGİ KOLONLAR GELECEK BUNLAR NEREDE SORGUDAKI KEYWORDLERİN SIRASI VS VS GİBİ İŞLEMLER YAPAR.
--BİR SORGU HER ÇALISTIGINDA BU İŞLEMLER AYNEN TEKRAR TEKRAR ÇALISTIRIRILIRLARSA SUREKLI TEKRARLARNIR EXECUTE.FAKAT SORGU STORE PROCEDURED OLARAK ÇALISTIRILIRSA BU İŞLEM SADECE BŞR KERE YAPILIR.VE ODA İLK ÇALISMA ESNASINDADIR.
--DİGER ÇALISMALARDA BI İŞLEM YAPILMAZ 
-- BU NEDENLE HIZ, PERFORMANS ARTISI SAGLAR
--İÇERİSİNDE SELECT İNSERT UPDATE İŞLEMLERŞİ GERCEKTLESTRILEBİLİR.
---DİLERSENİZ İÇ İÇE KULLANABİLİRSİNİZ.BU DURUMDA PARANTEZLE AYRILIEZASI GEREKİR
--FUNCTIONLARLA BİRLİKTE KULLANILABİLİR.
--DISARDAN DEGER ALABİLİRSİNİZ BUNAR PARAMAETER OLARAK SOTRED PROCEDURED LERE GEÇİRİLDİĞİNDEN DOLAYI ,SORGULARIMIZIN "SQL İNJECTION " YEMELERİNİN ÖNUNE GEÇEBİLİRİZ BU YONUYLE GÜVENİLİRDE 
--FİZİKSEL OLARAK İLGİLİ VERİ TANBANININ ALTINDA "PROGRAMLABİLİTY " ==> SORED PROCEDUREED KOMBİNASYONLARINI KULLLANARAK ERİŞİLEBİLİR.


----TASLAK--

--CREATE PROC VEYA PROCEDURE [İSİM]

--(
--VARSA PARAMETRE
--)
--AS
--YAZILACAK SORGULAR,KODLAR,SARTLAR,FONKSIYONLAR,KOMUTLAR VS VS,

CREATE PROC SP_ORNEK
(
@Id int --aksi belirtilmedikce bu parametrenin yapısı inputtur.
)
as
select * from Employees where EmployeeID=@Id

--DIKKAT 
--PROCEDURED PARAMTRELERİNİNİ TANIMLARKEN PARANTEZ KULLANMAK ZORNLU DEGİLDİR.
--AMA OKUNABİLİRLİĞİ ARTIRMAK İÇİN KULLANILMASINI ÖERİRİRİM.
--subquerylerin altında sp kulllanıılmazlar

ALTER PROCEDURE SP_ORNEK2
@Id INT,
@PARAMETRE2 INT,
@PARAMETRE3 NVARCHAR(MAX)
AS
SELECT * FROM Employees WHERE EmployeeID=@Id OR EmployeeID=@PARAMETRE2 AND EmployeeID=@PARAMETRE3

--STORED PROCEDURED KULLANIMI
--EXEC KOMUTU İLE KULLANILIR



EXEC SP_ORNEK2 2,5,'BİLGE ADAM'

--COUNTRY USA OLANLAR SP ILE GETİR

CREATE PROC CntryUsa
(
@Id nvarchar(max)
)
as
select * from Customers where Country=@Id

 
 exec CntryUsa 'usa'

--CREATE PROCEDURE[URUN EKLEME]

CREATE PROC[URUNEKLE]
(
@URUNAD NVARCHAR(20),@BİRİMFİYAT MONEY,@KatId int
)
as
insert Products(ProductName,UnitPrice,CategoryID)
values (@URUNAD,@BİRİMFİYAT,@KatId)
--degişkenleri ulusturduk
--insert yazdık hangı tabloyua eklenecekse tablo adı parantez hang sutunlere ekleneceklse sutun adları
--values yukarda yazdıgımız degişken leri yazarız 
--kaydettıkten sonra
-- yazıp procedure ismi boşluk degerler yazılır .

exec URUNEKLE 'ananas',54,5
exec URUNEKLE 'karpuz ',6 ,1

URUNEKLE 'TEST',5,6

--tablyu cagır kontrol et

select * from Products


--BURASI ÇOKOMELLİ
--GERİYE DEGER DONDUREN STORED PROCEDURED YAPISI
CREATE PROCEDURE UrunGetir
(
@Fiyat money 
)
as
select * from Products where UnitPrice>@Fiyat


return @@Rowcount   --yeni bir keyword işe giriyor yukarıda yapılan işlemde kaç satır eklendiğini dundurur
--ben işlemi yaptım buda etkilenen satırdır.işlemşin gerçekleşip gerçekleşmediğine dair bilgi verir.

exec UrunGetir 90



--yukarıda return rowcount yaptıgımız için asaagıda yaptıgımız işlem sonrasında print ettıgımızde massage sekmesinde kac adet etkilendii yazar.

declare @sonuc int 
exec @sonuc=UrunGetir 90
print cast(@sonuc as nvarchar(max))+'adet urun etkilenmiştir.'

--dönen deger int oldugu için nvarchara cast etmek gerekir.

--bu sekılde geriye deger donulen deger elde ederek kullanılabilir
--message tabına basark mesaaasjaı okuyabılırsınız



--AYNI PARAMTRELERİ KULLANARAK VE PRODUCT ID PARAMTRESINI KULLNARAK AYNI URULERİ PDATE ETMEK İÇİN BİR SP YAZINI
create proc [URUNGUNCELLE] 

(@URUNAD NVARCHAR(20),@BİRİMFİYAT MONEY,@KatId int,@UrunId int)
AS 
UPDATE Products
SET ProductName=@URUNAD,UnitPrice=@BİRİMFİYAT,CategoryID=@KatId
WHERE ProductID=@UrunId

EXEC URUNGUNCELLE 'HINISTAN VCEVİZİ',4,5,81

SELECT  * FROM Products

--KATEGORISI BİLİNMEYEN BİR URUN EKLENDİĞİNDEYADA OLMAYAN BİR BİR KATEGOR YAZILDIGINDA OTHER YANI KAT 9 EKLESİN



alter PROC [UNKNOWNKAT]
(
@ad nvarchar(50),@fiyat money ,@KatId int ,@stok int
)
as
declare @enbuyukkategorıId int
select @enbuyukkategorıId=MAX(CategoryID) from Categories

if @enbuyukkategorıId<@KatId
begin
print 'girdiğiniz kategorı olmaadıgından girmidiğiniz kat 9 olarak others kategorısıne kaydedilecektir.'
set @KatId=9
end
insert Products(ProductName,UnitPrice,CategoryID,UnitsInStock)
values (@ad,@fiyat,@KatId,@stok)

exec UNKNOWNKAT 'test',5,11,3


 select * from Products




 --OUTPUT İLE DEGER DONDURME--

 CREATE PROC SP_ORNEK4
 (
 @Id int,
 @Ad nvarchar(max) output,---output parametre içerdeki degeri dısarı göndermek için klllanılır.
 @Soyad nvarchar(max) output
 )
 as
 select @Ad=FirstName,@Soyad=LastName from Employees where EmployeeID=@Id

 ---kullanımı--
 declare @Ad nvarchar(max),@Soyad nvarchar(max)

 exec SP_ORNEK4 8,@Ad output,@Soyad Output
 select @Ad+' '+@Soyad




 --ÜRÜN ID NUMRASINA GÖRE İSMİNİ GETİREN UYGULAMAYI SP DE YAPINIZ.

alter PROC [UrunıdDegerineGöreİsimGetir]
(
@UrunId int
)
with encryption
as 


select ProductID,ProductName from Products where ProductID=@UrunId

exec UrunıdDegerineGöreİsimGetir 4


--sp nin çalısması sonucunda dönen degeri bşr degişken ile karsıalama çalısalım

declare @UrunAd int ,@İd int =10
exec @UrunAd=UrunıdDegerineGöreİsimGetir 10
print cast(@İd as nvarchar)+' deger ' +@UrunAd



---dısardan aldıgı isim soyısım  ve ülke bilgilerini personel tablosundaki ilgili kolonlara ekleyen sp yzınız

create proc PersonelEkle
(
@Ad nvarchar(30),@Soyad nvarchar(30),@Sehir nvarchar(30)
)
as

insert into Employees(FirstName,LastName,Country)
values(@Ad,@Soyad,@Sehir)

exec PersonelEkle 'ahmet','ünlü','kastamonu'

select * from Employees

--OUTPUT


CREATE PROC Shippersİnsert
(
@Cn nvarchar(50),
@p nvarchar(20),
@shipperId int output
)
as
insert Shippers (CompanyName,Phone)
values (@Cn,@p)
set @shipperId=@@IDENTITY


--1.yol
declare @Shipper_Id int
exec Shippersİnsert 'aras','45464121',@shipperId=@Shipper_Id Output
select @Shipper_Id

--2.yol
declare @Shipper_Id int
exec Shippersİnsert 'aras','45464121',@Shipper_Id Output
select @Shipper_Id

select * from Shippers





create proc sp_personelekle
(
@Ad nvarchar(max)='test1',
@soyad nvarchar(max)='test2',
@Sehir nvarchar(max)='test3'

)as

insert Employees (FirstName,LastName,City)values (@Ad,@soyad,@Sehir)

exec sp_personelekle 

select * from Employees

--stokta eksık olan urunleri getirsin.


alter view StokMiktar
as
select ProductName,UnitsInStock,UnitsOnOrder,UnitsOnOrder-UnitsInStock from Products where
UnitsOnOrder>UnitsInStock



---USER DEFINED FUNCTION --KULLANICI TANIMLI FONKSIYONLAR

--1)SCALAR FUNC
--2)IN-LINE VALUED FUC
--3)MULTISTATEMENT  TABLE VALUE FUNC

--FONSKIYONLAR VERER DATADESE OBJESI OLDUKLARINDAN DOLAYI DDL(CREATE ALTER DROP) KEYWORDLERİ İLE YONETİLİRLER
--FUNCTIONLAR PARAMTERER ALABLİRLER VEYA ALMAYABİLİRLER İSTEĞE BAGLIDIR.
---FUNCTIONLAR SUBQUERY ICERISNDE KULLLANILABİLİRLER.FAKAT STORED PROCEDURELER HERNGAİ BİR SORGU İÇERİSNİDE KULLANLAMAZLAR
--SCALAR VE TABLE VALUED FUNCTION LARDA SADECE SELECT SORGULAR KULLANILABŞLİRLER


--1.SCALAR FUNCTIONLAR
--DBO'SUZ KULLANILAMAZ.SCHEMABİNDİNG PARAMETRESİ İLE OLUSTURULAN YAPILARDA KULLANILIR.
--TABLO İSİMLERİDE DBOSUZ OLMAZ
--DBO DATABASE OWNER
--BEGİN END SKOPLARI MUTLAKA KULLANILMALIDIR.


CREATE FUNCTION KdvliFiyatHesapla
(
@Tutar money, @KdvOrani Float
)
returns money
as
begin 
return (@Tutar*(1+@KdvOrani))
end

select dbo.KdvliFiyatHesapla (15,.58)


--bugunun tarıhını döndurern functınon yazını



alter function [NowDate]
()
returns date
as
begin
return getdate()
end



select dbo.NowDate()

--bir fonksıyon paraamter almasada parantezler mutlaka aılıp kapanmalıdır.


--kategorı ıd bilgisi alan aldıgı bu kategorı den kar adeti gösyeren bir fonsıon yazınız.


create function KategorideSatanUrunSayısı
(
@KatId int
)
returns int

as
    begin
return (
         select SUM(od.Quantity) from [Order Details] od inner 
		 join Products p on p.ProductID=od.ProductID
		 where p.CategoryID=@KatId   
        )

    end


	select dbo.KategorideSatanUrunSayısı(2)



-- ürün eklenirken kategporı ıd bilgisi girilmemiş ise defoult olarakother ismin de kategirye eklenmiş olsun


insert Categories(CategoryName)values ('Other')

alter function BilinmeyenKategori()
returns int 
as
   begin 
    	return	
           (
            select CategoryID from Categories where CategoryName='Other'

			)
    end


	select dbo.BilinmeyenKategori()

	insert into Products(ProductName,UnitPrice)
	values ('bilgissayar',15)

	select * from Products



	--2sayıyı toplayan functıon


	create function Toplama
	(
	@sayı1 int,
	@sayı2 int

	)
	returns int
	as

               begin
                       return(
					   
					             @sayı1+@sayı2
					   
					          )


               end

select dbo.Toplama(5,15)


--4 işlemi yapın??


alter function TarihFormatla
(
@Tarih DateTime ,@Ayraç char(1),@Format char(3) 
)
returns nchar(10)
as
begin

declare @yil nchar(4)=year(@tarih)
declare @ay nchar(2)=month(@tarih)
declare @gün nchar(2)=day(@tarih)
declare @FormatlıTarih nchar(10)

if LEN(@gün)=1
set @gün='0'+@gün
if LEN(@ay)=1
set @ay='0'+@ay


if @Format='dmy'
set @FormatlıTarih=@gün+@Ayraç+@ay+@Ayraç+@yil
else if @Format='mdy'
set @FormatlıTarih=@ay+@Ayraç+@gün+@Ayraç+@yil
else if @Format='ymd'
set @FormatlıTarih=@yil+@Ayraç+@ay+@Ayraç+@gün

return @FormatlıTarih

end



select dbo.TarihFormatla(GETDATE(),'.','ymd')



--IN LINE TABLE VALUED FUNCTION---
--SADECE SELECT SORGULARINDA KULLANILABİLİR.
--GERİYE TABLO DÖNECEGİNDEN DOLAYI RETURNUNE TABLE YAZILMASI GEREKİR.
--BEGİN 
--END SCOPELARINA VE DBO PARTLARINA İSHİTYACINIZ YOK.




CREATE FUNCTION KAtUrunler
(@CatId int)
Returns table
as

return  (select ProductName,CategoryID  from Products where CategoryID=@CatId)


select * from KAtUrunler(3)
select * from KAtUrunler(1) where ProductName like 'ch%'


select unitprice from KAtUrunler(1) where ProductName like 'ch%'--ofuntıonda yazdıgımız talobda o kolon yoktur.


--paramtre degeri verilen kategorı Id neticesinde asagıdakı kolon bilgilerini donduren bır functıon yazınız.
--productname ,kategorıname,categorid,supllıerıd encryptıonlu yapınız.
alter FUNCTION KAtUrunler2
(@CatId int)
Returns table
with encryption 
as

return  (select p.ProductName,c.CategoryName,c.CategoryID,p.SupplierID  from Products p inner join Categories c on c.CategoryID=p.CategoryID
   where c.CategoryID=@CatId)



   select * from KAtUrunler2(2)



   select k.productname,s.CompanyName from KAtUrunler2(1) k inner join Suppliers s on s.SupplierID=k.SupplierId
   --functıonla tablo kategorılerı joınleyebiliriz.
   



   --MULTISTATEMENT TABLE VALUED FUNCTION--
   --bu functıonlar içerisinde ınsert update ve delete kullanılabılır geriye yıne bir tablo doner.
   --FAKAT BU TABLOYU TANIMLAMAM VE REM'E YERLEŞTİRMEM
   --tanımladıgım tablo local veya global bir deişken olabilir.


   alter function Kisilerim
   (@tip nvarchar(7)
  
   )
   returns @Tablom table
   (
    ıd int,
    İsim nvarchar(50)
	
   )
   as
    begin
	          if @tip='ad'
	              begin 
	                 insert @Tablom select EmployeeID,FirstName from Employees
					  delete from @Tablom where ıd=9
	              end
	         else if @tip='adsoyad'
	             begin
		             insert @Tablom select EmployeeID,FirstName+'  '+LastName from Employees
	           delete from @Tablom where ıd=9
			   
			     end
         
			     


	   return



    end


	select * from Kisilerim('ad')
    select * from Kisilerim('adsoyad')
		




		---database olusturmak

		create database BankaDB
		go
		Use bankaDB
		go
		alter table Hesap 
		(
		ID int primary key identity,
		AdSoyad nvarchar(max),
        Bakiye money,
		TcKimlikNo char(11)
     	)

-------------------------------------------
insert Hesap 
values 
('Erdi MUTLU',1000,'45445454541'),
('ALİ DENİZ',100000,'67972334422'),
('AYSE TAS',50000,'46845376741'),
('MUHAMMET AYDIN',50000,'46845376741')

SELECT * FROM Hesap

         begin try 
update Hesap set Bakiye -=200 where TcKimlikNo='67972334422'
raiserror ('elektrık kesildi.',16,2)
update Hesap set Bakiye +=200 where TcKimlikNo='45445454541'
         end try


         begin catch
print 'beklenmedik bir hata olustu.'
        end catch



--TRANSECTION KULLANIMI

--herhangi bir hata durumunda rollback işlemi yapar.

BEGIN TRY
          begin TRAN --transection baslar
update Hesap set Bakiye -=1000 where TcKimlikNo='67972334422'
raiserror ('elektrık kesildi.',16,2)
update Hesap set Bakiye +=500 where TcKimlikNo='45445454541'
update Hesap set Bakiye +=500 where TcKimlikNo='46845376741'
          commit tran --transection basarılı bir sekilde soonuçlanacaktır.
END TRY


BEGIN CATCH
print 'beklenmedik bir hata olustu.'
ROLLBACK TRAN ---TRANSECITON BASARISIZ BİŞR SEKİLDE SONLANDIRIRLIR.VE YAPILAN BASARILI İŞLEMLER GERİYE ALINIR. 


END CATCH


SELECT * FROM Hesap

--TRY CATCH BLOKLARI HATA YAKALAMAK İÇİN KULLANILAN BLoKLARDIR TRY CATCH BULUNDUGU AN GİDER  catcah tetıkler .CATCH İÇERİSİNDEKİ KODLAR CALISIR.
--BİZDE BURDA TRANSACTIONLARMIZI EGER  TRY ICERISINDE KODLAR BASARILI BİR SEKİLDE CALISIRSA TRANSACTION İŞLEMLERİ COMMIT TRAN İLE KAYDEDER VE İŞLEMİ SONLANDIRIRLIR EGER HATA ALINIRSA CATCH BLOGUNA DÜŞER  BLOK İÇERİSİNDE DE ROLLBACK KULLANDIGIMIZ İÇİN ADIMLAR GERİ ALINIYOR VE KAYDEDİLMİYOR.BU SEKILDE GURULUTU VERİ ÖNÜNE GEÇİLİR.






--23/08/2021
                                                 -------TRİGGERLAR---

--DmL.T(insert update,delete),DDL.T (CREATE ALTER DROP),LOGON .T,TABLO,SORGU SONUCU,YAPILAN İŞLEMLERDEN SONRA BİR OLAY YAKALARLAR.
--dml.t ddl.t,logon.t

--AFTER TRIGGER
--İNSTEAD OF TRIGGER 

--OTOMATIK CALISAN SPLERDİR.
--C# DAKİ EVENTKERERE BENZERLER


--DML TRIGGER
--BİR TABLODA İNSERT UPDATE DELETE İŞLEMŞİ GERÇEKLESTIGINDE DEVEREYE GİREN YAPILARDIR.


--İNSERTED TABLE
--EGER BİR TABLODA İNSERTED İŞLEMİ YAPILIYORSA,ARKA PLANDA İŞLEMLER İLK ÖNCE RAMDA OLUSTURULUR İNSERTED İSİMLİ BİR TABLO ÜZERINDE BU İŞLEM YAPILIP İŞLEMLER HANGİ BİR PROBLEM ÇIIKMAZ İSE İNSERTED TABLOSUNDAKİ EKLENEN VERİ GERCEK TABLOYA EKLENİR.İŞLEM TAMAMLANDIGINDA RAMDE OLUSTURULAN INSERTED TABLOSU SİLİNİYOR.




--DELETED TABLE   
--EGER BİR TABLODA DELETED İŞLEMİ YAPILIYORSA,ARKA PLANDA İŞLEMLER İLK ÖNCE RAMDA OLUSTURULUR DELETED İSİMLİ BİR TABLO ÜZERINDE BU İŞLEM YAPILIP İŞLEMLER HANGİ BİR PROBLEM ÇIIKMAZ İSE DELETED TABLOSUNDAKİ EKLENEN VERİ GERCEK TABLODAN SİLİNİR..İŞLEM TAMAMLANDIGINDA RAMDE OLUSTURULAN INSERTED TABLOSU SİLİNİYOR.


--DİREK GERÇEK TABLOYA ETKİ ETMEMESİNİN SEBEBİ ARADA IŞLEM YAPMAK İSTEDİĞİMİZDE TRIGGER GİBİ DİREK TABLOYA ETKİ ETSE BİZ ARADA İŞLEM YAPAMAZDIK.
--BU SAYEDE ARADA İŞLEMLERİMİZ<İ YAPABİLİYORUZ.


---UPDATE İŞLEMİ
--EGER BİR TABLODA UPDATE İŞLEMİ YAPILIRYORSA UPDATEDED İSİMLİ BİR TABLO OLUSTURULMAZ
--SQL SEVERDAKİ MANTIGA GÖRE ÖNCE SİLME ARDINDAN İNSERT İŞLEMİ GERDCEKLESECEK SEKİLDE YAPILIR
--EGER UPDATE İŞLEMİ YAPILIYORSA ARKA  TARAFTA HEM İNSERTED HEMDE DELETED İÇİN AYRI AYRI İKİ TABLO OLUSTURULUR.İŞLEMLER BUNUN UZERUNDE GERÇEKLESTIRILIR.
--DİKKAT !!! UPDATE YAPARKEN GUNCELLENEN  KAYDIN ORJINALİ DELETED TABLOSUNDA, GUNCELLENDİKTEN SONRAKİ HALİ İNSERTTED TABLOSUNA AKTARILIR.
--CÜNKÜ GUNCELLEMEKE DEMEKE KAYDI SİLMEK ARDINDANDA EKLEMEK DEMEKTIR.


--DELETED VE İNSERTED TABLOLARI, İLGİLİ SORGU SONUCU OLUSUR.
---SORGU SONUCUNDA OLUSTURDUKLARI TABLOLARIN KOLONLARI İLE OLUSURLAR
--BÖYLECE DELETE VE İNSERTED TABLOLARINA BEN SELECT ATABİLİRİM.

---TRİGGER TANIMLAMA
--CREATE TRIGGER [TRİGGER ADI]
--ON [İŞLEMİN YAPILACAGI TABLO ADI]
--ALTER VEYA İNSERT,UPDATE ,İNSERT
--AS [KODLAR]
--ASIL AMACI LOG TUTMAKTIR.

use Northwind
CREATE TRIGGER OrnekTrigger
on Employees
after insert
as
select * from employees



insert into employees(firstname,lastname)values ('mami','aydın')




--tedarikciler tablosundaki bire veri silindiiğinde tum urunleri fiyati otomatık olarak 10 artsın

Create Trigger VERİSİLME2
on Suppliers
after delete
as
Update Products set UnitPrice =UnitPrice+10
select * from Products


--tetikleme--

delete from Suppliers where SupplierID=30


select * from suppliers

--bu soruyu hocaya sor.



--örnek 2
--COMPANYNAME KOLONUNDA region kolonundan veri güncellendiğinde categoriler tablounda dondurulmus urunler adında yeni bir kategorı oplusuturlsun
alter trigger VeriGüncelleme
on suppliers
for update
as
insert into categories (CategoryName) values ('et')
select * from categories


update suppliers 
set companyname='hp' where SupplierID=31






--ORNEK 3 

--PERSONELLER TABLOSUNDAN BİR KAYIT SILINDIGINDE SİNEN KAIYT KAYDIN ADI, SOYUADI,KİM TARAFINDAN SILINDIGI,VE HANGİ TARİHTE SİLİNİDİĞİ BİLGİSİNİ BASKA BİER TABLOYA KAYDEDİN.


--öncelikle bir tablo olusturmamıuz gerekiyor.
create table LogTablosu
(
Id int primary key identity(1,1),
Rapor nvarchar (max)
)

alter trigger VeriSilmeİşlemi
on employees
after delete
as
declare @Ad nvarchar(max),@soyad nvarchar(max)
select @Ad=Firstname,@soyad=Lastname from employees
insert LogTablosu values ('ad'+'soyad'+@Ad+' '+@soyad+'olan personel'+ SUSER_NAME()+'tarafından'+CAST(GETDATE() as nvarchar(max))+
'tarihinde silinmiştir.')
select * from logtablosu


delete from employees where employeeID=13


--ornek 4
--persnoller tablousnda update gerçeklesştıgınde anda devreye giren ve bir log tabl9ıhnda 'adı .... olan oernsole yeni adıyla degiştirilierek .... kullanıcısı tarafından .....tarihinde güncellenmiştir.'




create table LogTablosu2
(
Id int primary key identity(1,1),
Rapor nvarchar (max)
)


alter trigger VeriGüncellemeİşlemi
on employees
for update --after update yazılsada olurdu..
as
declare @EskiAd nvarchar(max),@YeniAd nvarchar(max)
select  @EskiAd=Firstname from deleted
select @YeniAd=Firstname from inserted
insert LogTablosu2 values ('eski adı '+@EskiAd+' olan personel '+@YeniAd+' yeni adıyla değiştirilerek  '+ SUSER_NAME()+' kullanıcısı tarafından'+CAST(GETDATE()
 as nvarchar(max))
+' tarihinde guncellenmiştir.')
select * from logtablosu2


update  employees set firstname='mamı',lastname='aydın ' where employeeID=12
select * from employees


--multıple actıons trıggers
--birden fazla aksıyonu tetiklemek içn kullanılır
--

create trigger multıtrıgger
on employees
after delete,insert
as
print 'trigger çalısmasını tamamladı.'





insert employees (firstname ,lastname) values ('test','Test')
delete from employees where [EmployeeID]=12

--MEDIMUM GITBOOKTA BLOG YAZ..
--LATEX,
--AZUREDEVOPS




--SUSER_NAME()==> 0 ANKI SERVER UZERINDENKİ AKTIF OLAN KULLANICININ BİLGSİİNİN BİZE DÖNDURURR.

---İNSTEAD OF TRİGGERLAR---
--SUANA KADAR İNSERT UPDATE DELETE İŞLEMLERİ YAPILIRKEN SU SU İŞLEMLER YAP MANTIGI İLE HAREKET ETTTIK(YANINDA SUNU YAP)
--INSTEAD OF TRIGGERLERDE ISE İNSERT UPDATE DELETE İŞLEMLERİ YERİNE SU SU İŞLEMLERİ YAP MANTIGI İLE CALISMAKTDATIR.

--CREATE TRIGGER [TRIGGER ADI]
--ON TABLO ADI
--INSTEAD OF DELETE ,İNSERT ,UPDATE
--AS
--KOMUTLAR



--ÖRNEK 5
--PERSONELLER TABLOSUNDA UPDATE İŞLEMİ GERÇEKLESTIGI ANDA YAPILACAK GUNCELLEŞTIRME YERİNE BİR LOG TABLOUNA ADI ... OLAN PERSONEL .. YENİ ADIYLA DEGİŞTİRİLEREK .. KULLANICISI TARAFINDAN ....TARIHINDE GUNCELLENMEK İSTENDİ.


CREATE TRIGGER [YERİNETRİGGER]
ON EMPLOYEES
instead of update
as
 declare @EskiAd nvarchar(max),@YeniAd nvarchar(max)
select  @EskiAd=Firstname from deleted
select @YeniAd=Firstname from inserted
insert LogTablosu values ('eski adı '+@EskiAd+' olan personel '+@YeniAd+' yeni adıyla değiştirilerek  '+ SUSER_NAME()+' kullanıcısı tarafından'+CAST(GETDATE() as nvarchar(max))+ ' tarihinde guncellenmek  istendi..')


update  Employees set firstname='mamı' where employeeID=17
select * from logtablosu
select * from employees


--adı andrew olan kaydı silmesini engelleyen trıgger yaz printle uyarı verdir.


CREATE trigger [silinmeyenisim]
on employees
after delete
as
declare @isim nvarchar(max)
select @isim=firstname from deleted

if @isim='ahmet'
        begin
print 'bu kaydı silemessiniz.'
rollback --yapılan tüm işlemleri geri alır
        end

else 
       begin

                     insert LogTablosu values ('isim '+@isim+' olan personel '+ SUSER_NAME()+' kullanıcısı tarafından'+CAST(GETDATE() as nvarchar(max))+ ' tarihinde silindi.')
                      select * from logtablosu
      end;

--çalıstırma
delete from employees where employeeid=16

select * from employees




--DDL TRIGGER İŞLEMLERİ
--CREATE ALTER DROP İŞLEMLERİ SONUCUNDA VEYA SURECINDE DEVREYE GİRERCEK OLAN YAPILARDIR.

create trigger [Trigger]
on database
after create table   -- create_Table alter_table drop_table,create_procedure,alter_procedure,create_functıon,alter_functıon, işlemlerinde yapılır.
as
print 'test'
ROLLBACK





--dikkat ddl trıggerler programmabiliyt altındadır.

--disable Trigger DDL_Trigger[trigger isimi] on DATABASE
--enable Trigger DDL_Trigger[trigger isimi] on DATABASE
--triggerı aktıf veya pasif hale getirir. 

--TABLO ÜZERİNDE İNDEX İŞLEMİ
--PERFORMANSI ARTIRMAK DAHA HIZLI SOGU YAPMKA İÇİN YAPILIR.
--TEK TEK BUTUN SATIRLARI DOLASIR LAYDI BULSA BİLE BASK VERİ VARMI DİYE DOLASMAYA DFEVAÖ EDER




create database IndexTest
go
use IndexTest
go
create Table Kisi
(
id int primary key identity,
ad nvarchar(50),
soyad nvarchar(50),
telno char(11)
)


declare @i int=1
while @i<150

begin
insert Kisi
select ad='muhammet'+ cast(@i as nvarchar(50)),
soyad='aydın'+ cast(@i as nvarchar(20)),
telno=cast(@i as char(11))

set @i+=1

end

select * from Kisi where id=120
set statistics time on
set statistics IO on
select * from Kisi





truncate table kisi


--CLUSTERED İNDEX--

--VERİYİ SQLDE FİZİKSEL OLARAK SIRAYA SOOKN YAPILARDIR
---ASLINDA HEPİMİZ CLUSTERED İDEXİ TABLOLARIMIZDA KULLANIYORUZ.
--TABLOLARIMIZDA TANIMLADIGIMIZ HER BİR PK ASLINDA BİR CLUSTERED İNDEX YAPISINDADIR.
--CUNKU TABLOLARIMIZ BU PKYA GÖRE FIZIKSEL OLARAK SIRALANIR.


CREATE CLUSTERED index Kisiİndexle
on Kisi(id)
--clustered index degiştirme
CREATE CLUSTERED index Kisiİndexle
on Kisi(id)
with drop_existing --var olan şndexi siler tekrar olusturur.
fillfactor=60 --doluluk oranı
pad_index --intermatıate levelde duzenlenır.



--NONCLUSTERED İNDEX
--BİR COLNU NON CLUSTERED OLARAK İNDEXLEMYE LAŞKTIGIMIZDA ARKA TARAFTA KENDİJNE AİT YENİ BİR TABLO OLUSTURUR VE BU TABLO SIZIIN İNDEXLEDİĞİNİZ KOLONA KLARSILIK DEGERLERİ TUTAR  YANİ BİR NEVİ POINTER YAPISI GİBİ DUSUNEBİLİRİZ NON CLUSTERED İNDEXTE VEREİLERE İREK ERİSİLEMEZ
--ELDE EDİLEN İNDEXLEME YAPISINA ERİŞMEK İÇİN KUMELENMİŞ YAPISI KULLANILMIS OLUR.

CREATE NONCLUSTERED index TeleGöreIndexle on Kisi(TelNo)

set statistics time on
set statistics IO on

select ad,soyad,telno from kisi
where telno='125'


--İNDEX BAKIMI NASIL YAPILIR???
--repaır ve rebuıld ıslemlerinin yapılması gerekir.
--gerekli fonksıyon olusturulur ve hangi tablonun ne kadar bozuldugu bulunur.
--silinen colonlar silinen bilgiler yuzunden uyumsuzluklar olusur.cpu,önbellek ıo gibi parçalar zorlarnır.
--parçalanma yuzdesi 15 30 arasında repaır, 30dan buyuk oldugunda rebuıld,
--bu işlemler veri taanı yogun olmadıgı saatlerde yapılmaslıdır.
--DBCC SHOWCONTIG NEDİR BAKIN??
--belirtilen tablo veya görunumun verilerini  ve dizileri için parcalanma bilhgilerini verir.
--DBCC SHOWCONTIG   
--[ (   
--    { table_name | table_id | view_name | view_id }   
--    [ , index_name | index_id ]   
--) ]   
 --   [ WITH   
   --     {   
 --        [ , [ ALL_INDEXES ] ]   
    --       [ , [ TABLERESULTS ] ]   
   --        [ , [ FAST ] ]  
 --  -- [ , [ ALL_LEVELS ] ]   
    --       [ NO_INFOMSGS ]  
  --       }  
--    ]  

--NON CLUSER ŞİNDEXLEMEYİ SU SEKİLDE DUSUNEBİLİRSİNİZ.KİTAPLARIN İÇİNDEKİLER KISMI VARDIR ORDA HERBIR KOLONUN SAYDA BASLANGICISAYFASI YAZAR
--VE BİTİŞ SAYFASI YAZAR
--SİZ KİTABI ACTIGINIZDA İSTEDİĞİNİZ SAYFASI BAKARSINIZ ORDAN HANGİ BÖLUME GİDECEGİNİZİ BELİRLEYİP ONA GÖRE İSTEDİĞİNİZ YERE GİDERSİNİZ İNDEXTE BU MANTIKLA CALISIIR.


























 



































 













