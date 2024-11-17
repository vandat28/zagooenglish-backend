CREATE DATABASE  IF NOT EXISTS `zagoo_english` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `zagoo_english`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: zagoo_english
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fullname` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('thanhvy','$2b$10$KKniCY9l.EWdgLhsHosUNeHL1.JFrPI4PeXOqW01Ofo1khQ8aCohm',NULL,'Admin',NULL,NULL,NULL,1),('thanhvy21121992@gmail.com','','Vy Thanh','User','https://lh3.googleusercontent.com/a/ACg8ocK7IJoa53bJvdP91JTd94xB-fremQP0eh14BsN1x_0I7i8bVxU=s96-c',NULL,NULL,1),('vandat123','$2b$10$5/Zi7WHha6sHaKKWTAWQD.ttTQ62SSVrVKafMoTNU8YHcz4.qGJTu',NULL,'Admin',NULL,NULL,NULL,1),('vandat28','$2b$10$vrrcW.Ef0AvomMLp7Xs7RuoI/WJXVtKmYwMk7EpfTzHrlChe3JEQC','Tiến Đạt','Admin',NULL,NULL,NULL,1),('vandat2801@gmail.com','','Văn Nguyễn Tiến Đạt','User','https://lh3.googleusercontent.com/a/ACg8ocK4pHeGEX6AHsBUhFCz4kDKMMD45enS18w4nUJbdTpRAxDO6Rg=s96-c',NULL,NULL,1),('yasoucombat@gmail.com','','Đạt Văn','User','https://lh3.googleusercontent.com/a/ACg8ocLJL7lvWso5OgpYnLloVxJMyT7PbdhcWqqo1BWdDUFXI0Pth9qV=s96-c',NULL,NULL,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `audioSrc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `isTrue` tinyint(4) DEFAULT NULL,
  `questionId` int(11) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_idx` (`questionId`),
  CONSTRAINT `fk_question` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (5,'Hello',NULL,1,1,'hello'),(6,'Good bye',NULL,0,1,'goodbye'),(7,'Thank you',NULL,0,1,'thank_you'),(8,'Sorry',NULL,0,1,'sorry'),(9,'Good afternoon',NULL,0,2,'good_afternoon'),(10,'Good night',NULL,0,2,'good_night'),(11,'Good morning',NULL,1,2,'good_morning'),(12,'Good evening',NULL,0,2,'good_evening'),(13,'I',NULL,1,3,NULL),(14,'student',NULL,1,3,NULL),(15,'am',NULL,1,3,NULL),(16,'is',NULL,0,3,NULL),(17,'a',NULL,1,3,NULL),(18,'are',NULL,0,3,NULL),(19,'Good bye',NULL,0,5,NULL),(20,'Hello',NULL,1,5,NULL),(21,'Thank you',NULL,0,5,NULL),(22,'Sorry',NULL,0,5,NULL),(62,'Chicken','d1206ee2-9443-420a-8ca2-0fc533da70a8-How_are_you.mp3',1,53,'d2756236-d11f-4d7c-9e8a-14795020ea66-appearance.webp'),(63,'Cat','348231fc-2711-4cd2-8507-535db9e1adf4-Where_are_you_now_.mp3',0,53,'26d7a8ff-d1b8-4f68-889b-b63292e27014-feeling_and_personality.webp'),(64,'Dog','9084a484-7e28-43b2-8a17-20a472278bd1-How_are_you.mp3',0,53,'233791ad-f73c-4067-82b5-c35b5f33dafb-family.webp'),(65,'Owl','9fd1d1b7-9e7b-4872-8d22-81b653e2b1f9-Where_are_you_now_.mp3',0,53,'dc27913b-aa33-4a6a-a5a0-31687e679f33-traffic.webp'),(66,'Chicken',NULL,1,54,NULL),(67,'is',NULL,1,54,NULL),(68,'run',NULL,0,54,NULL),(69,'running',NULL,1,54,NULL),(70,'How are you?',NULL,1,60,NULL),(71,'2',NULL,0,60,NULL),(72,'3',NULL,0,60,NULL),(73,'4',NULL,0,60,NULL),(74,'1','43e36205-6b1c-449e-b076-08a8f7abbb4a-Where_are_you_now_.mp3',1,61,'b816be7c-3bba-4c63-aa8f-27d12d65b7cb-hobby.webp'),(75,'2','1a5689b6-5620-4e9b-bbbf-fc66de68881e-Where_are_you_now_.mp3',0,61,'d2206444-09cd-4545-b416-1f47fa1aa049-appearance.webp'),(76,'3','5ba9868f-d20b-4a02-8f0e-016fb78bbb2a-Where_are_you_now_.mp3',0,61,'f3efaf7e-007d-4c71-9661-6a77917fb08e-hobby.webp'),(77,'4','75cf37a6-5de9-49c2-9b8b-6a3958111a6e-Where_are_you_now_.mp3',0,61,'0b2256d3-f616-4a6b-808f-7bcf2666fc45-month.webp'),(78,'Where you now?',NULL,0,62,NULL),(79,'Where are you now?',NULL,1,62,NULL),(80,'Where your now?',NULL,0,62,NULL),(81,'Where are your now?',NULL,0,62,NULL),(82,'Three','aa61ff52-d181-489e-89e1-15c2ebabd7d5-How_are_you.mp3',1,64,'95fa41a8-ba2d-42fb-9759-2f7daa22dd70-sport.webp'),(83,'Two','facc842f-25da-48dd-b94a-6f8bad9e1071-How_are_you.mp3',0,64,'18e3689b-a8d7-46df-ae60-484e9de0cd7e-greeting.webp'),(84,'One','73f7fac6-8ed2-4602-ad7a-3ad6f225e591-How_are_you.mp3',0,64,'4d9dd1d5-b641-4e08-9ec4-c8196286c479-appearance.webp'),(85,'Zero','32ecfa9a-5244-48bb-92c1-2912b3fc5413-How_are_you.mp3',0,64,'89385ead-4321-4b6b-b99e-7b9829d4b51c-daily_routine.webp'),(86,'One','2c4d1162-344b-4649-9be9-98c760681607-Where_are_you_now_.mp3',1,65,NULL),(87,'Two','b096b39f-edb9-479b-9116-cd9a82316613-Where_are_you_now_.mp3',1,65,NULL),(88,'Four','7ddd9c05-44ab-4b9c-9c60-cefa92cad68c-Where_are_you_now_.mp3',1,65,NULL),(89,'Three','fb81867a-818c-4444-9e0d-c8522c26b3dc-Where_are_you_now_.mp3',1,65,NULL),(90,'1',NULL,0,66,NULL),(91,'2',NULL,0,66,NULL),(92,'3',NULL,0,66,NULL),(93,'4',NULL,0,66,NULL),(94,'5',NULL,1,66,NULL),(95,'Three',NULL,1,66,NULL),(96,'7',NULL,1,66,NULL),(97,'8',NULL,0,66,NULL),(98,'2',NULL,0,67,NULL),(99,'3',NULL,0,67,NULL),(100,'4',NULL,0,67,NULL),(101,'5',NULL,1,67,NULL),(102,'Dog','0d22cb57-1491-4ee8-8672-5a1c69c51ab1-Where_are_you_now_.mp3',1,68,'ed3e3a1a-c990-4ead-91a1-512825fc77ae-animal.webp'),(103,'Cat','3a275302-3ac5-450d-afb6-68697072ac07-How_are_you.mp3',0,68,'eae653ff-8804-425c-acea-89092118b091-feeling_and_personality.webp'),(104,'Bird','4cee6bd3-6a1f-4337-971a-2175434d93b4-Where_are_you_now_.mp3',0,68,'a784c6a3-dd06-4d6e-b5ec-e77a23e1205b-month.webp'),(105,'Duck','81a6f6da-e0fa-4015-a2a8-96bbaf3ae007-Where_are_you_now_.mp3',0,68,'ed9cb210-fd21-4fb8-bbfc-d06c409deb94-housework.webp'),(106,'1',NULL,1,69,NULL),(107,'2',NULL,0,69,NULL),(108,'3',NULL,0,69,NULL),(109,'4',NULL,0,69,NULL),(110,'1','81dfbfd4-c808-4e55-a39c-c4e2488e3c30-Where_are_you_now_.mp3',1,71,NULL),(111,'1','f99cfd8e-7e3d-4e85-b3f2-5def317afc3e-How_are_you.mp3',0,72,'18860000-5ecb-4b18-9477-37e20871e34d-housework.webp'),(112,'1','1cce3611-ea90-4db3-99f1-7f5394f7c25d-Where_are_you_now_.mp3',0,72,'95c375a0-897c-408d-8e2e-1d132c94dd6c-daily_routine.webp'),(113,'1','e0dc1095-12d3-424a-baca-fe78bdc88e57-How_are_you.mp3',1,72,'acce0ae1-a88d-4c9a-b54e-731162833ab4-month.webp'),(114,'1','26f52b2a-3b31-4fa5-9093-5adc497c64a0-How_are_you.mp3',0,72,'eb1ea63c-bbd7-4cb5-ae72-755e302d1e3a-hobby.webp'),(115,'Bạn có khỏe không ?','450830bf-6834-4c2d-ac23-2c8b0b2d106e-How_are_you.mp3',1,73,'01fd9d21-8ef2-484c-a930-8a32b50870b8-appearance.webp'),(116,'Bạn có khỏe không 1?','68c079d9-ef24-441b-9aaf-17b3e7569785-How_are_you.mp3',0,73,'26642721-788a-46e8-92b3-ba2ad9712483-housework.webp'),(117,'Bạn có khỏe không 2?','79562a0b-c4d9-4c71-919f-6c2e13421d4c-Where_are_you_now_.mp3',0,73,'96a3beee-c47d-4812-871a-14e30a12af8a-family.webp'),(118,'Bạn có khỏe không 3?','331661ef-70ab-418b-a4f8-f2d71632f4c2-How_are_you.mp3',0,73,'cfe817f6-f756-4bf4-a421-24b1c858bb77-hobby.webp'),(119,'Bạn có khỏe không',NULL,1,74,NULL),(120,'Bạn tên gì',NULL,0,74,NULL),(121,'Bạn làm nghề gì',NULL,0,74,NULL),(122,'Bạn ở đâu',NULL,0,74,NULL),(123,'How','ab7c71ee-abb1-41b2-94d3-f5d776ca64ff-How_are_you.mp3',1,76,NULL),(124,'are','30e42116-04f8-412a-8efd-25d17c74b64c-Where_are_you_now_.mp3',1,76,NULL),(125,'you','1b19b819-92d5-4054-8063-10f0c17b88ac-Where_are_you_now_.mp3',1,76,NULL),(126,'now','b0bef62b-d7dc-44ca-b316-8475191b7b21-How_are_you.mp3',0,76,NULL),(127,'is','5c297765-da29-42b7-a39e-dfe41275809c-Where_are_you_now_.mp3',0,76,NULL);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `img` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `status` int(11) DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`username`),
  CONSTRAINT `fk_user` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (9,'Tại sao Học Tiếng Anh Lại Quan Trọng Hơn Bao Giờ Hết?','Tiếng Anh không chỉ là ngôn ngữ quốc tế mà còn là chìa khóa mở ra cơ hội trong học tập và công việc. Cùng khám phá lý do tại sao việc học tiếng Anh ngày nay trở nên quan trọng hơn bao giờ hết.','<p>Trong một thế giới ng&agrave;y c&agrave;ng hội nhập, tiếng Anh đ&atilde; trở th&agrave;nh ng&ocirc;n ngữ cầu nối, đ&oacute;ng vai tr&ograve; quan trọng trong nhiều lĩnh vực từ gi&aacute;o dục, thương mại đến c&ocirc;ng nghệ. Dưới đ&acirc;y l&agrave; những l&yacute; do bạn n&ecirc;n đầu tư thời gian v&agrave; c&ocirc;ng sức để học tiếng Anh ngay h&ocirc;m nay.</p>\n<p><strong>1. Tiếng Anh l&agrave; ng&ocirc;n ngữ to&agrave;n cầu</strong></p>\n<p>Với hơn 1,5 tỷ người sử dụng tiếng Anh như ng&ocirc;n ngữ ch&iacute;nh hoặc phụ, tiếng Anh kh&ocirc;ng c&ograve;n chỉ l&agrave; ng&ocirc;n ngữ của người bản xứ. N&oacute; trở th&agrave;nh c&ocirc;ng cụ giao tiếp chung tr&ecirc;n to&agrave;n thế giới, từ việc giao tiếp trong kinh doanh, trao đổi văn h&oacute;a đến hợp t&aacute;c quốc tế. Khi th&agrave;nh thạo tiếng Anh, bạn c&oacute; thể tự tin giao tiếp với mọi người ở mọi nơi.</p>\n<p><strong>2. Tiếng Anh mở rộng cơ hội nghề nghiệp</strong></p>\n<p>Ng&agrave;y nay, nhiều c&ocirc;ng ty đa quốc gia y&ecirc;u cầu nh&acirc;n vi&ecirc;n của họ phải th&agrave;nh thạo tiếng Anh, đặc biệt l&agrave; trong c&aacute;c ng&agrave;nh như c&ocirc;ng nghệ, tiếp thị, t&agrave;i ch&iacute;nh v&agrave; du lịch. Nếu bạn biết tiếng Anh, cơ hội nghề nghiệp sẽ rộng mở hơn, kh&ocirc;ng chỉ trong nước m&agrave; c&ograve;n ở thị trường quốc tế.</p>\n<p><strong>3. Truy cập kho kiến thức v&ocirc; tận</strong></p>\n<p>Phần lớn nội dung tr&ecirc;n Internet v&agrave; c&aacute;c t&agrave;i liệu khoa học, c&ocirc;ng nghệ đều được viết bằng tiếng Anh. Khi học tiếng Anh, bạn c&oacute; thể dễ d&agrave;ng tiếp cận với nguồn tri thức khổng lồ, bao gồm c&aacute;c kh&oacute;a học online, s&aacute;ch, b&aacute;o, v&agrave; c&aacute;c nghi&ecirc;n cứu mới nhất.</p>\n<p><strong>4. Ph&aacute;t triển kỹ năng giao tiếp v&agrave; tự tin hơn</strong></p>\n<p>Việc học tiếng Anh kh&ocirc;ng chỉ gi&uacute;p bạn nắm vững ngữ ph&aacute;p v&agrave; từ vựng, m&agrave; c&ograve;n cải thiện kỹ năng giao tiếp. Khi bạn c&oacute; thể giao tiếp lưu lo&aacute;t bằng một ng&ocirc;n ngữ thứ hai, bạn sẽ tự tin hơn trong cả đời sống c&aacute; nh&acirc;n lẫn c&ocirc;ng việc.</p>\n<p><strong>5. Tiếng Anh gi&uacute;p kh&aacute;m ph&aacute; văn h&oacute;a mới</strong></p>\n<p>Tiếng Anh l&agrave; ng&ocirc;n ngữ ch&iacute;nh của nhiều quốc gia, bao gồm Mỹ, Anh, &Uacute;c, v&agrave; Canada. Khi học tiếng Anh, bạn kh&ocirc;ng chỉ học một ng&ocirc;n ngữ mới m&agrave; c&ograve;n mở c&aacute;nh cửa đến với c&aacute;c nền văn h&oacute;a, lối sống, v&agrave; truyền thống đa dạng.</p>','1728575045308.jpg',1,'vandat28'),(11,'Học Tiếng Anh Hiệu Quả: Bí Quyết Cho Người Mới Bắt Đầu','Học tiếng Anh có thể trở thành một hành trình thú vị nếu bạn biết cách tiếp cận đúng. Dưới đây là những bí quyết giúp người mới bắt đầu học tiếng Anh dễ dàng hơn.','<p>Việc học tiếng Anh c&oacute; thể khiến nhiều người cảm thấy kh&oacute; khăn l&uacute;c đầu, nhưng với phương ph&aacute;p v&agrave; sự ki&ecirc;n nhẫn, bạn ho&agrave;n to&agrave;n c&oacute; thể chinh phục ng&ocirc;n ngữ n&agrave;y. Dưới đ&acirc;y l&agrave; những b&iacute; quyết hữu &iacute;ch để bạn bắt đầu h&agrave;nh tr&igrave;nh học tiếng Anh một c&aacute;ch hiệu quả v&agrave; th&uacute; vị.</p>\r\n<p><strong>1. Đặt mục ti&ecirc;u cụ thể v&agrave; r&otilde; r&agrave;ng</strong></p>\r\n<p>Một trong những bước quan trọng khi bắt đầu học tiếng Anh l&agrave; x&aacute;c định r&otilde; mục ti&ecirc;u của bạn. Bạn học tiếng Anh để du lịch, c&ocirc;ng việc hay n&acirc;ng cao kỹ năng giao tiếp? Khi c&oacute; mục ti&ecirc;u r&otilde; r&agrave;ng, bạn sẽ c&oacute; động lực để tiếp tục học v&agrave; tiến bộ theo thời gian.</p>\r\n<p><strong>2. Tạo th&oacute;i quen học tiếng Anh h&agrave;ng ng&agrave;y</strong></p>\r\n<p>Th&agrave;nh c&ocirc;ng trong việc học ng&ocirc;n ngữ kh&ocirc;ng đến từ việc học một lần m&agrave; từ việc lặp đi lặp lại. Bạn h&atilde;y d&agrave;nh &iacute;t nhất 20-30 ph&uacute;t mỗi ng&agrave;y để học tiếng Anh. Điều n&agrave;y c&oacute; thể l&agrave; nghe podcast, đọc b&aacute;o tiếng Anh, hoặc thậm ch&iacute; chỉ đơn giản l&agrave; &ocirc;n lại từ vựng. Sự ki&ecirc;n tr&igrave; sẽ gi&uacute;p bạn tiến bộ mỗi ng&agrave;y.</p>\r\n<p><strong>3. Kết hợp học từ nhiều nguồn</strong></p>\r\n<p>Học tiếng Anh kh&ocirc;ng chỉ giới hạn ở s&aacute;ch gi&aacute;o khoa. Bạn c&oacute; thể kết hợp học từ c&aacute;c nguồn kh&aacute;c nhau như xem phim, nghe nhạc, hoặc tham gia c&aacute;c lớp học online. Xem phim c&oacute; phụ đề tiếng Anh gi&uacute;p bạn nắm bắt ngữ điệu v&agrave; từ vựng h&agrave;ng ng&agrave;y, c&ograve;n &acirc;m nhạc gi&uacute;p bạn nhớ từ vựng một c&aacute;ch tự nhi&ecirc;n.</p>\r\n<p><strong>4. Thực h&agrave;nh n&oacute;i v&agrave; nghe thường xuy&ecirc;n</strong></p>\r\n<p>Nghe v&agrave; n&oacute;i l&agrave; hai kỹ năng quan trọng nhất trong việc học ng&ocirc;n ngữ. Đừng ngại thử giao tiếp bằng tiếng Anh, d&ugrave; bạn chỉ mới học v&agrave;i từ. Thực h&agrave;nh n&oacute;i với bạn b&egrave;, đồng nghiệp hoặc tham gia c&aacute;c nh&oacute;m trao đổi tiếng Anh trực tuyến để n&acirc;ng cao kỹ năng giao tiếp.</p>\r\n<p><strong>5. Kh&ocirc;ng sợ mắc lỗi</strong></p>\r\n<p>Mắc lỗi l&agrave; một phần kh&ocirc;ng thể thiếu trong qu&aacute; tr&igrave;nh học ng&ocirc;n ngữ. Đừng ngại khi n&oacute;i sai hoặc viết chưa chuẩn. Quan trọng l&agrave; bạn học từ những lỗi đ&oacute; v&agrave; cải thiện mỗi ng&agrave;y. H&atilde;y nhớ rằng, ai cũng bắt đầu từ con số kh&ocirc;ng.</p>\r\n<p><strong>6. Sử dụng ứng dụng hỗ trợ học tiếng Anh</strong></p>\r\n<p>Hiện nay, c&oacute; rất nhiều ứng dụng gi&uacute;p học tiếng Anh hiệu quả như Duolingo, Memrise, hay Anki. Những ứng dụng n&agrave;y gi&uacute;p bạn &ocirc;n tập từ vựng, ngữ ph&aacute;p v&agrave; kỹ năng nghe một c&aacute;ch th&uacute; vị v&agrave; tiện lợi mọi l&uacute;c, mọi nơi.</p>','learn-english-effectively.jpg',1,'vandat28'),(21,'Những Lợi Ích Bất Ngờ Khi Học Tiếng Anh Mỗi Ngày','Học tiếng Anh không chỉ mang lại những cơ hội nghề nghiệp mà còn giúp bạn phát triển cá nhân, mở rộng tầm nhìn. Hãy cùng khám phá những lợi ích bất ngờ từ việc học tiếng Anh mỗi ngày.','<p>Tiếng Anh từ l&acirc;u đ&atilde; trở th&agrave;nh một ng&ocirc;n ngữ to&agrave;n cầu, v&agrave; việc học ng&ocirc;n ngữ n&agrave;y kh&ocirc;ng chỉ dừng lại ở những lợi &iacute;ch dễ thấy như tăng cơ hội việc l&agrave;m hay du học. Thực tế, học tiếng Anh mỗi ng&agrave;y c&ograve;n mang đến nhiều lợi &iacute;ch kh&aacute;c m&agrave; bạn c&oacute; thể chưa từng nghĩ đến.</p>\r\n<p><strong>1. Cải thiện khả năng tư duy v&agrave; s&aacute;ng tạo</strong></p>\r\n<p>Việc học một ng&ocirc;n ngữ mới kh&ocirc;ng chỉ gi&uacute;p bạn mở rộng vốn từ vựng, m&agrave; c&ograve;n th&uacute;c đẩy n&atilde;o bộ hoạt động linh hoạt hơn. Nhiều nghi&ecirc;n cứu đ&atilde; chỉ ra rằng, việc học ng&ocirc;n ngữ gi&uacute;p tăng cường khả năng tư duy logic, ph&acirc;n t&iacute;ch v&agrave; giải quyết vấn đề. Khi học tiếng Anh, bạn sẽ phải tiếp cận nhiều phương ph&aacute;p suy nghĩ mới mẻ, từ đ&oacute; k&iacute;ch th&iacute;ch sự s&aacute;ng tạo trong c&aacute;ch giao tiếp v&agrave; tư duy.</p>\r\n<p><strong>2. Tăng cường sự tự tin</strong></p>\r\n<p>Mỗi khi bạn giao tiếp th&agrave;nh c&ocirc;ng bằng tiếng Anh, d&ugrave; chỉ l&agrave; một cuộc tr&ograve; chuyện ngắn, sự tự tin của bạn sẽ tăng l&ecirc;n đ&aacute;ng kể. Việc học v&agrave; sử dụng ng&ocirc;n ngữ mới gi&uacute;p bạn vượt qua nỗi sợ mắc lỗi v&agrave; dần dần ph&aacute;t triển khả năng tự tin khi giao tiếp trong m&ocirc;i trường quốc tế. Đ&acirc;y l&agrave; một kỹ năng v&ocirc; c&ugrave;ng quan trọng, kh&ocirc;ng chỉ trong học tập m&agrave; c&ograve;n trong cuộc sống v&agrave; c&ocirc;ng việc.</p>\r\n<p><strong>3. Mở rộng tầm nh&igrave;n văn h&oacute;a</strong></p>\r\n<p>Tiếng Anh l&agrave; ng&ocirc;n ngữ ch&iacute;nh thức của nhiều quốc gia tr&ecirc;n thế giới, v&agrave; việc học tiếng Anh đồng nghĩa với việc bạn đang tiếp x&uacute;c với những nền văn h&oacute;a đa dạng. Bạn sẽ dễ d&agrave;ng kh&aacute;m ph&aacute; v&agrave; hiểu s&acirc;u hơn về văn h&oacute;a Anh, Mỹ, &Uacute;c, v&agrave; c&aacute;c quốc gia kh&aacute;c. Việc hiểu r&otilde; về c&aacute;c gi&aacute; trị, tập tục v&agrave; lối sống của người n&oacute;i tiếng Anh sẽ gi&uacute;p bạn c&oacute; c&aacute;i nh&igrave;n rộng mở v&agrave; bao dung hơn về thế giới.</p>\r\n<p><strong>4. Cơ hội kết nối v&agrave; giao lưu quốc tế</strong></p>\r\n<p>Khi bạn biết tiếng Anh, thế giới dường như trở n&ecirc;n nhỏ b&eacute; hơn. Bạn c&oacute; thể tham gia v&agrave;o c&aacute;c diễn đ&agrave;n, nh&oacute;m trao đổi quốc tế, hoặc kết bạn với những người đến từ khắp nơi tr&ecirc;n thế giới. Tiếng Anh gi&uacute;p bạn x&acirc;y dựng mối quan hệ mới, học hỏi từ nhiều nền văn h&oacute;a v&agrave; c&oacute; th&ecirc;m cơ hội giao lưu với cộng đồng quốc tế.</p>','1728575181478.jpg',1,'vandat28'),(22,'Học Tiếng Anh trực tuyến: 9 lợi ích vượt trội bạn nên biết','Bạn yêu thích tiếng Anh? nhưng việc cuốn theo cuộc sống hối hả đã là một công việc bận rộn. Làm sao bạn có thể phân bố thêm thời gian để đến một trung tâm ngoại ngữ hay ngồi vào các lớp học? Đó chính là lý do khiến các trang web luyện tiếng Anh ra đời hàng loạt để đáp ứng nhu cầu học tập của bạn. Ngoài điều này, vẫn còn rất nhiều yếu tố khác khiến cho các trang web học tiếng Anh tồn tại lâu dài. Hãy cùng khám phá những lý do còn lại là gì nhé!','<h2><strong>1. Mở ra nhiều cơ hội</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>Tiếng Anh l&agrave; một ng&ocirc;n ngữ ch&iacute;nh thức của Li&ecirc;n hợp quốc (LHQ) v&agrave; Li&ecirc;n minh ch&acirc;u &Acirc;u (EU), h&agrave;ng tỷ người đang n&oacute;i tiếng Anh tr&ecirc;n to&agrave;n thế giới v&agrave; n&oacute; cũng l&agrave; ng&ocirc;n ngữ phổ biến nhất tr&ecirc;n internet, v&igrave; thế học tiếng Anh thật sự l&agrave; một điều cần thiết ng&agrave;y nay. Hơn nữa, tiếng Anh được coi l&agrave; ng&ocirc;n ngữ kinh doanh - bạn phải th&agrave;nh thạo n&oacute; nếu muốn c&oacute; được nhiều hợp đồng hơn v&agrave; cải thiện những cơ hội trong m&ocirc;i trường c&ocirc;ng sở.</p>\r\n<p>&nbsp;</p>\r\n<p>Một b&agrave;i b&aacute;o của Kyung Lah tr&ecirc;n đầu trang CNN tuy&ecirc;n bố rằng: c&aacute;c c&ocirc;ng ty lớn đang ng&agrave;y c&agrave;ng xem việc th&ocirc;ng thạo tiếng Anh l&agrave; một y&ecirc;u cầu cần thiết đối với lực lượng lao động của họ. To&agrave;n cầu h&oacute;a ng&agrave;y c&agrave;ng diễn ra mạnh mẽ, c&aacute;c c&ocirc;ng ty c&agrave;ng muốn li&ecirc;n kết v&agrave; trao đổi với nhau nhiều hơn v&agrave; việc th&ocirc;ng thạo tiếng Anh sẽ mang lại nhiều lợi thế cho bạn. Đặc biệt l&agrave; gi&uacute;p bạn trở th&agrave;nh một phần của qu&aacute; tr&igrave;nh to&agrave;n cầu h&oacute;a ngo&agrave;i kia.</p>\r\n<p>&nbsp;</p>\r\n<p>Do đ&oacute;, việc bạn y&ecirc;u th&iacute;ch tiếng Anh vẫn l&agrave; chưa đủ, bạn cần phải học tiếng Anh như một nhu cầu thiết yếu trong cuộc sống. Nhưng nếu bạn l&agrave; người bận rộn, trừ khi bạn sẵn s&agrave;ng hy sinh giấc ngủ v&agrave; ph&aacute; vỡ cuộc sống đang c&acirc;n bằng của bạn th&igrave; mới \'h&ograve;a m&igrave;nh\' v&agrave;o tiếng Anh được. Tuy nhi&ecirc;n sự phổ biến của internet ng&agrave;y nay đ&atilde; cung cấp một giải ph&aacute;p v&ocirc; c&ugrave;ng hiệu qủa để bạn c&oacute; thể vừa duy tr&igrave; c&acirc;n bằng cuộc sống v&agrave; c&ocirc;ng việc, nhưng cũng vừa học th&ecirc;m được một ng&ocirc;n ngữ mới.</p>\r\n<p>&nbsp;</p>\r\n<h2><strong>2. Tự do về giờ giấc</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>H&atilde;y tưởng tượng việc bạn c&oacute; thể th&agrave;nh thạo tiếng Anh trong một m&ocirc;i trường học tập tự do, nghĩa l&agrave; bạn tự l&ecirc;n lịch v&agrave; điều chỉnh thời gian học để ph&ugrave; hợp với bản th&acirc;n - nghe c&oacute; vẻ l&yacute; tưởng kh&ocirc;ng n&agrave;o? Thật vậy! việc tham gia&nbsp;kh&oacute;a học tiếng Anh trực tuyến&nbsp;cho ph&eacute;p bạn điều chỉnh lịch học ph&ugrave; hợp với c&aacute;c lịch tr&igrave;nh bận rộn kh&aacute;c trong cuộc sống h&agrave;ng ng&agrave;y của bạn.</p>\r\n<p>&nbsp;</p>\r\n<h2><strong>3. Chi ph&iacute; hiệu quả</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>Khi học trực tuyến, bạn sẽ tiết kiệm được một khoản chi ph&iacute; kh&ocirc;ng hề nhỏ, c&oacute; khi l&ecirc;n đến h&agrave;ng trăm đ&ocirc; la, nhất l&agrave; những khoản ph&iacute; đầu tư cho c&aacute;c trang thiết bị lớp học hoặc kh&ocirc;ng gian học nếu như bạn học tại trung t&acirc;m tiếng Anh. Tất cả những g&igrave; bạn cần chỉ l&agrave; phần mềm hoặc trang web học tiếng Anh ph&ugrave; hợp để nhận t&agrave;i liệu học tập m&agrave; th&ocirc;i. DinoEnglish cung cấp chương tr&igrave;nh học tiếng Anh ho&agrave;n to&agrave;n miễn ph&iacute; ph&ugrave; hợp với mọi lứa tuổi v&agrave; tr&igrave;nh độ. Với nhiều tr&ograve; chơi tiếng Anh v&agrave; b&agrave;i học th&uacute; vị, DinoEnglish sẽ gi&uacute;p bạn ho&agrave;n thiện 4 kỹ năng<strong>:</strong> <strong>nghe,</strong> <strong>n&oacute;i,</strong> <strong>đọc,</strong> <strong>viết.</strong></p>\r\n<p>&nbsp;</p>\r\n<h2><strong>4. Tự học</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>Hầu hết những người học tiếng Anh như ng&ocirc;n ngữ thứ hai c&oacute; lẽ đều đ&atilde; trải qua c&aacute;c lớp học bắt buộc. Bạn bị buộc phải ngồi trong một lớp học, lặp đi lặp lại c&aacute;c từ vựng v&agrave; cố gắng ghi nhớ ch&uacute;ng. Nếu bạn học k&eacute;m hơn so với bạn b&egrave; kh&aacute;c v&igrave; bất kỳ l&yacute; do g&igrave;, bạn buộc phải t&igrave;m một gia sư ri&ecirc;ng hoặc học tập chăm chỉ hơn. Sau nhiều năm học miệt m&agrave;i, cuối c&ugrave;ng bạn đ&atilde; kết th&uacute;c chương tr&igrave;nh học v&agrave; bạn cũng ngừng lu&ocirc;n việc thực h&agrave;nh tiếng Anh. Đ&uacute;ng như dự đo&aacute;n, tr&igrave;nh độ tiếng Anh của bạn trở n&ecirc;n tệ hại. Để cải thiện tiếng Anh phục vụ cho kinh doanh hoặc mục đ&iacute;ch c&aacute; nh&acirc;n, bạn cần phải l&agrave;m g&igrave;? Bạn c&oacute; muốn quay trở lại hệ thống học tập m&agrave; bạn từng ch&aacute;n gh&eacute;t kh&ocirc;ng?</p>\r\n<p>&nbsp;</p>\r\n<p>Nếu bạn nằm trong t&igrave;nh huống tr&ecirc;n, bạn c&oacute; thể sẽ cảm thấy nhẹ nh&otilde;m khi biết rằng c&aacute;c kh&oacute;a học trực tuyến bằng tiếng Anh sẽ loại bỏ &aacute;p lực phải theo kịp c&aacute;c học vi&ecirc;n kh&aacute;c. Bạn ho&agrave;n to&agrave;n c&oacute; thể kiểm so&aacute;t được tiến độ của bản th&acirc;n. Nếu b&agrave;i học qu&aacute; dễ với bạn? Chỉ đơn giản l&agrave; ho&agrave;n th&agrave;nh ch&uacute;ng v&agrave; chuyển sang giai đoạn tiếp theo. Tương tự, nếu c&aacute;c kh&aacute;i niệm trở n&ecirc;n trừu tượng v&agrave; phức tạp, bạn c&oacute; thể d&agrave;nh th&ecirc;m thời gian để học ch&uacute;ng kỹ c&agrave;ng hơn.</p>\r\n<p>&nbsp;</p>\r\n<h2><strong>5. Việc học song h&agrave;nh với cuộc sống</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>Bất kể bạn l&agrave; một sinh vi&ecirc;n, một người đ&atilde; đi l&agrave;m hay một bậc phụ huynh đang muốn cải thiện vốn tiếng Anh của m&igrave;nh. Chỉ cần c&oacute; kết nối internet l&agrave; bạn c&oacute; thể vừa học vừa l&agrave;m việc hay vừa học vừa đi nghỉ m&aacute;t với gia đ&igrave;nh c&ugrave;ng một l&uacute;c. Đ&acirc;y l&agrave; ưu điểm m&agrave; chỉ c&oacute; ở c&aacute;c lớp tiếng Anh trực tuyến mới c&oacute; thể mang lại cho bạn.</p>\r\n<p>&nbsp;</p>\r\n<h2><strong>6. Thăng tiến trong nghề nghiệp</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>Một cuộc khảo s&aacute;t gần đ&acirc;y cho thấy 45% người học online được tăng lương, trong khi 44% c&ograve;n lại chỉ biết \'dậm ch&acirc;n tại chỗ\' trong sự nghiệp của họ. Học tiếng Anh trực tuyến kh&ocirc;ng chỉ gi&uacute;p c&aacute;c doanh nh&acirc;n v&agrave; c&aacute;c chuy&ecirc;n gia c&oacute; được kỹ năng v&agrave; kinh nghiệm cần thiết m&agrave; c&ograve;n gi&uacute;p họ thăng tiến trong sự nghiệp.</p>\r\n<p>&nbsp;</p>\r\n<p>Một kh&oacute;a học được soạn thảo cẩn thận với gia sư v&agrave; nguồn t&agrave;i liệu ph&ugrave; hợp c&oacute; thể gi&uacute;p cho việc học trực tuyến trở n&ecirc;n dễ d&agrave;ng hơn rất nhiều. Ho&agrave;n th&agrave;nh một kh&oacute;a học c&oacute; thể gi&uacute;p bạn đọc hiểu một số văn bản tiếng Anh quan trọng cũng như gi&agrave;nh được cảm t&igrave;nh từ một kh&aacute;ch h&agrave;ng tiềm năng, v.v...</p>\r\n<p>&nbsp;</p>\r\n<h2><strong>7. Khả năng tập trung cao hơn</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>Tất cả ch&uacute;ng ta đều muốn gặt h&aacute;i kết quả tối đa từ khoản đầu tư của m&igrave;nh, cho d&ugrave; ng&ocirc;n ngữ trực tuyến hay giao dịch cổ phiếu. V&agrave; b&iacute; quyết chỉ nằm ở \'sự tập trung\' của bạn, trong c&aacute;c lớp tiếng Anh online, bạn sẽ dễ d&agrave;ng tập trung v&agrave;o học v&agrave; xử l&yacute; th&ocirc;ng hiệu quả hơn v&igrave; m&ocirc;i trường n&agrave;y sẽ kh&ocirc;ng c&oacute; c&aacute;c hoạt động kh&aacute;c mang t&iacute;nh hoạt n&aacute;o như khi bạn học tại c&aacute;c lớp tiếng Anh ở trung t&acirc;m.</p>\r\n<p>&nbsp;</p>\r\n<h2><strong>8. Tăng sự tự tin</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>Với những người nh&uacute;t nh&aacute;t v&agrave; thường kh&ocirc;ng thoải m&aacute;i với c&aacute;c tương t&aacute;c trực tiếp, họ sẽ cảm thấy xấu hổ khi ph&aacute;t &acirc;m sai trước c&aacute;c th&agrave;nh vi&ecirc;n kh&aacute;c trong lớp học. Tuy nhi&ecirc;n, khi tham gia học tiếng Anh tr&ecirc;n mạng, họ sẽ loại bỏ được điều n&agrave;y v&agrave; tăng sự tự tin khi giao tiếp ngo&agrave;i đời thực.</p>\r\n<p>&nbsp;</p>\r\n<h2><strong>9. Tất cả những g&igrave; bạn cần l&agrave; mười ph&uacute;t mỗi ng&agrave;y</strong></h2>\r\n<p>&nbsp;</p>\r\n<p>C&aacute;c chuy&ecirc;n gia cũng đ&atilde; ước t&iacute;nh rằng bạn c&oacute; thể th&agrave;nh thạo tiếng Anh bằng c&aacute;c d&agrave;nh ra &iacute;t nhất mười ph&uacute;t mỗi ng&agrave;y. Vậy bạn c&ograve;n chờ g&igrave; nữa m&agrave; kh&ocirc;ng thực hiện việc học tiếng Anh đ&atilde; ấp ủ bấy l&acirc;u nay? Cả một thế giới đầy tiềm năng v&agrave; cơ hội đang mở ra cho bạn chỉ bằng một c&uacute; click chuột v&agrave;o c&aacute;c trang web luyện nghe tiếng Anh cơ bản hay c&aacute;c chương tr&igrave;nh học tiếng Anh online c&oacute; sẵn tr&ecirc;n mạng.</p>\r\n<p>&nbsp;</p>\r\n<p><em>Mong rằng với 9 l&yacute; do tr&ecirc;n bạn sẽ c&oacute; th&ecirc;m động lực học tiếng Anh để mở ra cho m&igrave;nh nhiều cơ hội mới trong thời kỳ hội nhập như hiện nay.</em></p>','1728626178772.webp',1,'vandat28'),(23,'Tại sao học tiếng Anh lại quan trọng và cách bắt đầu hiệu quả','Học tiếng Anh ngày nay đã trở thành một nhu cầu không thể thiếu, bởi vì ngôn ngữ này được sử dụng rộng rãi trên toàn thế giới, giúp bạn kết nối với nhiều nền văn hóa và mở rộng cơ hội học tập, làm việc. Việc học tiếng Anh không chỉ giúp bạn hiểu rõ hơn về thế giới, mà còn nâng cao khả năng giao tiếp và phát triển bản thân.','<p style=\"text-align: justify;\"><strong>Bắt đầu học tiếng Anh như thế n&agrave;o?</strong></p>\r\n<ol style=\"text-align: justify;\">\r\n<li>\r\n<p><strong>X&aacute;c định mục ti&ecirc;u</strong>: Bạn cần x&aacute;c định r&otilde; r&agrave;ng mục ti&ecirc;u học tiếng Anh để c&oacute; động lực l&acirc;u d&agrave;i. V&iacute; dụ: học để giao tiếp, để thi cử hay để phục vụ c&ocirc;ng việc.</p>\r\n</li>\r\n<li>\r\n<p><strong>Học từ vựng h&agrave;ng ng&agrave;y</strong>: Từ vựng l&agrave; nền tảng của ng&ocirc;n ngữ. H&atilde;y cố gắng học &iacute;t nhất 5-10 từ mới mỗi ng&agrave;y v&agrave; &aacute;p dụng ch&uacute;ng v&agrave;o thực tế.</p>\r\n</li>\r\n<li>\r\n<p><strong>Luyện nghe v&agrave; n&oacute;i</strong>: Để cải thiện kỹ năng nghe v&agrave; n&oacute;i, bạn c&oacute; thể xem phim, nghe nhạc hoặc podcast bằng tiếng Anh. H&atilde;y mạnh dạn giao tiếp với người kh&aacute;c, đừng sợ sai.</p>\r\n</li>\r\n<li>\r\n<p><strong>Đọc v&agrave; viết</strong>: Đọc s&aacute;ch, b&agrave;i b&aacute;o v&agrave; viết nhật k&yacute; bằng tiếng Anh l&agrave; c&aacute;ch hiệu quả để n&acirc;ng cao khả năng sử dụng từ ngữ v&agrave; cấu tr&uacute;c c&acirc;u.</p>\r\n</li>\r\n<li>\r\n<p><strong>Sử dụng c&ocirc;ng cụ hỗ trợ</strong>: C&aacute;c ứng dụng học tiếng Anh như Duolingo, Memrise, hoặc website học online sẽ gi&uacute;p bạn luyện tập một c&aacute;ch hiệu quả v&agrave; th&uacute; vị.</p>\r\n</li>\r\n</ol>\r\n<p style=\"text-align: justify;\">H&atilde;y nhớ rằng, học tiếng Anh l&agrave; một h&agrave;nh tr&igrave;nh d&agrave;i. Điều quan trọng l&agrave; bạn phải ki&ecirc;n nhẫn v&agrave; duy tr&igrave; th&oacute;i quen học mỗi ng&agrave;y.</p>','1729585329662.jpg',1,'vandat28'),(24,'Học tiếng Anh cho trẻ em: Phương pháp và Lợi ích','Tại sao nên dạy tiếng Anh cho trẻ em?','<p>Tiếng Anh l&agrave; một trong những ng&ocirc;n ngữ phổ biến nhất thế giới v&agrave; l&agrave; ng&ocirc;n ngữ ch&iacute;nh trong giao tiếp to&agrave;n cầu. Việc dạy tiếng Anh cho trẻ em từ sớm kh&ocirc;ng chỉ gi&uacute;p c&aacute;c em ph&aacute;t triển khả năng ng&ocirc;n ngữ m&agrave; c&ograve;n mở ra nhiều cơ hội trong học tập v&agrave; nghề nghiệp sau n&agrave;y. Ngo&agrave;i ra, học tiếng Anh c&ograve;n gi&uacute;p trẻ em hiểu biết hơn về văn h&oacute;a v&agrave; con người từ c&aacute;c quốc gia kh&aacute;c nhau.</p>\r\n<h3>Phương ph&aacute;p dạy tiếng Anh hiệu quả cho trẻ em</h3>\r\n<ol>\r\n<li>\r\n<p><strong>Học qua tr&ograve; chơi</strong>: Trẻ em học tốt hơn khi được chơi. C&aacute;c tr&ograve; chơi ng&ocirc;n ngữ, b&agrave;i h&aacute;t v&agrave; hoạt động tương t&aacute;c gi&uacute;p c&aacute;c em ghi nhớ từ vựng v&agrave; cấu tr&uacute;c c&acirc;u một c&aacute;ch tự nhi&ecirc;n.</p>\r\n</li>\r\n<li>\r\n<p><strong>Sử dụng h&igrave;nh ảnh v&agrave; video</strong>: Trẻ em thường dễ tiếp thu th&ocirc;ng tin qua h&igrave;nh ảnh v&agrave; video. Sử dụng flashcards, h&igrave;nh ảnh minh họa, v&agrave; video gi&aacute;o dục c&oacute; thể gi&uacute;p trẻ dễ d&agrave;ng h&igrave;nh dung v&agrave; nhớ từ vựng mới.</p>\r\n</li>\r\n<li>\r\n<p><strong>Khuyến kh&iacute;ch giao tiếp</strong>: Tạo điều kiện cho trẻ em giao tiếp bằng tiếng Anh, d&ugrave; l&agrave; trong c&aacute;c cuộc tr&ograve; chuyện đơn giản hay c&aacute;c b&agrave;i thuyết tr&igrave;nh nhỏ. Điều n&agrave;y gi&uacute;p c&aacute;c em tự tin hơn khi sử dụng ng&ocirc;n ngữ.</p>\r\n</li>\r\n<li>\r\n<p><strong>Đọc s&aacute;ch</strong>: Khuyến kh&iacute;ch trẻ đọc s&aacute;ch bằng tiếng Anh. Những cuốn s&aacute;ch đơn giản v&agrave; hấp dẫn sẽ gi&uacute;p trẻ mở rộng vốn từ v&agrave; ph&aacute;t triển khả năng hiểu biết.</p>\r\n</li>\r\n<li>\r\n<p><strong>Tạo m&ocirc;i trường học tập t&iacute;ch cực</strong>: H&atilde;y tạo ra một m&ocirc;i trường học tập th&acirc;n thiện, nơi trẻ em cảm thấy thoải m&aacute;i để học hỏi v&agrave; thử nghiệm với ng&ocirc;n ngữ. Việc khen ngợi v&agrave; động vi&ecirc;n sẽ gi&uacute;p trẻ th&ecirc;m tự tin.</p>\r\n</li>\r\n</ol>\r\n<h3>Lợi &iacute;ch của việc học tiếng Anh từ sớm</h3>\r\n<ol>\r\n<li>\r\n<p><strong>Ph&aacute;t triển tư duy</strong>: Học một ng&ocirc;n ngữ mới gi&uacute;p trẻ ph&aacute;t triển tư duy phản biện v&agrave; khả năng giải quyết vấn đề.</p>\r\n</li>\r\n<li>\r\n<p><strong>Mở rộng cơ hội</strong>: Những trẻ em biết tiếng Anh c&oacute; nhiều cơ hội hơn trong việc học tập, đi du lịch v&agrave; l&agrave;m việc trong tương lai.</p>\r\n</li>\r\n<li>\r\n<p><strong>Cải thiện kỹ năng giao tiếp</strong>: Học tiếng Anh gi&uacute;p trẻ em n&acirc;ng cao khả năng giao tiếp, kh&ocirc;ng chỉ trong tiếng Anh m&agrave; c&ograve;n trong ng&ocirc;n ngữ mẹ đẻ của m&igrave;nh.</p>\r\n</li>\r\n<li>\r\n<p><strong>Kh&aacute;m ph&aacute; văn h&oacute;a</strong>: Việc học tiếng Anh cũng mở ra cơ hội cho trẻ kh&aacute;m ph&aacute; văn h&oacute;a của c&aacute;c nước n&oacute;i tiếng Anh, gi&uacute;p c&aacute;c em trở th&agrave;nh c&ocirc;ng d&acirc;n to&agrave;n cầu.</p>\r\n</li>\r\n</ol>\r\n<h3>Kết luận</h3>\r\n<p>Việc học tiếng Anh cho trẻ em l&agrave; một h&agrave;nh tr&igrave;nh th&uacute; vị v&agrave; đầy &yacute; nghĩa. Bằng c&aacute;ch &aacute;p dụng c&aacute;c phương ph&aacute;p học tập s&aacute;ng tạo v&agrave; tạo điều kiện cho trẻ giao tiếp, c&aacute;c bậc phụ huynh v&agrave; gi&aacute;o vi&ecirc;n c&oacute; thể gi&uacute;p trẻ em ph&aacute;t triển kỹ năng ng&ocirc;n ngữ một c&aacute;ch tự nhi&ecirc;n v&agrave; hiệu quả. H&atilde;y bắt đầu h&agrave;nh tr&igrave;nh học tiếng Anh cho trẻ em ngay h&ocirc;m nay để gi&uacute;p c&aacute;c em c&oacute; một tương lai tươi s&aacute;ng hơn!</p>','1729586876199.jpg',0,'vandat2801@gmail.com');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `slug` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'green','/img/lv1.webp','Sơ cấp','beginners'),(2,'blue','/img/lv2.webp','Trung cấp','intermediate'),(3,'red','/img/lv3.webp','Cao cấp','higher');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_visits`
