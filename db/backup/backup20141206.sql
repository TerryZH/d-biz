PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20141114144022');
INSERT INTO "schema_migrations" VALUES('20141116040539');
INSERT INTO "schema_migrations" VALUES('20141116135534');
INSERT INTO "schema_migrations" VALUES('20141116135535');
INSERT INTO "schema_migrations" VALUES('20141117010521');
INSERT INTO "schema_migrations" VALUES('20141116135536');
INSERT INTO "schema_migrations" VALUES('20141117015918');
INSERT INTO "schema_migrations" VALUES('20141117015945');
INSERT INTO "schema_migrations" VALUES('20141116040540');
INSERT INTO "schema_migrations" VALUES('20141116040541');
INSERT INTO "schema_migrations" VALUES('20141117021058');
INSERT INTO "schema_migrations" VALUES('20141116040542');
INSERT INTO "schema_migrations" VALUES('20141117015919');
INSERT INTO "schema_migrations" VALUES('20141117020018');
INSERT INTO "schema_migrations" VALUES('20141129014413');
INSERT INTO "schema_migrations" VALUES('20141129014414');
INSERT INTO "schema_migrations" VALUES('20141129014418');
INSERT INTO "schema_migrations" VALUES('20141129015818');
INSERT INTO "schema_migrations" VALUES('20141205012228');
INSERT INTO "schema_migrations" VALUES('20141205012828');
INSERT INTO "schema_migrations" VALUES('20141129085818');
INSERT INTO "schema_migrations" VALUES('20141205085818');
CREATE TABLE "materials" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "when" date, "what" varchar(255), "sum" float, "price" float, "created_at" datetime, "updated_at" datetime);
INSERT INTO "materials" VALUES(1,'2014-11-10','大白菜',6.0,0.5,'2014-11-16 05:42:21.410162','2014-11-16 05:42:21.410162');
INSERT INTO "materials" VALUES(2,'2014-11-10','花生油',89.0,8.9,'2014-11-16 06:03:57.185435','2014-11-16 06:03:57.185435');
INSERT INTO "materials" VALUES(3,'2014-11-10','五得利面粉',42.0,2.1,'2014-11-16 06:07:00.250913','2014-11-16 06:07:00.250913');
INSERT INTO "materials" VALUES(4,'2014-11-11','锅',18.0,18.0,'2014-11-16 06:10:08.922426','2014-11-16 06:10:08.922426');
INSERT INTO "materials" VALUES(5,'2014-11-11','猪肉',40.0,9.5,'2014-11-16 06:11:19.482450','2014-11-16 06:11:19.482450');
INSERT INTO "materials" VALUES(6,'2014-11-11','牛肉',24.0,24.0,'2014-11-16 06:12:37.627110','2014-11-16 06:12:37.627110');
INSERT INTO "materials" VALUES(7,'2014-11-11','羊肉',29.0,29.0,'2014-11-16 06:14:14.746822','2014-11-16 06:14:14.746822');
INSERT INTO "materials" VALUES(8,'2014-11-11','木耳',9.0,15.0,'2014-11-16 06:15:05.715655','2014-11-16 06:15:05.715655');
INSERT INTO "materials" VALUES(9,'2014-11-11','辣椒面',5.0,10.0,'2014-11-16 06:15:53.787129','2014-11-16 06:15:53.787129');
INSERT INTO "materials" VALUES(10,'2014-11-11','生姜',4.2,4.0,'2014-11-16 06:16:43.787107','2014-11-16 06:16:43.787107');
INSERT INTO "materials" VALUES(11,'2014-11-11','香菜',0.8,3.0,'2014-11-16 06:17:50.948304','2014-11-16 06:17:50.948304');
INSERT INTO "materials" VALUES(12,'2014-11-11','大葱',10.0,1.0,'2014-11-16 06:18:53.972311','2014-11-16 06:18:53.972311');
INSERT INTO "materials" VALUES(13,'2014-11-11','五得利面粉',84.0,2.1,'2014-11-16 06:20:56.355095','2014-11-16 06:20:56.355095');
INSERT INTO "materials" VALUES(14,'2014-11-11','葵花籽油',10.0,10.0,'2014-11-16 06:22:56.291440','2014-11-16 06:22:56.291440');
INSERT INTO "materials" VALUES(15,'2014-11-12','虾仁',24.0,30.0,'2014-11-16 06:24:48.196695','2014-11-16 06:24:48.196695');
INSERT INTO "materials" VALUES(16,'2014-11-12','豆腐',7.5,2.5,'2014-11-16 06:25:45.004766','2014-11-16 06:25:45.004766');
INSERT INTO "materials" VALUES(17,'2014-11-12','韭菜',3.0,3.0,'2014-11-16 06:26:32.684698','2014-11-16 06:26:32.684698');
INSERT INTO "materials" VALUES(18,'2014-11-12','胡萝卜',9.0,1.0,'2014-11-16 06:27:15.900399','2014-11-16 06:27:15.900399');
INSERT INTO "materials" VALUES(19,'2014-11-13','木耳',15.0,15.0,'2014-11-16 06:28:02.381129','2014-11-16 06:28:02.381129');
INSERT INTO "materials" VALUES(20,'2014-11-13','牛肉',51.0,25.0,'2014-11-16 06:28:43.334576','2014-11-16 06:28:43.334576');
INSERT INTO "materials" VALUES(21,'2014-11-13','虾仁',24.0,30.0,'2014-11-16 06:29:32.981757','2014-11-16 06:29:32.981757');
INSERT INTO "materials" VALUES(22,'2014-11-13','猪肉',32.0,9.5,'2014-11-16 06:30:22.526149','2014-11-16 06:30:22.526149');
INSERT INTO "materials" VALUES(23,'2014-11-13','韭菜',3.0,3.0,'2014-11-16 06:30:59.702310','2014-11-16 06:30:59.702310');
INSERT INTO "materials" VALUES(24,'2014-11-13','香菜',2.0,3.0,'2014-11-16 06:32:06.461526','2014-11-16 06:32:06.461526');
INSERT INTO "materials" VALUES(25,'2014-11-13','鸡蛋',72.0,5.5,'2014-11-16 06:32:53.110315','2014-11-16 06:32:53.110315');
INSERT INTO "materials" VALUES(26,'2014-11-11','筷子',10.0,0.1,'2014-11-20 13:37:54.512908','2014-11-20 13:37:54.512908');
INSERT INTO "materials" VALUES(27,'2014-11-11','餐盒',22.5,0.45,'2014-11-20 13:38:51.349665','2014-11-20 13:38:51.349665');
INSERT INTO "materials" VALUES(28,'2014-11-11','打包盒',27.0,0.54,'2014-11-20 13:39:13.904321','2014-11-20 13:39:13.904321');
INSERT INTO "materials" VALUES(31,'2014-12-05','韭菜',7.0,4.5,'2014-12-05 12:50:45.887867','2014-12-05 12:50:45.887867');
INSERT INTO "materials" VALUES(32,'2014-12-06','包装袋',6.5,0.0325,'2014-12-06 10:42:08.546565','2014-12-06 10:42:08.546565');
INSERT INTO "materials" VALUES(33,'2014-12-06','方便袋',4.0,0.04,'2014-12-06 10:42:25.578647','2014-12-06 10:42:25.578647');
INSERT INTO "materials" VALUES(34,'2014-12-06','剁椒',6.4,13.33,'2014-12-06 10:44:29.502153','2014-12-06 10:44:29.502153');
INSERT INTO "materials" VALUES(35,'2014-12-06','生姜',4.7,5.6,'2014-12-06 10:45:34.872695','2014-12-06 10:45:34.872695');
INSERT INTO "materials" VALUES(36,'2014-12-06','豆腐',5.0,2.5,'2014-12-06 10:45:53.768753','2014-12-06 10:45:53.768753');
INSERT INTO "materials" VALUES(37,'2014-12-06','辣椒',5.5,4.0,'2014-12-06 10:46:53.450167','2014-12-06 10:46:53.450167');
INSERT INTO "materials" VALUES(38,'2014-12-06','香菜',2.0,4.0,'2014-12-06 10:47:53.382936','2014-12-06 10:47:53.382936');
CREATE TABLE "customers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "when_joined" date, "nick" varchar(255), "address" varchar(255), "tel" varchar(255), "email" varchar(255), "wechat" varchar(255), "weibo" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "customers" VALUES(2,'2014-11-14','','北京新天地1期11号楼1单元202','18613815156','','','','2014-11-17 01:32:28.434968','2014-12-05 13:47:34.836480');
INSERT INTO "customers" VALUES(3,'2014-11-14','','北京新天地1期11号楼1单元701','13811906761','','','','2014-11-17 01:33:20.747166','2014-11-17 01:33:20.747166');
INSERT INTO "customers" VALUES(4,'2014-11-18','','北京新天地1期11号楼1单元302','18609005774','','','','2014-11-18 06:37:37.294275','2014-11-18 06:37:37.294275');
INSERT INTO "customers" VALUES(5,'2014-11-20','','北京新天地1期8号楼1单元1702','13261776091','','','','2014-11-20 13:12:13.240713','2014-11-20 13:12:13.240713');
INSERT INTO "customers" VALUES(6,'2014-11-21','','北京新天地1期11号楼2单元802','01058464576','','','','2014-11-21 03:48:18.334642','2014-11-21 03:48:18.334642');
INSERT INTO "customers" VALUES(7,'2014-11-24','','北京新天地1期8号楼1单元2402','13811505385','','','','2014-11-24 12:16:58.805516','2014-11-24 12:16:58.805516');
INSERT INTO "customers" VALUES(8,'2014-11-28','','北京新天地1期12号楼2单元1902','18611636882','','','','2014-11-28 04:04:32.933385','2014-11-28 04:04:32.933385');
INSERT INTO "customers" VALUES(9,'2014-11-28','','北京新天地1期11号楼2单元2001','01059121655','','','','2014-11-28 10:47:59.650236','2014-11-28 10:47:59.650236');
INSERT INTO "customers" VALUES(10,'2014-12-02','','北京新天地1期11号楼1单元2002','18513543586','','','','2014-12-02 04:36:48.098448','2014-12-02 04:36:48.098448');
INSERT INTO "customers" VALUES(11,'2014-12-04','','北京新天地2期7号楼1单元2603','18612808764','','','','2014-12-04 10:23:20.527724','2014-12-04 10:23:20.527724');
INSERT INTO "customers" VALUES(12,'2014-12-05','','北京新天地2期6号楼1单元1001','15611973389','','','','2014-12-05 03:36:23.239517','2014-12-05 03:36:23.239517');
INSERT INTO "customers" VALUES(13,'2014-12-05','','北京新天地2期1号楼3单元1102','18611521416','','','','2014-12-05 04:46:31.120221','2014-12-05 04:46:31.120221');
INSERT INTO "customers" VALUES(14,'2014-12-05','','北京新天地2期7号楼2单元2103','13501126684','','','','2014-12-05 05:51:21.704592','2014-12-05 05:51:21.704592');
INSERT INTO "customers" VALUES(15,'2014-12-05','','北京新天地2期7号楼1单元802','13801314387','','','','2014-12-05 09:24:31.416757','2014-12-05 09:24:31.416757');
INSERT INTO "customers" VALUES(16,'2014-12-05','','北京新天地2期1号楼3单元1205','13911223809','','','','2014-12-05 10:57:27.771021','2014-12-05 10:57:27.771021');
INSERT INTO "customers" VALUES(21,'2014-12-06','','北京新天地2期1号楼2单元1103','01085583449','','','','2014-12-06 03:16:46.266895','2014-12-06 03:16:46.266895');
INSERT INTO "customers" VALUES(22,'2014-12-06','','北京新天地2期1号楼2单元602','01059122436','','','','2014-12-06 10:53:03.387413','2014-12-06 10:53:03.387413');
INSERT INTO "customers" VALUES(23,'2014-12-06','','北京新天地2期6号楼1单元1205','13476250765','','','','2014-12-06 10:55:38.982028','2014-12-06 10:55:38.982028');
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "when" date, "who_id" integer, "sum" float, "created_at" datetime, "updated_at" datetime);
INSERT INTO "orders" VALUES(1,'2014-11-14',2,30.0,'2014-11-17 01:53:21.051187','2014-11-17 01:53:21.051187');
INSERT INTO "orders" VALUES(2,'2014-11-14',3,110.0,'2014-11-17 01:55:17.640056','2014-11-17 01:55:17.640056');
INSERT INTO "orders" VALUES(3,'2014-11-18',4,30.0,'2014-11-18 06:39:03.757867','2014-11-18 06:39:03.757867');
INSERT INTO "orders" VALUES(4,'2014-11-20',5,23.0,'2014-11-20 13:16:57.356113','2014-11-20 13:16:57.356113');
INSERT INTO "orders" VALUES(5,'2014-11-21',6,27.0,'2014-11-21 03:48:37.332357','2014-11-21 03:48:37.332357');
INSERT INTO "orders" VALUES(6,'2014-11-24',7,22.0,'2014-11-24 12:21:04.987244','2014-11-24 12:21:04.987244');
INSERT INTO "orders" VALUES(7,'2014-11-25',7,24.0,'2014-11-25 10:00:37.064670','2014-11-25 10:00:37.064670');
INSERT INTO "orders" VALUES(8,'2014-11-28',8,39.0,'2014-11-28 04:05:10.710646','2014-11-28 04:05:10.710646');
INSERT INTO "orders" VALUES(9,'2014-11-28',9,23.0,'2014-11-28 10:48:13.976555','2014-11-28 10:48:13.976555');
INSERT INTO "orders" VALUES(10,'2014-11-28',7,20.0,'2014-11-28 12:22:49.441187','2014-11-28 12:22:49.441187');
INSERT INTO "orders" VALUES(11,'2014-11-30',5,24.0,'2014-11-30 12:12:48.642510','2014-11-30 12:12:48.642510');
INSERT INTO "orders" VALUES(12,'2014-12-02',10,10.0,'2014-12-02 04:37:12.705394','2014-12-02 04:37:12.705394');
INSERT INTO "orders" VALUES(13,'2014-12-04',11,21.0,'2014-12-04 10:23:33.296389','2014-12-04 10:23:33.296389');
INSERT INTO "orders" VALUES(14,'2014-12-04',11,24.0,'2014-12-04 12:34:20.703127','2014-12-04 12:34:20.703127');
INSERT INTO "orders" VALUES(15,'2014-12-05',12,18.0,'2014-12-05 03:36:34.151977','2014-12-05 03:36:34.151977');
INSERT INTO "orders" VALUES(16,'2014-12-05',12,18.0,'2014-12-05 04:00:54.541385','2014-12-05 04:00:54.541385');
INSERT INTO "orders" VALUES(17,'2014-12-05',13,23.0,'2014-12-05 04:46:45.303289','2014-12-05 04:46:45.303289');
INSERT INTO "orders" VALUES(18,'2014-12-05',14,97.0,'2014-12-05 05:54:56.264687','2014-12-05 05:54:56.264687');
INSERT INTO "orders" VALUES(19,'2014-12-05',15,61.0,'2014-12-05 09:25:23.613508','2014-12-05 09:25:23.613508');
INSERT INTO "orders" VALUES(20,'2014-12-05',16,28.0,'2014-12-05 10:57:36.710288','2014-12-05 11:00:53.377817');
INSERT INTO "orders" VALUES(33,'2014-12-06',21,45.0,'2014-12-06 03:16:46.271824','2014-12-06 03:16:46.293368');
INSERT INTO "orders" VALUES(34,'2014-12-06',11,28.0,'2014-12-06 04:07:03.602154','2014-12-06 04:07:03.612748');
INSERT INTO "orders" VALUES(35,'2014-12-06',16,40.0,'2014-12-06 10:16:36.500470','2014-12-06 10:16:36.516702');
INSERT INTO "orders" VALUES(36,'2014-12-06',22,23.0,'2014-12-06 10:53:03.398183','2014-12-06 10:53:03.409436');
INSERT INTO "orders" VALUES(37,'2014-12-06',23,22.0,'2014-12-06 10:55:38.994332','2014-12-06 10:55:39.000964');
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "products" VALUES(1,'五色素饺',NULL,NULL);
INSERT INTO "products" VALUES(2,'鸡蛋韭菜',NULL,NULL);
INSERT INTO "products" VALUES(3,'猪肉白菜',NULL,NULL);
INSERT INTO "products" VALUES(4,'牛肉韭菜',NULL,NULL);
INSERT INTO "products" VALUES(5,'羊肉胡萝卜',NULL,NULL);
INSERT INTO "products" VALUES(6,'灌汤三鲜',NULL,NULL);
INSERT INTO "products" VALUES(7,'双椒牛肉','','');
CREATE TABLE "workers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "workers" VALUES(1,'刘景梅',NULL,NULL);
CREATE TABLE "productions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "when" date, "who_id" integer, "what_id" integer, "number" float, "created_at" datetime, "updated_at" datetime);
INSERT INTO "productions" VALUES(1,'2014-11-12',1,3,3.0,'2014-11-17 02:31:57.550752','2014-11-17 02:31:57.550752');
INSERT INTO "productions" VALUES(2,'2014-11-12',1,1,3.0,'2014-11-17 02:32:46.443981','2014-11-17 02:32:46.443981');
INSERT INTO "productions" VALUES(3,'2014-11-12',1,6,2.0,'2014-11-17 02:33:05.099620','2014-11-17 02:33:05.099620');
INSERT INTO "productions" VALUES(4,'2014-11-13',1,4,1.5,'2014-11-17 02:33:25.147305','2014-11-17 02:33:25.147305');
INSERT INTO "productions" VALUES(5,'2014-11-13',1,5,1.8,'2014-11-17 02:33:39.482928','2014-11-17 02:33:39.482928');
INSERT INTO "productions" VALUES(6,'2014-11-13',1,6,1.8,'2014-11-17 02:33:57.923557','2014-11-17 02:33:57.923557');
INSERT INTO "productions" VALUES(7,'2014-11-14',1,5,0.5,'2014-11-17 02:34:35.550036','2014-11-17 02:34:35.550036');
INSERT INTO "productions" VALUES(8,'2014-11-14',1,2,1.6,'2014-11-17 02:34:54.803376','2014-11-17 02:34:54.803376');
INSERT INTO "productions" VALUES(9,'2014-11-30',1,7,1.8,'2014-12-05 05:25:52.383673','2014-12-05 05:25:52.383673');
INSERT INTO "productions" VALUES(10,'2014-11-29',1,4,1.8,'2014-12-05 06:38:37.797683','2014-12-05 06:38:37.797683');
INSERT INTO "productions" VALUES(11,'2014-11-27',1,2,1.6,'2014-12-05 06:44:34.587339','2014-12-05 06:44:34.587339');
INSERT INTO "productions" VALUES(12,'2014-12-05',1,2,1.4,'2014-12-05 09:08:00.947456','2014-12-05 09:08:00.947456');
INSERT INTO "productions" VALUES(13,'2014-12-06',1,2,1.3,'2014-12-06 03:44:13.853376','2014-12-06 03:44:13.853376');
INSERT INTO "productions" VALUES(14,'2014-12-06',1,1,2.8,'2014-12-06 10:24:45.430699','2014-12-06 10:24:45.430699');
CREATE TABLE "orderdetails" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "order_id" integer, "product_id" integer, "number" float, "price" float, "discount" float, "created_at" datetime, "updated_at" datetime);
INSERT INTO "orderdetails" VALUES(1,1,2,0.2,45.0,2.0,'2014-11-17 04:19:53.305832','2014-11-17 04:19:53.305832');
INSERT INTO "orderdetails" VALUES(2,1,1,0.2,50.0,0.0,'2014-11-17 04:20:14.925714','2014-11-17 04:20:14.925714');
INSERT INTO "orderdetails" VALUES(3,1,6,0.2,65.0,0.0,'2014-11-17 04:20:38.371234','2014-11-17 04:20:38.371234');
INSERT INTO "orderdetails" VALUES(4,2,1,0.5,50.0,0.0,'2014-11-17 04:21:10.563175','2014-11-17 04:21:10.563175');
INSERT INTO "orderdetails" VALUES(5,2,2,0.5,45.0,0.0,'2014-11-17 04:21:24.651739','2014-11-17 04:21:24.651739');
INSERT INTO "orderdetails" VALUES(6,2,4,0.5,60.0,0.0,'2014-11-17 04:21:42.691335','2014-11-17 04:21:42.691335');
INSERT INTO "orderdetails" VALUES(7,2,5,0.5,65.0,0.0,'2014-11-17 04:21:55.907582','2014-11-17 04:21:55.907582');
INSERT INTO "orderdetails" VALUES(8,3,2,0.5,45.0,4.5,'2014-11-18 06:39:50.779458','2014-11-18 06:39:50.779458');
INSERT INTO "orderdetails" VALUES(9,3,5,0.2,65.0,1.0,'2014-11-18 06:40:10.613560','2014-11-18 06:40:10.613560');
INSERT INTO "orderdetails" VALUES(10,4,2,0.2,50.0,0.0,'2014-11-20 13:17:14.328114','2014-11-20 13:17:14.328114');
INSERT INTO "orderdetails" VALUES(11,4,4,0.2,65.0,0.0,'2014-11-20 13:17:55.860067','2014-11-20 13:17:55.860067');
INSERT INTO "orderdetails" VALUES(12,5,4,0.2,65.0,0.0,'2014-11-21 03:48:58.538890','2014-11-21 03:48:58.538890');
INSERT INTO "orderdetails" VALUES(13,5,6,0.2,70.0,0.0,'2014-11-21 03:49:14.018859','2014-11-21 03:49:14.018859');
INSERT INTO "orderdetails" VALUES(14,6,2,0.2,45.0,0.0,'2014-11-24 12:21:20.960292','2014-11-24 12:21:20.960292');
INSERT INTO "orderdetails" VALUES(15,6,5,0.2,65.0,0.0,'2014-11-24 12:21:36.459045','2014-11-24 12:21:36.459045');
INSERT INTO "orderdetails" VALUES(16,7,1,0.2,55.0,0.0,'2014-11-25 10:00:53.606357','2014-11-25 10:00:53.606357');
INSERT INTO "orderdetails" VALUES(17,7,4,0.2,65.0,0.0,'2014-11-25 10:01:10.958896','2014-11-25 10:01:10.958896');
INSERT INTO "orderdetails" VALUES(18,8,4,0.6,65.0,0.0,'2014-11-28 04:33:04.157469','2014-11-28 04:33:04.157469');
INSERT INTO "orderdetails" VALUES(19,9,1,0.2,50.0,0.0,'2014-11-28 10:48:39.000645','2014-11-28 10:48:39.000645');
INSERT INTO "orderdetails" VALUES(20,9,6,0.2,65.0,0.0,'2014-11-28 10:50:07.458807','2014-11-28 10:50:07.458807');
INSERT INTO "orderdetails" VALUES(21,10,2,0.2,45.0,2.0,'2014-11-28 12:23:09.750823','2014-11-28 12:23:09.750823');
INSERT INTO "orderdetails" VALUES(22,10,6,0.2,65.0,0.0,'2014-11-28 12:23:30.186030','2014-11-28 12:23:30.186030');
INSERT INTO "orderdetails" VALUES(23,11,3,0.2,55.0,0.0,'2014-11-30 12:13:09.580410','2014-11-30 12:13:09.580410');
INSERT INTO "orderdetails" VALUES(24,11,4,0.2,65.0,0.0,'2014-11-30 12:13:24.181216','2014-11-30 12:13:24.181216');
INSERT INTO "orderdetails" VALUES(25,12,2,0.2,50.0,0.0,'2014-12-02 04:37:33.369192','2014-12-02 04:37:33.369192');
INSERT INTO "orderdetails" VALUES(26,13,1,0.2,55.0,0.0,'2014-12-04 10:23:50.376219','2014-12-04 10:23:50.376219');
INSERT INTO "orderdetails" VALUES(27,13,2,0.2,50.0,0.0,'2014-12-04 10:24:00.192912','2014-12-04 10:24:00.192912');
INSERT INTO "orderdetails" VALUES(28,14,2,0.2,50.0,0.0,'2014-12-04 12:34:33.848868','2014-12-04 12:34:33.848868');
INSERT INTO "orderdetails" VALUES(29,14,7,0.2,70.0,0.0,'2014-12-04 12:39:29.717767','2014-12-04 12:39:29.717767');
INSERT INTO "orderdetails" VALUES(30,15,2,0.4,45.0,0.0,'2014-12-05 03:36:47.216826','2014-12-05 03:36:47.216826');
INSERT INTO "orderdetails" VALUES(31,16,2,0.4,45.0,0.0,'2014-12-05 04:01:06.198981','2014-12-05 04:01:06.198981');
INSERT INTO "orderdetails" VALUES(32,17,1,0.2,50.0,0.0,'2014-12-05 04:46:55.947191','2014-12-05 04:46:55.947191');
INSERT INTO "orderdetails" VALUES(33,17,7,0.2,65.0,0.0,'2014-12-05 04:47:04.191537','2014-12-05 04:47:04.191537');
INSERT INTO "orderdetails" VALUES(34,18,1,0.6,55.0,0.0,'2014-12-05 06:33:12.837701','2014-12-05 06:33:12.837701');
INSERT INTO "orderdetails" VALUES(35,18,3,0.4,55.0,0.0,'2014-12-05 06:33:26.024381','2014-12-05 06:33:26.024381');
INSERT INTO "orderdetails" VALUES(36,18,7,0.2,70.0,0.0,'2014-12-05 06:33:38.234935','2014-12-05 06:33:38.234935');
INSERT INTO "orderdetails" VALUES(37,18,5,0.4,70.0,0.0,'2014-12-05 06:33:54.139527','2014-12-05 06:33:54.139527');
INSERT INTO "orderdetails" VALUES(38,19,2,0.2,50.0,0.0,'2014-12-05 09:25:52.742225','2014-12-05 09:25:52.742225');
INSERT INTO "orderdetails" VALUES(39,19,1,0.2,55.0,0.0,'2014-12-05 09:25:59.877985','2014-12-05 09:25:59.877985');
INSERT INTO "orderdetails" VALUES(40,19,6,0.2,70.0,0.0,'2014-12-05 09:26:10.988925','2014-12-05 09:26:10.988925');
INSERT INTO "orderdetails" VALUES(41,19,7,0.2,65.0,0.0,'2014-12-05 09:26:35.298816','2014-12-05 09:26:35.298816');
INSERT INTO "orderdetails" VALUES(42,19,6,0.2,65.0,0.0,'2014-12-05 09:27:00.295246','2014-12-05 09:27:00.295246');
INSERT INTO "orderdetails" VALUES(43,20,5,0.2,70.0,0.0,'2014-12-05 10:58:00.784793','2014-12-05 10:58:00.784793');
INSERT INTO "orderdetails" VALUES(44,20,6,0.2,70.0,0.0,'2014-12-05 11:00:53.374850','2014-12-05 11:00:53.374850');
INSERT INTO "orderdetails" VALUES(47,33,2,0.2,45.0,0.0,'2014-12-06 03:16:46.274542','2014-12-06 03:16:46.274542');
INSERT INTO "orderdetails" VALUES(48,33,1,0.2,50.0,0.0,'2014-12-06 03:16:46.280743','2014-12-06 03:16:46.280743');
INSERT INTO "orderdetails" VALUES(49,33,5,0.2,65.0,0.0,'2014-12-06 03:16:46.286220','2014-12-06 03:16:46.286220');
INSERT INTO "orderdetails" VALUES(50,33,7,0.2,65.0,0.0,'2014-12-06 03:16:46.291212','2014-12-06 03:16:46.291212');
INSERT INTO "orderdetails" VALUES(51,34,5,0.2,70.0,0.0,'2014-12-06 04:07:03.605825','2014-12-06 04:07:03.605825');
INSERT INTO "orderdetails" VALUES(52,34,7,0.2,70.0,0.0,'2014-12-06 04:07:03.610949','2014-12-06 04:07:03.610949');
INSERT INTO "orderdetails" VALUES(53,35,4,0.2,65.0,1.0,'2014-12-06 10:16:36.503902','2014-12-06 10:16:36.503902');
INSERT INTO "orderdetails" VALUES(54,35,5,0.2,70.0,0.0,'2014-12-06 10:16:36.509984','2014-12-06 10:16:36.509984');
INSERT INTO "orderdetails" VALUES(55,35,7,0.2,70.0,0.0,'2014-12-06 10:16:36.514015','2014-12-06 10:16:36.514015');
INSERT INTO "orderdetails" VALUES(56,36,6,0.2,65.0,0.0,'2014-12-06 10:53:03.401158','2014-12-06 10:53:03.401158');
INSERT INTO "orderdetails" VALUES(57,36,1,0.2,50.0,0.0,'2014-12-06 10:53:03.406692','2014-12-06 10:53:03.406692');
INSERT INTO "orderdetails" VALUES(58,37,1,0.4,55.0,0.0,'2014-12-06 10:55:38.997729','2014-12-06 10:55:38.997729');
CREATE TABLE "promotions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "when" date, "what" varchar(255), "sum" float, "number" float, "created_at" datetime, "updated_at" datetime);
INSERT INTO "promotions" VALUES(1,'2014-11-13','宣传单',17.0,100.0,'2014-12-05 02:37:21.569181','2014-12-05 02:37:21.569181');
INSERT INTO "promotions" VALUES(2,'2014-11-16','宣传单',23.0,400.0,'2014-12-05 02:41:55.427345','2014-12-05 02:41:55.427345');
INSERT INTO "promotions" VALUES(3,'2014-12-04','宣传单',58.5,1240.0,'2014-12-05 02:44:21.929316','2014-12-05 02:44:21.929316');
CREATE TABLE "profits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "profit" float, "amount" float, "when" date, "created_at" datetime, "updated_at" datetime);
INSERT INTO "profits" VALUES(1,88.15,140.0,'2014-11-14','2014-12-05 10:39:37.139603','2014-12-05 10:39:37.139603');
INSERT INTO "profits" VALUES(2,17.88,30.0,'2014-11-18','2014-12-05 10:39:37.150140','2014-12-05 10:39:37.150140');
INSERT INTO "profits" VALUES(3,14.64,23.0,'2014-11-20','2014-12-05 10:39:37.156295','2014-12-05 10:39:37.156295');
INSERT INTO "profits" VALUES(4,16.22,27.0,'2014-11-21','2014-12-05 10:39:37.161202','2014-12-05 10:39:37.161202');
INSERT INTO "profits" VALUES(5,13.8,22.0,'2014-11-24','2014-12-05 10:39:37.166598','2014-12-05 10:39:37.166598');
INSERT INTO "profits" VALUES(6,15.02,24.0,'2014-11-25','2014-12-05 10:39:37.170024','2014-12-05 10:39:37.170024');
INSERT INTO "profits" VALUES(7,49.93,82.0,'2014-11-28','2014-12-05 10:39:37.177539','2014-12-05 10:39:37.177539');
INSERT INTO "profits" VALUES(8,14.36,24.0,'2014-11-30','2014-12-05 10:39:37.183079','2014-12-05 10:39:37.183079');
INSERT INTO "profits" VALUES(9,7.1,10.0,'2014-12-02','2014-12-05 10:39:37.189169','2014-12-05 10:39:37.189169');
INSERT INTO "profits" VALUES(10,31.34,45.0,'2014-12-04','2014-12-05 10:39:37.194914','2014-12-05 10:39:37.194914');
INSERT INTO "profits" VALUES(11,159.98,245.0,'2014-12-05','2014-12-05 10:39:37.202698','2014-12-05 15:26:44.256754');
INSERT INTO "profits" VALUES(12,101.21,158.0,'2014-12-06','2014-12-06 03:16:46.317638','2014-12-06 10:55:39.017787');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('materials',38);
INSERT INTO "sqlite_sequence" VALUES('customers',23);
INSERT INTO "sqlite_sequence" VALUES('orders',37);
INSERT INTO "sqlite_sequence" VALUES('products',7);
INSERT INTO "sqlite_sequence" VALUES('workers',1);
INSERT INTO "sqlite_sequence" VALUES('productions',14);
INSERT INTO "sqlite_sequence" VALUES('orderdetails',58);
INSERT INTO "sqlite_sequence" VALUES('promotions',3);
INSERT INTO "sqlite_sequence" VALUES('profits',12);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE INDEX "index_orders_on_who_id" ON "orders" ("who_id");
CREATE INDEX "index_productions_on_who_id" ON "productions" ("who_id");
CREATE INDEX "index_productions_on_what_id" ON "productions" ("what_id");
CREATE INDEX "index_orderdetails_on_order_id" ON "orderdetails" ("order_id");
CREATE INDEX "index_orderdetails_on_product_id" ON "orderdetails" ("product_id");
COMMIT;