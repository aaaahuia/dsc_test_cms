-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.12 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 dsc_test_cms 的数据库结构
CREATE DATABASE IF NOT EXISTS `dsc_test_cms` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `dsc_test_cms`;

-- 导出  表 dsc_test_cms.book 结构
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `summary` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.book 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
REPLACE INTO `book` (`id`, `title`, `author`, `summary`, `image`, `create_time`, `update_time`, `delete_time`) VALUES
	(1, '深入理解计算机系统', 'Randal E.Bryant', '从程序员的视角，看计算机系统！\n本书适用于那些想要写出更快、更可靠程序的程序员。通过掌握程序是如何映射到系统上，以及程序是如何执行的，读者能够更好的理解程序的行为为什么是这样的，以及效率低下是如何造成的。', 'https://img3.doubanio.com/lpic/s1470003.jpg', '2022-08-05 16:21:58.678', '2022-08-05 16:21:58.678', NULL),
	(2, 'C程序设计语言', '（美）Brian W. Kernighan', '在计算机发展的历史上，没有哪一种程序设计语言像C语言这样应用广泛。本书原著即为C语言的设计者之一Dennis M.Ritchie和著名计算机科学家Brian W.Kernighan合著的一本介绍C语言的权威经典著作。', 'https://img3.doubanio.com/lpic/s1106934.jpg', '2022-08-05 16:21:58.703', '2022-08-05 16:21:58.703', NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_company 结构
CREATE TABLE IF NOT EXISTS `lin_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司名称',
  `company_tin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '纳税人识别号',
  `company_scc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '统一社会信用编码',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_company 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `lin_company` DISABLE KEYS */;
REPLACE INTO `lin_company` (`id`, `company_name`, `company_tin`, `company_scc`, `create_time`, `update_time`, `delete_time`) VALUES
	(1, '天机星股份有限公司', '91440300MA5G49LB0N', '91440300MA5G49LB0N', '2022-08-08 20:08:40.785', '2022-08-10 15:20:13.717', NULL),
	(2, '深信服科技股份有限公司', '92440130TU7B19BH1N', '92440130TU7B19BH1N', '2022-08-10 16:43:02.000', '2022-08-10 16:43:04.000', NULL);
/*!40000 ALTER TABLE `lin_company` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_file 结构
CREATE TABLE IF NOT EXISTS `lin_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'LOCAL' COMMENT 'LOCAL 本地，REMOTE 远程',
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `md5` varchar(40) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'md5值，防止上传重复文件',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5_del` (`md5`,`delete_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_file 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `lin_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `lin_file` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_group 结构
CREATE TABLE IF NOT EXISTS `lin_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称，例如：搬砖者',
  `info` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组信息：例如：搬砖的人',
  `level` tinyint(2) NOT NULL DEFAULT '3' COMMENT '分组级别 1：root 2：guest 3：user  root（root、guest分组只能存在一个)',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_del` (`name`,`delete_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_group 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `lin_group` DISABLE KEYS */;
REPLACE INTO `lin_group` (`id`, `name`, `info`, `level`, `create_time`, `update_time`, `delete_time`) VALUES
	(1, 'root', '超级用户组', 1, '2022-08-05 15:18:46.082', '2022-08-05 15:18:46.082', NULL),
	(2, 'guest', '游客组', 3, '2022-08-05 15:18:46.106', '2022-08-10 17:11:05.738', NULL),
	(3, 'companyadmin', '公司管理员', 2, '2022-08-10 17:11:02.652', '2022-08-10 17:11:10.278', NULL);
/*!40000 ALTER TABLE `lin_group` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_group_permission 结构
CREATE TABLE IF NOT EXISTS `lin_group_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL COMMENT '分组id',
  `permission_id` int(10) unsigned NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`) USING BTREE COMMENT '联合索引'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_group_permission 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `lin_group_permission` DISABLE KEYS */;
REPLACE INTO `lin_group_permission` (`id`, `group_id`, `permission_id`) VALUES
	(1, 1, 5),
	(2, 3, 7);
/*!40000 ALTER TABLE `lin_group_permission` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_log 结构
CREATE TABLE IF NOT EXISTS `lin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(450) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(24) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  `method` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permission` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `lin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lin_log` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_permission 结构
CREATE TABLE IF NOT EXISTS `lin_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称，例如：访问首页',
  `module` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限所属模块，例如：人员管理',
  `mount` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：关闭 1：开启',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_permission 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `lin_permission` DISABLE KEYS */;
REPLACE INTO `lin_permission` (`id`, `name`, `module`, `mount`, `create_time`, `update_time`, `delete_time`) VALUES
	(1, '查询所有日志', '日志', 1, '2022-08-05 15:19:31.856', '2022-08-05 15:19:31.856', NULL),
	(2, '搜索日志', '日志', 1, '2022-08-05 15:19:31.931', '2022-08-05 15:19:31.931', NULL),
	(3, '删除图书', '图书', 1, '2022-08-05 15:19:31.941', '2022-08-05 15:19:31.941', NULL),
	(4, '查询日志记录的用户', '日志', 1, '2022-08-05 15:19:31.950', '2022-08-05 15:19:31.950', NULL),
	(5, 'test', 'test', 1, '2022-08-10 10:06:01.800', '2022-08-10 10:06:01.800', NULL),
	(6, '查询所有用户', '管理员', 1, '2022-08-10 10:59:48.021', '2022-08-10 10:59:48.021', NULL),
	(7, '查询公司员工', '公司管理员', 1, '2022-08-10 17:12:25.332', '2022-08-10 17:12:25.332', NULL);
/*!40000 ALTER TABLE `lin_permission` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_user 结构
CREATE TABLE IF NOT EXISTS `lin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(24) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名，唯一',
  `nickname` varchar(24) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像url',
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  `idcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
  `phonenumber` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '家庭地址',
  `bankcard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '银行卡号',
  `txz` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '港澳通行证',
  `companyid` int(11) NOT NULL COMMENT '用户所属公司id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_del` (`username`,`delete_time`),
  UNIQUE KEY `email_del` (`email`,`delete_time`),
  KEY `companyid` (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_user 的数据：~31 rows (大约)
/*!40000 ALTER TABLE `lin_user` DISABLE KEYS */;
REPLACE INTO `lin_user` (`id`, `username`, `nickname`, `avatar`, `email`, `create_time`, `update_time`, `delete_time`, `idcard`, `phonenumber`, `address`, `bankcard`, `txz`, `companyid`) VALUES
	(1, 'root', 'root', NULL, 'root@123.com', '2022-08-05 15:18:46.014', '2022-08-10 16:02:11.167', NULL, '410723199908162995', '18345987649', '河南省新乡市卫滨区深信服小区88号楼一单元一楼', '379268200001022996', 'H64997812', 1),
	(2, 'test', 'test', NULL, 'test@qq.com', '2022-08-08 09:19:46.594', '2022-08-10 16:43:49.984', NULL, '319183197201122919', '13549741364', '深圳市宝安区电信小区12号楼一单元', '6212261803005021968', 'W26498564', 2),
	(3, 'test1', 'test1', NULL, 'test1@qq.com', '2022-08-10 15:33:00.000', '2022-08-10 16:44:05.802', NULL, '472139198801281235', '18313245965', '江苏省南京市秦淮区夫子庙', '6212261804006023956', 'H32698412', 1),
	(4, 'test2', 'test2', NULL, 'test2@qq.com', '2022-08-10 16:45:52.000', '2022-08-10 16:45:53.000', NULL, '376527199804152669', '13698954785', '深圳市塘览东路47号', '6212261703005024865', 'W46984569', 2);
/*!40000 ALTER TABLE `lin_user` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_user_group 结构
CREATE TABLE IF NOT EXISTS `lin_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(10) unsigned NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`),
  KEY `user_id_group_id` (`user_id`,`group_id`) USING BTREE COMMENT '联合索引'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_user_group 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `lin_user_group` DISABLE KEYS */;
REPLACE INTO `lin_user_group` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(4, 1, 2),
	(3, 1, 3),
	(2, 2, 2),
	(5, 2, 3),
	(6, 43, 3);
/*!40000 ALTER TABLE `lin_user_group` ENABLE KEYS */;

-- 导出  表 dsc_test_cms.lin_user_identity 结构
CREATE TABLE IF NOT EXISTS `lin_user_identity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `identity_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `credential` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 正在导出表  dsc_test_cms.lin_user_identity 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `lin_user_identity` DISABLE KEYS */;
REPLACE INTO `lin_user_identity` (`id`, `user_id`, `identity_type`, `identifier`, `credential`, `create_time`, `update_time`, `delete_time`) VALUES
	(1, 1, 'USERNAME_PASSWORD', 'root', 'pbkdf2sha256:64000:18:24:n:yUnDokcNRbwILZllmUOItIyo9MnI00QW:6ZcPf+sfzyoygOU8h/GSoirF', '2022-08-05 15:18:46.049', '2022-08-05 15:18:46.049', NULL),
	(2, 2, 'USERNAME_PASSWORD', 'test', 'pbkdf2sha256:64000:18:24:n:xbtFDzIw8Yxh+c/kt5jeSH+jFgPO28t9:bpJl4PPDd52lR0x7NdJUMgMm', '2022-08-08 09:20:05.529', '2022-08-10 14:44:24.303', NULL);
/*!40000 ALTER TABLE `lin_user_identity` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