--

DROP TABLE IF EXISTS `monthly_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `monthly_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(7) COLLATE utf8_bin DEFAULT NULL,
  `visit_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `month` (`month`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_visits`
--

LOCK TABLES `monthly_visits` WRITE;
/*!40000 ALTER TABLE `monthly_visits` DISABLE KEYS */;
INSERT INTO `monthly_visits` VALUES (1,'2024-10',13),(3,'2024-11',22);
/*!40000 ALTER TABLE `monthly_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `process` (
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `topicId` int(11) NOT NULL,
  `learningTime` datetime DEFAULT NULL,
  `process` int(11) DEFAULT NULL,
  `progress` float DEFAULT NULL,
  PRIMARY KEY (`username`,`topicId`),
  KEY `fk_topic_idx` (`topicId`),
  KEY `fk_topic_proccess_idx` (`topicId`),
  CONSTRAINT `fk_topic_proccess` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`),
  CONSTRAINT `fk_username_proccess` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES ('vandat123',1,'2024-07-30 10:41:26',4,75),('vandat28',1,'2024-10-30 14:18:25',1,100),('vandat28',2,'2024-10-19 16:07:56',4,100),('vandat28',3,'2024-10-31 14:59:31',8,100),('vandat28',4,'2024-07-30 11:12:45',1,100),('vandat28',8,'2024-07-30 13:06:04',1,45),('vandat28',9,'2024-11-01 16:10:37',3,66.6667),('vandat28',10,'2024-07-30 13:07:08',1,10),('vandat28',14,'2024-10-20 14:07:06',1,0),('vandat28',31,'2024-11-01 16:04:35',1,100),('vandat2801@gmail.com',1,'2024-08-09 14:50:26',1,100),('vandat2801@gmail.com',2,'2024-09-28 10:35:46',4,100),('vandat2801@gmail.com',4,'2024-07-30 11:12:45',1,100),('yasoucombat@gmail.com',1,'2024-09-28 10:35:46',2,20);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `keyword` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_idx` (`typeId`),
  KEY `fk_topic_idx` (`topicId`),
  CONSTRAINT `fk_topic` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`),
  CONSTRAINT `fk_type` FOREIGN KEY (`typeId`) REFERENCES `question_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Xin chào','',2,1),(2,'Chào buổi sáng',NULL,2,1),(3,'Tôi là học sinh','I am a student',4,1),(5,'/audio/hello.mp3',NULL,1,1),(7,'Chào buổi sáng','Good morning',3,1),(53,'Con gà',NULL,2,2),(54,'Con gà đang chạy','Chicken is running',4,2),(60,'2075b14c-bb40-43e4-b498-e43c54dc235c-How_are_you.mp3',NULL,1,2),(61,'Con gì',NULL,2,2),(62,'e05aabf3-99db-4b24-96e4-c498bb36718e-Where_are_you_now_.mp3',NULL,1,3),(63,'Số mười','10',3,3),(64,'Số ba',NULL,2,3),(65,'Một hai ba bốn','One Two Three Four',4,3),(66,'3','Three',4,3),(67,'23d1f4dc-0f39-4c39-9395-7a3459fd75ee-Where_are_you_now_.mp3',NULL,1,3),(68,'Con chó',NULL,2,2),(69,'b326ad03-d1ee-4319-99b0-46a4e0d55578-How_are_you.mp3',NULL,1,3),(70,'1','1',3,3),(71,'1','1',4,3),(72,'1',NULL,2,3),(73,'How are you',NULL,2,31),(74,'0bd4d108-697a-4259-9e3d-36a6087c7630-How_are_you.mp3',NULL,1,9),(75,'Con mèo','cat',3,9),(76,'Bạn có khỏe không ?','How are you ?',4,9),(77,'Gia đình của tôi','my family',3,4);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_type`
--

LOCK TABLES `question_type` WRITE;
/*!40000 ALTER TABLE `question_type` DISABLE KEYS */;
INSERT INTO `question_type` VALUES (1,'listening'),(2,'reading'),(3,'speaking'),(4,'writing');
/*!40000 ALTER TABLE `question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `label` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `levelId` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_level_idx` (`levelId`),
  CONSTRAINT `fk_level` FOREIGN KEY (`levelId`) REFERENCES `level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Chào hỏi','am/is/are','greeting.webp',1,1),(2,'Động vật','an/a, have/has','animal.webp',1,1),(3,'Số đếm','Số nhiều','number.webp',1,1),(4,'Gia đình','Sở hữu cách','family.webp',1,0),(8,'Thói quen hàng ngày','V + s/es, do/does + not','daily_routine.webp',2,1),(9,'Ngoại hình','So sánh hơn','appearance.webp',3,1),(10,'Tháng','Hỏi và trả lời ngay','month.webp',3,1),(14,'Giao thông','Hỏi và trả lời về phương tiện 222','2c108d86-99b3-453e-bb28-05ea40261d3f-housework.webp',3,1),(31,'Thể thao 1','Hỏi và trả lời về thể thao','8a508510-a256-4e64-bb14-e423393309ae-sport.webp',2,1);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 13:05:51
