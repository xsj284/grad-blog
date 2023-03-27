-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: grad_proj_blog
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_article`
--

DROP TABLE IF EXISTS `tb_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_article` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `author_id` int NOT NULL COMMENT '作者id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文章简介',
  `context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '文章内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '文章更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文章状态(0公开,1私密,2评论可见)',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tb_article_tb_user_uid_fk` (`author_id`) USING BTREE,
  CONSTRAINT `tb_article_tb_user_uid_fk` FOREIGN KEY (`author_id`) REFERENCES `tb_user` (`uid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_article`
--

LOCK TABLES `tb_article` WRITE;
/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` VALUES (1,1,'test','this a test article.','# Test','2023-03-21 04:44:27','2023-03-21 04:44:59',0,0);
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_bg_pic`
--

DROP TABLE IF EXISTS `tb_bg_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_bg_pic` (
  `id` int NOT NULL COMMENT '背景图片id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '背景图片url',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(0为展示,1为隐藏)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bg_pic`
--

LOCK TABLES `tb_bg_pic` WRITE;
/*!40000 ALTER TABLE `tb_bg_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_bg_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_permission`
--

DROP TABLE IF EXISTS `tb_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `value` varchar(50) NOT NULL COMMENT '权限值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_permission_value_uindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_permission`
--

LOCK TABLES `tb_permission` WRITE;
/*!40000 ALTER TABLE `tb_permission` DISABLE KEYS */;
INSERT INTO `tb_permission` VALUES (4,'user:delete'),(2,'user:insert'),(1,'user:select'),(3,'user:update');
/*!40000 ALTER TABLE `tb_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `value` varchar(50) NOT NULL COMMENT '角色值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_role_value_uindex` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'admin'),(2,'super_admin');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `uid` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `password` varchar(80) NOT NULL COMMENT '用户密码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户密码更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已注销',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `tb_user_account_uindex` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户表(前100000个保留为管理员账户)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'xsj284','123456','2023-03-21 01:55:05','2023-03-21 01:55:11',0),(100000,'last_admin','123456','2023-03-27 22:00:14','2023-03-27 22:00:14',0),(100001,'testuser1','123456','2023-03-27 20:28:05','2023-03-27 20:28:19',0),(100002,'testuser2','123456','2023-03-28 01:57:12','2023-03-28 02:08:42',0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_info`
--

DROP TABLE IF EXISTS `tb_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int NOT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户昵称',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户头像文件地址',
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户个性签名',
  `sex` tinyint(1) DEFAULT NULL COMMENT '用户性别(0为女,1为男,null为未知)',
  `age` tinyint DEFAULT NULL COMMENT '用户年龄',
  `birthday` date DEFAULT NULL COMMENT '用户生日',
  `email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户电子邮件地址',
  `current_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户当前地址',
  `original_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户籍贯',
  `level` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户等级',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户信息更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tb_user_info_tb_user_uid_fk` (`uid`) USING BTREE,
  CONSTRAINT `tb_user_info_tb_user_uid_fk` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_info`
--

LOCK TABLES `tb_user_info` WRITE;
/*!40000 ALTER TABLE `tb_user_info` DISABLE KEYS */;
INSERT INTO `tb_user_info` VALUES (1,1,'xsj284',NULL,'相生于心',1,20,NULL,NULL,NULL,NULL,6,'2023-03-21 17:27:50');
/*!40000 ALTER TABLE `tb_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_permission`
--

DROP TABLE IF EXISTS `tb_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NOT NULL COMMENT '用户id',
  `permission_id` int NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `tb_user_permission_tb_permission_id_fk` (`permission_id`),
  KEY `tb_user_permission_tb_user_uid_fk` (`user_id`),
  CONSTRAINT `tb_user_permission_tb_permission_id_fk` FOREIGN KEY (`permission_id`) REFERENCES `tb_permission` (`id`),
  CONSTRAINT `tb_user_permission_tb_user_uid_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_permission`
--

LOCK TABLES `tb_user_permission` WRITE;
/*!40000 ALTER TABLE `tb_user_permission` DISABLE KEYS */;
INSERT INTO `tb_user_permission` VALUES (1,100000,1),(2,100000,2),(3,100000,3),(4,100000,4);
/*!40000 ALTER TABLE `tb_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_role`
--

DROP TABLE IF EXISTS `tb_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `tb_user_role_tb_role_id_fk` (`role_id`),
  KEY `tb_user_role_tb_user_uid_fk` (`user_id`),
  CONSTRAINT `tb_user_role_tb_role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`id`),
  CONSTRAINT `tb_user_role_tb_user_uid_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_role`
--

LOCK TABLES `tb_user_role` WRITE;
/*!40000 ALTER TABLE `tb_user_role` DISABLE KEYS */;
INSERT INTO `tb_user_role` VALUES (1,1,2);
/*!40000 ALTER TABLE `tb_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-28  3:10:10
