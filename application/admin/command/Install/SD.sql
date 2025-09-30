-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.48-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 fish 的数据库结构
CREATE DATABASE IF NOT EXISTS `fish` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `fish`;

-- 导出  表 fish.fa_admin 结构
CREATE TABLE IF NOT EXISTS `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` bigint(16) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- 正在导出表  fish.fa_admin 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `fa_admin` DISABLE KEYS */;
INSERT IGNORE INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `mobile`, `loginfailure`, `logintime`, `loginip`, `createtime`, `updatetime`, `token`, `status`) VALUES
	(1, 'admin', 'Admin', '278d298d6996e1069ffa060b5ba9739c', 'd50bab', '/assets/img/avatar.png', 'admin@admin.com', '', 0, 1759144981, '127.0.0.1', 1491635035, 1759144981, '0d76c20c-350c-4e83-ae5e-d5a42a2df6e6', 'normal');
/*!40000 ALTER TABLE `fa_admin` ENABLE KEYS */;

-- 导出  表 fish.fa_admin_log 结构
CREATE TABLE IF NOT EXISTS `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` longtext NOT NULL COMMENT '内容',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `createtime` bigint(16) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8mb4 COMMENT='管理员日志表';

-- 正在导出表  fish.fa_admin_log 的数据：~458 rows (大约)
/*!40000 ALTER TABLE `fa_admin_log` DISABLE KEYS */;
INSERT IGNORE INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
	(1, 1, 'admin', '/oYtJBLQSfE.php/index/login', '登录', '{"__token__":"***","username":"admin","password":"***","captcha":"jftb","keeplogin":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750849),
	(2, 1, 'admin', '/oYtJBLQSfE.php/addon/install', '插件管理', '{"name":"command","force":"0","uid":"20976","token":"***","version":"1.1.2","faversion":"1.6.1.20250430"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750901),
	(3, 1, 'admin', '/oYtJBLQSfE.php/addon/install', '插件管理', '{"name":"command","force":"0","uid":"20976","token":"***","version":"1.1.2","faversion":"1.6.1.20250430"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750935),
	(4, 1, 'admin', '/oYtJBLQSfE.php/addon/state', '插件管理 / 禁用启用', '{"name":"command","action":"enable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750935),
	(5, 1, 'admin', '/oYtJBLQSfE.php/addon/install', '插件管理', '{"name":"summernote","force":"0","uid":"20976","token":"***","version":"1.2.1","faversion":"1.6.1.20250430"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750966),
	(6, 1, 'admin', '/oYtJBLQSfE.php/addon/state', '插件管理 / 禁用启用', '{"name":"summernote","action":"enable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750966),
	(7, 1, 'admin', '/oYtJBLQSfE.php/addon/install', '插件管理', '{"name":"crontab","force":"0","uid":"20976","token":"***","version":"1.1.3","faversion":"1.6.1.20250430"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750983),
	(8, 1, 'admin', '/oYtJBLQSfE.php/addon/state', '插件管理 / 禁用启用', '{"name":"crontab","action":"enable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755750983),
	(9, 1, 'admin', '/oYtJBLQSfE.php/addon/install', '插件管理', '{"name":"captcha","force":"0","uid":"20976","token":"***","version":"1.0.1","faversion":"1.6.1.20250430"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751074),
	(10, 1, 'admin', '/oYtJBLQSfE.php/addon/state', '插件管理 / 禁用启用', '{"name":"captcha","action":"enable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751074),
	(11, 1, 'admin', '/oYtJBLQSfE.php/addon/install', '插件管理', '{"name":"signin","force":"0","uid":"20976","token":"***","version":"1.0.5","faversion":"1.6.1.20250430"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751123),
	(12, 1, 'admin', '/oYtJBLQSfE.php/addon/state', '插件管理 / 禁用启用', '{"name":"signin","action":"enable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751123),
	(13, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751830),
	(14, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751834),
	(15, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751835),
	(16, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751846),
	(17, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751847),
	(18, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751852),
	(19, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751854),
	(20, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751855),
	(21, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755751870),
	(22, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/1', '在线命令管理 / 再次执行命令', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755753751),
	(23, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/1', '在线命令管理 / 再次执行命令', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755754660),
	(24, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/3', '在线命令管理 / 再次执行命令', '{"ids":"3"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755755517),
	(25, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756147),
	(26, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_order"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756156),
	(27, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756171),
	(28, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756171),
	(29, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756171),
	(30, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756171),
	(31, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756174),
	(32, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756174),
	(33, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756224),
	(34, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756224),
	(35, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756224),
	(36, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756224),
	(37, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_product"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756232),
	(38, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_product"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756232),
	(39, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_m_order","controller":"order\\/Order","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","mobile"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756279),
	(40, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_m_order","controller":"order\\/Order","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","mobile"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756280),
	(41, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756283),
	(42, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["m"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"m"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756285),
	(43, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["m—"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"m—"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756290),
	(44, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["order"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"order"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756292),
	(45, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756293),
	(46, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/Order.php","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756295),
	(47, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/Order.php","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756296),
	(48, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/105?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"0","name":"order","title":"订单管理","url":"","icon":"fa fa-list","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"138","status":"normal"},"ids":"105"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756324),
	(49, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/106?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"105","name":"order\\/order","title":"订单列表","url":"","icon":"fa fa-circle-o","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"0","status":"normal"},"ids":"106"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756361),
	(50, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756411),
	(51, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_product"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756422),
	(52, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_product","controller":"data\\/Product","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756431),
	(53, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_product","controller":"data\\/Product","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756431),
	(54, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_news"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756435),
	(55, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_news","controller":"data\\/News","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756440),
	(56, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_news","controller":"data\\/News","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756440),
	(57, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_order_charge"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756448),
	(58, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_order_charge","controller":"order\\/OrderCharge","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756459),
	(59, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_order_charge","controller":"order\\/OrderCharge","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756460),
	(60, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_order_withdraw"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756462),
	(61, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_order_withdraw","controller":"order\\/OrderWithdraw","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756470),
	(62, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_order_withdraw","controller":"order\\/OrderWithdraw","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756470),
	(63, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756472),
	(64, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["order"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"order"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756476),
	(65, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756477),
	(66, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["order"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"order"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756481),
	(67, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756482),
	(68, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["data"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"data"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756486),
	(69, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756487),
	(70, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["data"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"data"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756489),
	(71, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756490),
	(72, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/OrderCharge.php,order\\/OrderWithdraw.php,data\\/News.php,data\\/Product.php","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756492),
	(73, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/OrderCharge.php,order\\/OrderWithdraw.php,data\\/News.php,data\\/Product.php","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756493),
	(74, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/124?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"0","name":"data","title":"数据管理","url":"","icon":"fa fa-list","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"138","status":"normal"},"ids":"124"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756522),
	(75, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/112?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"105","name":"order\\/order_charge","title":"充值订单","url":"","icon":"fa fa-circle-o","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"0","status":"normal"},"ids":"112"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756537),
	(76, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/118?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"105","name":"order\\/order_withdraw","title":"提现订单","url":"","icon":"fa fa-circle-o","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"0","status":"normal"},"ids":"118"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756548),
	(77, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/131?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"124","name":"data\\/product","title":"产品列表","url":"","icon":"fa fa-circle-o","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"4","status":"normal"},"ids":"131"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756563),
	(78, 1, 'admin', '/oYtJBLQSfE.php/data/product/add?dialog=1', '数据管理 / 产品列表 / 添加', '{"dialog":"1","row":{"title":"5555555555555","images":"\\/assets\\/img\\/qrcode.png","content":"35345","price":"30.00","number":"20"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756881),
	(79, 1, 'admin', '/oYtJBLQSfE.php/data/product/add?dialog=1', '数据管理 / 产品列表 / 添加', '{"dialog":"1","row":{"title":"ttt","images":"\\/assets\\/img\\/qrcode.png","content":"45346","price":"30.00","number":"30"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755756955),
	(80, 1, 'admin', '/oYtJBLQSfE.php/data/news/add?dialog=1', '数据管理 / 资讯列管理 / 添加', '{"dialog":"1","row":{"title":"1222222222222222222","url":"","images":"\\/assets\\/img\\/qrcode.png","content":"ewr","weigh":"0","status":"1"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755757673),
	(81, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/1', '在线命令管理 / 再次执行命令', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755774447),
	(82, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/1', '在线命令管理 / 再次执行命令', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755774850),
	(83, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/1', '在线命令管理 / 再次执行命令', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755774889),
	(84, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755775223),
	(85, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/14', '在线命令管理 / 再次执行命令', '{"ids":"14"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755784732),
	(86, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755792773),
	(87, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795100),
	(88, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_order_mark"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795107),
	(89, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_order_mark","controller":"order\\/OrderMark","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795126),
	(90, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_order_mark","controller":"order\\/OrderMark","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795127),
	(91, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795130),
	(92, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["mar"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"mar"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795132),
	(93, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795134),
	(94, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/OrderMark.php","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795135),
	(95, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/OrderMark.php","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795136),
	(96, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/137?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"105","name":"order\\/order_mark","title":"派单列表","url":"","icon":"fa fa-circle-o","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"0","status":"normal"},"ids":"137"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755795160),
	(97, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839755),
	(98, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_level"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839760),
	(99, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_level","controller":"data\\/Level","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839768),
	(100, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"0","local":"1","delete":"0","force":"0","table":"fa_m_level","controller":"data\\/Level","model":"","setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839769),
	(101, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839772),
	(102, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["le"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"le"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839774),
	(103, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839776),
	(104, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"data\\/Level.php","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839777),
	(105, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"data\\/Level.php","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839778),
	(106, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/143?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"124","name":"data\\/level","title":"等级列表","url":"","icon":"fa fa-circle-o","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"0","status":"normal"},"ids":"143"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755839798),
	(107, 1, 'admin', '/oYtJBLQSfE.php/data/level/edit/ids/1?dialog=1', '数据管理 / 等级列表 / 编辑', '{"dialog":"1","row":{"pic":"\\/assets\\/img\\/qrcode.png","name":"level1","level":"1","enough_price":"0.00","max_order":"30","withdraw_min":"0.00","withdraw_max":"0.00","commission_rate":"3.00"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755840574),
	(108, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/multi', '权限管理 / 菜单规则', '{"action":"","ids":"79","params":"ismenu=0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755841163),
	(109, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/multi', '权限管理 / 菜单规则', '{"action":"","ids":"4","params":"ismenu=0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755841165),
	(110, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/multi', '权限管理 / 菜单规则', '{"action":"","ids":"73","params":"ismenu=0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755841172),
	(111, 1, 'admin', '/oYtJBLQSfE.php/order/order_charge/edit/ids/2?dialog=1', '订单管理 / 充值订单 / 编辑', '{"dialog":"1","row":{"order_sn":"W2025082157519910","amount":"10.00","status":"1","note":"0"},"ids":"2"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842478),
	(112, 1, 'admin', '/oYtJBLQSfE.php/order/order_withdraw/edit/ids/1?dialog=1', '订单管理 / 提现订单 / 编辑', '{"dialog":"1","row":{"order_sn":"W2025082153515210","amount":"101.00","fees":"0.00","status":"2","note":"0"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842627),
	(113, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842650),
	(114, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user_money_log"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842657),
	(115, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842667),
	(116, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842667),
	(117, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842668),
	(118, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842668),
	(119, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842673),
	(120, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842673),
	(121, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_user_money_log","controller":"user\\/MoneyLog","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","mobile"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842685),
	(122, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_user_money_log","controller":"user\\/MoneyLog","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","mobile"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842685),
	(123, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842688),
	(124, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["mony"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"mony"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842691),
	(125, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["money"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"money"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842692),
	(126, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842693),
	(127, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"user\\/MoneyLog.php","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842694),
	(128, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"user\\/MoneyLog.php","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755842695),
	(129, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845439),
	(130, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845444),
	(131, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845469),
	(132, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845557),
	(133, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845818),
	(134, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845827),
	(135, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845843),
	(136, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845847),
	(137, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755845872),
	(138, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"","custom":{"price":"1"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755846422),
	(139, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755846497),
	(140, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["32"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"32"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755846499),
	(141, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["32"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"32"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755846512),
	(142, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["3"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"3"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755846514),
	(143, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755846515),
	(144, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755846632),
	(145, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847088),
	(146, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["55"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"55"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847101),
	(147, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["5555"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"5555"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847104),
	(148, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["5555"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"5555"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847121),
	(149, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847124),
	(150, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"","custom":{"price":"100"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847162),
	(151, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847232),
	(152, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847240),
	(153, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847292),
	(154, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847299),
	(155, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847301),
	(156, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["44"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"44"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847388),
	(157, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["44"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"44"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847389),
	(158, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["4443"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"4443"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847391),
	(159, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["555"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["title"],"title":"555"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847394),
	(160, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847466),
	(161, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["11"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"11"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847468),
	(162, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["112"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"112"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847469),
	(163, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["1122"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"1122"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847471),
	(164, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847496),
	(165, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["34234"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"34234"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847499),
	(166, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["21"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"21"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847507),
	(167, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847511),
	(168, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["tt"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"tt"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847529),
	(169, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["3535"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"3535"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847542),
	(170, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847561),
	(171, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["42"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"42"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847564),
	(172, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["12"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847570),
	(173, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847573),
	(174, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["44"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"44"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847575),
	(175, 1, 'admin', '/oYtJBLQSfE.php/data/product/add?dialog=1', '数据管理 / 产品列表 / 添加', '{"dialog":"1","row":{"title":"sgsgsdgdg","images":"\\/assets\\/img\\/qrcode.png","content":"","price":"660.00","number":"0"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847596),
	(176, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847622),
	(177, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["33"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"33"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847624),
	(178, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847627),
	(179, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["44"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"44"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847628),
	(180, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847629),
	(181, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847630),
	(182, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["23"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"23"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847632),
	(183, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847635),
	(184, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["55"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"55"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847636),
	(185, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847755),
	(186, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847759),
	(187, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847814),
	(188, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847827),
	(189, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847828),
	(190, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["id","ASC"]],"searchTable":"tbl","showField":"id","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847926),
	(191, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["id","ASC"]],"searchTable":"tbl","showField":"id","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847928),
	(192, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["id","ASC"]],"searchTable":"tbl","showField":"id","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847930),
	(193, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["id","ASC"]],"searchTable":"tbl","showField":"id","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755847945),
	(194, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["","ASC"]],"searchTable":"tbl","showField":"","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848094),
	(195, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["100"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["","ASC"]],"searchTable":"tbl","showField":"","keyField":"id","searchField":["price"],"price":"100"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848101),
	(196, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["","ASC"]],"searchTable":"tbl","showField":"","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848102),
	(197, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["12"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["","ASC"]],"searchTable":"tbl","showField":"","keyField":"id","searchField":["price"],"price":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848105),
	(198, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["id","ASC"]],"searchTable":"tbl","showField":"id","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848120),
	(199, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["","ASC"]],"searchTable":"tbl","showField":"","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848121),
	(200, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848189),
	(201, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848328),
	(202, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848528),
	(203, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848529),
	(204, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848530),
	(205, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=4&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"4","dialog":"1","row":{"sort_id":"3","product_id":["","","","","","","","","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848810),
	(206, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=4&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"4","dialog":"1","row":{"sort_id":"3","product_id":["","","","","","","","","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755848964),
	(207, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=4&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"4","dialog":"1","row":{"sort_id":"3","product_id":["","","","","","","","","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755849004),
	(208, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755849222),
	(209, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755849223),
	(210, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755849252),
	(211, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755849253),
	(212, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755851421),
	(213, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755851422),
	(214, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755851423),
	(215, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755851424),
	(216, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=4&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"4","dialog":"1","row":{"sort_id":"4","product_id":["5555555555555","1","5555555555555","1","ttt","2","ttt","2","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755852267),
	(217, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"username":"112","mobile":"112","password":"***","email":"","level":"1","deal_count":"3","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755853871),
	(218, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"password":"***","level":"1","deal_count":"3","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755853920),
	(219, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"password":"***","level":"1","deal_count":"3","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755853923),
	(220, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"username":"112","mobile":"112","password":"***","email":"","level":"1","deal_count":"8","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755853982),
	(221, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"username":"112","mobile":"112","email":"","password":"***","level":"1","deal_count":"8","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755854562),
	(222, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","username":"112","mobile":"112","email":"","password":"***","level":"1","deal_count":"3","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755854737),
	(223, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","password":"***","level":"1","deal_count":"8","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755854771),
	(224, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","username":"112","nickname":"112","mobile":"112","email":"","password":"***","level":"1","deal_count":"8","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755854802),
	(225, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","username":"112","nickname":"112","mobile":"112","email":"11@1.com","password":"***","level":"1","deal_count":"8","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755854812),
	(226, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","username":"112","nickname":"112","mobile":"112","email":"11@1.com","password":"***","level":"1","deal_count":"3","money":"218.10","score":"0","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755854820),
	(227, 1, 'admin', '/oYtJBLQSfE.php/general/crontab/del', '常规管理 / 定时任务 / 删除', '{"action":"del","ids":"2","params":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870532),
	(228, 1, 'admin', '/oYtJBLQSfE.php/general/crontab/del', '常规管理 / 定时任务 / 删除', '{"action":"del","ids":"1","params":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870535),
	(229, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/21', '在线命令管理 / 再次执行命令', '{"ids":"21"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870609),
	(230, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/22', '在线命令管理 / 再次执行命令', '{"ids":"22"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870678),
	(231, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/23', '在线命令管理 / 再次执行命令', '{"ids":"23"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870904),
	(232, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870962),
	(233, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870967),
	(234, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755870967),
	(235, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/25', '在线命令管理 / 再次执行命令', '{"ids":"25"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755871084),
	(236, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/26', '在线命令管理 / 再次执行命令', '{"ids":"26"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755873186),
	(237, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/27', '在线命令管理 / 再次执行命令', '{"ids":"27"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755873737),
	(238, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/28', '在线命令管理 / 再次执行命令', '{"ids":"28"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755928544),
	(239, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/29', '在线命令管理 / 再次执行命令', '{"ids":"29"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755929229),
	(240, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/multi', '权限管理 / 菜单规则', '{"action":"","ids":"4","params":"ismenu=1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1755931093),
	(241, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"page":"1","ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756003688),
	(242, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"page":"1","ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756003699),
	(243, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/2', '订单管理 / 订单列表', '{"page":"1","ids":"2"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756003707),
	(244, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004330),
	(245, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004407),
	(246, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004446),
	(247, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/4', '订单管理 / 订单列表', '{"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004466),
	(248, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004536),
	(249, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004548),
	(250, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004660),
	(251, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004685),
	(252, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/3', '订单管理 / 订单列表', '{"ids":"3"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004688),
	(253, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/2', '订单管理 / 订单列表', '{"ids":"2"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004844),
	(254, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/4', '订单管理 / 订单列表', '{"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004846),
	(255, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/4', '订单管理 / 订单列表', '{"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004917),
	(256, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/66?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"0","name":"user","title":"会员管理","url":"","icon":"fa fa-user-circle","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"1320","status":"normal"},"ids":"66"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756004956),
	(257, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/66?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"0","name":"user","title":"会员管理","url":"","icon":"fa fa-user-circle","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"132","status":"normal"},"ids":"66"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756005000),
	(258, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/2?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"0","name":"general","title":"常规管理","url":"","icon":"fa fa-cogs","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"130","status":"normal"},"ids":"2"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756005018),
	(259, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756005165),
	(260, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"02:00|20:00","withdraw_time":"02:00|20:00"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756007060),
	(261, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00|20:00","withdraw_time":"02:00|20:00"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756009560),
	(262, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/multi', '权限管理 / 菜单规则', '{"action":"","ids":"99","params":"ismenu=0"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 1756029902),
	(263, 1, 'admin', '/oYtJBLQSfE.php/index/login', '登录', '{"__token__":"***","username":"admin","password":"***","captcha":"w9qd"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757668048),
	(264, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13000000000","email":"admin@163.com","password":"***","level":"0","deal_count":"0","money":"100.11","score":"0","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757668068),
	(265, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757675807),
	(266, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757675810),
	(267, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757675813),
	(268, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757677559),
	(269, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00|23:00","withdraw_time":"02:00|20:00"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757684555),
	(270, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13000000000","email":"admin@163.com","password":"***","level":"1","deal_count":"0","money":"100.11","score":"0","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757684577),
	(271, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/32', '在线命令管理 / 再次执行命令', '{"ids":"32"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757920286),
	(272, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921307),
	(273, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_fixed_deposit"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921311),
	(274, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921352),
	(275, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921352),
	(276, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921352),
	(277, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921352),
	(278, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921355),
	(279, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921355),
	(280, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_m_fixed_deposit","controller":"order\\/FixedDeposit","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","nickname"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921378),
	(281, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_m_fixed_deposit","controller":"order\\/FixedDeposit","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","nickname"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921379),
	(282, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921382),
	(283, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["fix"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"fix"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921385),
	(284, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921386),
	(285, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/FixedDeposit.php","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921388),
	(286, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"order\\/FixedDeposit.php","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757921390),
	(287, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757923694),
	(288, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/34', '在线命令管理 / 再次执行命令', '{"ids":"34"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757923706),
	(289, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757923710),
	(290, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757923713),
	(291, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757923740),
	(292, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13000000000","email":"admin@163.com","password":"***","level":"1","deal_count":"1","money":"22269.11","score":"0","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757923798),
	(293, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/39', '在线命令管理 / 再次执行命令', '{"ids":"39"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1757924097),
	(294, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289588),
	(295, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_m_bankinfo"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289594),
	(296, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289608),
	(297, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289608),
	(298, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289608),
	(299, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289608),
	(300, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289612),
	(301, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_user"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289612),
	(302, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_m_bankinfo","controller":"user\\/Bankinfo","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","mobile"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289625),
	(303, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"crud","isrelation":"1","local":"1","delete":"0","force":"0","table":"fa_m_bankinfo","controller":"user\\/Bankinfo","model":"","relation":{"2":{"relation":"fa_user","relationmode":"belongsto","relationforeignkey":"user_id","relationprimarykey":"id","relationfields":["username","mobile"]}},"setcheckboxsuffix":"","enumradiosuffix":"","imagefield":"","filefield":"","intdatesuffix":"","switchsuffix":"","citysuffix":"","selectpagesuffix":"","selectpagessuffix":"","ignorefields":"","sortfield":"","editorsuffix":"","headingfilterfield":"","tagsuffix":"","jsonsuffix":"","fixedcolumns":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289626),
	(304, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289629),
	(305, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":["bank"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":"bank"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289631),
	(306, 1, 'admin', '/oYtJBLQSfE.php/command/get_controller_list', '在线命令管理', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["name","ASC"]],"searchTable":"tbl","showField":"name","keyField":"id","searchField":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289632),
	(307, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"user\\/Bankinfo.php","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289634),
	(308, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"menu","allcontroller":"0","delete":"0","force":"0","controllerfile_text":"","controllerfile":"user\\/Bankinfo.php","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289634),
	(309, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/edit/ids/161?dialog=1', '权限管理 / 菜单规则 / 编辑', '{"dialog":"1","__token__":"***","row":{"ismenu":"1","pid":"66","name":"user\\/bankinfo","title":"收款管理","url":"","icon":"fa fa-circle-o","condition":"","menutype":"addtabs","extend":"","remark":"","weigh":"0","status":"normal"},"ids":"161"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758289665),
	(310, 1, 'admin', '/oYtJBLQSfE.php/user/user/money?ids=1&dialog=1', '会员管理 / 会员管理', '{"ids":"1","dialog":"1","__token__":"***","row":{"id":"1","money":"-69.11"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758299406),
	(311, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13000000000","email":"admin@gmail.com","level":"1","deal_count":"1","money":"20200.00","score":"0","signiture":"S","password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758432716),
	(312, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758432813),
	(313, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758432816),
	(314, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758432818),
	(315, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00|23:00","withdraw_time":"02:00|20:00","currency":"$"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758455585),
	(316, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00|23:00","withdraw_time":"02:00|20:00","currency":"$","purchase_amount":"10000"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758456094),
	(317, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00|23:00","withdraw_time":"02:00|20:00","currency":"$","purchase_amount":"1000000"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758456156),
	(318, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00-23:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"1000000"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758460157),
	(319, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00-20:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"1000000"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758460292),
	(320, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"10","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00-20:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"1000"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758460314),
	(321, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/44', '在线命令管理 / 再次执行命令', '{"ids":"44"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758529669),
	(322, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"8","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"14:00-20:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"1000","customer_service1":"","customer_service2":""}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758539905),
	(323, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599018),
	(324, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["1"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599019),
	(325, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["100"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["title","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"100"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599020),
	(326, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599202),
	(327, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["2"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"2"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599203),
	(328, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["21"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"21"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599204),
	(329, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=1&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"1","dialog":"1","row":{"sort_id":"4","product_id":["21","","","","","","","","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599234),
	(330, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":["21"],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":"21"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599245),
	(331, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=1&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"1","dialog":"1","row":{"sort_id":"4","product_id":["5555555555555","1","","","","","","","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599248),
	(332, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"8","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"11:00-20:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"1000","customer_service1":"","customer_service2":""}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758599842),
	(333, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","row":{"username":"test","nickname":"test","mobile":"13000000000","email":"test@11.com","level":"1","deal_count":"0","money":"0","score":"0","signiture":"","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758682334),
	(334, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","row":{"username":"test","nickname":"test","mobile":"13000000000","email":"test@11.com","level":"1","deal_count":"0","money":"0","score":"0","signiture":"","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758682336),
	(335, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","row":{"username":"test","nickname":"test","mobile":"13000000000","email":"test@11.com","level":"1","deal_count":"0","money":"0","score":"0","signiture":"","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758682337),
	(336, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"username":"test","nickname":"test","mobile":"13000000000","email":"test@11.com","level":"1","deal_count":"0","money":"0","score":"0","signiture":"S","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758682363),
	(337, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"username":"test1","nickname":"test1","mobile":"13000000001","email":"test@11.com","invite_code":"0tnJqG","level":"1","deal_count":"0","money":"0","score":"0","signiture":"S","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758682799),
	(338, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"username":"admin","nickname":"admin","mobile":"13000000000","email":"admin@163.com","invite_code":"fdYtNc","level":"1","deal_count":"0","money":"0","score":"0","signiture":"S","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758683287),
	(339, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"username":"admin","mobile":"13000000000","level":"1","money":"0","score":"0","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758683701),
	(340, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"username":"admin1","mobile":"13000000000","level":"1","money":"0","score":"0","password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758683705),
	(341, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","nickname":"admin","mobile":"13000000000","email":"admin@163.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","password":"***","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758683785),
	(342, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","username":"admin2","nickname":"admin","mobile":"13000000000","email":"admin@163.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","password":"***","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758683796),
	(343, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","username":"admin2","nickname":"admin2","mobile":"13000000000","email":"admin@163.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","password":"***","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758683802),
	(344, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/4?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"4","username":"admin2","nickname":"admin2","mobile":"13000000003","email":"admin@163.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","password":"***","status":"normal"},"ids":"4"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758683805),
	(345, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13000000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758693648),
	(346, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758693662),
	(347, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758693666),
	(348, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758693744),
	(349, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758693812),
	(350, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758693827),
	(351, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758693882),
	(352, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758694004),
	(353, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758694034),
	(354, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758694065),
	(355, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"20270.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal","pay_salt":"***"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758694427),
	(356, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"0","username":"test12","mobile":"13000000002","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758810671),
	(357, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"0","username":"test12","mobile":"13000000002","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758810680),
	(358, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"0","username":"test12","mobile":"13000000002","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal","pay_salt":"***","nickname":"test12","email":"test12@gamil.com","invite_code":"gC6Jld"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758810788),
	(359, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"2","username":"test13","mobile":"13000000003","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758810932),
	(360, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"2","username":"test13","mobile":"13000000006","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal","salt":"***","pay_salt":"***","nickname":"test13","email":"test13@gamil.com","invite_code":"HuKa2y"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758810936),
	(361, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758857990),
	(362, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758858026),
	(363, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"8","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"11:00-21:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"1000","customer_service1":"","customer_service2":"","min_price":"50","max_price":"100"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758889279),
	(364, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"4","money":"1269.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896727),
	(365, 1, 'admin', '/oYtJBLQSfE.php/data/product/edit/ids/2?dialog=1', '数据管理 / 产品列表 / 编辑', '{"dialog":"1","row":{"title":"ttt","images":"http:\\/\\/fish.test\\/assets\\/img\\/qrcode.png,\\/assets\\/img\\/qrcode.png","content":"45346","price":"430.00","number":"30"},"ids":"2"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896756),
	(366, 1, 'admin', '/oYtJBLQSfE.php/data/product/edit/ids/3?dialog=1', '数据管理 / 产品列表 / 编辑', '{"dialog":"1","row":{"title":"sgsgsdgdg","images":"\\/assets\\/img\\/qrcode.png","content":"","price":"660.00","number":"1"},"ids":"3"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896762),
	(367, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896784),
	(368, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896786),
	(369, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896798),
	(370, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896800),
	(371, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896805),
	(372, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896806),
	(373, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=1&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"1","dialog":"1","row":{"sort_id":"6","product_id":["ttt","2","ttt","2","sgsgsdgdg","3","","","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896810),
	(374, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"8","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"11:00-23:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"1000","customer_service1":"","customer_service2":"","min_price":"50","max_price":"100"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758896830),
	(375, 1, 'admin', '/oYtJBLQSfE.php/user/user/money?ids=1&dialog=1', '会员管理 / 会员管理', '{"ids":"1","dialog":"1","__token__":"***","row":{"id":"1","money":"300"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758897009),
	(376, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758897229),
	(377, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758897243),
	(378, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758897244),
	(379, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758897246),
	(380, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=1&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"1","dialog":"1","row":{"sort_id":"1","product_id":["sgsgsdgdg","3","sgsgsdgdg","3","sgsgsdgdg","3","","","",""],"number":["1","1","1","1","1"],"commission_rate":["5.00","5.00","5","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758897254),
	(381, 1, 'admin', '/oYtJBLQSfE.php/user/user/money?ids=1&dialog=1', '会员管理 / 会员管理', '{"ids":"1","dialog":"1","__token__":"***","row":{"id":"1","money":"346"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758897689),
	(382, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758955775),
	(383, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"0","money":"879.80","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758965925),
	(384, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"8","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"11:00-23:00","withdraw_time":"02:00-20:00","currency":"$","purchase_amount":"300","customer_service1":"","customer_service2":"","min_price":"50","max_price":"100"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758965946),
	(385, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"1","money":"2219.80","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758989017),
	(386, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758989119),
	(387, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758989135),
	(388, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758989209),
	(389, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"2","money":"1010.60","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758989485),
	(390, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"3","money":"1330.40","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1758989510),
	(391, 1, 'admin', '/oYtJBLQSfE.php/order/order/refresh/ids/1', '订单管理 / 订单列表', '{"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759044143),
	(392, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","username":"admin","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"1","money":"109.60","score":"0","signiture":"S","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759044504),
	(393, 1, 'admin', '/oYtJBLQSfE.php/user/user/money?ids=1&dialog=1', '会员管理 / 会员管理', '{"ids":"1","dialog":"1","__token__":"***","row":{"id":"1","money":"1000"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759044541),
	(394, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759045037),
	(395, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759045039),
	(396, 1, 'admin', '/oYtJBLQSfE.php/data/product/search_products', '数据管理 / 产品列表', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"OR ","orderBy":[["price","ASC"]],"searchTable":"tbl","showField":"title","keyField":"id","searchField":["price"],"price":""}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759045042),
	(397, 1, 'admin', '/oYtJBLQSfE.php/order/order_mark/add?user_id=1&dialog=1&dialog=1', '订单管理 / 派单列表 / 添加', '{"user_id":"1","dialog":"1","row":{"sort_id":"3","product_id":["5555555555555","1","ttt","2","sgsgsdgdg","3","","","",""],"number":["1","1","1","1","1"],"commission_rate":["3.00","3.00","3.00","3.00","3.00"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759045047),
	(398, 1, 'admin', '/oYtJBLQSfE.php/user/user/money?ids=1&dialog=1', '会员管理 / 会员管理', '{"ids":"1","dialog":"1","__token__":"***","row":{"id":"1","money":"140"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759045435),
	(399, 1, 'admin', '/oYtJBLQSfE.php/auth/rule/multi', '权限管理 / 菜单规则', '{"action":"","ids":"99","params":"ismenu=1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759124122),
	(400, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759126174),
	(401, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759126177),
	(402, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759126177),
	(403, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/46', '在线命令管理 / 再次执行命令', '{"ids":"46"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759128936),
	(404, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/8?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"8","username":"test13","nickname":"test13","mobile":"13000000006","email":"test13@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"1","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"8"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759130404),
	(405, 1, 'admin', '/oYtJBLQSfE.php/index/login', '登录', '{"__token__":"***","username":"admin","password":"***","captcha":"ht28"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759144981),
	(406, 1, 'admin', '/oYtJBLQSfE.php/command/get_field_list', '在线命令管理', '{"table":"fa_admin"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759144991),
	(407, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/command', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"command"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759144994),
	(408, 1, 'admin', '/oYtJBLQSfE.php/command/command/action/execute', '在线命令管理 / 生成并执行命令', '{"commandtype":"api","force":"1","url":"","output":"","template":"","language":"","title":"","author":"","module":"","addon":"","action":"execute"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759144995),
	(409, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"1","username":"admin12","mobile":"13100000012","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal","nickname":"admin12","email":"admin12@gamil.com","invite_code":"fEMKIJ"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759156132),
	(410, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"1","username":"admin13","mobile":"13100000014","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759156449),
	(411, 1, 'admin', '/oYtJBLQSfE.php/user/user/add?dialog=1', '会员管理 / 会员管理 / 添加', '{"dialog":"1","__token__":"***","row":{"pid":"3","username":"admin15","mobile":"13100000015","level":"1","money":"0","score":"0","password":"***","pay_password":"***","status":"normal"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759156610),
	(412, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/48', '在线命令管理 / 再次执行命令', '{"ids":"48"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759168266),
	(413, 1, 'admin', '/oYtJBLQSfE.php/user/user/money?ids=1&dialog=1', '会员管理 / 会员管理', '{"ids":"1","dialog":"1","__token__":"***","row":{"id":"1","money":"11"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759168565),
	(414, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","username":"你好","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219095),
	(415, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","username":"你好","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219111),
	(416, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","username":"你好","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219143),
	(417, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219152),
	(418, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219272),
	(419, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219278),
	(420, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219295),
	(421, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219308),
	(422, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/12?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"12","nickname":"admin15","mobile":"13100000015","email":"admin15@gamil.com","level":"1","deal_count":"0","money":"0.00","score":"0","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"12"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759219325),
	(423, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"7","money":"1938.30","score":"5","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759234986),
	(424, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"7","money":"1938.30","score":"5","signiture":"S","sign_normal":"0","sign_fillup":"0","password":"***","pay_password":"***","status":"normal","pay_salt":"***"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759234998),
	(425, 1, 'admin', '/oYtJBLQSfE.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{"__token__":"***","row":{"register_amount":"8","level1_rate":"5","level2_rate":"3","level3_rate":"1","auto_upgrade":"1","order_time":"11:00-23:00","withdraw_time":"02:00-21:00","currency":"$","purchase_amount":"300","customer_service1":"","customer_service2":"","min_price":"50","max_price":"100","login_method":"1"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759235016),
	(426, 1, 'admin', '/oYtJBLQSfE.php/command/execute/ids/49', '在线命令管理 / 再次执行命令', '{"ids":"49"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759236451),
	(427, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"7","money":"1827.30","score":"5","signiture":"S","sign_normal":"0","sign_fillups":"0","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759238501),
	(428, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"7","money":"1827.30","score":"5","signiture":"S","sign_normal":"0","sign_fillupgdg":"0","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759238534),
	(429, 1, 'admin', '/oYtJBLQSfE.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{"dialog":"1","__token__":"***","row":{"id":"1","nickname":"admin","mobile":"13100000000","email":"admin@gmail.com","level":"1","deal_count":"7","money":"1827.30","score":"5","signiture":"S","sign_normal":"0","sign_fillupgdg":"0","password":"***","pay_password":"***","status":"normal"},"ids":"1"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 1759238542);
/*!40000 ALTER TABLE `fa_admin_log` ENABLE KEYS */;

-- 导出  表 fish.fa_area 结构
CREATE TABLE IF NOT EXISTS `fa_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) DEFAULT NULL COMMENT '简称',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区表';

-- 正在导出表  fish.fa_area 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `fa_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_area` ENABLE KEYS */;

-- 导出  表 fish.fa_attachment 结构
CREATE TABLE IF NOT EXISTS `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) DEFAULT '' COMMENT '类别',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) DEFAULT '' COMMENT '物理路径',
  `imagewidth` int(10) unsigned DEFAULT '0' COMMENT '宽度',
  `imageheight` int(10) unsigned DEFAULT '0' COMMENT '高度',
  `imagetype` varchar(30) DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) DEFAULT '' COMMENT '透传数据',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建日期',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` bigint(16) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='附件表';

-- 正在导出表  fish.fa_attachment 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `fa_attachment` DISABLE KEYS */;
INSERT IGNORE INTO `fa_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
	(1, '', 1, 0, '/assets/img/qrcode.png', 150, 150, 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
/*!40000 ALTER TABLE `fa_attachment` ENABLE KEYS */;

-- 导出  表 fish.fa_auth_group 结构
CREATE TABLE IF NOT EXISTS `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='分组表';

-- 正在导出表  fish.fa_auth_group 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `fa_auth_group` DISABLE KEYS */;
INSERT IGNORE INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
	(1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal'),
	(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal'),
	(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal'),
	(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal'),
	(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');
/*!40000 ALTER TABLE `fa_auth_group` ENABLE KEYS */;

-- 导出  表 fish.fa_auth_group_access 结构
CREATE TABLE IF NOT EXISTS `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限分组表';

-- 正在导出表  fish.fa_auth_group_access 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `fa_auth_group_access` DISABLE KEYS */;
INSERT IGNORE INTO `fa_auth_group_access` (`uid`, `group_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `fa_auth_group_access` ENABLE KEYS */;

-- 导出  表 fish.fa_auth_rule 结构
CREATE TABLE IF NOT EXISTS `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `url` varchar(255) DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) DEFAULT '' COMMENT '条件',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COMMENT='节点表';

-- 正在导出表  fish.fa_auth_rule 的数据：~193 rows (大约)
/*!40000 ALTER TABLE `fa_auth_rule` DISABLE KEYS */;
INSERT IGNORE INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
	(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal'),
	(2, 'file', 0, 'general', '常规管理', 'fa fa-cogs', '', '', '', 1, 'addtabs', '', 'cggl', 'changguiguanli', 1491635035, 1756005018, 130, 'normal'),
	(3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 0, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1491635035, 119, 'normal'),
	(4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 1, NULL, '', 'cjgl', 'chajianguanli', 1491635035, 1755931093, 0, 'normal'),
	(5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal'),
	(6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal'),
	(7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal'),
	(8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal'),
	(9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal'),
	(10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal'),
	(11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal'),
	(12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal'),
	(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal'),
	(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal'),
	(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal'),
	(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal'),
	(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal'),
	(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal'),
	(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal'),
	(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal'),
	(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal'),
	(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal'),
	(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal'),
	(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal'),
	(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal'),
	(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal'),
	(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal'),
	(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal'),
	(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal'),
	(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal'),
	(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal'),
	(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal'),
	(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal'),
	(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal'),
	(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal'),
	(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal'),
	(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal'),
	(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal'),
	(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal'),
	(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal'),
	(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal'),
	(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal'),
	(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal'),
	(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal'),
	(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal'),
	(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal'),
	(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal'),
	(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal'),
	(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal'),
	(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal'),
	(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal'),
	(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal'),
	(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal'),
	(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal'),
	(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(66, 'file', 0, 'user', '会员管理', 'fa fa-user-circle', '', '', '', 1, 'addtabs', '', 'hygl', 'huiyuanguanli', 1491635035, 1756005000, 132, 'normal'),
	(67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal'),
	(68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 0, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1755841172, 0, 'normal'),
	(74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1755841163, 0, 'normal'),
	(80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal'),
	(85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', '', 1, NULL, '', 'zxmlgl', 'zaixianminglingguanli', 1755750935, 1755750935, 0, 'normal'),
	(86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755750935, 1755750935, 0, 'normal'),
	(87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755750935, 1755750935, 0, 'normal'),
	(88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xq', 'xiangqing', 1755750935, 1755750935, 0, 'normal'),
	(89, 'file', 85, 'command/command', '生成并执行命令', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'scbzxml', 'shengchengbingzhixingmingling', 1755750935, 1755750935, 0, 'normal'),
	(90, 'file', 85, 'command/execute', '再次执行命令', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zczxml', 'zaicizhixingmingling', 1755750935, 1755750935, 0, 'normal'),
	(91, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755750935, 1755750935, 0, 'normal'),
	(92, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755750935, 1755750935, 0, 'normal'),
	(93, 'file', 2, 'general/crontab', '定时任务', 'fa fa-tasks', '', '', '按照设定的时间进行任务的执行,目前支持三种任务:请求URL、执行SQL、执行Shell。', 1, NULL, '', 'dsrw', 'dingshirenwu', 1755750983, 1755750983, 0, 'normal'),
	(94, 'file', 93, 'general/crontab/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755750983, 1755750983, 0, 'normal'),
	(95, 'file', 93, 'general/crontab/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755750983, 1755750983, 0, 'normal'),
	(96, 'file', 93, 'general/crontab/edit', '编辑 ', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755750983, 1755750983, 0, 'normal'),
	(97, 'file', 93, 'general/crontab/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755750983, 1755750983, 0, 'normal'),
	(98, 'file', 93, 'general/crontab/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755750983, 1755750983, 0, 'normal'),
	(99, 'file', 0, 'signin', '签到管理', 'fa fa-map-marker', '', '', '', 1, NULL, '', 'qdgl', 'qiandaoguanli', 1755751123, 1759124122, 0, 'normal'),
	(100, 'file', 99, 'signin/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755751123, 1755751123, 0, 'normal'),
	(101, 'file', 99, 'signin/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755751123, 1755751123, 0, 'normal'),
	(102, 'file', 99, 'signin/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755751123, 1755751123, 0, 'normal'),
	(103, 'file', 99, 'signin/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755751123, 1755751123, 0, 'normal'),
	(104, 'file', 99, 'signin/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755751123, 1755751123, 0, 'normal'),
	(105, 'file', 0, 'order', '订单管理', 'fa fa-list', '', '', '', 1, 'addtabs', '', 'ddgl', 'dingdanguanli', 1755756295, 1755756324, 138, 'normal'),
	(106, 'file', 105, 'order/order', '订单列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'ddlb', 'dingdanliebiao', 1755756295, 1755756361, 0, 'normal'),
	(107, 'file', 106, 'order/order/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755756295, 1755756295, 0, 'normal'),
	(108, 'file', 106, 'order/order/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755756295, 1755756295, 0, 'normal'),
	(109, 'file', 106, 'order/order/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755756295, 1755756295, 0, 'normal'),
	(110, 'file', 106, 'order/order/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755756295, 1755756295, 0, 'normal'),
	(111, 'file', 106, 'order/order/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755756295, 1755756295, 0, 'normal'),
	(112, 'file', 105, 'order/order_charge', '充值订单', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'czdd', 'chongzhidingdan', 1755756492, 1755756537, 0, 'normal'),
	(113, 'file', 112, 'order/order_charge/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755756492, 1755756492, 0, 'normal'),
	(114, 'file', 112, 'order/order_charge/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755756492, 1755756492, 0, 'normal'),
	(115, 'file', 112, 'order/order_charge/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755756492, 1755756492, 0, 'normal'),
	(116, 'file', 112, 'order/order_charge/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755756492, 1755756492, 0, 'normal'),
	(117, 'file', 112, 'order/order_charge/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755756492, 1755756492, 0, 'normal'),
	(118, 'file', 105, 'order/order_withdraw', '提现订单', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'txdd', 'tixiandingdan', 1755756492, 1755756548, 0, 'normal'),
	(119, 'file', 118, 'order/order_withdraw/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755756492, 1755756492, 0, 'normal'),
	(120, 'file', 118, 'order/order_withdraw/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755756493, 1755756493, 0, 'normal'),
	(121, 'file', 118, 'order/order_withdraw/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755756493, 1755756493, 0, 'normal'),
	(122, 'file', 118, 'order/order_withdraw/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755756493, 1755756493, 0, 'normal'),
	(123, 'file', 118, 'order/order_withdraw/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755756493, 1755756493, 0, 'normal'),
	(124, 'file', 0, 'data', '数据管理', 'fa fa-list', '', '', '', 1, 'addtabs', '', 'sjgl', 'shujuguanli', 1755756493, 1755756522, 138, 'normal'),
	(125, 'file', 124, 'data/news', '资讯列管理', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'zxlgl', 'zixunlieguanli', 1755756493, 1755756493, 0, 'normal'),
	(126, 'file', 125, 'data/news/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755756493, 1755756493, 0, 'normal'),
	(127, 'file', 125, 'data/news/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755756493, 1755756493, 0, 'normal'),
	(128, 'file', 125, 'data/news/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755756493, 1755756493, 0, 'normal'),
	(129, 'file', 125, 'data/news/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755756493, 1755756493, 0, 'normal'),
	(130, 'file', 125, 'data/news/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755756493, 1755756493, 0, 'normal'),
	(131, 'file', 124, 'data/product', '产品列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'cplb', 'chanpinliebiao', 1755756493, 1755756563, 4, 'normal'),
	(132, 'file', 131, 'data/product/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755756493, 1755756493, 0, 'normal'),
	(133, 'file', 131, 'data/product/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755756493, 1755756493, 0, 'normal'),
	(134, 'file', 131, 'data/product/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755756493, 1755756493, 0, 'normal'),
	(135, 'file', 131, 'data/product/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755756493, 1755756493, 0, 'normal'),
	(136, 'file', 131, 'data/product/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755756493, 1755756493, 0, 'normal'),
	(137, 'file', 105, 'order/order_mark', '派单列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'pdlb', 'paidanliebiao', 1755795136, 1755795160, 0, 'normal'),
	(138, 'file', 137, 'order/order_mark/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755795136, 1755795136, 0, 'normal'),
	(139, 'file', 137, 'order/order_mark/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755795136, 1755795136, 0, 'normal'),
	(140, 'file', 137, 'order/order_mark/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755795136, 1755795136, 0, 'normal'),
	(141, 'file', 137, 'order/order_mark/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755795136, 1755795136, 0, 'normal'),
	(142, 'file', 137, 'order/order_mark/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755795136, 1755795136, 0, 'normal'),
	(143, 'file', 124, 'data/level', '等级列表', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'djlb', 'dengjiliebiao', 1755839778, 1755839798, 0, 'normal'),
	(144, 'file', 143, 'data/level/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755839778, 1755839778, 0, 'normal'),
	(145, 'file', 143, 'data/level/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755839778, 1755839778, 0, 'normal'),
	(146, 'file', 143, 'data/level/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755839778, 1755839778, 0, 'normal'),
	(147, 'file', 143, 'data/level/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755839778, 1755839778, 0, 'normal'),
	(148, 'file', 143, 'data/level/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755839778, 1755839778, 0, 'normal'),
	(149, 'file', 66, 'user/money_log', '会员余额变动管理', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hyyebdgl', 'huiyuanyuebiandongguanli', 1755842695, 1755842695, 0, 'normal'),
	(150, 'file', 149, 'user/money_log/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1755842695, 1755870904, 0, 'normal'),
	(151, 'file', 149, 'user/money_log/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1755842695, 1755870904, 0, 'normal'),
	(152, 'file', 149, 'user/money_log/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1755842695, 1755870904, 0, 'normal'),
	(153, 'file', 149, 'user/money_log/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1755842695, 1755870904, 0, 'normal'),
	(154, 'file', 149, 'user/money_log/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1755842695, 1755870904, 0, 'normal'),
	(155, 'file', 105, 'order/fixed_deposit', 'FixedDeposit', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'F', 'FixedDeposit', 1757921389, 1757921389, 0, 'normal'),
	(156, 'file', 155, 'order/fixed_deposit/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1757921390, 1757921390, 0, 'normal'),
	(157, 'file', 155, 'order/fixed_deposit/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1757921390, 1757921390, 0, 'normal'),
	(158, 'file', 155, 'order/fixed_deposit/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1757921390, 1757921390, 0, 'normal'),
	(159, 'file', 155, 'order/fixed_deposit/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1757921390, 1757921390, 0, 'normal'),
	(160, 'file', 155, 'order/fixed_deposit/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1757921390, 1757921390, 0, 'normal'),
	(161, 'file', 66, 'user/bankinfo', '收款管理', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'skgl', 'shoukuanguanli', 1758289634, 1758289665, 0, 'normal'),
	(162, 'file', 161, 'user/bankinfo/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1758289634, 1758289634, 0, 'normal'),
	(163, 'file', 161, 'user/bankinfo/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1758289634, 1758289634, 0, 'normal'),
	(164, 'file', 161, 'user/bankinfo/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1758289634, 1758289634, 0, 'normal'),
	(165, 'file', 161, 'user/bankinfo/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1758289634, 1758289634, 0, 'normal'),
	(166, 'file', 161, 'user/bankinfo/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1758289634, 1758289634, 0, 'normal');
/*!40000 ALTER TABLE `fa_auth_rule` ENABLE KEYS */;

-- 导出  表 fish.fa_category 结构
CREATE TABLE IF NOT EXISTS `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `flag` set('hot','index','recommend') DEFAULT '',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) DEFAULT '' COMMENT '自定义名称',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- 正在导出表  fish.fa_category 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `fa_category` DISABLE KEYS */;
INSERT IGNORE INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
	(1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1491635035, 1491635035, 1, 'normal'),
	(2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1491635035, 1491635035, 2, 'normal'),
	(3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1491635035, 1491635035, 3, 'normal'),
	(4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1491635035, 1491635035, 4, 'normal'),
	(5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1491635035, 1491635035, 5, 'normal'),
	(6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1491635035, 1491635035, 6, 'normal'),
	(7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1491635035, 1491635035, 7, 'normal'),
	(8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1491635035, 1491635035, 8, 'normal'),
	(9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1491635035, 1491635035, 9, 'normal'),
	(10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1491635035, 1491635035, 10, 'normal'),
	(11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1491635035, 1491635035, 11, 'normal'),
	(12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1491635035, 1491635035, 12, 'normal'),
	(13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1491635035, 1491635035, 13, 'normal');
/*!40000 ALTER TABLE `fa_category` ENABLE KEYS */;

-- 导出  表 fish.fa_command 结构
CREATE TABLE IF NOT EXISTS `fa_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` bigint(16) unsigned DEFAULT NULL COMMENT '执行时间',
  `createtime` bigint(16) unsigned DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='在线命令表';

-- 正在导出表  fish.fa_command 的数据：~49 rows (大约)
/*!40000 ALTER TABLE `fa_command` DISABLE KEYS */;
INSERT IGNORE INTO `fa_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES
	(1, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755751870, 1755751870, 1755751870, 'successed'),
	(2, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755753751, 1755753751, 1755753751, 'successed'),
	(3, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755754660, 1755754660, 1755754660, 'successed'),
	(4, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755755516, 1755755516, 1755755517, 'successed'),
	(5, 'crud', '["--table=fa_m_order","--controller=order\\/Order","--relation=fa_user","--relationmode=belongsto","--relationforeignkey=user_id","--relationprimarykey=id","--relationfields=username,mobile"]', 'php think crud --table=fa_m_order --controller=order/Order --relation=fa_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,mobile', 'Build Successed', 1755756280, 1755756280, 1755756280, 'successed'),
	(6, 'menu', '["--controller=order\\/Order"]', 'php think menu --controller=order/Order', 'Build Successed!', 1755756295, 1755756295, 1755756295, 'successed'),
	(7, 'crud', '["--table=fa_m_product","--controller=data\\/Product"]', 'php think crud --table=fa_m_product --controller=data/Product', 'Build Successed', 1755756431, 1755756431, 1755756431, 'successed'),
	(8, 'crud', '["--table=fa_m_news","--controller=data\\/News"]', 'php think crud --table=fa_m_news --controller=data/News', 'Build Successed', 1755756440, 1755756440, 1755756440, 'successed'),
	(9, 'crud', '["--table=fa_m_order_charge","--controller=order\\/OrderCharge"]', 'php think crud --table=fa_m_order_charge --controller=order/OrderCharge', 'Build Successed', 1755756460, 1755756460, 1755756460, 'successed'),
	(10, 'crud', '["--table=fa_m_order_withdraw","--controller=order\\/OrderWithdraw"]', 'php think crud --table=fa_m_order_withdraw --controller=order/OrderWithdraw', 'Build Successed', 1755756470, 1755756470, 1755756470, 'successed'),
	(11, 'menu', '["--controller=order\\/OrderCharge","--controller=order\\/OrderWithdraw","--controller=data\\/News","--controller=data\\/Product"]', 'php think menu --controller=order/OrderCharge --controller=order/OrderWithdraw --controller=data/News --controller=data/Product', 'Build Successed!', 1755756492, 1755756492, 1755756493, 'successed'),
	(12, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755774447, 1755774447, 1755774447, 'successed'),
	(13, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755774850, 1755774850, 1755774850, 'successed'),
	(14, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755774889, 1755774889, 1755774889, 'successed'),
	(15, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755784732, 1755784732, 1755784732, 'successed'),
	(16, 'crud', '["--table=fa_m_order_mark","--controller=order\\/OrderMark"]', 'php think crud --table=fa_m_order_mark --controller=order/OrderMark', 'Build Successed', 1755795127, 1755795127, 1755795127, 'successed'),
	(17, 'menu', '["--controller=order\\/OrderMark"]', 'php think menu --controller=order/OrderMark', 'Build Successed!', 1755795136, 1755795136, 1755795136, 'successed'),
	(18, 'crud', '["--table=fa_m_level","--controller=data\\/Level"]', 'php think crud --table=fa_m_level --controller=data/Level', 'Build Successed', 1755839769, 1755839769, 1755839769, 'successed'),
	(19, 'menu', '["--controller=data\\/Level"]', 'php think menu --controller=data/Level', 'Build Successed!', 1755839778, 1755839778, 1755839778, 'successed'),
	(20, 'crud', '["--table=fa_user_money_log","--controller=user\\/MoneyLog","--relation=fa_user","--relationmode=belongsto","--relationforeignkey=user_id","--relationprimarykey=id","--relationfields=username,mobile"]', 'php think crud --table=fa_user_money_log --controller=user/MoneyLog --relation=fa_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,mobile', 'Build Successed', 1755842685, 1755842685, 1755842685, 'successed'),
	(21, 'menu', '["--controller=user\\/MoneyLog"]', 'php think menu --controller=user/MoneyLog', 'Build Successed!', 1755842695, 1755842695, 1755842695, 'successed'),
	(22, 'menu', '["--controller=user\\/MoneyLog"]', 'php think menu --controller=user/MoneyLog', 'Build Successed!', 1755870609, 1755870609, 1755870609, 'successed'),
	(23, 'menu', '["--controller=user\\/MoneyLog"]', 'php think menu --controller=user/MoneyLog', 'Build Successed!', 1755870678, 1755870678, 1755870678, 'successed'),
	(24, 'menu', '["--controller=user\\/MoneyLog"]', 'php think menu --controller=user/MoneyLog', 'Build Successed!', 1755870904, 1755870904, 1755870904, 'successed'),
	(25, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755870967, 1755870967, 1755870967, 'successed'),
	(26, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755871084, 1755871084, 1755871084, 'successed'),
	(27, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755873186, 1755873186, 1755873186, 'successed'),
	(28, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755873737, 1755873737, 1755873737, 'successed'),
	(29, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755928544, 1755928544, 1755928544, 'successed'),
	(30, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1755929229, 1755929229, 1755929229, 'successed'),
	(31, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1757675813, 1757675813, 1757675813, 'successed'),
	(32, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1757677559, 1757677559, 1757677559, 'successed'),
	(33, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1757920285, 1757920285, 1757920286, 'successed'),
	(34, 'crud', '["--table=fa_m_fixed_deposit","--controller=order\\/FixedDeposit","--relation=fa_user","--relationmode=belongsto","--relationforeignkey=user_id","--relationprimarykey=id","--relationfields=username,nickname"]', 'php think crud --table=fa_m_fixed_deposit --controller=order/FixedDeposit --relation=fa_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'Build Successed', 1757921379, 1757921379, 1757921379, 'successed'),
	(35, 'menu', '["--controller=order\\/FixedDeposit"]', 'php think menu --controller=order/FixedDeposit', 'Build Successed!', 1757921389, 1757921389, 1757921390, 'successed'),
	(36, 'api', '["--force=1"]', 'php think api --force=1', NULL, 1757923700, 1757923700, 1757923700, 'failured'),
	(37, 'crud', '["--table=fa_m_fixed_deposit","--controller=order\\/FixedDeposit","--relation=fa_user","--relationmode=belongsto","--relationforeignkey=user_id","--relationprimarykey=id","--relationfields=username,nickname"]', 'php think crud --table=fa_m_fixed_deposit --controller=order/FixedDeposit --relation=fa_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', 1757923706, 1757923706, 1757923706, 'failured'),
	(38, 'api', '["--force=1"]', 'php think api --force=1', NULL, 1757923713, 1757923713, 1757923713, 'failured'),
	(39, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1757923740, 1757923740, 1757923740, 'successed'),
	(40, 'api', '["--force=1"]', 'php think api --force=1', NULL, 1757924074, 1757924074, 1757924074, 'failured'),
	(41, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1757924097, 1757924097, 1757924097, 'successed'),
	(42, 'crud', '["--table=fa_m_bankinfo","--controller=user\\/Bankinfo","--relation=fa_user","--relationmode=belongsto","--relationforeignkey=user_id","--relationprimarykey=id","--relationfields=username,mobile"]', 'php think crud --table=fa_m_bankinfo --controller=user/Bankinfo --relation=fa_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,mobile', 'Build Successed', 1758289626, 1758289626, 1758289626, 'successed'),
	(43, 'menu', '["--controller=user\\/Bankinfo"]', 'php think menu --controller=user/Bankinfo', 'Build Successed!', 1758289634, 1758289634, 1758289634, 'successed'),
	(44, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1758432817, 1758432817, 1758432818, 'successed'),
	(45, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1758529667, 1758529667, 1758529669, 'successed'),
	(46, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1759126177, 1759126177, 1759126177, 'successed'),
	(47, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1759128936, 1759128936, 1759128936, 'successed'),
	(48, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1759144995, 1759144995, 1759144995, 'successed'),
	(49, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1759168266, 1759168266, 1759168266, 'successed'),
	(50, 'api', '["--force=1"]', 'php think api --force=1', 'Build Successed!', 1759236451, 1759236451, 1759236451, 'successed');
/*!40000 ALTER TABLE `fa_command` ENABLE KEYS */;

-- 导出  表 fish.fa_config 结构
CREATE TABLE IF NOT EXISTS `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '变量名',
  `group` varchar(30) DEFAULT '' COMMENT '分组',
  `title` varchar(100) DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) DEFAULT '' COMMENT '可见条件',
  `value` text COMMENT '变量值',
  `content` text COMMENT '变量字典数据',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置';

-- 正在导出表  fish.fa_config 的数据：~32 rows (大约)
/*!40000 ALTER TABLE `fa_config` DISABLE KEYS */;
INSERT IGNORE INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES
	(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', 'Fish', '', 'required', '', ''),
	(2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', ''),
	(3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', ''),
	(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1.0.1', '', 'required', '', ''),
	(5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', ''),
	(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', ''),
	(7, 'languages', 'basic', 'Languages', '', 'array', '', '{"backend":"zh-cn","frontend":"zh-cn"}', '', 'required', '', ''),
	(8, 'fixedpage', 'basic', 'Fixed page', '请输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', ''),
	(9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{"default":"Default","page":"Page","article":"Article","test":"Test"}', '', '', '', ''),
	(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}', '', '', '', ''),
	(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '["请选择","SMTP"]', '', '', ''),
	(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', ''),
	(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', ''),
	(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '', '', '', '', ''),
	(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'password', '', '', '', '', '', ''),
	(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '["无","TLS","SSL"]', '', '', ''),
	(17, 'mail_from', 'email', 'Mail from', '', 'string', '', '', '', '', '', ''),
	(18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{"category1":"Category1","category2":"Category2","custom":"Custom"}', '', '', '', ''),
	(19, 'register_amount', 'user', '注册赠送金额', '注册赠送金额', 'string', '', '8', NULL, '', '', NULL),
	(20, 'level1_rate', 'user', '一级佣金(%)', '一级佣金(%)', 'string', '', '5', NULL, '', '', NULL),
	(21, 'level2_rate', 'user', '二级佣金(%)', '二级佣金(%)', 'string', '', '3', NULL, '', '', NULL),
	(22, 'level3_rate', 'user', '三级佣金(%)', '三级佣金(%)', 'string', '', '1', NULL, '', '', NULL),
	(23, 'auto_upgrade', 'user', '升级模式', '0关闭 1升级  2升降级', 'string', '', '1', NULL, '', '', NULL),
	(24, 'order_time', 'user', '做单时间段', '时分|时分', 'string', '', '11:00-23:00', NULL, '', '', NULL),
	(25, 'withdraw_time', 'user', '提现时间', '时分|时分', 'string', '', '02:00-21:00', NULL, '', '', NULL),
	(26, 'currency', 'user', '货币单位', '货币单位', 'string', '', '$', NULL, '', '', NULL),
	(27, 'purchase_amount', 'user', '起始交易金额', '起始交易金额', 'string', '', '300', NULL, '', '', NULL),
	(28, 'customer_service1', 'user', '客服1', '客服1', 'string', '', '', NULL, '', '', NULL),
	(29, 'customer_service2', 'user', '客服2', '客服2', 'string', '', '', NULL, '', '', NULL),
	(30, 'min_price', 'user', '最小金额(%)', '最小金额(%)', 'string', '', '50', NULL, '', '', NULL),
	(31, 'max_price', 'user', '最大金额(%)', '最大金额(%)', 'string', '', '100', NULL, '', '', NULL),
	(32, 'login_method', 'user', '登录方式', '1系统 2用户名 3手机号 4邮箱', 'string', '', '1', NULL, '', '', NULL);
/*!40000 ALTER TABLE `fa_config` ENABLE KEYS */;

-- 导出  表 fish.fa_crontab 结构
CREATE TABLE IF NOT EXISTS `fa_crontab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '延迟秒数执行',
  `maximums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大执行次数 0为不限',
  `executes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已经执行的次数',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `begintime` bigint(16) DEFAULT NULL COMMENT '开始时间',
  `endtime` bigint(16) DEFAULT NULL COMMENT '结束时间',
  `executetime` bigint(16) DEFAULT NULL COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表';

-- 正在导出表  fish.fa_crontab 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `fa_crontab` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_crontab` ENABLE KEYS */;

-- 导出  表 fish.fa_crontab_log 结构
CREATE TABLE IF NOT EXISTS `fa_crontab_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crontab_id` int(10) DEFAULT NULL COMMENT '任务ID',
  `executetime` bigint(16) DEFAULT NULL COMMENT '执行时间',
  `completetime` bigint(16) DEFAULT NULL COMMENT '结束时间',
  `content` text COMMENT '执行结果',
  `processid` int(10) DEFAULT '0' COMMENT '进程ID',
  `status` enum('success','failure','inprogress') DEFAULT 'failure' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `crontab_id` (`crontab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志表';

-- 正在导出表  fish.fa_crontab_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `fa_crontab_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_crontab_log` ENABLE KEYS */;

-- 导出  表 fish.fa_ems 结构
CREATE TABLE IF NOT EXISTS `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮箱验证码表';

-- 正在导出表  fish.fa_ems 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `fa_ems` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_ems` ENABLE KEYS */;

-- 导出  表 fish.fa_membership_chain 结构
CREATE TABLE IF NOT EXISTS `fa_membership_chain` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ancestral_id` int(11) NOT NULL DEFAULT '0' COMMENT '祖先ID',
  `level` int(11) DEFAULT '1' COMMENT '当前所处关键链的层次，顶端是0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ss` (`user_id`,`ancestral_id`) USING BTREE,
  KEY `ancestral_id` (`ancestral_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员关系链';

-- 正在导出表  fish.fa_membership_chain 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `fa_membership_chain` DISABLE KEYS */;
INSERT IGNORE INTO `fa_membership_chain` (`id`, `user_id`, `ancestral_id`, `level`) VALUES
	(2, 2, 1, 1),
	(3, 3, 2, 1),
	(4, 3, 1, 2),
	(5, 4, 3, 1),
	(6, 4, 2, 2),
	(7, 4, 1, 3),
	(8, 1, 1, 1),
	(9, 12, 3, 1),
	(10, 12, 2, 2),
	(11, 12, 1, 3);
/*!40000 ALTER TABLE `fa_membership_chain` ENABLE KEYS */;

-- 导出  表 fish.fa_m_bankinfo 结构
CREATE TABLE IF NOT EXISTS `fa_m_bankinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `bank_name` varchar(30) NOT NULL DEFAULT '',
  `card_num` varchar(38) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `erc20` varchar(50) NOT NULL DEFAULT '',
  `trc20` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(120) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  fish.fa_m_bankinfo 的数据：2 rows
/*!40000 ALTER TABLE `fa_m_bankinfo` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_bankinfo` (`id`, `user_id`, `name`, `bank_name`, `card_num`, `mobile`, `erc20`, `trc20`, `address`, `status`) VALUES
	(1, 4, 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 1),
	(2, 1, '23', '234', '23423', '235', '1', '12', '12', 1);
/*!40000 ALTER TABLE `fa_m_bankinfo` ENABLE KEYS */;

-- 导出  表 fish.fa_m_fixed_deposit 结构
CREATE TABLE IF NOT EXISTS `fa_m_fixed_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT '0',
  `day` int(1) NOT NULL DEFAULT '0',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(20,3) NOT NULL DEFAULT '0.000',
  `interest` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL DEFAULT '0',
  `start_time` int(1) NOT NULL DEFAULT '0',
  `expire_time` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_sn` (`order_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  fish.fa_m_fixed_deposit 的数据：1 rows
/*!40000 ALTER TABLE `fa_m_fixed_deposit` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_fixed_deposit` (`id`, `user_id`, `order_sn`, `name`, `type`, `day`, `amount`, `rate`, `interest`, `status`, `start_time`, `expire_time`) VALUES
	(1, 1, 'FD2025091599569753', '3天定存 利率 0.001', 0, 3, 2000.00, 0.001, 2.00, 0, 1757923996, 1758183196);
/*!40000 ALTER TABLE `fa_m_fixed_deposit` ENABLE KEYS */;

-- 导出  表 fish.fa_m_level 结构
CREATE TABLE IF NOT EXISTS `fa_m_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL DEFAULT '0',
  `enough_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `max_order` int(11) NOT NULL DEFAULT '30',
  `withdraw_min` decimal(20,2) NOT NULL DEFAULT '0.00',
  `withdraw_max` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `name` varchar(30) NOT NULL DEFAULT '',
  `pic` varchar(230) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  fish.fa_m_level 的数据：1 rows
/*!40000 ALTER TABLE `fa_m_level` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_level` (`id`, `level`, `enough_price`, `max_order`, `withdraw_min`, `withdraw_max`, `commission_rate`, `name`, `pic`, `status`) VALUES
	(1, 1, 0.00, 30, 0.00, 0.00, 3.00, 'level1', '/assets/img/qrcode.png', 1);
/*!40000 ALTER TABLE `fa_m_level` ENABLE KEYS */;

-- 导出  表 fish.fa_m_news 结构
CREATE TABLE IF NOT EXISTS `fa_m_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(250) NOT NULL DEFAULT '' COMMENT 'URL',
  `images` varchar(2150) NOT NULL DEFAULT '' COMMENT '图片',
  `content` text NOT NULL COMMENT '内容',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0轮播 1资讯',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `weigh` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `create_time` bigint(12) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='资讯列表';

-- 正在导出表  fish.fa_m_news 的数据：1 rows
/*!40000 ALTER TABLE `fa_m_news` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_news` (`id`, `title`, `url`, `images`, `content`, `type`, `status`, `weigh`, `create_time`) VALUES
	(1, '1222222222222222222', '', '/assets/img/qrcode.png', '<p>ewr</p>', 0, 1, 1, 1755757673);
/*!40000 ALTER TABLE `fa_m_news` ENABLE KEYS */;

-- 导出  表 fish.fa_m_order 结构
CREATE TABLE IF NOT EXISTS `fa_m_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '1',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未完成 1完成 2冻结 \r\n-1取消',
  `sort_id` tinyint(1) NOT NULL DEFAULT '0',
  `mark_no` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0无 1续 2终',
  `score` tinyint(1) NOT NULL DEFAULT '0',
  `over_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  fish.fa_m_order 的数据：36 rows
/*!40000 ALTER TABLE `fa_m_order` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_order` (`id`, `order_sn`, `user_id`, `admin_id`, `product_id`, `number`, `amount`, `commission`, `commission_rate`, `status`, `sort_id`, `mark_no`, `score`, `over_time`, `create_time`) VALUES
	(1, 'O2025082156100102', 4, 0, 1, 0, 30.00, 0.90, 3.00, 1, 1, 0, 0, 0, 1755785880),
	(2, 'O2025082148999955', 4, 0, 2, 0, 30.00, 0.90, 3.00, 1, 1, 0, 0, 0, 1755791456),
	(3, 'O2025082252539910', 4, 0, 1, 0, 30.00, 0.90, 3.00, 1, 2, 0, 0, 0, 1755794484),
	(4, 'O2025082298555557', 4, 0, 2, 1, 30.00, 0.90, 3.00, 1, 3, 0, 0, 1755853565, 1755853547),
	(5, 'O2025082253995757', 4, 0, 1, 1, 30.00, 0.90, 3.00, 1, 4, 1, 0, 1755853792, 1755853573),
	(6, 'O2025082210155489', 4, 0, 1, 1, 30.00, 0.90, 3.00, 1, 5, 1, 0, 1755853792, 1755853598),
	(7, 'O2025082256985149', 4, 0, 2, 1, 30.00, 0.90, 3.00, 1, 6, 1, 0, 1755853792, 1755853624),
	(8, 'O2025082252564848', 4, 0, 2, 1, 30.00, 0.90, 3.00, 1, 7, 2, 0, 1755853792, 1755853668),
	(9, 'O2025082252101545', 4, 0, 1, 1, 30.00, 0.90, 3.00, 1, 8, 0, 0, 1755853802, 1755853796),
	(10, 'O2025082297101975', 4, 0, 1, 1, 30.00, 0.90, 3.00, 1, 4, 1, 0, 1755855894, 1755854826),
	(11, 'O2025082257519856', 4, 0, 1, 1, 30.00, 0.90, 3.00, 1, 5, 1, 0, 1755855894, 1755854841),
	(12, 'O2025082210210157', 4, 0, 2, 1, 30.00, 0.90, 3.00, 1, 6, 1, 0, 1755855894, 1755855871),
	(13, 'O2025082248484949', 4, 0, 2, 1, 30.00, 0.90, 3.00, 1, 7, 2, 0, 1755855894, 1755855888),
	(14, 'O2025091250101564', 1, 0, 2, 1, 30.00, 0.90, 3.00, 1, 1, 0, 0, 1758456127, 1757684578),
	(15, 'O2025092149974849', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 2, 0, 0, 1758456147, 1758456129),
	(16, 'O2025092110257559', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 3, 0, 0, 1758456171, 1758456159),
	(17, 'O2025092355499852', 1, 0, 1, 1, 30.00, 0.90, 3.00, 1, 4, 2, 0, 1758599852, 1758599847),
	(18, 'O2025092649579849', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 5, 0, 0, 1758896839, 1758896833),
	(19, 'O2025092697100102', 1, 0, 2, 1, 430.00, 12.90, 3.00, 1, 6, 1, 0, 1758897012, 1758896842),
	(20, 'O2025092654539798', 1, 0, 2, 1, 430.00, 12.90, 3.00, 1, 7, 1, 0, 1758897012, 1758896854),
	(21, 'O2025092654535752', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 8, 2, 0, 1758897012, 1758896934),
	(22, 'O2025092652579952', 1, 0, 3, 1, 660.00, 33.00, 5.00, 1, 1, 1, 0, 1758897692, 1758897268),
	(23, 'O2025092657565157', 1, 0, 3, 1, 660.00, 33.00, 5.00, 1, 2, 1, 0, 1758897692, 1758897289),
	(24, 'O2025092650495350', 1, 0, 3, 1, 660.00, 33.00, 5.00, 1, 3, 2, 0, 1758897692, 1758897314),
	(25, 'O2025092799995610', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 1, 0, 0, 0, 1758965948),
	(26, 'O2025092851979910', 1, 0, 2, 4, 430.00, 51.60, 3.00, 1, 1, 0, 0, 1758989446, 1758989411),
	(27, 'O2025092810148555', 1, 0, 3, 4, 660.00, 79.20, 3.00, 1, 2, 0, 0, 1758989476, 1758989454),
	(28, 'O2025092850565056', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 3, 0, 0, 1758989500, 1758989490),
	(29, 'O2025092897525456', 1, 0, 2, 2, 430.00, 25.80, 3.00, 1, 4, 0, 0, 0, 1758989514),
	(30, 'O2025092810155575', 1, 0, 1, 34, 1020.00, 30.60, 3.00, 1, 1, 0, 0, 1759044986, 1759044158),
	(31, 'O2025092856501024', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 2, 0, 0, 1759045026, 1759045000),
	(32, 'O2025092899545256', 1, 0, 1, 1, 30.00, 0.90, 3.00, 1, 3, 1, 0, 1759045440, 1759045052),
	(33, 'O2025092849100571', 1, 0, 2, 1, 430.00, 12.90, 3.00, 1, 4, 1, 0, 1759045440, 1759045393),
	(34, 'O2025092850565455', 1, 0, 3, 1, 660.00, 19.80, 3.00, 1, 5, 2, 0, 1759045440, 1759045410),
	(35, 'O2025092897101499', 1, 0, 2, 4, 1720.00, 51.60, 3.00, 1, 6, 0, 0, 1759047580, 1759047562),
	(36, 'O2025092810157505', 1, 0, 1, 47, 1410.00, 42.30, 3.00, 1, 7, 0, 0, 1759047602, 1759047598);
/*!40000 ALTER TABLE `fa_m_order` ENABLE KEYS */;

-- 导出  表 fish.fa_m_order_charge 结构
CREATE TABLE IF NOT EXISTS `fa_m_order_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `fees` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未完成 1完成 2驳回',
  `note` varchar(200) NOT NULL DEFAULT '',
  `over_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- 正在导出表  fish.fa_m_order_charge 的数据：2 rows
/*!40000 ALTER TABLE `fa_m_order_charge` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_order_charge` (`id`, `order_sn`, `user_id`, `admin_id`, `amount`, `fees`, `status`, `note`, `over_time`, `create_time`) VALUES
	(1, 'C2025082197995557', 4, 0, 10000.00, 0.00, 0, '0', 0, 1755784778),
	(2, 'W2025082157519910', 4, 1, 10.00, 0.00, 1, '0', 1755842478, 1755785273);
/*!40000 ALTER TABLE `fa_m_order_charge` ENABLE KEYS */;

-- 导出  表 fish.fa_m_order_mark 结构
CREATE TABLE IF NOT EXISTS `fa_m_order_mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `number` int(11) NOT NULL DEFAULT '0',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未使用 1使用',
  `mark_num` tinyint(1) NOT NULL DEFAULT '1',
  `mark_over` tinyint(1) NOT NULL DEFAULT '1',
  `over_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  fish.fa_m_order_mark 的数据：3 rows
/*!40000 ALTER TABLE `fa_m_order_mark` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_order_mark` (`id`, `user_id`, `product_id`, `number`, `price`, `commission_rate`, `sort_id`, `status`, `mark_num`, `mark_over`, `over_time`, `create_time`) VALUES
	(14, 1, 3, 1, 0.00, 3.00, 5, 1, 3, 3, 1759045410, 1759045047),
	(13, 1, 2, 1, 0.00, 3.00, 4, 1, 2, 3, 1759045393, 1759045047),
	(12, 1, 1, 1, 0.00, 3.00, 3, 1, 1, 3, 1759045052, 1759045047);
/*!40000 ALTER TABLE `fa_m_order_mark` ENABLE KEYS */;

-- 导出  表 fish.fa_m_order_withdraw 结构
CREATE TABLE IF NOT EXISTS `fa_m_order_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `bank_id` int(11) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `fees` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未完成 1完成 2驳回',
  `note` varchar(200) NOT NULL DEFAULT '',
  `over_time` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_sn` (`order_sn`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- 正在导出表  fish.fa_m_order_withdraw 的数据：5 rows
/*!40000 ALTER TABLE `fa_m_order_withdraw` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_order_withdraw` (`id`, `order_sn`, `user_id`, `bank_id`, `admin_id`, `amount`, `fees`, `status`, `note`, `over_time`, `create_time`) VALUES
	(1, 'W2025082153515210', 4, 0, 1, 101.00, 0.00, 2, '0', 1755842627, 1755785365),
	(2, 'W2025091557529751', 1, 0, 0, 1.00, 0.00, 0, '', 0, 1757919513),
	(3, 'W2025092453515656', 1, 1, 0, 1.00, 0.00, 0, '', 0, 1758693589),
	(4, 'W2025092450531004', 1, 1, 0, 1.00, 0.00, 0, '', 0, 1758694434),
	(5, 'W2025093097101539', 1, 0, 0, 111.00, 0.00, 0, '', 0, 1759235018);
/*!40000 ALTER TABLE `fa_m_order_withdraw` ENABLE KEYS */;

-- 导出  表 fish.fa_m_product 结构
CREATE TABLE IF NOT EXISTS `fa_m_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `images` varchar(3200) NOT NULL DEFAULT '',
  `content` varchar(5200) NOT NULL DEFAULT '',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `number` int(5) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- 正在导出表  fish.fa_m_product 的数据：3 rows
/*!40000 ALTER TABLE `fa_m_product` DISABLE KEYS */;
INSERT IGNORE INTO `fa_m_product` (`id`, `cate_id`, `title`, `images`, `content`, `price`, `number`, `create_time`) VALUES
	(1, 0, '5555555555555', '/assets/img/qrcode.png,/assets/img/qrcode.png', '<p>35345</p>', 30.00, 20, 0),
	(2, 0, 'ttt', 'http://fish.test/assets/img/qrcode.png,/assets/img/qrcode.png', '<p>45346</p>', 430.00, 30, 1755756955),
	(3, 0, 'sgsgsdgdg', '/assets/img/qrcode.png', '', 660.00, 1, 1755847596);
/*!40000 ALTER TABLE `fa_m_product` ENABLE KEYS */;

-- 导出  表 fish.fa_signin 结构
CREATE TABLE IF NOT EXISTS `fa_signin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `successions` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '连续签到次数',
  `type` enum('normal','fillup') DEFAULT 'normal' COMMENT '签到类型',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='签到表';

-- 正在导出表  fish.fa_signin 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `fa_signin` DISABLE KEYS */;
INSERT IGNORE INTO `fa_signin` (`id`, `user_id`, `successions`, `type`, `createtime`) VALUES
	(1, 1, 3, 'normal', 1758816000),
	(3, 1, 1, '', 1758816000),
	(4, 1, 1, '', 1758902400),
	(5, 1, 1, 'normal', 1759127102),
	(6, 1, 1, 'fillup', 1758902400);
/*!40000 ALTER TABLE `fa_signin` ENABLE KEYS */;

-- 导出  表 fish.fa_sms 结构
CREATE TABLE IF NOT EXISTS `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信验证码表';

-- 正在导出表  fish.fa_sms 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `fa_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_sms` ENABLE KEYS */;

-- 导出  表 fish.fa_test 结构
CREATE TABLE IF NOT EXISTS `fa_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) DEFAULT '0' COMMENT '会员ID',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) DEFAULT NULL COMMENT '分类ID(多选)',
  `tags` varchar(255) DEFAULT '' COMMENT '标签',
  `week` enum('monday','tuesday','wednesday') DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `images` varchar(1500) DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `city` varchar(100) DEFAULT '' COMMENT '省市',
  `array` varchar(255) DEFAULT '' COMMENT '数组:value=值',
  `json` varchar(255) DEFAULT '' COMMENT '配置:key=名称,value=值',
  `multiplejson` varchar(1500) DEFAULT '' COMMENT '二维数组:title=标题,intro=介绍,author=作者,age=年龄',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned DEFAULT '0' COMMENT '点击',
  `workrange` varchar(100) DEFAULT '' COMMENT '时间区间',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` bigint(16) DEFAULT NULL COMMENT '刷新时间',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `deletetime` bigint(16) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='测试表';

-- 正在导出表  fish.fa_test 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `fa_test` DISABLE KEYS */;
INSERT IGNORE INTO `fa_test` (`id`, `user_id`, `admin_id`, `category_id`, `category_ids`, `tags`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `array`, `json`, `multiplejson`, `price`, `views`, `workrange`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`) VALUES
	(1, 1, 1, 12, '12,13', '互联网,计算机', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '我是一篇测试文章描述，内容过多时将自动隐藏', '广西壮族自治区/百色市/平果县', '["a","b"]', '{"a":"1","b":"2"}', '[{"title":"标题一","intro":"介绍一","author":"小明","age":"21"}]', 0.00, 0, '2020-10-01 00:00:00 - 2021-10-31 23:59:59', '2017-07-10', '2017-07-10 18:24:45', '2017', '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');
/*!40000 ALTER TABLE `fa_test` ENABLE KEYS */;

-- 导出  表 fish.fa_user 结构
CREATE TABLE IF NOT EXISTS `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `pay_password` varchar(32) DEFAULT '',
  `pay_salt` varchar(30) DEFAULT '',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` bigint(16) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` bigint(16) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `loginfailuretime` bigint(16) DEFAULT NULL COMMENT '最后登录失败时间',
  `joinip` varchar(50) DEFAULT '' COMMENT '加入IP',
  `jointime` bigint(16) DEFAULT NULL COMMENT '加入时间',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `resettime` bigint(16) DEFAULT '0',
  `token` varchar(50) DEFAULT '' COMMENT 'Token',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  `verification` varchar(255) DEFAULT '' COMMENT '验证',
  `invite_code` varchar(10) DEFAULT '',
  `deal_count` int(1) DEFAULT '0',
  `signiture` varchar(10) DEFAULT 'S',
  `sign_normal` varchar(10) DEFAULT '0',
  `sign_fillup` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invite_code` (`invite_code`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='会员表';

-- 正在导出表  fish.fa_user 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `fa_user` DISABLE KEYS */;
INSERT IGNORE INTO `fa_user` (`id`, `pid`, `group_id`, `username`, `nickname`, `password`, `salt`, `pay_password`, `pay_salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `loginfailuretime`, `joinip`, `jointime`, `createtime`, `updatetime`, `resettime`, `token`, `status`, `verification`, `invite_code`, `deal_count`, `signiture`, `sign_normal`, `sign_fillup`) VALUES
	(1, 0, 1, 'admin', 'admin', '5c24096af824808b145f1340e8798bf9', 'ncJ8Hr', '', 'jZzwiG', 'admin@gmail.com', '13100000000', '/assets/img/avatar.png', 1, 0, '2017-04-08', '', 1827.30, 5, 1, 1, 1758968309, 1759124144, '127.0.0.1', 0, 1757667960, '127.0.0.1', 1491635035, 0, 1759238542, 1759044143, '', 'normal', '', 'kGiKk3a', 9, 'S', '0', '0'),
	(2, 0, 0, 'test', 'test', '', '', '', '', 'test@11.com', '13000000000', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '', NULL, 1758682363, 1758682363, 0, '', 'normal', '', '', 0, 'S', '0', '0'),
	(3, 0, 0, 'test1', 'test1', '', '', '', '', 'test@11.com', '13000000001', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '', NULL, 1758682799, 1758682799, 0, '', 'normal', '', '0tnJqG', 0, 'S', '0', '0'),
	(4, 0, 0, 'admin2', 'admin2', '', '', '', '', 'admin@163.com', '13000000003', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '', NULL, 1758683287, 1758683805, 0, '', 'normal', '', 'fdYtNc', 0, 'S', '0', '0'),
	(7, 0, 0, 'test12', 'test12', '123456', '', '98ce3412597038d3ab3da1375d9800da', 'W9mySY', 'test12@gamil.com', '13000000002', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 4, 1758810860, '', NULL, 1758810788, 1758810860, 0, '', 'normal', '', 'gC6Jld', 0, 'S', '0', '0'),
	(8, 2, 0, 'test13', 'test13', '7c818040b3bd246930205810499699ed', 'zm5f3J', '', '0cyfoV', 'test13@gamil.com', '13000000006', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1758810955, '127.0.0.1', 0, NULL, '', NULL, 1758810936, 1759130404, 0, '', 'normal', '', 'HuKa2y', 0, 'S', '1', '0'),
	(9, 1, 0, 'admin12', 'admin12', '', '', '', '', 'admin12@gamil.com', '13100000012', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '', NULL, 1759156132, 1759156132, 0, '', 'normal', '', 'fEMKIJ', 0, 'S', '0', '0'),
	(10, 1, 0, 'admin13', 'admin13', '', '', '', '', 'admin13@gamil.com', '13100000014', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '', NULL, 1759156449, 1759156449, 0, '', 'normal', '', 'eRDVCE', 0, 'S', '0', '0'),
	(12, 3, 0, '你好', 'admin15', '', '', '', '', 'admin15@gamil.com', '13100000015', '', 1, 0, NULL, '', 0.00, 0, 1, 1, NULL, NULL, '', 0, NULL, '', NULL, 1759156610, 1759156610, 0, '', 'normal', '', 'M62i5G', 0, 'S', '0', '0');
/*!40000 ALTER TABLE `fa_user` ENABLE KEYS */;

-- 导出  表 fish.fa_user_group 结构
CREATE TABLE IF NOT EXISTS `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` bigint(16) DEFAULT NULL COMMENT '添加时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='会员组表';

-- 正在导出表  fish.fa_user_group 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `fa_user_group` DISABLE KEYS */;
INSERT IGNORE INTO `fa_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
	(1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');
/*!40000 ALTER TABLE `fa_user_group` ENABLE KEYS */;

-- 导出  表 fish.fa_user_money_log 结构
CREATE TABLE IF NOT EXISTS `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1充值',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COMMENT='会员余额变动表';

-- 正在导出表  fish.fa_user_money_log 的数据：~174 rows (大约)
/*!40000 ALTER TABLE `fa_user_money_log` DISABLE KEYS */;
INSERT IGNORE INTO `fa_user_money_log` (`id`, `user_id`, `type`, `money`, `before`, `after`, `memo`, `createtime`) VALUES
	(1, 4, 0, -10.00, 10.00, 0.00, '提现', 1755785273),
	(2, 4, 0, -101.00, 200.00, 99.00, '提现', 1755785365),
	(3, 4, 0, -30.00, 99.00, 69.00, 'O2025082156100102', 1755785880),
	(4, 4, 0, 30.00, 69.00, 99.00, 'O2025082156100102', 1755785903),
	(5, 4, 0, 0.90, 99.00, 99.90, 'O2025082156100102佣金', 1755785903),
	(6, 4, 0, -30.00, 99.90, 69.90, 'O2025082148999955', 1755791456),
	(7, 4, 0, 30.00, 69.90, 99.90, 'O2025082148999955', 1755791479),
	(8, 4, 0, 0.90, 99.90, 100.80, 'O2025082148999955佣金', 1755791479),
	(9, 3, 0, 500.00, 0.00, 500.00, '佣金', 1755793823),
	(10, 2, 0, 300.00, 0.00, 300.00, '佣金', 1755793823),
	(11, 1, 0, 100.00, 0.00, 100.00, '佣金', 1755793823),
	(12, 4, 0, -30.00, 100.80, 70.80, 'O2025082252539910', 1755794484),
	(13, 4, 0, 30.00, 70.80, 100.80, 'O2025082252539910', 1755794493),
	(14, 4, 0, 0.90, 100.80, 101.70, 'O2025082252539910佣金', 1755794493),
	(15, 3, 0, 0.05, 500.00, 500.05, '佣金', 1755794493),
	(16, 2, 0, 0.03, 300.00, 300.03, '佣金', 1755794493),
	(17, 1, 0, 0.01, 100.00, 100.01, '佣金', 1755794493),
	(18, 4, 0, 10.00, 101.70, 111.70, 'W2025082157519910', 1755842478),
	(19, 4, 0, 101.00, 111.70, 212.70, 'W2025082153515210', 1755842627),
	(20, 4, 0, -30.00, 212.70, 182.70, 'O2025082298555557', 1755853547),
	(21, 4, 0, 30.00, 182.70, 212.70, 'O2025082298555557', 1755853565),
	(22, 4, 0, 0.90, 212.70, 213.60, 'O2025082298555557佣金', 1755853565),
	(23, 3, 0, 0.05, 500.05, 500.10, '佣金', 1755853565),
	(24, 2, 0, 0.03, 300.03, 300.06, '佣金', 1755853565),
	(25, 1, 0, 0.01, 100.01, 100.02, '佣金', 1755853565),
	(26, 4, 0, -30.00, 213.60, 183.60, 'O2025082253995757', 1755853573),
	(27, 4, 0, -30.00, 183.60, 153.60, 'O2025082210155489', 1755853598),
	(28, 4, 0, -30.00, 153.60, 123.60, 'O2025082256985149', 1755853624),
	(29, 4, 0, -30.00, 123.60, 93.60, 'O2025082252564848', 1755853668),
	(30, 4, 0, 30.00, 93.60, 123.60, 'O2025082253995757', 1755853792),
	(31, 4, 0, 0.90, 123.60, 124.50, 'O2025082253995757佣金', 1755853792),
	(32, 3, 0, 0.05, 500.10, 500.15, '佣金', 1755853792),
	(33, 2, 0, 0.03, 300.06, 300.09, '佣金', 1755853792),
	(34, 1, 0, 0.01, 100.02, 100.03, '佣金', 1755853792),
	(35, 4, 0, 30.00, 124.50, 154.50, 'O2025082210155489', 1755853792),
	(36, 4, 0, 0.90, 154.50, 155.40, 'O2025082210155489佣金', 1755853792),
	(37, 3, 0, 0.05, 500.15, 500.20, '佣金', 1755853792),
	(38, 2, 0, 0.03, 300.09, 300.12, '佣金', 1755853792),
	(39, 1, 0, 0.01, 100.03, 100.04, '佣金', 1755853792),
	(40, 4, 0, 30.00, 155.40, 185.40, 'O2025082256985149', 1755853792),
	(41, 4, 0, 0.90, 185.40, 186.30, 'O2025082256985149佣金', 1755853792),
	(42, 3, 0, 0.05, 500.20, 500.25, '佣金', 1755853792),
	(43, 2, 0, 0.03, 300.12, 300.15, '佣金', 1755853792),
	(44, 1, 0, 0.01, 100.04, 100.05, '佣金', 1755853792),
	(45, 4, 0, 30.00, 186.30, 216.30, 'O2025082252564848', 1755853792),
	(46, 4, 0, 0.90, 216.30, 217.20, 'O2025082252564848佣金', 1755853792),
	(47, 3, 0, 0.05, 500.25, 500.30, '佣金', 1755853792),
	(48, 2, 0, 0.03, 300.15, 300.18, '佣金', 1755853792),
	(49, 1, 0, 0.01, 100.05, 100.06, '佣金', 1755853792),
	(50, 4, 0, -30.00, 217.20, 187.20, 'O2025082252101545', 1755853796),
	(51, 4, 0, 30.00, 187.20, 217.20, 'O2025082252101545', 1755853802),
	(52, 4, 0, 0.90, 217.20, 218.10, 'O2025082252101545佣金', 1755853802),
	(53, 3, 0, 0.05, 500.30, 500.35, '佣金', 1755853802),
	(54, 2, 0, 0.03, 300.18, 300.21, '佣金', 1755853802),
	(55, 1, 0, 0.01, 100.06, 100.07, '佣金', 1755853802),
	(56, 4, 0, -30.00, 218.10, 188.10, 'O2025082297101975', 1755854826),
	(57, 4, 0, -30.00, 188.10, 158.10, 'O2025082257519856', 1755854841),
	(58, 4, 0, -30.00, 158.10, 128.10, 'O2025082210210157', 1755855871),
	(59, 4, 0, -30.00, 128.10, 98.10, 'O2025082248484949', 1755855888),
	(60, 4, 0, 30.00, 98.10, 128.10, 'O2025082297101975', 1755855894),
	(61, 4, 0, 0.90, 128.10, 129.00, 'O2025082297101975佣金', 1755855894),
	(62, 3, 0, 0.05, 500.35, 500.40, '佣金', 1755855894),
	(63, 2, 0, 0.03, 300.21, 300.24, '佣金', 1755855894),
	(64, 1, 0, 0.01, 100.07, 100.08, '佣金', 1755855894),
	(65, 4, 0, 30.00, 129.00, 159.00, 'O2025082257519856', 1755855894),
	(66, 4, 0, 0.90, 159.00, 159.90, 'O2025082257519856佣金', 1755855894),
	(67, 3, 0, 0.05, 500.40, 500.45, '佣金', 1755855894),
	(68, 2, 0, 0.03, 300.24, 300.27, '佣金', 1755855894),
	(69, 1, 0, 0.01, 100.08, 100.09, '佣金', 1755855894),
	(70, 4, 0, 30.00, 159.90, 189.90, 'O2025082210210157', 1755855894),
	(71, 4, 0, 0.90, 189.90, 190.80, 'O2025082210210157佣金', 1755855894),
	(72, 3, 0, 0.05, 500.45, 500.50, '佣金', 1755855894),
	(73, 2, 0, 0.03, 300.27, 300.30, '佣金', 1755855894),
	(74, 1, 0, 0.01, 100.09, 100.10, '佣金', 1755855894),
	(75, 4, 0, 30.00, 190.80, 220.80, 'O2025082248484949', 1755855894),
	(76, 4, 0, 0.90, 220.80, 221.70, 'O2025082248484949佣金', 1755855894),
	(77, 3, 0, 0.05, 500.50, 500.55, '佣金', 1755855894),
	(78, 2, 0, 0.03, 300.30, 300.33, '佣金', 1755855894),
	(79, 1, 0, 0.01, 100.10, 100.11, '佣金', 1755855894),
	(80, 1, 0, -30.00, 100.11, 70.11, 'O2025091250101564', 1757684578),
	(81, 1, 0, -1.00, 70.11, 69.11, '提现', 1757919513),
	(82, 1, 0, 22200.00, 69.11, 22269.11, '管理员变更金额', 1757923798),
	(83, 1, 0, -2000.00, 22269.11, 20269.11, '定存', 1757923996),
	(84, 1, 0, -69.11, 20269.11, 20200.00, '1', 1758299406),
	(85, 1, 0, 30.00, 20200.00, 20230.00, 'O2025091250101564', 1758456127),
	(86, 1, 0, 0.90, 20230.00, 20230.90, 'O2025091250101564佣金', 1758456127),
	(87, 1, 0, -660.00, 20230.90, 19570.90, 'O2025092149974849', 1758456129),
	(88, 1, 0, 660.00, 19570.90, 20230.90, 'O2025092149974849', 1758456147),
	(89, 1, 0, 19.80, 20230.90, 20250.70, 'O2025092149974849佣金', 1758456147),
	(90, 1, 0, -660.00, 20250.70, 19590.70, 'O2025092110257559', 1758456159),
	(91, 1, 0, 660.00, 19590.70, 20250.70, 'O2025092110257559', 1758456171),
	(92, 1, 0, 19.80, 20250.70, 20270.50, 'O2025092110257559佣金', 1758456171),
	(93, 1, 0, -30.00, 20270.50, 20240.50, 'O2025092355499852', 1758599847),
	(94, 1, 0, 30.00, 20240.50, 20270.50, 'O2025092355499852', 1758599852),
	(95, 1, 0, 0.90, 20270.50, 20271.40, 'O2025092355499852佣金', 1758599852),
	(96, 1, 0, -1.00, 20271.40, 20270.40, '提现', 1758693589),
	(97, 1, 0, -1.00, 20270.40, 20269.40, '提现', 1758694434),
	(98, 1, 0, -19000.00, 20269.40, 1269.40, '管理员变更金额', 1758896727),
	(99, 1, 0, -660.00, 1269.40, 609.40, 'O2025092649579849', 1758896833),
	(100, 1, 0, 660.00, 609.40, 1269.40, 'O2025092649579849', 1758896839),
	(101, 1, 0, 19.80, 1269.40, 1289.20, 'O2025092649579849佣金', 1758896839),
	(102, 1, 0, -430.00, 1289.20, 859.20, 'O2025092697100102', 1758896842),
	(103, 1, 0, -430.00, 859.20, 429.20, 'O2025092654539798', 1758896854),
	(104, 1, 0, -660.00, 429.20, -230.80, 'O2025092654535752', 1758896934),
	(105, 1, 0, 300.00, -230.80, 69.20, '管理员：1', 1758897009),
	(106, 1, 0, 430.00, 69.20, 499.20, 'O2025092697100102', 1758897012),
	(107, 1, 0, 12.90, 499.20, 512.10, 'O2025092697100102佣金', 1758897012),
	(108, 1, 0, 430.00, 512.10, 942.10, 'O2025092654539798', 1758897012),
	(109, 1, 0, 12.90, 942.10, 955.00, 'O2025092654539798佣金', 1758897012),
	(110, 1, 0, 660.00, 955.00, 1615.00, 'O2025092654535752', 1758897012),
	(111, 1, 0, 19.80, 1615.00, 1634.80, 'O2025092654535752佣金', 1758897012),
	(112, 1, 0, -660.00, 1634.80, 974.80, 'O2025092652579952', 1758897268),
	(113, 1, 0, -660.00, 974.80, 314.80, 'O2025092657565157', 1758897289),
	(114, 1, 0, -660.00, 314.80, -345.20, 'O2025092650495350', 1758897314),
	(115, 1, 0, 346.00, -345.20, 0.80, '管理员：1', 1758897689),
	(116, 1, 0, 660.00, 0.80, 660.80, 'O2025092652579952', 1758897692),
	(117, 1, 0, 33.00, 660.80, 693.80, 'O2025092652579952佣金', 1758897692),
	(118, 1, 0, 660.00, 693.80, 1353.80, 'O2025092657565157', 1758897692),
	(119, 1, 0, 33.00, 1353.80, 1386.80, 'O2025092657565157佣金', 1758897692),
	(120, 1, 0, 660.00, 1386.80, 2046.80, 'O2025092650495350', 1758897692),
	(121, 1, 0, 33.00, 2046.80, 2079.80, 'O2025092650495350佣金', 1758897692),
	(122, 1, 0, -1200.00, 2079.80, 879.80, '管理员变更金额', 1758965925),
	(123, 1, 0, -660.00, 879.80, 219.80, 'O2025092799995610', 1758965948),
	(124, 1, 0, 2000.00, 219.80, 2219.80, '管理员变更金额', 1758989017),
	(125, 1, 0, 660.00, 2219.80, 2879.80, 'O2025092799995610', 1758989209),
	(126, 1, 0, -430.00, 2879.80, 2449.80, 'O2025092851979910', 1758989411),
	(127, 1, 0, 430.00, 2449.80, 2879.80, 'O2025092851979910', 1758989446),
	(128, 1, 0, 51.60, 2879.80, 2931.40, 'O2025092851979910佣金', 1758989446),
	(129, 1, 0, -660.00, 2931.40, 2271.40, 'O2025092810148555', 1758989454),
	(130, 1, 0, 660.00, 2271.40, 2931.40, 'O2025092810148555', 1758989476),
	(131, 1, 0, 79.20, 2931.40, 3010.60, 'O2025092810148555佣金', 1758989476),
	(132, 1, 0, -2000.00, 3010.60, 1010.60, '管理员变更金额', 1758989485),
	(133, 1, 0, -660.00, 1010.60, 350.60, 'O2025092850565056', 1758989490),
	(134, 1, 0, 660.00, 350.60, 1010.60, 'O2025092850565056', 1758989500),
	(135, 1, 0, 19.80, 1010.60, 1030.40, 'O2025092850565056佣金', 1758989500),
	(136, 1, 0, 300.00, 1030.40, 1330.40, '管理员变更金额', 1758989510),
	(137, 1, 0, -430.00, 1330.40, 900.40, 'O2025092897525456', 1758989514),
	(138, 1, 0, 430.00, 900.40, 1330.40, 'O2025092897525456', 1759044143),
	(139, 1, 0, -1020.00, 1330.40, 310.40, 'O2025092810155575', 1759044219),
	(141, 1, 0, -1020.00, 310.40, -709.60, 'O2025092810155575', 1759044338),
	(142, 1, 0, 819.20, -709.60, 109.60, '管理员变更金额', 1759044504),
	(143, 1, 0, -1020.00, 109.60, -910.40, 'O2025092810155575', 1759044526),
	(144, 1, 0, 1000.00, -910.40, 89.60, '管理员：1', 1759044541),
	(145, 1, 0, 1020.00, 89.60, 1109.60, 'O2025092810155575', 1759044986),
	(146, 1, 0, 30.60, 1109.60, 1140.20, 'O2025092810155575佣金', 1759044986),
	(147, 1, 0, -660.00, 1140.20, 480.20, 'O2025092856501024', 1759045026),
	(148, 1, 0, 660.00, 480.20, 1140.20, 'O2025092856501024', 1759045026),
	(149, 1, 0, 19.80, 1140.20, 1160.00, 'O2025092856501024佣金', 1759045026),
	(150, 1, 0, -30.00, 1160.00, 1130.00, 'O2025092899545256', 1759045056),
	(151, 1, 0, -30.00, 1130.00, 1100.00, 'O2025092899545256', 1759045059),
	(152, 1, 0, -30.00, 1100.00, 1070.00, 'O2025092899545256', 1759045061),
	(153, 1, 0, -30.00, 1070.00, 1040.00, 'O2025092899545256', 1759045061),
	(154, 1, 0, -30.00, 1040.00, 1010.00, 'O2025092899545256', 1759045192),
	(155, 1, 0, -30.00, 1010.00, 980.00, 'O2025092899545256', 1759045214),
	(156, 1, 0, -30.00, 980.00, 950.00, 'O2025092899545256', 1759045233),
	(157, 1, 0, -430.00, 950.00, 520.00, 'O2025092849100571', 1759045399),
	(158, 1, 0, -660.00, 520.00, -140.00, 'O2025092850565455', 1759045418),
	(159, 1, 0, 140.00, -140.00, 0.00, '管理员：1', 1759045435),
	(160, 1, 0, 30.00, 0.00, 30.00, 'O2025092899545256', 1759045440),
	(161, 1, 0, 0.90, 30.00, 30.90, 'O2025092899545256佣金', 1759045440),
	(162, 1, 0, 430.00, 30.90, 460.90, 'O2025092849100571', 1759045440),
	(163, 1, 0, 12.90, 460.90, 473.80, 'O2025092849100571佣金', 1759045440),
	(164, 1, 0, 660.00, 473.80, 1133.80, 'O2025092850565455', 1759045440),
	(165, 1, 0, 19.80, 1133.80, 1153.60, 'O2025092850565455佣金', 1759045440),
	(166, 1, 0, 660.00, 1153.60, 1813.60, 'O2025092850565455', 1759045440),
	(167, 1, 0, 19.80, 1813.60, 1833.40, 'O2025092850565455佣金', 1759045440),
	(168, 1, 0, -1720.00, 1833.40, 113.40, 'O2025092897101499', 1759047580),
	(169, 1, 0, 1720.00, 113.40, 1833.40, 'O2025092897101499', 1759047580),
	(170, 1, 0, 51.60, 1833.40, 1885.00, 'O2025092897101499佣金', 1759047580),
	(171, 1, 0, -1410.00, 1885.00, 475.00, 'O2025092810157505', 1759047602),
	(172, 1, 0, 1410.00, 475.00, 1885.00, 'O2025092810157505', 1759047602),
	(173, 1, 0, 42.30, 1885.00, 1927.30, 'O2025092810157505佣金', 1759047602),
	(174, 1, 0, 11.00, 1927.30, 1938.30, '管理员：1', 1759168565),
	(175, 1, 0, -111.00, 1938.30, 1827.30, '提现', 1759235018);
/*!40000 ALTER TABLE `fa_user_money_log` ENABLE KEYS */;

-- 导出  表 fish.fa_user_rule 结构
CREATE TABLE IF NOT EXISTS `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='会员规则表';

-- 正在导出表  fish.fa_user_rule 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `fa_user_rule` DISABLE KEYS */;
INSERT IGNORE INTO `fa_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
	(1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal'),
	(2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal'),
	(3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal'),
	(4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal'),
	(5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal'),
	(6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal'),
	(7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal'),
	(8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal'),
	(9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal'),
	(10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal'),
	(11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal'),
	(12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');
/*!40000 ALTER TABLE `fa_user_rule` ENABLE KEYS */;

-- 导出  表 fish.fa_user_score_log 结构
CREATE TABLE IF NOT EXISTS `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `type` enum('normal','fillup') DEFAULT 'normal',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='会员积分变动表';

-- 正在导出表  fish.fa_user_score_log 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `fa_user_score_log` DISABLE KEYS */;
INSERT IGNORE INTO `fa_user_score_log` (`id`, `user_id`, `score`, `before`, `after`, `type`, `memo`, `createtime`) VALUES
	(1, 1, 1, 0, 1, NULL, '连续签到1天', 1759124155),
	(2, 1, 1, 1, 2, '', '连续签到1天', 1758816000),
	(3, 1, 1, 2, 3, '', '连续签到1天', 1758902400),
	(4, 1, 1, 3, 4, 'normal', '连续签到1天', 1759127102),
	(5, 1, 1, 4, 5, 'fillup', '连续签到1天', 1759127193);
/*!40000 ALTER TABLE `fa_user_score_log` ENABLE KEYS */;

-- 导出  表 fish.fa_user_token 结构
CREATE TABLE IF NOT EXISTS `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `expiretime` bigint(16) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员Token表';

-- 正在导出表  fish.fa_user_token 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `fa_user_token` DISABLE KEYS */;
INSERT IGNORE INTO `fa_user_token` (`token`, `user_id`, `createtime`, `expiretime`) VALUES
	('693390174a16c9023a33da95a2ba635d427e6577', 1, 1757668086, 1760260086),
	('c7ba9b7b1c5b534aec45d385720c9485fcbc4b60', 1, 1759124144, 1761716144),
	('cfb2d64b3e2ffbe867e2cce0353f6038efd64906', 8, 1758810955, 1761402955),
	('f717d50afa2c819ccfd5ee19292c06f0ea4850b6', 1, 1758968309, 1761560309);
/*!40000 ALTER TABLE `fa_user_token` ENABLE KEYS */;

-- 导出  表 fish.fa_version 结构
CREATE TABLE IF NOT EXISTS `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) DEFAULT '' COMMENT '包大小',
  `content` varchar(500) DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  `updatetime` bigint(16) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='版本表';

-- 正在导出表  fish.fa_version 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `fa_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `fa_version` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
