/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50599
File Encoding         : 65001

Date: 2018-04-03 18:02:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `name` (`name`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`group_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`, `permission_id`) USING BTREE ,
INDEX `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NOT NULL ,
`codename`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`, `codename`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=34

;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add permission', '2', 'add_permission'), ('5', 'Can change permission', '2', 'change_permission'), ('6', 'Can delete permission', '2', 'delete_permission'), ('7', 'Can add user', '3', 'add_user'), ('8', 'Can change user', '3', 'change_user'), ('9', 'Can delete user', '3', 'delete_user'), ('10', 'Can add group', '4', 'add_group'), ('11', 'Can change group', '4', 'change_group'), ('12', 'Can delete group', '4', 'delete_group'), ('13', 'Can add content type', '5', 'add_contenttype'), ('14', 'Can change content type', '5', 'change_contenttype'), ('15', 'Can delete content type', '5', 'delete_contenttype'), ('16', 'Can add session', '6', 'add_session'), ('17', 'Can change session', '6', 'change_session'), ('18', 'Can delete session', '6', 'delete_session'), ('19', 'Can add tag', '7', 'add_tag'), ('20', 'Can change tag', '7', 'change_tag'), ('21', 'Can delete tag', '7', 'delete_tag'), ('22', 'Can add category', '8', 'add_category'), ('23', 'Can change category', '8', 'change_category'), ('24', 'Can delete category', '8', 'delete_category'), ('25', 'Can add post', '9', 'add_post'), ('26', 'Can change post', '9', 'change_post'), ('27', 'Can delete post', '9', 'delete_post'), ('28', 'Can add read', '10', 'add_read'), ('29', 'Can change read', '10', 'change_read'), ('30', 'Can delete read', '10', 'delete_read'), ('31', 'Can add column', '11', 'add_column'), ('32', 'Can change column', '11', 'change_column'), ('33', 'Can delete column', '11', 'delete_column');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`password`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_login`  datetime NULL DEFAULT NULL ,
`is_superuser`  tinyint(1) NOT NULL ,
`username`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`first_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`last_name`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_staff`  tinyint(1) NOT NULL ,
`is_active`  tinyint(1) NOT NULL ,
`date_joined`  datetime NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `username` (`username`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=2

;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$30000$ArLa14xnyaN8$TI7fGp9Orj+5E6vOykaCgdQ1oFAuo3ZGDsBupYsollI=', '2018-03-21 08:34:01.534000', '1', 'admin', '', '', 'lostyu789@163.com', '1', '1', '2018-03-21 08:33:42.658000');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`group_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_user_groups_user_id_94350c0c_uniq` (`user_id`, `group_id`) USING BTREE ,
INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`user_id`  int(11) NOT NULL ,
`permission_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`, `permission_id`) USING BTREE ,
INDEX `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=1

;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_pub`  tinyint(1) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
BEGIN;
INSERT INTO `blog_category` VALUES ('5', '新闻', '1'), ('6', '新知', '1'), ('7', '数据库', '1'), ('8', '知识点', '1'), ('9', '测试', '0'), ('10', '阅读', '1'), ('11', 'about', '0');
COMMIT;

-- ----------------------------
-- Table structure for blog_column
-- ----------------------------
DROP TABLE IF EXISTS `blog_column`;
CREATE TABLE `blog_column` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`banner`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`site_title`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`site_keywords`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`site_description`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`page_title`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`page_subtitle`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of blog_column
-- ----------------------------
BEGIN;
INSERT INTO `blog_column` VALUES ('1', 'index', '', 'Tony Blog', '学习，音乐，游戏，阅读，电影，前端，后端，全栈，成长，分享', '这是一个分享，学习，成长的平台', 'Stay Hungry, Stay Foolish.', ''), ('2', 'read', 'banner/banner_read1.jpg', '阅读 - Tony Blog', '经典书籍 书单', '经典书籍推荐，书单推荐', '静下来，阅读一本书', '我唯一所知的，是我一无所知'), ('3', 'category', 'banner/2017-07-31.jpg', '分类 - Tony Blog', '分类', 'Tony Blog 文章分类', '宠辱不惊，闲看庭前花开花落', ''), ('4', 'tag', 'banner/2017-08-07.jpg', '标签 - Tony Blog', 'tag', 'Tony Blog 文章标签', '去留无意，漫随天外云卷云舒', ''), ('5', 'archive', 'banner/2018-03-27.jpg', '归档 - Tony Blog', '归档', 'Tony Blog 文章归档', '欲速则不达', ''), ('6', 'about', 'banner/banner_index41.jpg', '关于 - Tony Blog', '关于 aoubt me', '关于我，Tony Blog 的简介', '非淡泊无以明志，非宁静无以致远', '');
COMMIT;

-- ----------------------------
-- Table structure for blog_post
-- ----------------------------
DROP TABLE IF EXISTS `blog_post`;
CREATE TABLE `blog_post` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`body`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`excerpt`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`views`  int(10) UNSIGNED NOT NULL ,
`created_time`  datetime NOT NULL ,
`modified_time`  datetime NOT NULL ,
`author_id`  int(11) NOT NULL ,
`category_id`  int(11) NOT NULL ,
`is_pub`  tinyint(1) NOT NULL ,
`description`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`keywords`  varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`banner`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`reprint`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`) USING BTREE ,
INDEX `blog_post_category_id_c326dbf8_fk_blog_category_id` (`category_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of blog_post
-- ----------------------------
BEGIN;
INSERT INTO `blog_post` VALUES ('1', '乔布斯2005斯坦福大学毕业演讲', '第一个故事讲的是，如何将生活中细微的事情联系在一起。\r\n你无法预测你的未来，但是，当你回顾你所有的人生经历，就会发现他们是如何串联在一起的，凡有所学，皆成性格。你所经历的，就是你的人生。你的性格，爱好，行为习惯，生活环境，朋友，工作，这些都会对一个人产生影响。\r\n\r\n第二个故事是关于爱和损失。\r\n混乱能够打破常规，产生新的秩序，接受生命中的意外。有时候，你以为失去了什么，或许才是收获的开始。\r\n\r\n<!-- more -->\r\n\r\n第三个故事是关于死亡。\r\n把生命的每一天当作最后一天来度过，生命才是最宝贵的稀缺资源，不要被教条所束缚，跟随你的内心，不要停止寻找，找到你一生所爱的东西。\r\n\r\n\r\n\r\n三个故事足以显示他对生命、对商业都有着超凡的理解　<a href=\"http://open.163.com/movie/2006/8/3/8/M7BC8JMHJ_M7BC8PA38.html\" target=\"_blank\">[视频地址]</a>\r\n\r\n<p class=\"text-center\"><strong>Stay Hungry, Stay Foolish</strong></p>\r\n![foolish[1].png](https://i.loli.net/2018/03/26/5ab8c46a777a5.png)', '', '0', '2018-03-21 08:43:48.000000', '2018-03-21 08:43:43.000000', '1', '5', '1', '乔布斯关于斯坦福大学毕业演讲，三个故事足以显示他对生命、对商业都有着超凡的理解', '乔布斯毕业演讲', 'banner/bn-jobs1.jpg', ''), ('2', '长期接受碎片化信息，会有什么后果？', '你所接受的一切信息，构成了你的思维方式。所以，长期接受碎片信息的后果，就是让你的思维变得狭隘，难以进行复杂的思考。\r\n\r\n## 碎片信息通常具备这样的特征：\r\n\r\n- 它们往往是一些事实的集合而非逻辑\r\n- 它们往往大量简化了推演过程\r\n- 它们往往将多路径简化为单一路径\r\n- 它们往往不够严谨、全面\r\n\r\n简而言之，碎片信息为了达到易于习得的目的，通常会显著降低认知成本，最明显的方式就是：将复杂的事物简单化。它们往往只告诉你表面上的东西，却不会告诉你背后的原理，以及它与其他事物之间的联系。\r\n\r\n<!-- more -->\r\n\r\n![](http://www.nowamagic.net/librarys/images/201608/2016_08_18_01.jpg)\r\n\r\n\r\n我们所说的“知识”，由两部分组成：一是“事实”（或曰“观念”），二是“联系”。\r\n\r\n事实就是一个个点，联系则是把点连接起来的线，它们所构成的网络，就是我们的知识结构。“事实”决定了你的知识广度，“联系”决定了你的知识深度。\r\n\r\n如果你了解事物之间的联系，即使你只知道ABC，你也可以根据这三者的内在逻辑，得出DE，甚至F，这个过程就叫做思考。但如果你不了解它们的内在逻辑，即使你知道ABCDE，你也是没办法得出F的——你不知道需要把它们放在一起，更不知道放在一起之后它们能够呈现出怎样的内在逻辑关系。\r\n\r\n这就是碎片化信息的弊端。当我们接受碎片信息时，我们实际上是在扩充“事实”，但并没有增加“联系”。长此以往，会使我们的知识结构变成一张浮点图：孤零零的知识点漂浮在各个位置，却缺乏一个将它们有序串联起来的网络。\r\n\r\n这样的结果是：碎片化知识通过连续的新鲜内容，不断刺激你的大脑，让你始终处于“啊！又知道了新的东西”的喜悦中，从而难以自拔——这也就是我们难以抑制刷微博、刷朋友圈的缘故，因为我们只需要付出很少，就可以沉浸在“获得了新东西”的刺激里面。\r\n\r\n但是，这些获得的信息，因为它们缺少跟其他信息的“联系”，因此难以被我们“提取”，而“提取”得越少的内容，会被提取得多的内容挤压在记忆的底部。——因此，这些碎片化的信息极其容易被我们遗忘。你以为你得到了很多，但其实你什么都没有得到。\r\n\r\n前面已经说过，我们的知识网络，决定了我们如何思考。那么，长期接受碎片信息，对你的思考能力并没有提升——你的“网络”并没有扩大；甚至是有害的。——你已经习惯了用孤立的知识点去看待问题，习惯了一层、两层的思维，难以对事物进行五层、六层乃至更深入的剖析。\r\n\r\n**长此以往，你将弱化对于复杂事物的思考与理解能力。**\r\n\r\n这里要注意一点：碎片化信息，跟来源没有太大关系。如果你习惯了接受“A是B”、“C是坏的”、“因为A所以B”的简单观念，那么，无论你是在刷微博，还是在读书、看公开课，其实接受的都是碎片化知识。我之前在一个“聪明人的思考方式是什么”的问题中，提到过：聪明人的思考方式，其实很简单，就是三个字：**元认知**。\r\n\r\n同样一个问题，较为聪明的人，会去思考这个问题产生的背景、原因、合理性、必要性、可能性，等等。他们会拔高一层去看待这个问题，从而更容易找到一根线条，将它和远处的某个固有的“观念”联系在一起，从而拓展自己的思维网络。\r\n\r\n所以，如果你有这样的意识，那么其实无论刷微博还是读书，都可以避免碎片化认知。\r\n\r\n## 具体的方式是：\r\n\r\n1. **先花一点时间，建立自己的知识体系。**把你已经知道的东西梳理一遍。如何梳理呢？以你能够说出某个知识点的影响因素，以及它对其他事物的影响为准。顺着这样的知识点捋一遍，这个网络就是你已经构建完成的知识网络。\r\n2. **找到知识网络的触点。亦即自己感兴趣的、但尚未进行探索和了解的知识点。**阅读、学习的时候，有意识地去接触这些触点的知识，延展自己的知识网络。\r\n3. **当接触到一个新的知识点时，先考虑如何将其纳入知识体系。**亦即在脑子里回想你的知识网络，思考它可以如何跟你已经知道的东西联系起来。\r\n4. **如果找到了对应的点，弄通路径。**也就是说，将这个新的知识点，跟已经知道的某个点之间的路径，查清楚、弄清楚，将它们连接起来，使这个知识点成为你新的「触点」，拓展你的思维网络。\r\n5. **检验并输出。**将这两个点之间的联系讲清楚。最简单的办法，就是通过口述、写文章，去教会别人这个知识。或者，在心里把它讲一遍，看是否能够讲得清晰易懂，没有障碍。只有能够输出的东西，才是真正属于你的东西。\r\n6. **不符合以上方式的内容，果断舍弃。**如果一个东西无法纳入你的认知体系，那说明你现在还不能掌握它，那就果断放弃，因为它对你来说是没有价值的，或者说（记忆的）成本是远高于收益的。\r\n\r\n### 再多谈几点：\r\n\r\n- **读书不用追求“读完一本书”，而应该追求“从这本书中获得了什么东西”。**一本书的内容不可能100%对你有用，其中肯定有你所不感兴趣的东西，也有你所无法接受的东西，没关系，接受你所能接受的即可。不用务求全部读完。甚至，读一半，放回去，再跳着读别的书，也是很好的方式。**读书应该为自己所用，而不是让自己去迁就它。**\r\n- **如何处理微博上、知乎上那些有趣的碎片化知识？**个人建议，最好的方式，是将它们作为起点。如果你觉得一个知识很有趣，就以它为出发点，去探索它背后的原理、背景、应用，去查资料、GOOGLE，顺藤摸瓜。这个知识点本身是没有太大价值的，有价值的是你去探索的过程。你经过探索了解到的东西，才能纳入你的知识体系，成为你思维的一部分。\r\n\r\n以上种种都需要不菲的时间，但学习本就是一件艰难的事情，所以优秀的人永远是凤毛麟角，所谓聪明的人，无非他们把走路、等车、休息等更多的时间花在这上面罢了。\r\n\r\n再说，学习本身，岂非也是一件很有趣的事情？ : )', '', '0', '2018-03-22 03:55:01.000000', '2018-03-22 03:55:02.000000', '1', '6', '1', '长期接受碎片化信息，就是让你的思维变得狭隘，难以进行复杂的思考。', '碎片化信息', '', ''), ('3', 'OOP mysqli入门', '## 数据库连接\r\n```php\r\n<?php\r\n\r\n// 数据库连接\r\n$mysqli = new mysqli(\'localhost\', \'root\', \'\', \'test\');  \r\n// 参数：host, username, password, dbname\r\n\r\nif ($mysqli->connect_errno) {   // 连接数据库如果有错误\r\n    die(\'数据库连接错误，错误信息：\' . $mysqli->connect_error);  // 输出错误信息\r\n} else {\r\n    $mysqli->set_charset(\'utf-8\');  // 设置字符编码\r\n}\r\n```\r\n\r\n<!-- more -->\r\n\r\n## 增，删，改，查\r\n```php\r\n<?php\r\n\r\n// 增\r\n$sql = \"insert into `mysqli` (`username`,`age`) values(\'test\',\'11\')\";\r\n$res = $mysqli->query($sql);  // SELECT, SHOW, DESCRIBE或 EXPLAIN查询会返回一个mysqli_result 对象，其他返回true\r\nif ($res) {\r\n    echo $mysqli->insert_id;    // 返回插入成功后的id\r\n}\r\n\r\n// 删\r\n$sql = \"delete from `mysqli` where id=\'44\'\";\r\n$res = $mysqli->query($sql);\r\nif($res){\r\n    echo $mysqli->affected_rows;    // 返回受影响条数\r\n}\r\n\r\n// 改\r\n$sql = \"update `mysqli` set `username`=\'111\' where id=42\";\r\n$res = $mysqli->query($sql);\r\nif($res){\r\n    echo $mysqli->affected_rows;    // 返回受影响条数\r\n}\r\n\r\n// 查\r\n$sql = \"select * from `mysqli`\";\r\n$res = $mysqli->query($sql);    // select操作，返回mysqli_result 对象\r\nif($res && $res->num_rows > 0){ // 如果有结果集，并且大于0\r\n    // 1. 遍历数据 fetch_assoc()\r\n//    $rows = [];\r\n//    while ($row = $res->fetch_assoc()){ // 返回关联数组\r\n//        $rows[] = $row;\r\n//    }\r\n//    print_r($rows);\r\n\r\n    // 2. fetch_all,遍历所有数据，并返回关联数组，参数：MYSQLI_ASSOC\r\n    $rows = $res->fetch_all(MYSQLI_ASSOC);\r\n    print_r($rows);\r\n}\r\n```\r\n\r\n\r\n\r\n## 执行多条sql语句    {#duotiaosqlyuju}\r\n```php\r\n<?php\r\n\r\n$sql = \"select * from `mysqli`;\";\r\n$sql .= \"select count(*) from `mysqli`;\";\r\n// store_result, next_result, more_results\r\nif ($mysqli->multi_query($sql)) {   // 执行多条语，如果有结果集，没有返回false\r\n    do {\r\n\r\n        if ($result = $mysqli->store_result()) {  // 暂存的结果集,第一个\r\n            while ($row = $result->fetch_assoc()) {\r\n                print_r($row);\r\n            }\r\n            $result->free();    // 释放结果集\r\n        }\r\n\r\n        if ($mysqli->more_results()) {    // 如果有多个结果集\r\n            echo \'<hr/>\';\r\n        }\r\n\r\n    } while ($mysqli->next_result()); // 调用下一个结果集\r\n}\r\n```\r\n\r\n## 预处理语句\r\n```php\r\n<?php\r\n\r\n// 有效防止sql注入，大大减少分析时间\r\n$sql = \"select `username`,`age` from `mysqli` where username = ?\";\r\n$stmt = $mysqli->prepare($sql); // 预处理sql语句\r\n$stmt->bind_param(\"s\", $name);  // 绑定sql语句中的?参数, 参数1：类型(int,double,string,blob)，参数2：变量\r\n\r\n$name = \'haha\';\r\n\r\nif($stmt->execute()){   // 执行预处理语句\r\n    $stmt->bind_result($username,$age); // 绑定结果到变量\r\n\r\n    while ($stmt->fetch()){ // 执行遍历\r\n        echo $username.\':\'.$age;    // 输出结果\r\n        echo \'<br/>\';\r\n    }\r\n}\r\n```\r\n\r\n## 预处理插入\r\n```php\r\n<?php\r\n\r\n$sql = \"insert into `mysqli` (`username`,`age`) values (?, ?);\";\r\n$stmt = $mysqli->prepare($sql); // 预处理sql语句\r\n$stmt->bind_param(\'si\',$username,$age); // 绑定sql语句中的?参数, 参数1：类型(int,double,string,blob)，参数2：变量\r\n\r\n$username = \"JK\";\r\n$age = \"999\";\r\n$stmt->execute();\r\n\r\n$username = \"PHP\";\r\n$age = \"333\";\r\n$stmt->execute();\r\n\r\n//if($stmt->execute()){   // 执行预处理语句\r\n//    echo $stmt->insert_id;  // 插入成功后的id\r\n//}else{\r\n//    echo $stmt->error;\r\n//}\r\n```\r\n\r\n## 事务\r\n```php\r\n<?php\r\n\r\n// 事务，需要所有sql执行都成功了才会提交\r\n$mysqli->autocommit(false); // 关闭自动提交\r\n$sql1 = \"update `user` set `money`=`money`-100 where id=1\";\r\n$res1 = $mysqli->query($sql1);\r\n$num1 = $res1->num_rows;\r\n\r\n$sql2 = \"update `user` set `money`=`money`+100 where id=2\";\r\n$res2 = $mysqli->query($sql2);\r\n$num2 = $res2->num_rows;\r\n\r\nif($res1 && $res2 && $num1 && $num2){   // 需满足所有sql执行的结果都正确\r\n    $mysqli->commit();  // 提交\r\n    $mysqli->autocommit(true);  // 开启自动提交\r\n    echo \'交易成功！\';\r\n}else{\r\n    $mysqli->rollback();    // 回滚\r\n    echo $mysqli->error;\r\n}\r\n```\r\n\r\n## 类封装\r\n```php\r\n<?php\r\n\r\nclass mysqliDB\r\n{\r\n    private $mysqli;\r\n\r\n    public function __construct($config)\r\n    {\r\n        $this->mysqli = new mysqli($config[\'host\'], $config[\'username\'], $config[\'passwd\'], $config[\'dbname\']);\r\n        if ($this->mysqli->connect_errno) {\r\n            die(\'数据库连接失败：\' . $this->mysqli->connect_error);\r\n        } else {\r\n            $this->mysqli->set_charset(\'utf8\');\r\n        }\r\n    }\r\n\r\n    public function error($error)\r\n    {\r\n        echo \'错误信息：\' . $error;\r\n    }\r\n\r\n    public function query($sql)\r\n    {\r\n        $res = $this->mysqli->query($sql);\r\n        if (!$res) {\r\n            $this->error($this->mysqli->error);\r\n        }\r\n        return $res;\r\n    }\r\n\r\n    // 增\r\n    public function insert($table, $arr)\r\n    {\r\n\r\n        $keys = [];\r\n        $vals = [];\r\n\r\n        foreach ($arr as $key => $val) {\r\n            $keys[] = \"`$key`\";\r\n            $vals[] = \"\'$val\'\";\r\n        }\r\n\r\n        $sql = \"insert into {$table} (\" . implode(\',\', $keys) . \") values (\" . implode(\',\', $vals) . \")\";\r\n\r\n        $this->query($sql);\r\n        return $this->mysqli->insert_id;\r\n    }\r\n\r\n    // 删\r\n    public function delete($table, $where = null)\r\n    {\r\n        $where = $where ? \'\' : \"where \" . $where;\r\n        $sql = \"delete from $table {$where}\";\r\n\r\n        $this->query($sql);\r\n        return $this->mysqli->affected_rows;\r\n    }\r\n\r\n    // 改\r\n    public function update($table, $arr, $where = null)\r\n    {\r\n        $where = $where ? \'\' : \"where \" . $where;\r\n        $str = \'\';\r\n\r\n        foreach ($arr as $key => $val) {\r\n            $str .= \",\" . \"`\" . $key . \"`\" . \"=\" . \"\'\" . $val . \"\'\";\r\n        }\r\n\r\n        $str = substr($str, 1);\r\n\r\n        $sql = \"update {$table} set {$str} {$where}\";\r\n\r\n        $this->query($sql);\r\n        return $this->mysqli->affected_rows;\r\n    }\r\n\r\n    // 获取所有数据\r\n    public function findAll($sql)\r\n    {\r\n        $res = $this->query($sql);\r\n        if ($res && $res->num_rows > 0) {\r\n            return $res->fetch_all(MYSQLI_ASSOC);\r\n        }\r\n    }\r\n\r\n    // 获取一条数据\r\n    public function findOne($sql)\r\n    {\r\n        $res = $this->query($sql);\r\n        if ($res && $res->num_rows > 0) {\r\n            return $res->fetch_assoc();\r\n        }\r\n    }\r\n\r\n    // 获取一条字段\r\n    public function findResult($sql, $row = 0, $filed = 0)\r\n    {\r\n        $res = $this->query($sql);\r\n        if ($res && $res->num_rows > 0) {\r\n            $res->data_seek($row);\r\n            $r = $res->fetch_array();\r\n            return $r[$filed];\r\n        }\r\n    }\r\n\r\n    // 获取结果条数\r\n    public function getResultRows($sql)\r\n    {\r\n        $res = $this->query($sql);\r\n        return $res->num_rows;\r\n    }\r\n\r\n}\r\n```\r\n\r\n## 参考资料\r\n<a href=\"http://php.net/manual/zh/book.mysqli.php\" target=\"_blank\">参考资料</a>', '', '0', '2018-03-23 07:22:58.000000', '2018-03-23 07:22:59.000000', '1', '7', '1', 'php mysqli 的入门基础', 'php mysqli', '', ''), ('4', '2017年成为全栈开发工程师的权威指南', '![1_UgCnCLR0e3R3v7fnCS9ALA[1].jpeg](https://i.loli.net/2017/12/26/5a426aa723f56.jpeg)\r\n\r\n根据 2016年 Stack Overflow 开发者调查 显示，全栈开发工程师是当今最受欢迎的开发者职业。 毫无疑问，有许多在线和现场教学课程可以帮助你成为全栈开发工程师，甚至帮助这些新开发人员找到高薪编程开发工作。\r\n\r\n国内外有很流行的在线课程，比如： Lynda ，Udacity ，Coursera ，Thinkful ， 全栈开发工程师远程就业班，带你轻松搞定node.js，从前端小工到 BAT 中高级工程师的必备技能，Vue2.0全栈实战项目，WEB前端开发零基础课程，React 大神进阶 等等。\r\n\r\n<!-- more -->\r\n\r\n除了这些在线课程，还有许多 现场教学课程 正在教人们成为 Web 开发人员所需的技能。\r\n\r\n\r\n\r\n在这篇文章中，我不会讨论哪些在线或现场教学课程比较好。相反，我将提供一份我认为当今要成为一个全栈开发工程师所需最重要技能的权威指南，如果你以前从未编写过代码的话，或许可以获得一份好工作。我会从三个方面列出成为一个全栈开发工程师所需的最重要技能：\r\n\r\n2017年教给学生最多的课程是什么。\r\n我过去去面试开发者岗位 和 在我现在公司全栈开发工程师的个人经验。\r\n在 Coderbyte 接受现场教学，然后从事全栈开发工作的开发者们的故事和反馈。\r\n权威指南\r\n\r\n全栈开发工程师是指能够独立开发应用程序的前端和后端工作的开发人员。前端通常是指用户在应用程序中能看到或交互的部分，后端是应用程序中处理业务逻辑，数据库交互，用户认证，服务端配置等部分。作为一个全栈开发工程师并不意味着你必要完全掌握前端或后端所需的一切开发技术，而是意味着你可以进行前后端开发工作，并且了解构建应用程序时发生了什么。\r\n\r\n如果您想在2017年成为一个全栈开发工程师，并找到你的第一份工作，以下是参考指南，列出你应该学习的事项。\r\n\r\n## 1. HTML/CSS \r\n\r\n![1_mVyO2CM9a_8mpEj0oVh2Nw[1].jpeg](https://i.loli.net/2017/12/26/5a426aa7b2327.jpeg)\r\n\r\n\r\n\r\n几乎每一个课程，无论是在线还是在场，教你成为全栈开发工程师都是从 HTML 和 CSS 开始的，因为它们是 Web 构建的基石。简单地说，HTML允许你向网站添加内容，CSS允许你为内容设计风格。与 HTML / CSS 相关的以下主题经常在面试时和实际工作中出现：\r\n\r\n- [语义化的 HTML。!](https://en.wikipedia.org/wiki/Semantic_HTML)\r\n- 能够解释 CSS 盒子模型。\r\n- CSS 预处理器 的优点 （您不一定需要了解如何深入使用它们，但是您应该了解它们的用途以及它们对开发的帮助）。\r\n- CSS Media Queries (媒体查询) (愚人码头注：原文是这个链接) 定位不同的设备并编写响应式CSS。\r\n- Bootstrap（一个框架，帮助设计和布局页面内容，并且许多在线课程或学校重点关注和教学 Bootstrap ，事实上相对于 Bootstrap 的功能和方法，更重要的是深入掌握 CSS 的基础知识）。\r\n\r\n## 2. JavaScript\r\n\r\n![1_UgCnCLR0e3R3v7fnCS9ALA[1].jpeg](https://i.loli.net/2017/12/26/5a426aa723f56.jpeg)\r\n\r\n\r\nJavaScript 语言每年都越来越受欢迎，新的库、框架和工具都在持续不断的涌现。根据 2016年 Stack Overflow 开发者调查 ，JavaScript 已经成为 全栈，前端 和 后端开发中最流行的语言。它是在浏览器中本机运行的唯一语言，并且也可以将其作为服务端语言（比如您将在下面看到的 Node.js ）。以下是你成为一个全栈开发工程师所需要了解的一些主题：\r\n\r\n知道如何 处理DOM ，同时也知道 JSON 是什么，以及如何操作它。\r\n重要的 语言特性 ，如 functional composition(函数组合)，prototypal inheritance(原型继承)，closures(闭包)，event delegation(事件委托)，scope(作用域)(愚人码头注：作用域可以查看 深入理解JavaScript中的作用域和上下文 这篇文章)，higher-order functions(高阶函数) 等。\r\n异步流程控制，promises 和 callbacks 。(愚人码头注：当然还有 ES 7 中的 async / await 也可以作为一个了解点。)\r\n学习如何正确地构建你的代码，并将代码 模块化 ，像 webpack ，browserify ，或者像 gulp 这样的构建工具将会很有帮助。\r\n至少知道如何使用一个 流行的框架 （许多课程将重点放在一些库、框架上，如 React 或 AngularJS (愚人码头注：还有 Vue 等)，但实际上，你需要更加深入地了解 JavaScript 语言，而不是非常重视框架特定的功能。一旦你对 JavaScript 有了很好的了解，拿起一个框架就不会太难了）。\r\n虽然有些人 可能会争论 说，你应该尽量少使用慢慢地消亡的东西，但是现在的实际情况是 jQuery 代码在大多数应用程序中仍然存在，并且理解它将会很有帮助。\r\n了解有关 测试框架 的知识以及它们的重要性（有些人甚至认为这个主题应该是可选的）。\r\n了解一些重要的 ES6 新特性（可选）。\r\n\r\n## 3. 后端语言\r\n\r\n\r\n![1_7Va2xnJbgXenQ95RAkhuAQ[1].jpeg](https://i.loli.net/2017/12/26/5a426aa4cfe09.jpeg)\r\n\r\n\r\n\r\n一旦你感觉 HTML / CSS 和 JavaScript 掌握的很好的时候，那么你将需要转到后端语言，来处理数据库操作，用户认证 和 应用程序逻辑 等操作。所有 在线课程 和 现场教学 通常集中教学一门特定的后端语言，只要你了解一门后端语言，并且学习与所选择的语言的细微差别，那么在实际中，无论你学什么都会比较轻松。如果你问某些后端语言是最好的学习方法，你将收到不同的答案，所以下面我列出了一些流行的组合。一个重要的说明：无论你决定学习什么，只要坚持下去，尽可能多地学习它 – 所有以下列出的语言都可以找到相关的工作。\r\n\r\nNode.js：这是一个很好的选择，因为 Node.js 本身只是一个 JavaScript 运行环境，这意味着你不需要学习一种新的语言。这是很多在线课程和现场教学选择教 Node.js 的重要原因。最有可能学会，帮助你开发 Web 应用程序的框架是 Express。\r\nRuby：Ruby 开发的一些流行框架是 Rails 和 Sinatra 。许多 课程规划 都把 Ruby 作为第一选择的后端语言。\r\nPython：Python 开发的一些流行框架是 Django 和 Flask 。\r\nJava：涉及到全栈 Web 开发，Java 语言目前并没有太多的学习课程，但是一些公司确实将 Java 作为后端，它仍然是一个需求量很大的语言(见上图)。\r\nPHP：现在很少有教 PHP 的课程，但是它和 JAVA 一样，它仍然是非常需要的语言，它是当今 Web 开发的基石。\r\n\r\n## 4. 数据库 和 Web 存储\r\n\r\n![1_IfG8E5UMuPwBp2OczpiUmw[1].jpeg](https://i.loli.net/2017/12/26/5a426aa83e3ed.jpeg)\r\n\r\n\r\n当学习构建 Web 应用程序时，在某些时候你可能想要在某个地方存储数据，以便以后再访问它。你应该很好地掌握与 数据库 和 存储 有关的以下主题。\r\n\r\n理解 关系形数据 的好处，例如：SQL 。\r\n学习 NoSQL (非关系型) 数据库，例如：MongoDB 。\r\n理解 不同场景 中选择哪些会更好。\r\n知道如何使用你选择的后端语言连接数据库(例如： Node.js + MongoDB)。\r\n理解像 Redis 或 memcached 这样的内存数据存储的 好处 。\r\n掌握 Web storage(存储) 可以在浏览器中存储 session ，cookies 和 cached 数据。\r\n了解 扩展数据库 ，ACID 和 ORM （全部可选）。\r\n\r\n## 5. HTTP & REST\r\n\r\n![1_3jazyUwurr2zfp5uEIi2Dg[1].png](https://i.loli.net/2017/12/26/5a426aa63e100.png)\r\n\r\n\r\n\r\nHTTP 是互联网上的无状态应用协议 – 它允许客户端与服务器进行通信的方式（例如，您的 JavaScript 代码可以通过 HTTP 发起一个 AJAX 请求 ，来获取服务器上运行某些后端代码的结果）。你应该掌握的重要主题如下：\r\n\r\n什么是 REST ，以及它对 HTTP 和 web 应用的 重要性.\r\n设计 RESTful API 的 最佳实践 。POST / GET 请求。\r\n学习如何使用 Chrome DevTools 非常有用。（愚人码头注： Chrome DevTools 中文文档）\r\n什么是 SSL证书 ？\r\nHTTP/2 & SPDY （可选）\r\nWebSockets ，Web Workers 和 Service Worders（全部可选）\r\n\r\n## 6. Web应用架构\r\n\r\n![1_wWDnYaaeAIsYVmNACstddg[1].png](https://i.loli.net/2017/12/26/5a426aa820182.png)\r\n\r\n\r\n一旦你认为你掌握了 HTML / CSS ，JavaScript ，后端编程 ，数据库 和 HTTP / REST，那么接下来就是棘手部分了。这时，如果你想创建一个有点复杂的 Web 应用程序，你需要知道如何构建代码，如何分离文件，在哪里存储您的大型媒体文件，如何在数据库中组织数据，在哪里执行某些计算任务（客户端 vs 服务器端）等等。\r\n\r\n你可以在线阅读许多最佳实践的文章，但是实际上，了解应用程序架构的最佳方式是通过对自己的大型应用程序（包含几个 移动端项目 ）进行处理总结出来的 – 更好一点的方式是，在一个团队工作，一起开发一个 大型/复杂 的应用程序。\r\n\r\n为什么这么说呢？例如，具有 7 年以上经验的开发人员可能不一定比具有 2 年经验的开发人员更好地了解 CSS 或 JavaScript ，但是在这些年中，他们参与开发了许多不同的应用和网站，并 学会如何 建构和设计应用程序，在实践中学习通常是最有效的，往往是 经验丰富的开发人员 能掌控“大局”。以下是你可以阅读的一些内容，可以帮助你了解如何高效地构建Web应用程序：\r\n\r\n学习公共 平台服务 ，例如 Heroku 和 AWS 。Heroku 允许您轻松上传您的代码，并且不需要多少的配置 或 服务器维护就可以轻松启动和运行应用程序。AWS 提供了数十种产品和服务来帮助存储，视频处理，负载均衡等等。\r\n针对应用和现代浏览器进行 性能 优化 。\r\n关于Web应用程序架构应该采纳的 一些意见 。\r\n微软的 设计web应用指南 。\r\nMVC 。\r\n最重要的是，你应该尝试与其他开发人员合作，看看 GitHub 上热门的项目代码库，并从高级开发人员那里 学到 尽可能多 的东西。\r\n\r\n## 7. Git\r\n\r\n![1_NomW1pXBFlKFFwZuTXVSTA[1].png](https://i.loli.net/2017/12/26/5a426aa56d98b.png)\r\n\r\n\r\n\r\nGit 是一个 版本控制系统 ，允许开发团队中的开发人员跟踪代码库的所有更改。了解与 Git 有关的一些重要事项很重要，以便你了解如何正确获取你错过的最新代码，更新部分代码，修复，并修改别人的代码，而不会搞破坏。你一定要学习 Git 背后的 概念 ，同时也要自己玩弄。\r\n\r\n这个是你可能会使用的 一些常见的 git 命令的参考列表 。\r\n这是一个为初学者准备的 冠以使用 Git 和 GitHub 的教程 。\r\n\r\n## 8. 基本算法和数据结构\r\n\r\n![1_YewAB-IJnGpBr3LtvZPiRg[1].png](https://i.loli.net/2017/12/26/5a426aa724039.png)\r\n\r\n这个话题在开发者中有点两极化，因为有些开发者认为，在 web 开发中，不需要过分的注重计算机科学这个课题，比如树遍历，排序，算法分析，矩阵处理等。不过一些公司，比如 Google ，在面试中 提到 这些问题是出了名的，也经常被一些面试者吐槽。有人谈及 Google 的前端工程师面试时说：\r\n\r\n也就是说，正如 Ryan McGrath 所说，我们希望前端(FE)工程师像所有的工程师一样拥有扎实的 CS 背景。\r\n\r\n虽然有些公司几乎都要求求职者拥有计算机科学学位或同等学历，然而也有很多公司会 雇用 那些没有这种技术资历的开发人员，如果这些开发人员可以证明他们知道如何开发应用程序，并展示出对整个领域了解。但是我认为，作为一个有实力的开发者，不写出低效的代码，或使用错误的工具，非常有必要了解一些基本的算法和数据结构，并能够分析权衡。所以这里有一些你应该学习的东西：\r\n\r\n深入学习研究 hash tables(哈希表) 。这种数据结构在 JavaScript 中使用对象表示（ Python 中是字典，而在 Ruby 中是哈希 ）。\r\n理解 树 和 图形 如何 更加有利的 作为数据结构。\r\n理解 Big-O 分析 的基础知识，所以你不要做 愚蠢的事情 ，比如创建一个嵌套3层的循环，如果你不需要！\r\n知道什么时候使用应该 对象或数组 ，并能作出很好的权衡。\r\n学习为什么使用大量数据时 缓存 非常重要。 还要了解内存存缓与磁盘存储的 优缺点 。\r\n学习队列和堆栈之间的 区别 。\r\n总结\r\n\r\n学习所有这一切将是非常艰苦，但最终是很有收获的，全栈开发非常有趣！欢迎你评论留言，说出你的观点和已经。同事推荐查看 Coderbyte 的一些算法练习。', '', '0', '2018-03-23 07:24:06.000000', '2018-03-23 07:24:05.000000', '1', '8', '1', '成为全栈工程师需要掌握的知识栈', '全栈工程师 权威指南 web全栈', 'banner/banner_full_stack1.jpeg', 'http://www.css88.com/archives/7529'), ('5', 'Mysql基础1——[数据类型，查看，创建，约束]', 'MySQL是一个**关系型数据库管理系统**，其体积小、速度快、总体拥有成本低，而且是开放源码\r\n\r\n虽然我们日常一般在像`navicat`这样的软件上操作Mysql，但掌握一些常用的Mysql命令，概念还是有必要的，更能加深我们对Mysql的理解程度，以便更灵活的操作Mysql\r\n\r\n<!-- more -->\r\n\r\n## 基础\r\n### Mysql语句规范\r\n- 关键字与函数名称全部大写\r\n- 数据库名称、表名称、字段名称、全部小写\r\n- sql语句必须以分号结尾\r\n\r\n### 启动|关闭服务(win平台cmd命令行 win+r,输入cmd回车)\r\n`net start|stop mysql`\r\n\r\n### 登陆\r\n`mysql -uroot -p111222`\r\n\r\n### 退出\r\n`exit;quit;\\q;`\r\n\r\n### 打开数据库\r\n`USE db_name`\r\n\r\n### 列显示查询的数据\r\n`SELECT * FROM tdb_goods\\G`\r\n\r\n### 改变显示编码，不会影响到数据\r\n`SET NAMES gbk;`\r\n\r\n### 查看编码\r\n`SHOW VARIABLES LIKE \'character%\';`\r\n\r\n### 查看数据库编码\r\n`SHOW VARIABLES LIKE \'collation%\';`\r\n\r\n---\r\n\r\n## 数据类型\r\n### 整型\r\n<table class=\"table table-striped\">\r\n    <tr>\r\n        <td class=\"col-md-2\">TINYINT</td>\r\n        <td>有符号：-128~127，无符号:0~255</td>\r\n        <td class=\"col-md-2 text-right\">1字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>SMALLINT</td>\r\n        <td>有符号：-32768~32768，无符号:0~65535</td>\r\n        <td class=\"text-right\">2字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>MEDIUMINT</td>\r\n        <td>有符号：-8388608~8388607，无符号:0~16777215</td>\r\n        <td class=\"text-right\">3字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>INT</td>\r\n        <td>有符号：-2147483648~2147483647，无符号:0~4294967295</td>\r\n        <td class=\"text-right\">4字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>BIGINT</td>\r\n        <td>有符号：-9223372036854775808~9223373036854775807，无符号:0~18446744073709551615</td>\r\n        <td class=\"text-right\">8字节</td>\r\n    </tr>\r\n</table>\r\n\r\n### 浮点型\r\n<table class=\"table table-striped\">\r\n    <tr>\r\n        <td class=\"col-md-3\">FLOAT[(M,D)]</td>\r\n        <td>M是数字总位数，D是小数点后面的位数。若省略单精度浮点数大约7位小数</td>\r\n    </tr>\r\n    <tr>\r\n        <td>DOUBLE[(M,D)]	</td>\r\n        <td>M是数字总位数，D是小数点后面的位数。若省略单精度浮点数大约7位小数</td>\r\n    </tr>\r\n</table>\r\n	\r\n### 日期时间类型\r\n\r\n一般用数字类型存储时间\r\n<table class=\"table table-striped\">\r\n    <tr>\r\n        <td class=\"col-md-3\">YEAR</td>\r\n        <td>1字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>TIME</td>\r\n        <td>3字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>DATE</td>\r\n        <td>3字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>DATETIME</td>\r\n        <td>8字节</td>\r\n    </tr>\r\n    <tr>\r\n        <td>TIMESTAMP</td>\r\n        <td>4字节</td>\r\n    </tr>\r\n</table>\r\n\r\n### 字符型\r\n<table class=\"table table-striped\">\r\n    <tr>\r\n        <td class=\"col-md-3\">CHAR(M)</td>\r\n        <td>M个字节，0<= M <=255</td>\r\n    </tr>\r\n    <tr>\r\n        <td>VARCHAR(M)</td>\r\n        <td>L+1个字节，其中L<=M 且 0<= M <=65535</td>\r\n    </tr>\r\n    <tr>\r\n        <td>TINYTEXT</td>\r\n        <td>L+1个字节，其中L<2的8次方</td>\r\n    </tr>\r\n    <tr>\r\n        <td>TEXT</td>\r\n        <td>L+2个字节，其中L<2的16次方</td>\r\n    </tr>\r\n    <tr>\r\n        <td>MEDIUMTEXT</td>\r\n        <td>L+3个字节，其中L<2的24次方</td>\r\n    </tr>\r\n    <tr>\r\n        <td>LONGTEXT</td>\r\n        <td>L+4个字节，其中L<2的32次方</td>\r\n    </tr>\r\n    <tr>\r\n        <td>ENUM(\'value1\',\'value2\',...)</td>\r\n        <td>1或2个字节，最多65535个值</td>\r\n    </tr>\r\n    <tr>\r\n        <td>SET(\'value1\',\'value2\',...)</td>\r\n        <td>1，2，3，4，8个字节，最多64个成员</td>\r\n    </tr>\r\n</table>\r\n\r\n---\r\n	\r\n## 查看SHOW\r\n### 当前服务器下的数据库\r\n`SHOW {DATABASES|SCHEMAS} [LIKE \'pattern\'|WHERE expr]`\r\n    \r\n`SHOW DATABASES;`\r\n\r\n### 警告信息\r\n`SHOW WARNINGS;`\r\n\r\n### 数据库创建编码\r\n`SHOW CREATE DATABASE db_name;`\r\n\r\n### 数据表\r\n`SHOW TABLES [FROM db_name] [LIKE \'pattern\'|WHERE expr]`\r\n\r\n`SHOW TABLES;`\r\n\r\n### 当前打开的数据库\r\n`SELECT DATABASE();`\r\n\r\n### 表的创建信息\r\n`SHOW CREATE TABLE tbl_name;`\r\n\r\n### 表的索引\r\n`SHOW INDEXES FROM tb1\\G`\r\n\r\n### 数据表结构\r\n`SHOW COLUMNS FROM tbl_name;`\r\n\r\n`DESC tbl_name;`\r\n\r\n`DESCRIBE tbl_name;`\r\n\r\n---\r\n\r\n## 创建CREATE\r\n### 数据库\r\n`CREATE {DATABASE|SCHEMA} [IF NOT EXISTS] db_name [DEFAULT] CHARACTER SET [=] charset_name`\r\n\r\n`CREATE DATABASE IF NOT EXISTS mydb CHARACTER SET utf8`\r\n\r\n### 数据表\r\n`CREATE TABLE [IF NOT EXISTS] table_name(column_name data_type,…)`\r\n\r\n```sql\r\nCREATE TABLE IF NOT EXISTS mytbl(\r\n    id SMALLINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,\r\n    name VARCHAR(20),\r\n    age TINYINT UNSIGNED DEFAULT 8\r\n);\r\n```\r\n\r\n---\r\n\r\n## 约束\r\n### 空值与非空\r\n`NULL,NOT NULL`\r\n### 自动编号\r\n`AUTO_INCREMENT`\r\n### 主键\r\n`PRIMARY KEY`\r\n### 唯一约束\r\n`UNIQUE KEY`\r\n### 默认约束\r\n`DEFAULT`\r\n### 外键\r\n`FOREIGN KEY`', '', '0', '2018-03-23 07:45:36.000000', '2018-03-23 07:45:37.000000', '1', '7', '1', 'mysql数据的基础，基本数据类型，查看数据库，创建数据库，数据表，创建约束', 'mysql 数据类型 查看 创建 约束', '', ''), ('6', 'Mysql基础2——[插入，删除，更新，查询，修改]', 'MySQL是一个**关系型数据库管理系统**，其体积小、速度快、总体拥有成本低，而且是开放源码\r\n\r\n虽然我们日常一般在像`navicat`这样的软件上操作Mysql，但掌握一些常用的Mysql命令，概念还是有必要的，更能加深我们对Mysql的理解程度，以便更灵活的操作Mysql\r\n\r\n<!-- more -->\r\n\r\n## 插入INSERT\r\n为自动增长的id赋值，可以采用NULL,DEFAULT\r\n\r\n`INSERT [INTO] tbl_name [(col_name,...)] VALUES(val,...)`\r\n\r\n`INSERT [INTO] tbl_name [(col_name,...)] {VALUES|VALUE} ({expr|DEFAULT},...),(...),...`\r\n\r\n`INSERT [INTO] tbl_name SET col_name = {expr|DEFAULT},... （此方法可以使用子查询,只能插入1条）`\r\n\r\n`INSERT [INTO] tbl_name [(col_name,...)] SELECT ... （将查询结果插入到指定的数据表）`\r\n\r\n---\r\n\r\n\r\n## 删除DELETE\r\n### 删除记录(单表删除)\r\n`DELETE FROM tbl_name [WHERE where_condition]`\r\n\r\n### 删除数据库\r\n`DROP {DATABASE | SCHEMA} [IF EXISTS] db_name;`\r\n\r\n---\r\n\r\n## 更新UPDATE\r\n\r\n`UPDATE [LOW_PRIORITY] [IGNORE] table_reference SET col_name1={expr1|DEFAULT} [,col_name2={expr2|DEFAULT}]... [WHERE where_condition]`\r\n\r\n`UPDATE mytbl SET age=20 WHERE id = 1;`\r\n\r\n---\r\n\r\n## 查询SELECT\r\n`SELECT expr,... FROM tbl_name`\r\n\r\n`SELECT username AS u FROM tbl_name;`\r\n\r\n\r\n```sql\r\nSELECT select_expr [,select_expr...] \r\n[\r\n    FROM table_references\r\n    [WHERE where_condition]\r\n    [GROUP BY {col_name|position} [ASC|DESC],...]\r\n    [HAVING where_condition]\r\n    [ORDER BY {col_name|expr|position} [ASC|DESC],...]\r\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\r\n]\r\n```\r\n\r\n---\r\n\r\n## 修改ALTER\r\n### 数据库\r\n`ALTER {DATABASE|SCHEMA} [db_name] [DEFAULT] CHARACTER SET [=] charset_name`\r\n\r\n### 数据表\r\n#### 添加列：\r\n`ALTER TABLE tbl_name ADD [COLUMN] col_name column_definition [FIRST|AFTER]`\r\n\r\n#### 添加多列：\r\n`ALTER TABLE tbl_name ADD [COLUMN] (col_name column_definition,…)`\r\n\r\n#### 删除列：\r\n`ALTER TABLE tbl_name DROP [COLUMN] col_name`\r\n\r\n#### 删除多列：\r\n`ALTER TABLE tbl_name DROP [COLUMN] col_name, DROP col_name,…`\r\n\r\n#### 添加主键约束：\r\n`ALTER TABLE tbl_name ADD [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)`\r\n\r\n#### 添加唯一约束：\r\n`ALTER TABLE tbl_name ADD [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY] [index_name] [index_type] (index_col_name,...)`\r\n\r\n#### 添加外键约束：\r\n`ALTER TABLE tbl_name ADD [CONSTRAINT [symbol]] FOREIGN [index_name] (index_col_name,...) reference_definition`\r\n\r\n#### 添加删除默认约束：\r\n`ALTER TABLE tbl_name ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}`\r\n\r\n#### 删除主键约束，需要先改变自增长（`ALTER TABLE tbl_name CHANGE id id int`）：\r\n`ALTER TABLE tbl_name DROP PRIMARY KEY`\r\n\r\n#### 删除唯一约束：\r\n`ALTER TABLE tbl_name DROP {INDEX|KEY} index_name`\r\n\r\n#### 删除外键约束：\r\n`ALTER TABLE tbl_name DROP FOREIGN KEY fk_symbol`\r\n\r\n#### 修改列定义：\r\n`ALTER TABLE tbl_name MODIFY [COLUMN] col_name column_definition [FIRST|AFTER col_name]`\r\n\r\n#### 修改列名，除了可以修改列定义，还可以修改列名：\r\n`ALTER TABLE tbl_name CHANGE [COLUM] old_col_name new_col_name column_definition [FIRST|AFTER col_name]`\r\n\r\n#### 数据表更名（不要随意更改数据列或数据表名，会造成其他引用问题）：\r\n`ALTER TABLE tbl_name RENAME [TO|AS] new_tbl_name`\r\n\r\n`RENAME TABLE tbl_name TO new_tbl_name [, tbl_name2 TO new_tbl_name2]`', '', '0', '2018-03-23 07:46:11.000000', '2018-03-23 07:46:12.000000', '1', '7', '1', 'mysql数据库的基本操作，增加，删除，读取，修改', 'mysql 增 删 改 查 CURD', '', ''), ('7', 'Mysql基础4——[运算符，函数]', 'mysql给我们提供了一些常用的运算符和函数，方便我们处理一些常用的操作，比如，字符串的拼接，数字字符串的格式化，大小写转换，去空格，取整，获取当前日期，MD5加密等等\r\n\r\n接下来，就一起来了解这相关的知识点\r\n\r\n\r\n## 字符函数\r\n- CONCAT() 字符串连接\r\n- FORMART() 字符串格式化\r\n- LOWER() 字符串转小写\r\n- UPPER() 字符串转大写\r\n- LENGTH() 字符串长度\r\n- LTRIM() 字符串去左边空格\r\n- RTRIM() 字符串去右边空格\r\n- TRIM() 去掉字符串中指定的前后字符,默认BOTH，前后都去除\r\n- SUBSTRING() 截取字符串,开始位置从1开始\r\n- [NOT] LIKE 通配符匹配的字符串\r\n- REPLACE() 在字符串中替换搜索的字符串\r\n\r\n<!-- more -->\r\n\r\n```sql\r\n# concat() 字符串连接\r\nMySQL [(none)]> SELECT CONCAT(\'abc\',\'def\');\r\n+---------------------+\r\n| CONCAT(\'abc\',\'def\') |\r\n+---------------------+\r\n| abcdef              |\r\n+---------------------+\r\n\r\n\r\n# format() 字符串格式化\r\nMySQL [(none)]> SELECT FORMAT(1000,2);\r\n+----------------+\r\n| FORMAT(1000,2) |\r\n+----------------+\r\n| 1,000.00       |\r\n+----------------+\r\nMySQL [(none)]> SELECT FORMAT(100.2389, 2);\r\n+---------------------+\r\n| FORMAT(100.2389, 2) |\r\n+---------------------+\r\n| 100.24              |\r\n+---------------------+\r\n\r\n\r\n# lower() 字符串转小写\r\nMySQL [(none)]> SELECT LOWER(\'NOW\');\r\n+--------------+\r\n| LOWER(\'NOW\') |\r\n+--------------+\r\n| now          |\r\n+--------------+\r\n\r\n\r\n# upper() 字符串转大写\r\nMySQL [(none)]> SELECT UPPER(\'now\');\r\n+--------------+\r\n| UPPER(\'now\') |\r\n+--------------+\r\n| NOW          |\r\n+--------------+\r\n\r\n\r\n# length() 字符串长度\r\nMySQL [(none)]> SELECT LENGTH(\'5five\');\r\n+-----------------+\r\n| LENGTH(\'5five\') |\r\n+-----------------+\r\n|               5 |\r\n+-----------------+\r\n\r\n\r\n# LTRIM(),RTRIM() 字符串去左|右边空格\r\nMySQL [(none)]> SELECT LTRIM(\'   TEST\');\r\n+------------------+\r\n| LTRIM(\'   TEST\') |\r\n+------------------+\r\n| TEST             |\r\n+------------------+\r\n\r\n\r\n# TRIM({LEADING|TRAILING|BOTH} \'?\' FROM \'??MY??SQL?\') 去掉字符串中指定的前后字符,默认BOTH，前后都去除\r\nMySQL [(none)]> SELECT TRIM(BOTH  \'?\' FROM \'??MY?SQL?\');\r\n+----------------------------------+\r\n| TRIM(BOTH  \'?\' FROM \'??MY?SQL?\') |\r\n+----------------------------------+\r\n| MY?SQL                           |\r\n+----------------------------------+\r\n\r\n\r\n# SUBSTRING(str,startIndex=1,length) 截取字符串,开始位置从1开始\r\nMySQL [(none)]> SELECT SUBSTRING(\'abcdef\',1,2);\r\n+-------------------------+\r\n| SUBSTRING(\'abcdef\',1,2) |\r\n+-------------------------+\r\n| ab                      |\r\n+-------------------------+\r\n\r\n\r\n# [not] like 通配符匹配的字符串\r\n# 表数据\r\n+------------+\r\n| type_name  |\r\n+------------+\r\n| 家用电器   |\r\n| 电脑、办公 |\r\n| 大家电     |\r\n| 生活电器   |\r\n| 平板电视   |\r\n| 空调       |\r\n| 电风扇     |\r\n| 饮水机     |\r\n| 电脑整机   |\r\n| 电脑配件   |\r\n| 笔记本     |\r\n| 超级本     |\r\n| 游戏本     |\r\n| CPU        |\r\n| 主机       |\r\n+------------+\r\n# 查询商品类型表中以\'电\'开头的类型\r\nMySQL [test]> SELECT type_name FROM goods_types WHERE type_name LIKE \'电%\';\r\n+------------+\r\n| type_name  |\r\n+------------+\r\n| 电脑、办公 |\r\n| 电风扇     |\r\n| 电脑整机   |\r\n| 电脑配件   |\r\n+------------+\r\n\r\n\r\n# REPLACE(str,search,replace) 在str中，把search字符串替换为replace字符串\r\nMySQL [test]> SELECT REPLACE(\'abcdeffffff\',\'f\',\'?\');\r\n+--------------------------------+\r\n| REPLACE(\'abcdeffffff\',\'f\',\'?\') |\r\n+--------------------------------+\r\n| abcde??????                    |\r\n+--------------------------------+\r\n```\r\n\r\n\r\n## 数值运算函数\r\n- CEIL() 向上取整\r\n- FLOOR() 向下取整\r\n- DIV 整除\r\n- MOD() 取模\r\n- POWER() 幂运算\r\n- ROUND() 四舍五入\r\n- TRUNCATE() 截断\r\n\r\n```sql\r\n# 向上|下取整\r\nMySQL [test]> SELECT CEIL(7.1);\r\n+-----------+\r\n| CEIL(7.1) |\r\n+-----------+\r\n|         8 |\r\n+-----------+\r\nMySQL [test]> SELECT FLOOR(9.9);\r\n+------------+\r\n| FLOOR(9.9) |\r\n+------------+\r\n|          9 |\r\n+------------+\r\n\r\n\r\n# DIV 整数除法\r\nMySQL [test]> SELECT 10 DIV 3;\r\n+----------+\r\n| 10 DIV 3 |\r\n+----------+\r\n|        3 |\r\n+----------+\r\n\r\n\r\n# MOD 取模\r\nMySQL [test]> SELECT 5 MOD 2;\r\n+---------+\r\n| 5 MOD 2 |\r\n+---------+\r\n|       1 |\r\n+---------+\r\n\r\n\r\n# POWER() 幂运算\r\nMySQL [test]> SELECT POWER(3,2);\r\n+------------+\r\n| POWER(3,2) |\r\n+------------+\r\n|          9 |\r\n+------------+\r\n\r\n\r\n# ROUND() 四舍五入\r\nMySQL [test]> SELECT ROUND(3.4);\r\n+------------+\r\n| ROUND(3.4) |\r\n+------------+\r\n|          3 |\r\n+------------+\r\n\r\n\r\n# TRUNCATE() 截断，不四舍五入\r\nMySQL [test]> SELECT TRUNCATE(234.156, 2);\r\n+----------------------+\r\n| TRUNCATE(234.156, 2) |\r\n+----------------------+\r\n|               234.15 |\r\n+----------------------+\r\n```\r\n\r\n\r\n## 比较运算符\r\n- [NOT] BETWEEN...AND... [不]在范围之内\r\n- [NOT] IN() [不]在列出的范围之内\r\n- IS [NOT] NULL 是否为空\r\n\r\n```sql\r\n# BETWEEN...AND...\r\n# 查询12是否在10到20范围之内\r\nMySQL [test]> SELECT 12 BETWEEN 10 AND 20;\r\n+----------------------+\r\n| 12 BETWEEN 10 AND 20 |\r\n+----------------------+\r\n|                    1 |\r\n+----------------------+\r\n\r\n\r\n# IN() 查询目标是否在指定范围之内\r\nMySQL [test]> SELECT 4 IN(1,2,5,6);\r\n+---------------+\r\n| 4 IN(1,2,5,6) |\r\n+---------------+\r\n|             0 |\r\n+---------------+\r\n\r\n\r\n# IS NULL 是否为空\r\nMySQL [test]> SELECT NULL is NULL;\r\n+--------------+\r\n| NULL is NULL |\r\n+--------------+\r\n|            1 |\r\n+--------------+\r\n```\r\n\r\n\r\n## 日期时间函数\r\n- NOW() 当前年月日，时间\r\n- CURDATE() 当前年月日(2011-02-03)\r\n- CURTIME() 当前时间(21:22:39)\r\n- DATE_ADD() 日期加减\r\n- DATEDIFF() 日期的差值天\r\n- DATE_FORMAT() 日期格式化\r\n\r\n```sql\r\n# NOW()\r\nMySQL [test]> SELECT NOW();\r\n+---------------------+\r\n| NOW()               |\r\n+---------------------+\r\n| 2017-03-22 12:28:26 |\r\n+---------------------+\r\n\r\n\r\n# CURDATE()\r\nMySQL [test]> SELECT CURDATE();\r\n+------------+\r\n| CURDATE()  |\r\n+------------+\r\n| 2017-03-22 |\r\n+------------+\r\n\r\n\r\n# CURTIME()\r\nMySQL [test]> SELECT CURTIME();\r\n+-----------+\r\n| CURTIME() |\r\n+-----------+\r\n| 12:29:44  |\r\n+-----------+\r\n\r\n\r\n# DATE_ADD()\r\n# 常用单位YEAR,MONTH,DAY,WEEK\r\nMySQL [test]> SELECT DATE_ADD(\'2017-03-22\',INTERVAL 365 DAY);\r\n+-----------------------------------------+\r\n| DATE_ADD(\'2017-03-22\',INTERVAL 365 DAY) |\r\n+-----------------------------------------+\r\n| 2018-03-22                              |\r\n+-----------------------------------------+\r\n\r\n\r\n# DATEDIFF()\r\nMySQL [test]> SELECT DATEDIFF(\'2017-03-22\',\'2016-03-22\');\r\n+-------------------------------------+\r\n| DATEDIFF(\'2017-03-22\',\'2016-03-22\') |\r\n+-------------------------------------+\r\n|                                 365 |\r\n+-------------------------------------+\r\n\r\n\r\n# DATE_FORMAT()\r\nMySQL [test]> SELECT DATE_FORMAT(\'2017-03-22\',\'%m/%d/%Y\');\r\n+--------------------------------------+\r\n| DATE_FORMAT(\'2017-03-22\',\'%m/%d/%Y\') |\r\n+--------------------------------------+\r\n| 03/22/2017                           |\r\n+--------------------------------------+\r\n```\r\n\r\n\r\n## 信息函数\r\n- CONNECTION_ID() 连接ID\r\n- DATEBASE() 当前数据库\r\n- LAST_INSERT_ID()\r\n    - 最后插入记录的id\r\n    - 数据表必须为自增主键\r\n    - 插入多条记录只返回插入的第一条ID\r\n- USER() 当前用户\r\n- VERSION() 数据库版本\r\n\r\n\r\n## 聚合函数\r\n- AVG() 平均值\r\n- COUNT() 统计总数\r\n- MAX() 最大值\r\n- MIN() 最小值\r\n- SUM() 求和\r\n\r\n```sql\r\n# 学生表\r\nMySQL [test]> SELECT * FROM students;\r\n+----+------+-----+------+\r\n| id | name | age | sex  |\r\n+----+------+-----+------+\r\n|  1 | tony |  22 |    1 |\r\n|  2 | jack |  23 |    1 |\r\n|  3 | jim  |  12 |    1 |\r\n|  4 | mary |  20 |    0 |\r\n+----+------+-----+------+\r\n\r\n\r\n# AVG()\r\nMySQL [test]> SELECT AVG(age) FROM students;\r\n+----------+\r\n| AVG(age) |\r\n+----------+\r\n|  19.2500 |\r\n+----------+\r\n\r\n\r\n# COUNT()\r\nMySQL [test]> SELECT COUNT(*) FROM students;\r\n+----------+\r\n| COUNT(*) |\r\n+----------+\r\n|        4 |\r\n+----------+\r\n\r\n\r\n# MAX()\r\nMySQL [test]> SELECT MAX(age) FROM students;\r\n+----------+\r\n| MAX(age) |\r\n+----------+\r\n|       23 |\r\n+----------+\r\n\r\n\r\n# MIN()\r\nMySQL [test]> SELECT MIN(age) FROM students;\r\n+----------+\r\n| MIN(age) |\r\n+----------+\r\n|       12 |\r\n+----------+\r\n\r\n\r\n# SUM()\r\nMySQL [test]> SELECT SUM(age) FROM students;\r\n+----------+\r\n| SUM(age) |\r\n+----------+\r\n|       77 |\r\n+----------+\r\n```\r\n\r\n\r\n## 加密函数\r\n- MD5()\r\n- PASSWORD()\r\n\r\n```sql\r\n# MD5()\r\nMySQL [test]> SELECT MD5(\'123456\');\r\n+----------------------------------+\r\n| MD5(\'123456\')                    |\r\n+----------------------------------+\r\n| e10adc3949ba59abbe56e057f20f883e |\r\n+----------------------------------+\r\n\r\n\r\n# 修改mysql密码\r\nMySQL [test]> SET PASSWORD=PASSWORD(\'456789\');\r\n```', '', '0', '2018-03-26 03:46:07.000000', '2018-03-26 03:46:10.000000', '1', '7', '1', 'mysql的基础，包括运算符，一些常用的函数', 'mysql 运算符 函数', '', ''), ('8', 'test', 'html\r\n```html\r\n<h1>h2<h1>\r\n<a href=\"#\">aa</a>\r\n```\r\n\r\nphp\r\n```php\r\n<?php\r\nrequire __DIR__.\'/../vendor/autoload.php\';\r\n\r\nfunction myFn($name){\r\n    echo $name\r\n}\r\n```\r\n\r\n\r\npython\r\n```python\r\ndef myFn(num):\r\n    print(num)\r\n\r\nclass myCl(object):\r\n    pass\r\n```\r\n\r\n\r\ncss\r\n```css\r\nbody{\r\n    font-size:14px;\r\n}\r\n```\r\n\r\nc\r\n```c\r\n/* hello world demo */\r\n#include <stdio.h>\r\nint main(int argc, char **argv)\r\n{\r\n    printf(\"Hello, World!\\n\");\r\n    return 0;\r\n}\r\n```', '', '0', '2018-03-26 05:01:40.000000', '2018-03-26 05:01:41.000000', '1', '9', '0', 'test', 'test', '', ''), ('9', '新时代严肃阅读指南：文本矩阵简述', '1. 矩阵（matrix）是一个从线性代数里借用的概念，用来描述复杂的、可以从不同维度切分的文本系统，每一种拣选、组合原则即是一行，而被此原则选中的所有元素组成一列，组成矩阵的基本单位是一本本主题、风格、范围等一目了然的书籍，也可以是从所有文本里析取的其他抽象元素。  \r\n\r\n2. 之所以论述文本，只因为它是人类精神文化成果迄今为止发展最充分最完善的符号表达方式，也是任何知识人可以简便掌握且高效运用、进行再生产的工具（不是图像，它信息含量太低；不是音乐，它基本只有娱乐消费价值，个人很难再生产优秀的作品；不是电影，它成长时间太短，目前无法完成高等数学之类抽象而有深度的思考，一般人也没有充足的资源去创作、生产电影供人消费）。  \r\n\r\n3. 文本矩阵的整体容量无限大，可就个人所处时代，就个人实际所能了解、阅读、消化、运用的容量而论，存在一个极限，此极限大概是15亿汉字符、6000本书，概略核算如下：  \r\n\r\n3.1 综合各种数据，人基本上阅读中等难度文本的速度在20000字/小时左右，而平均来说，每天读50000-100000正经文字已经到了头，再多可能已经是无关紧要的媒体新闻、娱乐八卦，取中间值75000字/天，从而人一生的阅读总量是75000（字）X365（天）X60（年）=16亿4250万≈15亿字，相当于两部《四库全书》。  \r\n\r\n3.2 现在一本书的中等体量大略是25万字，750字/页，333.33页，所以一个人一生能从头至尾读完的书是150000000/250000=6000本。  \r\n\r\n3.3 有人说自己也许每天读书时间更长，8小时以上，所以能读一本15、6万字的小说，但问题在于：A）现代小说是一种低密度低知识含量的文本，读起来快且能够持续，而除了读这些，我们还会读《高等数学》、《纯粹理性批判》、《资治通鉴》；B）某一天读书8小时以上容易，但谁可以如是坚持60年不辍，要不要工作，要不要社交，要不要处理家务，要不要休闲娱乐等等？因此平均每天阅读75000字已经是极限，可能钱锺书都无法超越。  \r\n\r\n4. 给出极限（3）只是作为参考，实际上我们个人没有必要试图去触摸、超越此极限值，因为：  \r\n\r\n4.1一个人极大可能不是职业阅读者，完成本职工作外能读书的精力、时间有限，即使是职业阅读者，比如高校老师，也一般会受各种干扰而不能全神贯注地自由读书，要去上课，要参加会议，要研究课题，要撰写专著等。  \r\n\r\n4.2 即便由于特别的机缘达到了此极限，反而有可能成了低效阅读。阅读重要，不断地深入思考、消化、熔炼更重要。康德读书量肯定比不上钱锺书，但明显康德在人类文化史上的地位更高。只要钱锺书自觉缩减自己的阅读量，他的成就也许会更大，原因非常简单，同质阅读的边际收益递减，而且任何门类书籍的阅读只要超过某个量，一定只是碰到更多的垃圾读物。 \r\n \r\n5. 结合上述分析，比较理想的一生阅读量是在极限的基础上打对折，也即认真读书30年，读3000本左右，而考虑到人免不了要读一些垃圾书、一些读了却没丝毫收获的名著，又有一些读了一半却再也没兴趣没勇气读竟，所以真正能纳入个人文本矩阵的有效书籍大概是2000本，5亿字符。  \r\n\r\n6. 2000、3000本书，5亿字符绝对不是小数目，有人写《中国读者理想藏书》，包含2500本书，张之洞《书目答问》收书2000种，《四部丛刊》也就500种，有人写《一生的读书计划》，只有130本书，有人写《女人一生的读书计划》，只有100本书，还有林林总总《影响世界的100本书》之类，无论是藏书单还是读书单，无论是2500还是100，仔细去观察，什么年龄层次的读者都能发现自己有些书没收藏，有些书没从头到尾读过。而且，就是把所有垃圾书都算上，很多人一生的阅读量实际上无法超越500本，去过一些朋友家，工科糙哥文艺女青都有，他们的书架上无非零零落落摆几十上百本，一般是高校教材、MBA/GRE考试书以及一些流行读物、著名小说，30岁如此，50岁也许还是类似于此。  \r\n\r\n7. 2000、3000本书，5亿字符同时不是一个不可超越的数字，只要从小养成了阅读的习惯，一年读30-40本书丝毫不困难，不过是平均一两周时间读完奥斯丁的《理智与情感》，估计兴趣浓烈且时间充足的话，一般人周末两天时间就能读毕。把这样的阅读习惯从15岁保持到75岁，完全可以轻松读到2000、3000本，把自己一生珍爱的理想藏书读完。但是，V在这里主张有志读书之人要更勤奋精进些，当下争取一年读书在60-80本之间。一是充分利用年轻时的健康体质、优良记性、丰裕时间，二是无论如何到了50、60岁一个读书人总该系统整理自己的阅读成果，甚至写出著作，而不是还像个青年人无所事事，闭门读书。  \r\n\r\n8. 现在谈到的只是构筑文本矩阵容量、数量的问题，即2000本书，5亿字符，然而更重要的是文本矩阵的质量、优化程度。康德500本藏书最终生成的是影响深远的《三大批判》，无数人2000本书造就的只是一个平庸的作家，一个平凡的人文社科教授，甚或连他们都不如。打个比方就是，同样作为动力、燃料系统，有的是垃圾焚化厂，有的是内燃机发电机组，有的则是核聚变裂变反应堆，它们之间的效率和能量有天渊之别。  \r\n\r\n9. 我们的目标是——不是“没有蛀牙”，而是建构有成为核反应堆可能的高效文本矩阵。  \r\n\r\n10. 高效文本矩阵的第一个特征是天罗地网式的完备性、广泛性、包容性。  \r\n\r\n10.1 一个国家强大而完善的武装力量，必然包括陆军、海军、空军、警察等，一个完整的家，必然有客厅、卧室、书房、厨房、厕所、阳台等，一所著名的综合性大学，必然包含文学、哲学、历史、宗教、新闻、外语、政治、经济、管理、法律、社会、心理、医学、生物、数学、物理、化学、工程、建筑、计算机等专业，哈佛、牛津如此，北大、复旦也是如此，一座藏书丰富的图书馆，不论是采用杜威分类法还是中图分类法，它囊括的图书门类与综合性大学的专业、科系基本同构，它们——国家武装、家庭功能区、综合性大学专业、大型图书馆分类——都是自足完备的独立系统，基本可以满足所有人绝大多数的需要。同理，一个强大的、包容度高的文本矩阵，必然要与精神文化生产、保存的基地——高校、图书馆——类似或同构，只有这样才能满足个人旺盛广泛的精神文化需要。  \r\n\r\n10.2 可是高校科系、专业的分类委实太过详细，超过20种，每个专业读一个学士硕士学位，总共都要花费80、100、120、140年，大大逾越了人的寿命界限，所以必须有效收缩战线，推出拳头产品、招牌特长，V个人认为6、8、10个专业或者方向已经足够，如果想更精深，3、4、5也未尝不可。根据对人类文化史的考察，大概如下知识领域尤其重要：文学、历史、哲学、宗教（古来沿袭已久的学问），经济、政治、科技/电脑、外语（建构了当代人基本的知识体系）。  \r\n\r\n10.3 也可以从其他角度来进一步确认上面8个知识领域的重要性，比如说个人需要理论：一个人的基本需求无非利（money）、色（sex）、权（power）、名（fame），认知（真）、伦理（善）、审美（美）、综合、超越（圣），利的代表就是经济，权的代表就是政治，对共时态自然的认知就是科技，对历时态社会的认知就是历史，审美就是文学，而伦理、超越的企图包含在宗教里，无所不包的是哲学，外语稍微有点特别，对应于我们这个全球化信息化的时代。甚至我们可以用海德格尔天（Himmel）、地（Erde）、人（Sterbliche）、神（Goettliche）这样的分析结构来辨析认定，哲学是天问，科技是地问，经济、政治、历史是人对社会、他人与自我的理解，文学是人和天神缪斯结合的产物，宗教就是神迹。  \r\n\r\n10.4 当然个人可以根据自己的特殊嗜好、特别的成长路径添加某一不包含于上述8种的门类，诸如医学、法律、社会、新闻等，但V自己对这些领域一直不怎么看重。一个人只要身体健康，不作奸犯科，又不是医生、律师，可能不需要怎么关注医学、法律领域的成就。社会学基本理论也许是杂糅的怪胎，懂了文学、历史、哲学、宗教、经济、政治、科技（电脑）、外语，不懂社会学关系也不大，高兴了自己综合综合甚至能创立一派社会理论。研读新闻学大概不如学文学来得货真价实，现实生活中也的确无数记者编辑是文学科班出身。  \r\n\r\n10.5 科技一门包罗万象、内容深湛，如何去自己研读？V的结论是科技无法踏实地去学，除非你去读或者已经读过一个理工类的本科、研究生，4年、6年跟着教授锱铢积累。强调科技的重要性，不是炫耀性地制造进入壁垒，而是说：A）有了微积分、量子力学、有机化学、模拟电路、C++语言等理工科知识才能使我们更深入、更准确地理解周围的自然世界、物质世界、逻辑世界；B）自然科学知识是训练我们理性、谨严的逻辑思维的高效方式，可以使我们混乱的大脑充分条理化、清晰化，更适应时代的建构机制。不曾读、不能读理工科也有次优的补救措施，那就是大量阅读优秀的科普书籍，读200本以上。一个理工科学生4年时间只能读30、50门课程，但它们基本都算得上高密度、高思维含量，要用极大稀释过的科普书替代的话，需要把总数字提高4倍，普通的书籍4年也恰好能读200本上下。  \r\n\r\n10.6 除了核心门类、主干课程，我们不妨也同时对一些感兴趣的边缘、枝叶领域拾遗补阙，3、5本，10本、几十本地去读，矩阵的总容量是2000，随便在里面穿插几十上百种异质文本不会带来什么影响，反而在一定程度补充完善我们的知识结构，使之浑然一体、滴水不漏。  \r\n\r\n10.7 综上所述，文学、历史、哲学、宗教、经济、政治、科技/电脑、外语8种门类具有极大的广泛性、代表性、包容度，它截取了文本世界正态分布的中间一段，由它们组成的文本矩阵基本上是一所综合性高校、一座省市级图书馆、一个大型图书城的同构体，更为关键的是，它不复是异体的漠然的疏离的外在物，经过努力它们能完全吸纳、植入个人的眼睛、大脑，记忆、理解、思考、想象，是居家的更随身携带的精神文化的全息微型宇宙（holographic mini universe）。宇宙囊括天地、并吞八荒，它的历时演化构成了我们这个无比美妙复杂的世界，当一个人能把完善的精神小宇宙纳入体内，且勤奋熔炼铸造，会发生什么样奇迹呢？  \r\n\r\n11. 高效文本矩阵的第二个特征是一一追溯至创造性典籍的原教旨主义、本源性、代表性、彻底性。  \r\n\r\n11.1 8大门类非常广博，但无疑同时也最空洞、最大话、最不着边际，我们需要找到理想的办法使之落到实处，来具体填充拟定的框架。首先可以想到的一点自然是鸟瞰概观，研究清楚每一门类在空间的共时态上在时间的历时态上到底包含哪些知识。因此基本的起点是读深浅不一、方向不一的入门概论，西洋、中国的形态发展史、理论发展史。以经济学为例，萨缪尔森、斯蒂格利茨的《经济学》、平狄克《微观经济学》、多恩布什《宏观经济学》、克鲁格曼《国际经济学》、米什金《货币金融学》、斯皮格尔《经济思想的成长》都肯定要在入门的时候就仔细研读，同时，市面上能找到的优秀的《欧美经济史》、《中国经济史》、《西方经济思想史》、《中国经济思想史》等也要一一拜读，它们从概论、历史演变的视角让人可以一睹学科全貌，做到心中有数、格局完整。  \r\n\r\n11.1.1 读概论、概述时务必选择此学科内最优秀最典范的教科书，非大师之作不读。  \r\n\r\n11.1.2 读此类书一定要认真踏实，把自己当作一个必须通过专业考试的本科学生，阅读时任何细节都不放过，都要深刻领会理解，而且争取做到可以记诵关键内容。当然如此，不然怎么去参加结业考试，开卷吗？  \r\n\r\n11.1.3 同一类书以一本为主干，但最好同时再找几本来对比阅读，例如说，西方哲学史除了阅读芝加哥大学版、北大版、复旦版、罗素版，也无妨读读文德尔班版、黑格尔版、Frederick Copleston的九卷本《A History Of Philosophy》，大致了解下各种解读有什么不同。  \r\n\r\n11.2 上面所说只是学科性阅读的引子，还没进入正题。读过一些概论性的文本之后，我们最迫切的需要是一本本学科基本典籍地读，去读核心文本。读政治学，概论、历史类阅读引子先过关，马上从柏拉图《理想国》、亚里士多德《政治学》、西塞罗《论共和国》、马基雅维利《君主论》起，中间经《政府论》、《社会契约论》，一直读到《正义论》、《无政府、国家与乌托邦》、《认真对待权利》等，读50本政治典籍、100本典籍、150本典籍，直至抵达政治哲学基本文献阅读的极限——凡是重要的经典都读过，凡是没读过的都无足轻重，都算不上创造性的示范作品，绝大多数人也没读过。其他学科的读法与此类似，可以举一反三。  \r\n\r\n11.2.1 如何知道哪些是基本典籍？非常简单，去观察本学科理论发展史里不得不提到的重要人物，什么是他们的代表作。参阅各种书目、典籍提要，有哪些作品会交叉入选。咨询可以信赖的资深专业人士，让他们予以指导。  \r\n\r\n11.2.2 按照什么次序去读基本典籍？V个人认为通常依照历史顺序阅读，比如经济学、政治学、宗教等，只有先读了前人作品才能真正清楚后来者对前贤的理论进行了如何的修正、补充、颠覆，大师之作一般都有明确的针对性，而不是闭门造车、信口开河，例如潘恩的《常识》一书明显是针对柏克的《法国革命论》，诺齐克写《无政府、国家与乌托邦》正是为了批评罗尔斯的《正义论》。也可以逆序去读，哲学、文学等就能够如此，对某一个问题、题材、风格感兴趣，不妨从后到前追本溯源，萨特读不明白就去读海德格尔，海德格尔读不明白就去读胡塞尔，胡塞尔读不明白就去读黑格尔，黑格尔读不明白再去读康德。当然还有一种可能的次序是没有次序，随便选手边的、当前有兴趣的来读，V通常不主张这样，阅读时最好带着疑惑、问题去读，而不是无缘无故、随机漫步，像个没头苍蝇。  \r\n\r\n11.3 基本典籍地读才是本源性的阅读。文本的世界无边无际，但绝大多数作品无非是典范文本繁衍的不肖子孙后代，是它们的拙劣模仿、剽窃、改装、拼凑，空洞化、琐碎化，既不能开创性地刷新、改造、扭转人们的整体精神视野，也不能把一种重要的理论、技巧、风格推向至精至纯，达到、超越时代的极限可能边界。它们萎靡柔弱，陈腐可笑，琐屑无聊，至多也只能成为王元化、余英时、杨义、刘小枫、汪丁丁、秦晖、甘阳、朱学勤，在我们这个廖化当先锋的堕落时代里摇旗呐喊，独领风骚，面对斯密、面对尼采、面对李白、面对鲁迅的创造性巨大贡献，我们的确有道理有权利对他们嗤之以鼻、不屑一顾。无数的文本只是附属的文本、二道贩子的文本，如藤萝寄生于大树、苔藓寄生于岩石、虱子细菌寄生于人体，充斥着混乱的逻辑、拷贝的知识、改头换面的见解、平庸苍白的文采、莫名其妙又无足轻重的情绪，只要我们踏实读过寄生作者们读过的经典之作，就是无情拆解了他们的秘术、花招、看家本领，我们只要愿意，可能写出来的书比他们的还要精彩，那我们为什么还要读寄生性文本，为何不直接去读带给我们无限灵感、启示、震撼、素材、话题的本源性典籍？  \r\n\r\n11.4 基本典籍地读才是代表性的阅读。巨匠大师创制典籍，必然要博学穷观，吞噬一切能吸收的精华，融会贯通而又自出心裁，他们既总结了前人的各种大大小小成就，又肇始了后人不同层次的种种追随模拟，因此具有广泛的代表性，可以完全覆盖、包裹大量类似文本、同质文本。我们阅读典籍，不仅可以辨认、推测大师读过但在历史中湮灭了的一些文本，更可以先知先觉地推演即将到来的无数仰慕者的文本，它们如何浅陋地分析、解读大师，又如何邯郸学步地依葫芦画瓢，还如何卖弄从其他二三流匠人那里学来的聪明、习气。读一本大师之作，再加上我们的思考、分析、推演、排列组合，其效果就等于读了前前后后几十本、几百本，甚至几千本几万本不入流作品。不读《史记》、《汉书》、《资治通鉴》却去读钱穆、唐德刚、严耕望、黄仁宇、葛剑雄，不读《鲁迅全集》却去读王瑶、钱理群、林非、汪晖、吴中杰、郜元宝的鲁迅研究，岂不是买椟还珠、本末倒置、抓住芝麻漏掉西瓜？  \r\n\r\n11.5 基本典籍地读才是彻底性的阅读。彻底性意味着最高最深最广最远，最引人入胜、最卓落不凡，是文本的珠穆朗玛山峰、马里亚纳海沟，除了它们，你再也不能找到更优秀的原创文本，它们就是精神的极限、边界线。无知浅薄的人，最开始会爱上薛涌、于丹、韩寒、和菜头，慢慢会发现余秋雨、周国平、王怡、许知远等可能更有知识才华，进而又开始佩服余光中、刘小枫、朱学勤、林毅夫、陈志武，直到某一天，或者30岁或者40岁，终于发现庄周、司马迁、韩愈、李白、苏轼、王阳明、亚里士多德、塞万提斯、牛顿、凯恩斯、诺齐克才真正是难以逾越的巅峰，他们不但走到了自己时代的最前沿，而且到了21世纪依然对人类的心智构成严峻挑战。在他们之外，没有更高的肩膀可以站立，就是世界尽头，就是昂首天外，就是一片荒芜，就是孤独凄凉，前不见古人，后不见来者。  \r\n\r\n12 高效文本矩阵的第三个特征需要阅读者积极认真的参与，是最基层最微观的机制，彻头彻尾体现阅读的条理性、细节性、琐屑性。  \r\n\r\n12.1 有人读书堪称狂飙突进，文字只要囫囵吞枣、走马观花地过了眼就算大功告成，就此鸣锣收兵。此类的读书法固然勇猛、壮观，但也不得不付出皮相肤浅的沉痛代价。网眼过大的渔网，能指望在文字的海洋里打捞到什么奇珍异宝？文本过眼不等于过脑，更不等于过心（姑且假设心灵是一种更高的精神器官，关涉人所谓的灵魂），而实际上只有经过大脑沉思、心灵涵蕴的文字方能彻底内化、吸收，成为文本矩阵的有效构成因子。如前所述的门类、具体典籍都只是矩阵的宏观、中观层次，而最要紧的是微观层次，它的“微”直抵书里的每一个字符、词汇、句子成分、语句、段落、节、章、篇。在节、章、篇的层面我们要考察其逻辑性、条理性及整体的气势、气韵，在语句、段落的层面我们审查判断见识、知识细节、论证技巧、修辞手法、情感强度，在字符、词汇、句子成分的层面我们检查思维的严谨性、准确性，词语的表现力、敏感度，要做到如此的细致精微，岂是浮光掠影、蜻蜓点水的阅读所能梦想和抵达？  \r\n\r\n12.2 条理性貌似最容易做到，其实非常难以企及。不是说分出了一二三四五章，1、2、3、4、5点，首先、其次、然后、再及、最后等就等于有逻辑有条理，你必须先搞清楚为什么是五章而不是三章十章，五章之间有没有互相交叉、重复的内容，交叉了是为了立体式充分描述或者根本就是赘语，即使有五章，什么列在第一什么是第五有没有讲究，它们之间是平行关系是递进关系或者干脆就是在衰减。整体上没逻辑没条理的文本比比皆是，即使经典名著也不能幸免于外。《神曲》里地狱、炼狱、天堂三界排布当然有道理，但谁能说说地狱里的先后九层有什么逻辑关系？可能是并行结构，调整次序也没什么问题，可在V的眼里，巨匠之作根本容不得任何随意变动，作品结构的细微安排都曾经深思熟虑、反复调整过。上文提到的《法国革命论》更是一个典型的代表，虽然气势磅礴，情感丰沛，但根本找不到柏克由A说到B、由B说到C、由C说到D有什么必然的逻辑关联。从流飘荡、任意东西？飘逸潇洒固然没得说，但还是要斥为文青习性、诗人气质，根本不适合出现在论理性的皇皇巨著里。  \r\n\r\n12.3 其实章篇层次的条理化、清晰化尚且是简单的工作，试着去翻翻我们的教材，无不体现着整饬有序的文本构造美学，主要原因可能是此类书籍经过无数代的精心打磨，早已有了现成的结构，再者作为书来说撰写周期长，有充分的时间删改调整。可一到2000-20000字的文章，有些人的颠倒错乱就体现得淋漓尽致，任由思绪随意飘荡，临时怎么想就怎么写，一点不顾及文章的主题、章节的中心、自然段的目的，不能在每一部分集中火力瞄准靶标彻底解决问题，同一话题和内容在文章前中后反复出现，夹缠不清，令人如堕五里云雾，不知所云。如此这类的文本，V素来深恶痛绝。说到结构清晰，写作者也许都应该向几何证明或者计算机程序代码学习，每一个步骤、模块都目的明确，简洁精练，完整封装，它是漂亮整洁的模范建筑，而不是汶川大地震后充斥着断壁残垣的废墟。如果做不到这些，可能还不如学着像王阳明、王廷相、叔本华、尼采一样写零碎散乱的语录体、箴言体。  \r\n\r\n12.4 条理化、逻辑化地读，就是要随时准备归纳一个段落的中心大意，像个乖巧的小学高年级学生一样，并且观察作者如何井井有条、水到渠成地论述了他的观点，换我们自己来写，可不可以同样轻松自如，望尘莫及就拜师学艺，现炒现卖剽窃模仿。如果陈述混乱，半天也理不清头绪，我们不妨试着看能不能通过删减合并语句把它改造明白清楚。作者的一条论证是否在逻辑上成立，我们能不能接受他的前提约定或者假设，论述过程中有没有传动链条的断裂、错位，最终结论可不可以合乎情理地导出，即使推导完毕，有没有予以结论精准清晰地表达？在阅读时这都是需要一一检视的因素，我们不但要服善思齐，我们更要能批判性地读、颠覆性地读，同作者言谈甚欢，更同作者拔刀相见，裸身肉搏。读即是写，把自己混乱的头脑注入作者的轨道共同来写，让作者的混乱思维在我们的逻辑里整饬规训，读写互动提升、改进。不但总结段落大意，我们甚至更要还原、重构文本篇章节组成的整体框架，体味它是否宏大、完整、匀称、精巧，什么地方优美自然值得效仿，什么地方别出心裁而值得省思，什么地方陈陈相因而令人鄙弃，什么地方扭曲残缺而必须引以为戒。一句话，读的条理性就是把文本所有皮筋肉剔除净尽，我们直接审查裸裎面前的硬核、骨架。  \r\n\r\n12.5 文本的整体气势、气韵是个神秘玄妙的因素，我们好像可以明显感觉到有的文章苍白干枯，读之令人生厌，但有的文章却元气充足、酣畅淋漓，可终究不大容易明确说出造成这种分别的一二三。比如说，庄子、韩愈、李贽、鲁迅、荷马、西塞罗、柏克、叔本华的文章算是气势磅礴、气韵生动，起承转合轻快流利，每一部分又都是浓墨重彩，一气呵成，如排山倒海，汪洋恣肆，不可拘圄，可以比拟为郭靖的降龙十八掌，杨过的无锋重剑、黯然销魂掌，力大气雄，无坚不摧。但是亚里士多德、金岳霖总让人觉得干燥枯瘠、沉闷乏味，如贫家之女、寒寺之僧。可能这和文体有关系，更跟个人的禀赋、生活历练有关联。阅读的时候我们要特别留意这类气势雄浑的文章，反复涵咏、揣摩，也许可以体会到一些奥秘。  \r\n\r\n12.5.1 在此，V想重提以前说过的“身体性阅读”这一概念来补充阐释文本的气势、气韵，也就是说，读书的主要目的起初不能是写出什么鸿篇巨制，而应该是养气蓄志，基本也类似于陈寅恪所言：“士之读书治学，盖将以脱心志于俗谛之桎梏。”所以，阅读的过程就是让词语、段落震荡心灵，心灵生产温暖澎湃的血液，同时把血液运送至四肢百骸的过程，它给人气度、血性、胆识、神魄，它是古老的精神修炼术，要根本上给日常行动的肉体充电，而不是给言谈书写雪中送炭、锦上添花。只有这样改变读书态度，一个人方能将阅读得到滋养的气和生命本身的气、生活经验带来的气合并在一起，来共同形成个人的能量场，如果一个人还去写作的话，就是用整个肉体和精神熔炼在一起的能储去书写，而不是去轻巧地摆弄把玩暂时过耳过目的词汇、风景、事物。鲁迅的《野草》，气魄之澎湃、意志之决绝、情感之激烈、色彩之秾艳，远远为周作人、张爱玲之流莫及，V相信这是因为鲁迅是在用听起来有些神秘的肉体精神综合气场在书写，而不是其他人相对单纯的知识式生活经验式写作。鲁迅的阅读具有身体性，所以他的写作也具有身体性，呈现着赤身肉搏的激烈、残酷、高昂，惊魂动魄。  \r\n\r\n12.6 条理、气势申察吸纳一番，随着文本的具体延展我们就走到了语句、段落的层次。单独的一句话、一段话，最关键的莫过于见识、洞察（insight）——深入地去看，内部地去看，本地知情人地去看，看到别人看不到的关键东西，而不是像远道观光客一般只知道在风景画册都会收录的著名景点前抒发幽情，拍照留念。观光客们一路上自然觉得处处稀奇古怪、风光无限，从而心满意足、兴高采烈，可要命的缺点就是肤浅，要他们讲讲到底见到什么好风景，说出来的不外乎是导游册上烂熟的陈词滥调（cliché）。以V的阅读经验来说，即使著名作者的典范文本，也一般和种种借尸还魂的cliché脱不了干系，一本25万字的书，能有2.5万字识见不凡、略有新意已经算得上是优秀，剩下的十分之九不是妇孺皆知的常识，就是鹦鹉学舌的结果——他人知识公开或私密的贩运，此类文字基本上一概可以删除。阅读，所以也就成了甄别拣选桃子、鸡蛋的农家活，臭鸡蛋、烂桃子悉数剔除，留下来的优良品洗刷干净装进筐备用。而这个筐，就是我们正在描述的文本矩阵。  \r\n\r\n12.6.1 什么算是眼力惊人、见识卓绝，这是一个关涉鉴赏力和判断力的问题。常常感叹我们的时代一点都不缺乏知识广博富赡之人，可是无数人就是没有眼光，鉴赏力、判断力低下，白白浪费气力去捧臭脚。大体来说，见识的形成，需要正反馈放大机制，见识和见识互相发现，首先向略有见识的人学习，借他们的眼光来刷新、提高自己的眼光，让自己也略有见识，而后再用自己略有见识的眼光寻找更有见识之人，进一步刷新、提升自己的眼光，如此循环往复无数次，到了一定程度自己可能也会优入圣域，站在见识不凡者之列，真正有能力去鉴别事物的妍蚩优劣。在此，要有两种人生态度，一谦虚，不故步自封，二精进，不懒惰懈怠。再就是强调一个人人都懂但不见得人人能做到的道理：操千曲而后晓声，观千剑而后识器。  \r\n\r\n12.6.2 见识、洞察、思想、智慧不能只停留在书本里，不然它就只是别人的见识、智慧，像别人的老婆、汽车、别墅一样与我无关，幸运的是思想智慧的私人产权从来没严格界定，我们能够想方设法让它也属于自己，纳入私己的文本矩阵。最彻底最完全的占有策略当然是背诵，可是读一本书就背诵2.5万字，总共记诵5000万字的确是Mission Impossible，人可以是阅读机器，但目前来看尚不是U盘、光盘、硬盘这样的记忆机器，因此，我们必须退而求其次寻求大脑之外的辅助记忆体、存储体。结合V的实际经验，可以总结出4种方法：  \r\n\r\n12.6.2.1 纸质笔记簿上一笔一画地手工抄录。钱锺书《容安馆札记》就是这么苦干蛮干的半成品，我们是否记得中学课本上有个叫张溥的人，他的书房名为“七录斋”，到底是什么典故？V在大学、研究生早期用过这样的方法，现在已彻底放弃，原因比较简单，效率太低因而不可能把一本书的闪光点摘录殆尽，所以在抄写时不得不舍弃、割爱，而V想要的是涸泽而渔、敲骨吸髓式的收纳，不丢弃任何一滴过眼过脑的智慧。  \r\n\r\n12.6.2.2 书买回家直接在上面点校批注。黄侃、陈寅恪、毛泽东是这一派的典范人物，兹不详述。不过V从来不在书上写阅读感悟，至多校改一些错别字，最经常干的事情是用红色、蓝色圆珠笔在关键词、语句、段落上密密麻麻划线，突显一切觉得有价值、令人有所悟解的文本。划线文本在划线时重读一次，同时以备此后快速定位阅读，至于其他留白的文本，都属于打入冷宫，从此可读可不读之列，它们的存在意义不过是作为重点文本再次阅读时的语境参考而已。  \r\n\r\n12.6.2.3 阅读电子文件，同时拷贝或OCR存档。复制、OCR都很简单，不用细谈，难处在于收集到欲读之书的TXT化文件、图像版文件，此类技能，V没日没夜研究了5年，而V的朋友Dasha，恐怕研究的时日在10年以上，纵使如此，常常也依然只能望洋兴叹。电子摘录时有些细节需要注意，比如说电子文本质量不佳，错讹满目，这时需要找图像版文件或者印刷纸本校对。还有，摘录时要在文件中标明版本、页码，以免不容易还原至原始印刷书，TXT摘录内容可以用搜索引擎反查迅速核对语境、出处，而图像文件显然不能，要靠页码标记定位。  \r\n\r\n12.6.2.4 径直在电子文档上批注。电子摘录的好处显而易见，汰除芜杂、留存菁华，可以全文检索，二度利用时能自由复制、编辑，但弊端则在于摘录文本与原始语境割裂，没有上下文供准确深入理解。在这个时候，我们可以借助于Acrobat Pro的强大功能来实现电子批注。不过到底什么书会选择电子批注略有讲究，V个人的抉择是一般只在Acrobat里批注概论、通史、研究等属于文献综述而不够格称为一家之言的作品。说是“批注”，其实也算不上，V依然是只圈划有兴趣的段落、语句、关键词。  \r\n\r\n12.6.3 抄录、圈划、复制、OCR，用尽十八般武艺，积聚在筐-矩阵里的一堆文本用来作甚？它们用来随时重读、反复读，甚至背诵。重读一本书的25万字和从前一样慢，需要10个小时以上，但重读摘录下的2.5万字，只需一小时，即使5000万字的笔记全部重读一次，我们也只需要2-3年时间。人是善于遗忘或者说记忆容量有限的动物，只有反复的辛苦劳作才能使我们真正记住、理解、掌握该记住、该理解、该掌握的东西，让它们像刀痕一样永恒地长在肉体上、心灵里，从而得以随时自由调用、索引、排列组合。不过V只主张反复阅读、深思窃为己有的洞见、智慧，不怎么提倡背诵，即使一个人记忆力卓越，也不要勉强记诵，能记下就记下，记不下也无妨，因为记诵下的语句可能会带来影响的焦虑，让人出口就本能地引述别人的话语，而不是自己随机生成的说法，从而完全把剽窃借鉴的痕迹消弭干净，但这也只是V的一个暂时观察，或者根本就是自己偷懒的勉强借口，算不得定论。当然，有的人喜欢钱锺书一般炫耀性地给学问开国际博览会，则是其他一套既辛苦又巧妙的机制。  \r\n\r\n12.6.4 洞察、智慧类段落和语句的囤积，对它们的重读、反复读，只类似于把水稻、小麦、玉米、土豆等主粮收割回家，脱粒晒干装进粮仓，即使离开一桌简单筵席都差一大截，我们没有猪牛羊肉鸡鸭鹅鱼肉，也没有萝卜、白菜、黄瓜、番茄，还没有油盐酱醋茶、姜葱、辣椒，更没有米其林三星大厨的高超技艺。因此要继续在语句、段落层次认真阅读。  \r\n\r\n12.7 作为知识的资料、细节、素材、数据就是我们的猪牛羊肉鸡鸭鹅鱼肉，相对于见识、思想此类高阶的、综合的、价值的、议论的、形而上的陈述与判断，资料性知识就具有一阶性、分散性、描述性、叙述性、形而下性，它可能是CPI增长数值，海湾战争中美军死亡人数，也可能是章太炎与黄侃交往的趣闻轶事，更可能是12世纪基督教的一份会议记录，它只是真实地或者虚假地描述、记载自然界、社会或者心灵世界发生的事实，并不给出分析和评判。它们林林总总、庞大无比又杂乱无章，而正是它们，塑造着、瓦解着、支撑着、背叛着、嘲讽着我们的每一种见解、思想与智慧。书籍，常常并没有我们所赋予的高尚意义，它不过是肉体的延伸，扩展感官功能的装置、器具，是我们的千里眼与顺风耳，用以间接地、不亲历其境地观察、体验发生在历史上的和周围的事实，我们读书，只是因为没钱没时间开着敞篷车或者乘坐豪华邮轮周游世界而已，只是因为没有时空穿梭机让自己重回大唐盛世或者日不落帝国而已。', '', '0', '2017-03-27 10:36:46.000000', '2017-03-27 10:36:50.000000', '1', '10', '1', '', '', '', ''), ('10', 'about', '## 关于Tony的博客\r\n一开始只是觉得需要一个的地方，来记录一些学习中遇到的问题，总结经验教训，避免重复犯错，也方便汇总，回顾。\r\n\r\n后来慢慢发现，已经喜欢上了这片宁静，安逸的星空。这里有悠扬的旋律，平静的湖面，微风拂柳，就感觉像是身处瓦尔登湖畔旁的小木屋。\r\n\r\n沉醉于风中，想要分享一切美好有趣的，动人的电影、优美的音乐、成长的感悟。这里已经不单是一个记录学习的博客，更像是一块自由的栖息地。\r\n\r\n希望这里能给你带来须臾的宁静。\r\n\r\n## 联系方式\r\n- 邮　箱：<a href=\"mailto:tonysoul@foxmail.com\" target=\"_blank\">tonysoul@foxmail.com</a>\r\n- 云音乐：<a href=\"http://music.163.com/#/user/home?id=69564000\" target=\"_blank\">Hack_Tony</a>', '', '0', '2018-03-28 12:38:26.000000', '2018-03-28 12:38:28.000000', '1', '11', '0', '', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for blog_post_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_tag`;
CREATE TABLE `blog_post_tag` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`post_id`  int(11) NOT NULL ,
`tag_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
UNIQUE INDEX `blog_post_tag_post_id_ba2a5f83_uniq` (`post_id`, `tag_id`) USING BTREE ,
INDEX `blog_post_tag_tag_id_2bbd31e4_fk_blog_tag_id` (`tag_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=11

;

-- ----------------------------
-- Records of blog_post_tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_post_tag` VALUES ('3', '1', '1'), ('2', '1', '2'), ('1', '2', '1'), ('4', '3', '3'), ('5', '4', '4'), ('6', '5', '5'), ('7', '6', '5'), ('8', '7', '5'), ('9', '8', '6'), ('10', '9', '1');
COMMIT;

-- ----------------------------
-- Table structure for blog_read
-- ----------------------------
DROP TABLE IF EXISTS `blog_read`;
CREATE TABLE `blog_read` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`title`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`description`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`author`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`pub_time`  date NOT NULL ,
`thumbnail`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`url`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`group`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`order`  smallint(5) UNSIGNED NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=31

;

-- ----------------------------
-- Records of blog_read
-- ----------------------------
BEGIN;
INSERT INTO `blog_read` VALUES ('1', '解忧杂货店', '现代人内心流失的东西，这家杂货店能帮你找回——\r\n\r\n僻静的街道旁有一家杂货店，只要写下烦恼投进卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答。\r\n\r\n因男友身患绝症，年轻女孩静子在爱情与梦想间徘徊；克郎为了音乐梦想离家漂泊，却在现实中寸步难行；少年浩介面临家庭巨变，挣扎在亲情与未来的迷茫中……\r\n\r\n他们将困惑写成信投进杂货店，随即奇妙的事情竟不断发生。\r\n\r\n生命中的一次偶然交会，将如何演绎出截然不同的人生？\r\n\r\n如今回顾写作过程，我发现自己始终在思考一个问题：站在人生的岔路口，人究竟应该怎么做？我希望读者能在掩卷时喃喃自语：我从未读过这样的小说。——东野圭吾', '[日] 东野圭吾', '2014-05-22', 'read/s272641811.jpg', 'https://book.douban.com/subject/25862578/', 'new', '0'), ('2', '时间简史', '《时间简史》讲述是探索时间和空间核心秘密的故事，是关于宇宙本性的最前沿知识，包括我们的宇宙图像、空间和时间、膨胀的宇宙不确定性原理、基本粒子和自然的力、黑洞、黑洞不是这么黑、时间箭头等内容。第一版中的许多理论预言，后来在对微观或宏观宇宙世界观测中得到证实。\r\n\r\n自1988年首版以来，《时间简史》已成为全球科学著作的里程碑。它被翻译成40种文字，销售了近1000万册。此版更新了内容，把许多观测揭示的新知识，以及霍金最新的研究纳入，并配以250幅照片和电脑制作的三维和四维空间图。', '[英] 史蒂芬·霍金', '2010-04-01', 'read/s19148611.jpg', 'https://book.douban.com/subject/1034282/', 'new', '0'), ('3', '影响力（经典版）', '自出版以来，《影响力》就一直是畅销佳作。由于它的影响，劝说得以成为一门科学。无论你是普通人还是为某一产品或事业观点游说的人，这都是一本最基本的书，是你理解人们心理的基石。\r\n\r\n在这本书中，心理学家罗伯特·B·西奥迪尼博士为我们解释了为什么有些人极具说服力，而我们总是容易上当受骗。隐藏在冲动地顺从他人行为背后的6大心理秘笈，正是这一切的根源。那些劝说高手们，总是熟练地运用它们，让我们就范。', '[美] 罗伯特·B·西奥迪尼', '2016-09-20', 'read/s290225201.jpg', 'https://book.douban.com/subject/26866762/', 'new', '0'), ('4', '史蒂夫·乔布斯传', '这本乔布斯唯一授权的官方传记，在2011年上半年由美国出版商西蒙舒斯特对外发布出版消息以来，备受全球媒体和业界瞩目，这本书的全球出版日期最终确定为2011年11月21日，简体中文版也将同步上市。\r\n\r\n两年多的时间，与乔布斯40多次的面对面倾谈，以及与乔布斯一百多个家庭成员、 朋友、竞争对手、同事的不受限的采访，造就了这本独家传记。\r\n\r\n尽管乔布斯给予本书的采访和创作全面的配合，但他对内容从不干涉，也不要求出版前阅读全文的权利。对于任何资源和关联的人，他都不设限，甚至鼓励他所熟知的人袒露出自己的心声。\r\n“我已经做了很多并不值得自豪的事情，比如23岁时就让我的女友怀了孕，以及我对这件事的处理方式”，他说， “对我而言，没有什么不可以对外袒露的。”\r\n\r\n谈及和他共过事的人以及竞争对手，他直言不讳，甚至尖酸刻薄。他的激情、精力、欲望、完美主义、艺术修养、残暴还有对掌控权的迷恋塑造出的商业哲学一览无余。\r\n\r\n同样，他的朋友、敌人，还有同事得以为我们提供了一个前所未有的毫无掩饰的视角。\r\n\r\n他是一位极具创造力的企业家，他有如过山车般精彩的人生和犀利激越的性格，充满追求完美和誓不罢休的激情，他创造出个人电脑、动画电影、音乐、手机、平板电脑以及数字出版等6大产业的颠覆性变革。\r\n\r\n乔布斯的个性经常让周围的人愤怒和绝望，但其所创造出的产品也与这种个性息息相关，全然不可分割的，正如苹果的硬件和软件一样。\r\n\r\n他的故事既具有启发意义，又有警示意义，充满了关于创新、个性、领导力以及价值观的教益。', '[美] 沃尔特·艾萨克森', '2018-03-28', 'read/s69742021.jpg', 'https://book.douban.com/subject/6798611/', 'new', '0'), ('5', '重来', '大多数的企业管理的书籍都会告诉你：制定商业计划、分析竞争形势、寻找投资人等等。如果你要找的是那样的书，那么把这本书放回书架吧。\r\n\r\n这本书呈现的是一种更好、更简单的经商成功之道。读完这本书，你就会明白为什么计划实际上百害而无一益，为什么你不需要外界投资人，为什么将竞争视而不见反倒会发展得更好。事实是你所需要的比你想象的少得多。你不必成为工作狂，你不必大量招兵买马，你不必把时间浪费在案头工作和会议上，你甚至不必拥有一间办公室。所有这些都仅仅是借口！\r\n\r\n用直截了当的语言和崇尚简约的方式，《重来》是每一个梦想着拥有自己的事业的人的完美指南。不管是作为中坚力量的企业家、小企业主，还是深陷令人不快的工作中的职场中人、被炒鱿鱼的受害者，抑或是想要“脱贫”的艺术家，都能在这一页页中找到弥足珍贵的指引。', '[美] 贾森·弗里德 / [丹] 戴维·海涅迈尔·汉森', '2018-03-28', 'read/s45024511.jpg', 'https://book.douban.com/subject/5320866/', 'new', '0'), ('6', '禅与摩托车维修艺术', '在一个炎热的夏天，父子两人和约翰夫妇骑摩托车从明尼苏达到加州，跨越美国大陆，旅行的过程与一个青年斐德洛研修科学技术与西方经典，寻求自我的解脱，以及探寻生命的意义的过程相互穿插。\r\n\r\n一路上父亲以一场哲学肖陶扩的形式，将见到的自然景色，野外露营的经历，夜晚旅店的谈话，机车修护技术等等日常生活与西方从苏格拉底以来的理性哲学的深入浅出的阐述与评论相结合，进行了对形而上学传统的主客体二元论的反思，以及对科学与艺术，知识与价值，古典主义与浪漫主义，精神与物质，机械论与神秘主义，西方与东方等西方二分法划分下的事物间的关系的思考。并潜入自己的过去，探寻在现代文明下自己精神的分裂的起源，完成了一次自我心灵与人类文明的探索。', '[美] 罗伯特·M·波西格', '2011-09-28', 'read/s69276761.jpg', 'https://book.douban.com/subject/6811366/', 'new', '0'), ('7', '黑客与画家', '本书是硅谷创业之父Paul Graham 的文集，主要介绍黑客即优秀程序员的爱好和动机，讨论黑客成长、黑客对世界的贡献以及编程语言和黑客工作方法等所有对计算机时代感兴趣的人的一些话题。书中的内容不但有助于了解计算机编程的本质、互联网行业的规则，还会帮助读者了解我们这个时代，迫使读者独立思考。\r\n\r\n本书适合所有程序员和互联网创业者，也适合一切对计算机行业感兴趣的读者。', '[美] 保罗·格雷厄姆', '2011-04-28', 'read/s46695541.jpg', 'https://book.douban.com/subject/6021440/', 'new', '0'), ('8', '从0到1', '硅谷创投教父、PayPal创始人作品，斯坦福大学改变未来的一堂课，为世界创造价值的商业哲学。\r\n\r\n在科技剧烈改变世界的今天，想要成功，你必须在一切发生之前研究结局。\r\n\r\n你必须找到创新的独特方式，让未来不仅仅与众不同，而且更加美好。\r\n\r\n从0到1，为自己创造无限的机会与价值！\r\n\r\nPaypal创始人、Facebook第一位外部投资者彼得•蒂尔在本书中详细阐述了自己的创业历程与心得，包括如何避免竞争、如何进行垄断、如何发现新的市场。《从0到1》还将带你穿越哲学、历史、经济等多元领域，解读世界运行的脉络，分享商业与未来发展的逻辑，帮助你思考从0到1的秘密，在意想不到之处发现价值与机会。\r\n\r\n揭开创新的秘密，进入彼得•蒂尔颠覆式的商业世界：\r\n\r\n创新不是从1到N，而是从0到1\r\n全球化并不全是进步\r\n竞争扼杀创新\r\n“产品会说话”是谎言\r\n失败者才去竞争，创业者应当选择垄断\r\n创业开局十分重要，“频繁试错”是错误的\r\n没有科技公司可以仅靠品牌吃饭\r\n初创公司要打造帮派文化', '彼得·蒂尔 / 布莱克·马斯特斯', '2015-01-01', 'read/s282992651.jpg', 'https://book.douban.com/subject/26297606/', 'new', '0'), ('9', '重来2', '“不再需要办公室”，这不仅仅是未来才有的事——它已经发生了。现在，轮到你迈开脚步，跟上时代的步伐了。\r\n\r\n上百万的员工和成千上万的企业已经发现了远程工作的乐趣和好处。然而，远程工作方式还没有成为常见的选择。事实上，远程工作的技术手段都已齐备。还没有升级换代的，是人们的思想。\r\n\r\n这本书的目的就是帮你把想法升级换代。作者会向你展示远程工作的诸多好处：可以找到最优秀的人才，从摧残灵魂的通勤路上解脱出来……还会对坊间流传的托词和借口一一进行分析，比如，创新只能发生在面对面谈话的时候，远程之后公司文化会慢慢消亡等等。在书中，你还会找到充分发挥远程工作方式优势的工具和方法，也会看到有哪些不利因素可能会影响到你，并提前做好应对准备。\r\n\r\n书中呈现的全是第一手的经验。作者创立的软件公司37signals（现更名为Basecamp）团队成员居住在世界各地，却成为全世界效率最高的软件公司之一，是通过远程方式协同工作的典范。\r\n\r\n远程工作犹如打开了一扇通往新世界的大门。这个美好的新世界超越了工业时代对办公室的笃信。在这个新世界里，作者摒弃了一个覆满尘土的旧观念:“远程工作（外包）是用最低成本来提升业绩的好办法”，继而提出了一个全新的观念：远程工作既能提升工作质量，又能提高员工满意度，并能让所有人不必等到退休后才能享受生活的美好。', '[美] 贾森·弗里德 / [美] 戴维·海涅迈尔·汉森', '2014-04-08', 'read/s272552761.jpg', 'https://book.douban.com/subject/25861795/', 'new', '0'), ('10', '失控', '《失控》，全名为《失控：机器、社会与经济的新生物学》（Out of Control: The New Biology of Machines, Social Systems, and the Economic World）。\r\n\r\n2006年，《长尾》作者克里斯·安德森在亚马逊网站上这样评价该书：\r\n\r\n“这可能是90年代最重要的一本书”，并且是“少有的一年比一年卖得好的书”。“尽管书中的一些例子在十几年后可能有些过时，但（它们所表达的）信息却越来越成为真知灼见”。“在那时人们还无法想象博客和维基等大众智慧的突起，但凯利却分毫不差地预见到了。这可能是过去十年来最聪明的一本书。”\r\n这是一部思考人类社会（或更一般意义上的复杂系统）进化的“大部头”著作，对于那些不惧于“头脑体操”的读者来说，必然会开卷有益。\r\n\r\n《失控》成书于1994年，作者是《连线》杂志的创始主编凯文·凯利。这本书所记述的，是他对当时科技、社会和经济最前沿的一次漫游，以及借此所窥得的未来图景。\r\n\r\n书中提到并且今天正在兴起或大热的概念包括：大众智慧、云计算、物联网、虚拟现实、敏捷开发、协作、双赢、共生、共同进化、网络社区、网络经济，等等。说它是一本“预言式”的书并不为过。其中必定还隐藏着我们尚未印证或窥破的对未来的“预言”。', '[美] 凯文·凯利', '2010-12-28', 'read/s45548201.jpg', 'https://book.douban.com/subject/5375620/', 'new', '0'), ('11', '精益创业', '《精益创业:新创企业的成长思维》内容简介：我们正处在一个空前的全球创业兴盛时代，但无数创业公司都黯然收场，以失败告终。精益创业代表了一种不断形成创新的新方法，它源于“精益生产”的理念，提倡企业进行“验证性学习”，先向市场推出极简的原型产品，然后在不断地试验和学习中，以最小的成本和有效的方式验证产品是否符合用户需求，灵活调整方向。如果产品不符合市场需求，最好能“快速地失败、廉价地失败”，而不要“昂贵地失败”；如果产品被用户认可也应该不断学习，挖掘用户需求，迭代优化产品。这一模式 不仅针对车库创业派，对于全球最大企业内部的新创业务也同样适用。\r\n\r\n创业是在充满不确定性的情况下进行产品或服务创新。新创企业还不知道他们的产品应该是什么样的，他们的顾客在哪里。计划和预测只能基于长期、稳定的运营历史和相对静止的环境。而这些条件新创企业都不具备。有时候我们自己觉得产品会非常受欢迎，所以花费巨大精力，在各种细小的问题上进行打磨，结果，产品推到市场后，消费者很残酷地表示他们不需要这个东西。如果我们的生意本身不被市场需要，那么我们失败来的越快越好，这意味着我们耗费更少的资金和精力在错误的事情上。\r\n\r\n埃里克将精益创业提炼为一个反馈循环：想法—开发—测量—认知—新的想法。根据这种模式，我们创业的第一步是把想法变为产品，而且这时开发的产品是精简的原型，投入最小的金钱和精力开发出体现核心价值的产品，不要在许多细枝末节上耗费过多精力。当极简功能的产品得到用户认可后，创业者需要把控局势，在不断的反馈和循环中测试产品，快速作出调整和改变，迭代优化产品，挖掘用户需求，达到爆发式增长。新创企业必须在消耗完启动资金之前，以最小的成本、在最短时间里找到有价值的认知。', '[美] 埃里克·莱斯', '2012-08-28', 'read/s111372561.jpg', 'https://book.douban.com/subject/10945606/', 'new', '0'), ('12', '断舍离', '“断舍离”是由日本杂物管理咨询师山下英子提出的人生整理观念。 所谓断舍离，就是透过整理物品了解自己，整理心中的混沌，让人生舒适的行动技术。换句话说，就是利用收拾家里的杂物来整理內心的废物，让人生转而开心的方法。其中，断=断绝不需要的东西 ，舍=舍弃多余的废物 ，离=脱离对物品的执着。\r\n\r\n断舍离非常简单，只需要以自己而不是物品为主角，去思考什么东西最适合现在的自己。只要是不符合这两个标准的东西，就立即淘汰或是送人。\r\n\r\n通过学习和实践断舍离，人们将重新审视自己与物品的关系， 从关注物品转换为关注自我——我需不需要，一旦开始思考，并致力于将身边所有“不需要、不适合、不舒服”的东西替换为“需要、适合、舒服”的东西，就能让环境变得清爽，也会由此改善心灵环境，从外在到内在，彻底焕然一新。', '[日] 山下英子', '2013-07-30', 'read/s268723961.jpg', 'https://book.douban.com/subject/24749465/', 'new', '0'), ('13', '高效能人士的七个习惯', '《高效能人士的七个习惯(20周年纪念版)》为中国商界最经典、最著名的一部培训教材；世界500强企业必备培训课程。奥巴马、克林顿、普京、李开复、汤姆•彼得斯、肯•布兰佳、世界领导力大师沃伦•本尼斯、世界潜能大师博恩•崔西、《一分钟经理》的肯•布兰佳、世界第一潜能专家安东尼•罗宾、华人成功学权威陈安之、《纽约时报》《福布斯》《财富》《商业周刊》《经济学人》《哈佛商业评论》鼎力推荐阅读。\r\n\r\n《高效能人士的七个习惯(20周年纪念版)》不仅是企业、组织机构，更是个人获得自我提升的人生必修教材。读者遍及工商业、政府部门、军队、学校以及家庭等各个领域。改变人的思维方式和行为方式。这种改变甚至帮助实现一个国家的强大。\r\n\r\n《高效能人士的七个习惯(20周年纪念版)》精选柯维博士“七个习惯”的最核心思想和方法，为忙碌人士带来超价值的自我提升体验。用最少的时间，参透高效能人士的持续成功之路。', '[美] 史蒂芬·柯维', '2010-10-28', 'read/s45109071.jpg', 'https://book.douban.com/subject/5325618/', 'new', '0'), ('14', '月亮和六便士', '一个英国证券交易所的经纪人，本已有牢靠的职业和地位、美满的家庭，但却迷恋上绘画，像“被魔鬼附了体”，突然弃家出走，到巴黎去追求绘画的理想。他的行径没有人能够理解。他在异国不仅肉体受着贫穷和饥饿煎熬，而且为了寻找表现手法，精神亦在忍受痛苦折磨。经过一番离奇的遭遇后，主人公最后离开文明世界，远遁到与世隔绝的塔希提岛上。他终于找到灵魂的宁静和适合自己艺术气质的氛围。他同一个土著女子同居，创作出一幅又一幅使后世震惊的杰作。在他染上麻风病双目失明之前，曾在自己住房四壁画了一幅表现伊甸园的伟大作品。但在逝世之前，他却命令土著女子在他死后把这幅画作付之一炬。通过这样一个一心追求艺术、不通人性世故的怪才，毛姆探索了艺术的产生与本质、个性与天才的关系、艺术家与社会的矛盾等等引人深思的问题。同时这本书也引发了人们对摆脱世俗束缚逃离世俗社会寻找心灵家园这一话题的思考，而关于南太平洋小岛的自然民风的描写也引人向往。\r\n\r\n《月亮和六便士》说问世后，以情节入胜、文字深刻在文坛轰动一时，人们争相传看。在小说中，毛姆用第一人称的叙述手法，借“我”之口，叙述整个故事，有人认为这篇小说的原型是法国印象派画家高更，这更增加了它的传奇色彩，受到了全世界读者的关注。', '[英] 威廉·萨默塞特·毛姆', '2006-08-28', 'read/s26592081.jpg', 'https://book.douban.com/subject/1858513/', 'new', '0'), ('15', '干法', '《干法》首次完整阐释了日本经营之圣稻盛和夫关于工作的看法、做法。从字面上讲，\r\n\r\n《干法》似乎是讲述如何有效工作的方法。但其实这本书的重点，专注于人生观中的“劳动观”、“工作观”，而这个问题，在浮躁的当下具有重大而深刻的现实意义。\r\n\r\n《干法》既是稻盛先生70多年工作经验的总结分享，也是被多家企业的成功实践证明了的正确哲学。尤其是，它不是被简单地误读为，“只要埋头苦干，经年累月就能成功”的鸡汤说教，它是“不能放弃对自我的人生责任”的信念。\r\n\r\n作为最新版本，本书收录了稻盛和夫2014年杭州报告会讲演。', '[日] 稻盛和夫', '2015-05-28', 'read/s283245361.jpg', 'https://book.douban.com/subject/26648884/', 'new', '0'), ('16', '穷查理宝典', '《穷查理宝典》收录了查理过去20年来主要的公开演讲。除简单而权威的查理传略外，其后的《芒格的生活、学习和决策方法》以及《芒格主义：查理的即席谈话》整理了芒格最精华的思维与决策方式和以往在伯克希尔·哈撒韦公司和西科金融公司年会上犀利——和幽默——的评论。\r\n\r\n而最后最珍贵的十一篇讲稿则全面展现了这个传奇人物的聪明才智。贯穿全书的是芒格展示出来的聪慧、机智，其令人敬服的价值观和深不可测的修辞天赋。他拥有百科全书式的知识，所以从古代的雄辩家，到18、19世纪的欧洲文豪，再到当代的流行文化偶像，这些人的名言他都能信手拈来，并用这些来强调终身学习和保持求知欲望的好处。\r\n\r\n精装本于5月推出，深受读者欢迎。此次推出平装本，内容同样完整详实。', '[美] 彼得·考夫曼', '2010-10-28', 'read/s45320081.jpg', 'https://book.douban.com/subject/5346110/', 'new', '0'), ('17', '如何阅读一本书', '每本书的封面之下都有一套自己的骨架，作为一个分析阅读的读者，责任就是要找出这个骨架。一本书出现在面前时，肌肉包着骨头，衣服包裹着肌肉，可说是盛装而来。读者用不着揭开它的外衣或是撕去它的肌肉来得到在柔软表皮下的那套骨架，但是一定要用一双X光般的透视眼来看这本书，因为那是了解一本书、掌握其骨架的基础。\r\n\r\n《如何阅读一本书》初版于1940年，1972年大幅增订改写为新版。不懂阅读的人，初探阅读的人，读这本书可以少走冤枉路。对阅读有所体会的人，读这本书可以有更深的印证和领悟。', '[美] 莫提默·J. 艾德勒 / 查尔斯·范多伦', '2004-01-28', 'read/s16709781.jpg', 'https://book.douban.com/subject/1013208/', 'new', '0'), ('18', '雷军的谜', '“中国乔布斯”雷何逆袭已成红海之势的智能手机市场，从金山到小米，这令人惊诧的转身究竟凝聚多少辛酸，解密小米疯狂成长内幕，看雷军如何玩转“小米模式”。 雷军之谜，小米成功逆袭的背后隐藏了多少内幕？孙建华著的《雷军的谜(小米野蛮生长内幕)》将为您揭密。 令人瞠目结舌的定价模式，究竟是成本低廉，还是成本定价？ 众矢之的的抢购销售模式，究竟是产能不足，还是饥渴营销？ 持股式薪资的企业管理零宣传费用的论坛推广。 扁平化管理的团队建设山寨之王中的科技创新。 深层对话小米模式，解密“中国乔布斯”的打拼之路。\r\n\r\n这是一个消费者决定厂家生产何种产品的时代。\r\n\r\n小米的开放性思维，给传统手机业带来了新的活力，越来越多的竞争对手开始跟随小米，在雷军身后亦步亦趋。但是小米究竟做了什么？雷军究竟做了什么？他们并不了解。雷军经常对媒体总结小米成功的七个字：专注、极致、口碑、快。不过这七个字所代表的涵义，并没有多少人去深究。正因为如此，小米永远是小米，而其他人也成为不了另一个小米。今天，孙建华著的《雷军的谜(小米野蛮生长内幕)》来挖掘小米到底是怎么从零开始的。小米到底有多么专注？是如何追求极致的？它所要求的快是什么？只有解决诸如此类的问题，我们才能看到一个真正的小米，看到真实的雷军到底是怎么想的。谜一般的小米模式，值得我们去探究。', '孙建华', '2014-09-01', 'read/41.jpg', 'https://book.douban.com/subject/26598386/', 'new', '0'), ('19', '周鸿祎自述', '在很多方面，周鸿祎都是互联网领域的颠覆者。他重新定义了“微创新”，提出从细微之处着手，通过聚焦战略，以持续的创新，最终改变市场格局、为客户创造全新价值。他第一个提出了互联网免费安全的理念，也由此让奇虎360拥有了超过4亿的用户。\r\n\r\n在《周鸿祎自述：我的互联网方法论》中，周鸿祎首次讲述了自己的互联网观、产品观和管理思想，厘清了互联网产品的本质特征和互联网时代的新趋势，列举了颠覆式创新在现实中的实践和应用。《周鸿祎自述：我的互联网方法论》首次解密360的产品秘籍和盈利模式，同时，针对目前传统企业的互联网转型焦虑，也提出了一套系统解决方案。', '周鸿祎', '2014-08-28', 'read/s273315591.jpg', 'https://book.douban.com/subject/25928983/', 'new', '0'), ('20', '简单的逻辑学', '这是一本足以彻底改变你思维世界的小书。美国著名逻辑学家、哲学教授D.Q.麦克伦尼，将一门宽广、深奥的逻辑科学以贴近生活、通俗易懂、妙趣横生的语言娓娓道来。它既没有刻板的理论教条，也不是正规的教科书，而是一本必不可多得的现实指南。正如著名行为学家孙路弘所说： 《简单的逻辑学》就如一场及时雨，一本治愈社会疾病的宝典，的确是应该人手一册。\r\n\r\n作者在书中告诉我们，生活中，逻辑无处不在。无论我们是有意还是无意，逻辑无时不在服务于我们的生活。然而逻辑到底是什么，也许并没有太多的人有很清楚的概念。作者以其简练而又充满趣味的笔触，将逻辑学活化为一种艺术，从它的基本原理，到论证，到非逻辑思维的根源，再到28种就发生在你身边的非逻辑思维形式，带领我们进入这个精彩无比的逻辑世界，体会妙趣横生的思维交锋，跨过无处不在的逻辑陷阱，让你沉醉其中，欲罢不能。\r\n\r\n[编辑推荐]\r\n《简单的逻辑学》作为最畅销的逻辑学科普入门书，被香港中文大学奉为40本英文经典之一，被哈佛大学校内书店视为皇冠书籍，还曾位列台湾诚品网络书店英文畅销书榜第一名，同时，还是国内最畅销、读者热评近2万条的五星好书，本书再经湛庐文化策划出品，重磅回归。\r\n\r\n这是一本足以彻底改变你思维世界的小书。正如著名行为学家孙路弘所说：缺乏逻辑已成为社会的一种流行病症：逻辑紊乱症候群。而《简单的逻辑学》就如一场及时雨，一本治愈社会疾病的宝典，的确是应该人手一册。\r\n\r\n作者D.Q.麦克伦尼在书中提出了28种非逻辑思维形式，抛却了逻辑学一贯的刻板理论，转而以轻松的笔触带领我们畅游这个精彩无比的逻辑世界，让你沉醉其中，欲罢不能。', '[美] D·Q·麦克伦尼', '2013-06-28', 'read/s268060861.jpg', 'https://book.douban.com/subject/24754537/', 'new', '0'), ('21', '怦然心动的人生整理魔法', '这本书是一本整理书，同时是一本心灵疗愈书。从精神层面到整理方法俱全。本书介绍“一旦整理，就不会变乱”的整理方法，教授按照心动的标准选择物品，按照先丢东西，后收纳的顺序，按照物品类别，进行一次性、短期、完善的整理等，使人通过整理找回人生决断力，找到最初的梦想，找到怦然心动的幸福人生。', '[日] 近藤麻理惠', '2012-05-01', 'read/s246071811.jpg', 'https://book.douban.com/subject/10747883/', 'new', '0'), ('22', '活法', '《活法》，作者稻盛和夫是日本战后经济的传奇，除每一个人的人生活法之外，企业和国家，甚至社会、全人类的生存之道也包括在《活法》所阐述的范围之内。为什么这样说呢?因为它们都是一个个人的集合体，在应该拥有的“人生活法”这一点上，不存有任何差异性。...', '[日] 稻盛和夫', '2005-03-28', 'read/s12651831.jpg', 'https://book.douban.com/subject/1269900/', 'new', '0'), ('23', '瓦尔登湖', '这本书的思想是崇尚简朴生活，热爱大自然的风光，内容丰厚，意义深远，语言生动，意境深邃，就像是个智慧的老人，闪现哲理灵光，又有高山流水那样的境界。\r\n\r\n书中记录了作者隐居瓦尔登湖畔，与大自然水乳交融、在田园生活中感知自然重塑自我的奇异历程。读本书，能引领人进入一个澄明、恬美、素雅的世界。', '亨利·戴维·梭罗', '2006-08-28', 'read/s19991191.jpg', 'https://book.douban.com/subject/1865089/', 'new', '0'), ('24', '人类简史', '尤瓦尔·赫拉利，1976年生，牛津大学历史学博士，现为耶路撒冷希伯来大学的历史系教授，青年怪才，全球瞩目的新锐历史学家。\r\n\r\n他擅长世界历史和宏观历史进程研究。在学术领域和大众出版领域都有很大的兴趣。\r\n他的《人类简史》一书让他一举成名，成为以色列超级畅销书，目前这本书已授20多个国家版权，在历史学之外，人类学、生态学、基因学等领域的知识信手拈来，根据图书改变的课程上传YOUTUBE后风靡全球，拥有大批青年粉丝。写书，视频课程之外，他还开设有专栏。', '[以色列] 尤瓦尔·赫拉利', '2014-11-01', 'read/s278148831.jpg', 'https://book.douban.com/subject/25985021/', 'new', '0'), ('25', '乌合之众', '古斯塔夫・勒庞 Gustave Le Bon(1841-1931) 法国著名社会心理学家。他自1894年始，写下一系列社会心理学著作，以本书最为著名；在社会心理学领域已有的著作中，最有影响的，也是这本并不很厚的《乌合之众》。古斯塔夫・勒庞在他在书中极为精致地描述了集体心态，对人们理解集体行为的作用以及对社会心理学的思考发挥了巨大影响。《乌合之众--大众心理研究》在西方已印至第29版，其观点新颖，语言生动，是群体行为的研究者不可不读的佳作。', '[法] 古斯塔夫·勒庞', '1988-01-01', 'read/s19883931.jpg', 'https://book.douban.com/subject/1012611/', 'new', '0'), ('26', '無印良品的改革', '具有典型日本美学气质的设计品牌無印良品，曾以辉煌的业绩缔造出 “無印神话”，其简朴的理念和高质感的产品深得消费者之心。进入21世纪，其经历了一次从业绩急剧下滑到通过一系列改革实现复苏的过程。本书对無印良品的改革过程进行了总结，揭开导致业绩下滑的根本原因，并详细介绍了無印良品采取的一系列改革措施和所取得的成效。从中能看到無印良品将崇尚自然、简朴生活的企业文化和科学的经营管理有机结合、促进发展的成功模式。\r\n\r\n这是第一本深入探讨無印良品的经营哲学与品牌消费的读本。当面临企业危机时，作为风靡全球的设计品牌“無印良品”，是如何重组企业，推行革新，从而印证“無印神话”。\r\n\r\n深度解读：在物质生活过剩的时代，人们渐渐忘却和忽视在日常生活中本该珍视的东西。通过“物”来实现什么样的生活方式，良品计划又如何利用这一美学理念来塑造“無印良品”的精神文化与品牌形象，从而缔造出“無印神话”，本书将为此揭开“無印良品”所不为人知的另一面。\r\n\r\n本书的特色：在充斥设计、文化、品牌、形象的光环之外，超越深泽直人、原研哉这些显赫有名的设计师，本书还原给读者一个最真实、本原、质朴的“無印良品”。\r\n\r\n生活中的“無印”和“良品”：关注生活细节，于日常朴素中发现生活的美，是日本美学的精髓。“無印良品”作为日本“物之美学”的代表，在以文化和感性为本的设计理念背后，实质经历了一场以数据为本、强调实时优化运营机制的理性成功之道。', '[日]渡边米英', '2014-03-28', 'read/s272247901.jpg', 'https://book.douban.com/subject/25833194/', 'new', '0'), ('27', '枪炮、病菌与钢铁', '为什么是欧亚大陆人征服、赶走或大批杀死印第安人、澳大利亚人和非洲人，而不是相反？为什么么小麦和玉米、牛和猪以及现代世界的其他一些“不了起的”作物和牲畜出现在这些特定地区，而不是其他地区？在这部开创性的著作中，演化生物学家贾雷德.戴蒙德揭示了事实上有助于形成历史最广泛模式的环境因素，从而以震撼人心的力量摧毁了以种族主义为基础的人类史理论，因其突出价值和重要性，本书荣获1998年美国普利策奖和英国科普书奖，并为《纽约时报》畅销书排行榜作品。\r\n\r\n本书是理解人类社会发展史方面的一个重大进展，它记录了现代世界及其诸多不平等所以形成的原因，也是一部真正关于全世界各民族的历史，是对人类生活的完整一贯的叙述，娓娓道来，具有很强的可读性。', '[美] 贾雷德·戴蒙德', '2006-04-01', 'read/s17386431.jpg', 'https://book.douban.com/subject/1813841/', 'new', '0'), ('28', '当我谈跑步时我谈些什么', '他以文字名满全球。\r\n他的“蓝调”令万千人神迷忧伤。\r\n\r\n文字是他的符号，“跑者蓝调”何尝不是？\r\n\r\n不再是浮华迷茫，不再是旖旎感伤，不再羚羊挂角无迹可寻——写了几十年“别人”的文字，他第一次只写自己：小说之外、故事之外、文字之外，均是不施雕琢娓娓道来，清淡如云，宁静如水……', '[日] 村上春树', '2009-01-28', 'read/s35075801.jpg', 'https://book.douban.com/subject/3369600/', 'new', '0'), ('29', '人月神话', '在软件领域，很少能有像《人月神话》一样具有深远影响力和畅销不衰的著作。Brooks博士为人们管理复杂项目提供了最具洞察力的见解，既有很多发人深省的观点，又有大量软件工程的实践。本书内容来自Brooks博士在IBM公司SYSTEM/360家族和OS/360中的项目管理经验，该项目堪称软件开发项目管理的典范。该书英文原版一经面世，即引起业内人士的强烈反响，后又译为德、法、日、俄、中、韩等多种文字，全球销售数百万册。确立了其在行业内的经典地位。\r\n\r\n在本书第一次出版32年后的今天，清华大学出版社重新整理了Brooks博士的经典内容，并将国内软件开发领域先行者们对《人月神话》中的实践及系统理论的使用经验和心得集结成册免费赠与大家共享，更使本书成为国内从业者的必读经典之一。\r\n\r\n本书读者包括：软件开发人员、软件项目经理、系统分析师等IT从业者。', '[美] 弗雷德里克·布鲁克斯', '2007-09-28', 'read/s26850111.jpg', 'https://book.douban.com/subject/2230248/', 'new', '0'), ('30', '成功的真谛', '《成功的真谛》每一部分都堪称稻盛流派成功哲学的教科书。在书中，稻盛和夫从经营哲学的高度全面梳理了自己对生活、工作的理念。作者指出，把困难的事理解得简单，从中发现真理，捍卫真理，只有这样才能成就我们的人生；企业的领导者一定要拥有能称之为“哲学”的高水平的判断标准；只有内心的意愿强烈而持久，才能表现为外在的现象；付出不亚于任何人的努力，提升心性，拓展命运。\r\n\r\n一本书读懂日本“经营四圣”之一的稻盛和夫。', '[日] 稻盛和夫', '2016-07-01', 'read/s289087281.jpg', 'https://book.douban.com/subject/26839601/', 'new', '0');
COMMIT;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`name`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`is_pub`  tinyint(1) NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_tag` VALUES ('1', '随笔', '1'), ('2', '前端', '1'), ('3', 'mysqli', '1'), ('4', '全栈', '1'), ('5', 'mysql', '1'), ('6', '语法测试', '0');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`action_time`  datetime NOT NULL ,
`object_id`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
`object_repr`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`action_flag`  smallint(5) UNSIGNED NOT NULL ,
`change_message`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`content_type_id`  int(11) NULL DEFAULT NULL ,
`user_id`  int(11) NOT NULL ,
PRIMARY KEY (`id`),
FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
INDEX `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`) USING BTREE ,
INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=123

;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES ('1', '2018-03-21 08:43:33.576000', '5', '新闻', '1', '[{\"added\": {}}]', '8', '1'), ('2', '2018-03-21 08:43:48.675000', '1', '乔布斯2005斯坦福大学毕业演讲', '1', '[{\"added\": {}}]', '9', '1'), ('3', '2018-03-21 09:04:09.268000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('4', '2018-03-22 03:55:13.545000', '6', '新知', '1', '[{\"added\": {}}]', '8', '1'), ('5', '2018-03-22 03:55:25.854000', '1', '随笔', '1', '[{\"added\": {}}]', '7', '1'), ('6', '2018-03-22 03:55:29.037000', '2', '长期接受碎片化信息，会有什么后果？', '1', '[{\"added\": {}}]', '9', '1'), ('7', '2018-03-22 04:05:52.873000', '2', '前端', '1', '[{\"added\": {}}]', '7', '1'), ('8', '2018-03-22 04:06:38.459000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[]', '9', '1'), ('9', '2018-03-22 04:51:34.651000', '1', 'Read object', '1', '[{\"added\": {}}]', '10', '1'), ('10', '2018-03-22 05:52:52.372000', '1', '解忧杂货店', '2', '[{\"changed\": {\"fields\": [\"thumbnail\"]}}]', '10', '1'), ('11', '2018-03-22 07:40:13.625000', '1', '解忧杂货店', '2', '[{\"changed\": {\"fields\": [\"pub_time\"]}}]', '10', '1'), ('12', '2018-03-22 07:44:14.320000', '2', '时间简史', '1', '[{\"added\": {}}]', '10', '1'), ('13', '2018-03-22 07:46:45.947000', '3', '影响力（经典版）', '1', '[{\"added\": {}}]', '10', '1'), ('14', '2018-03-22 08:05:43.956000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[]', '9', '1'), ('15', '2018-03-23 07:23:07.902000', '7', '数据库', '1', '[{\"added\": {}}]', '8', '1'), ('16', '2018-03-23 07:23:13.826000', '3', 'mysqli', '1', '[{\"added\": {}}]', '7', '1'), ('17', '2018-03-23 07:23:17.303000', '3', 'OOP mysqli入门', '1', '[{\"added\": {}}]', '9', '1'), ('18', '2018-03-23 07:24:37.249000', '8', '知识点', '1', '[{\"added\": {}}]', '8', '1'), ('19', '2018-03-23 07:24:47.487000', '4', '全栈', '1', '[{\"added\": {}}]', '7', '1'), ('20', '2018-03-23 07:24:50.245000', '4', '2017年成为全栈开发工程师的权威指南', '1', '[{\"added\": {}}]', '9', '1'), ('21', '2018-03-23 07:45:47.829000', '5', 'mysql', '1', '[{\"added\": {}}]', '7', '1'), ('22', '2018-03-23 07:45:53.913000', '5', 'Mysql基础1——[数据类型，查看，创建，约束]', '1', '[{\"added\": {}}]', '9', '1'), ('23', '2018-03-23 07:46:19.975000', '6', 'Mysql基础2——[插入，删除，更新，查询，修改]', '1', '[{\"added\": {}}]', '9', '1'), ('24', '2018-03-26 03:46:18.283000', '7', 'Mysql基础4——[运算符，函数]', '1', '[{\"added\": {}}]', '9', '1'), ('25', '2018-03-26 05:01:50.260000', '9', '测试', '1', '[{\"added\": {}}]', '8', '1'), ('26', '2018-03-26 05:01:58.902000', '6', '语法测试', '1', '[{\"added\": {}}]', '7', '1'), ('27', '2018-03-26 05:02:02.071000', '8', 'test', '1', '[{\"added\": {}}]', '9', '1'), ('28', '2018-03-26 05:18:07.591000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('29', '2018-03-26 05:18:20.645000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('30', '2018-03-26 05:19:04.957000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('31', '2018-03-26 05:21:11.428000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('32', '2018-03-26 05:30:19.847000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('33', '2018-03-26 05:30:45.789000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('34', '2018-03-26 05:32:25.076000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('35', '2018-03-26 09:57:19.932000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('36', '2018-03-26 09:59:43.634000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('37', '2018-03-27 10:36:57.712000', '10', '阅读', '1', '[{\"added\": {}}]', '8', '1'), ('38', '2018-03-27 10:37:06.422000', '9', '新时代严肃阅读指南：文本矩阵简述', '1', '[{\"added\": {}}]', '9', '1'), ('39', '2018-03-27 10:38:57.052000', '9', '新时代严肃阅读指南：文本矩阵简述', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('40', '2018-03-28 03:45:01.975000', '9', '新时代严肃阅读指南：文本矩阵简述', '2', '[]', '9', '1'), ('41', '2018-03-28 12:39:45.954000', '11', 'about', '1', '[{\"added\": {}}]', '8', '1'), ('42', '2018-03-28 12:39:51.513000', '10', 'about', '1', '[{\"added\": {}}]', '9', '1'), ('43', '2018-03-28 13:29:39.439000', '10', 'about', '2', '[{\"changed\": {\"fields\": [\"is_pub\"]}}]', '9', '1'), ('44', '2018-03-28 13:53:38.715000', '11', 'about', '2', '[{\"changed\": {\"fields\": [\"is_pub\"]}}]', '8', '1'), ('45', '2018-03-28 14:04:30.909000', '6', '语法测试', '2', '[{\"changed\": {\"fields\": [\"is_pub\"]}}]', '7', '1'), ('46', '2018-03-28 14:10:28.012000', '11', '333', '1', '[{\"added\": {}}]', '9', '1'), ('47', '2018-03-28 14:11:33.706000', '11', '333', '3', '', '9', '1'), ('48', '2018-03-28 15:06:45.869000', '10', 'about', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('49', '2018-03-28 15:51:23.388000', '4', '史蒂夫·乔布斯传', '1', '[{\"added\": {}}]', '10', '1'), ('50', '2018-03-28 15:52:32.371000', '5', '重来', '1', '[{\"added\": {}}]', '10', '1'), ('51', '2018-03-28 17:23:00.951000', '6', '禅与摩托车维修艺术', '1', '[{\"added\": {}}]', '10', '1'), ('52', '2018-03-28 17:24:00.430000', '7', '黑客与画家', '1', '[{\"added\": {}}]', '10', '1'), ('53', '2018-03-28 17:25:05.773000', '8', '从0到1', '1', '[{\"added\": {}}]', '10', '1'), ('54', '2018-03-28 17:26:31.288000', '9', '重来2', '1', '[{\"added\": {}}]', '10', '1'), ('55', '2018-03-28 17:27:47.951000', '10', '失控', '1', '[{\"added\": {}}]', '10', '1'), ('56', '2018-03-28 17:28:35.237000', '11', '精益创业', '1', '[{\"added\": {}}]', '10', '1'), ('57', '2018-03-28 17:29:23.871000', '12', '断舍离', '1', '[{\"added\": {}}]', '10', '1'), ('58', '2018-03-28 17:30:13.726000', '13', '高效能人士的七个习惯', '1', '[{\"added\": {}}]', '10', '1'), ('59', '2018-03-28 17:31:13.473000', '14', '月亮和六便士', '1', '[{\"added\": {}}]', '10', '1'), ('60', '2018-03-28 17:31:48.790000', '15', '干法', '1', '[{\"added\": {}}]', '10', '1'), ('61', '2018-03-28 17:32:32.887000', '16', '穷查理宝典', '1', '[{\"added\": {}}]', '10', '1'), ('62', '2018-03-28 17:33:12.766000', '17', '如何阅读一本书', '1', '[{\"added\": {}}]', '10', '1'), ('63', '2018-03-28 17:34:09.612000', '18', '雷军的谜', '1', '[{\"added\": {}}]', '10', '1'), ('64', '2018-03-28 17:34:52.149000', '19', '周鸿祎自述', '1', '[{\"added\": {}}]', '10', '1'), ('65', '2018-03-28 17:35:45.887000', '20', '简单的逻辑学', '1', '[{\"added\": {}}]', '10', '1'), ('66', '2018-03-28 17:36:20.105000', '21', '怦然心动的人生整理魔法', '1', '[{\"added\": {}}]', '10', '1'), ('67', '2018-03-28 17:37:00.108000', '22', '活法', '1', '[{\"added\": {}}]', '10', '1'), ('68', '2018-03-28 17:37:38.056000', '23', '瓦尔登湖', '1', '[{\"added\": {}}]', '10', '1'), ('69', '2018-03-28 17:38:26.030000', '24', '人类简史', '1', '[{\"added\": {}}]', '10', '1'), ('70', '2018-03-28 17:39:08.623000', '25', '乌合之众', '1', '[{\"added\": {}}]', '10', '1'), ('71', '2018-03-28 17:39:52.321000', '26', '無印良品的改革', '1', '[{\"added\": {}}]', '10', '1'), ('72', '2018-03-28 17:40:29.918000', '27', '枪炮、病菌与钢铁', '1', '[{\"added\": {}}]', '10', '1'), ('73', '2018-03-28 17:41:10.681000', '28', '当我谈跑步时我谈些什么', '1', '[{\"added\": {}}]', '10', '1'), ('74', '2018-03-28 17:41:50.484000', '29', '人月神话', '1', '[{\"added\": {}}]', '10', '1'), ('75', '2018-03-28 17:42:34.251000', '30', '成功的真谛', '1', '[{\"added\": {}}]', '10', '1'), ('76', '2018-03-29 15:54:40.519000', '7', 'Mysql基础4——[运算符，函数]', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\"]}}]', '9', '1'), ('77', '2018-03-29 16:10:34.100000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\", \"banner\"]}}]', '9', '1'), ('78', '2018-03-29 16:27:47.058000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[{\"changed\": {\"fields\": [\"keywords\"]}}]', '9', '1'), ('79', '2018-03-29 16:29:01.809000', '7', 'Mysql基础4——[运算符，函数]', '2', '[{\"changed\": {\"fields\": [\"keywords\"]}}]', '9', '1'), ('80', '2018-03-29 16:29:13.879000', '7', 'Mysql基础4——[运算符，函数]', '2', '[]', '9', '1'), ('81', '2018-03-29 16:46:29.093000', '4', '2017年成为全栈开发工程师的权威指南', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\", \"banner\"]}}]', '9', '1'), ('82', '2018-03-29 17:13:07.847000', '1', 'index', '1', '[{\"added\": {}}]', '11', '1'), ('83', '2018-03-29 17:13:26.774000', '1', 'index', '2', '[]', '11', '1'), ('84', '2018-03-29 17:15:07.686000', '2', 'read', '1', '[{\"added\": {}}]', '11', '1'), ('85', '2018-03-29 17:17:28.895000', '3', 'category', '1', '[{\"added\": {}}]', '11', '1'), ('86', '2018-03-29 17:18:16.494000', '4', 'tag', '1', '[{\"added\": {}}]', '11', '1'), ('87', '2018-03-29 17:19:15.806000', '5', 'archive', '1', '[{\"added\": {}}]', '11', '1'), ('88', '2018-03-29 17:20:40.006000', '6', 'about', '1', '[{\"added\": {}}]', '11', '1'), ('89', '2018-03-29 17:47:22.530000', '6', 'about', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('90', '2018-03-29 17:47:34.311000', '5', 'archive', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('91', '2018-03-29 17:47:38.832000', '4', 'tag', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('92', '2018-03-29 17:47:43.692000', '3', 'category', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('93', '2018-03-29 17:47:51.638000', '2', 'read', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('94', '2018-03-29 17:48:01.694000', '1', 'index', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('95', '2018-03-29 17:48:26.963000', '7', 'Mysql基础4——[运算符，函数]', '2', '[{\"changed\": {\"fields\": [\"keywords\"]}}]', '9', '1'), ('96', '2018-03-29 17:51:57.277000', '6', 'Mysql基础2——[插入，删除，更新，查询，修改]', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\"]}}]', '9', '1'), ('97', '2018-03-29 17:53:06.863000', '5', 'Mysql基础1——[数据类型，查看，创建，约束]', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\"]}}]', '9', '1'), ('98', '2018-03-29 17:53:40.193000', '4', '2017年成为全栈开发工程师的权威指南', '2', '[{\"changed\": {\"fields\": [\"keywords\"]}}]', '9', '1'), ('99', '2018-03-29 17:54:26.466000', '3', 'OOP mysqli入门', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\"]}}]', '9', '1'), ('100', '2018-03-29 17:55:05.676000', '2', '长期接受碎片化信息，会有什么后果？', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2018-03-29 17:55:14.511000', '1', '乔布斯2005斯坦福大学毕业演讲', '2', '[]', '9', '1'), ('102', '2018-03-29 17:55:31.339000', '7', 'Mysql基础4——[运算符，函数]', '2', '[{\"changed\": {\"fields\": [\"keywords\"]}}]', '9', '1'), ('103', '2018-03-29 17:55:36.359000', '6', 'Mysql基础2——[插入，删除，更新，查询，修改]', '2', '[{\"changed\": {\"fields\": [\"keywords\"]}}]', '9', '1'), ('104', '2018-03-29 17:55:40.898000', '5', 'Mysql基础1——[数据类型，查看，创建，约束]', '2', '[]', '9', '1'), ('105', '2018-03-29 17:55:46.582000', '4', '2017年成为全栈开发工程师的权威指南', '2', '[{\"changed\": {\"fields\": [\"keywords\"]}}]', '9', '1'), ('106', '2018-03-29 17:56:24.022000', '6', 'about', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('107', '2018-03-29 17:56:30.549000', '5', 'archive', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('108', '2018-03-29 17:56:35.984000', '4', 'tag', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('109', '2018-03-29 17:56:42.053000', '3', 'category', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('110', '2018-03-29 17:56:47.867000', '2', 'read', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('111', '2018-03-29 17:56:55.631000', '1', 'index', '2', '[{\"changed\": {\"fields\": [\"site_keywords\"]}}]', '11', '1'), ('112', '2018-03-30 11:03:03.735000', '6', 'about', '2', '[{\"changed\": {\"fields\": [\"site_description\"]}}]', '11', '1'), ('113', '2018-03-30 11:04:12.937000', '5', 'archive', '2', '[{\"changed\": {\"fields\": [\"banner\"]}}]', '11', '1'), ('114', '2018-03-30 11:05:40.835000', '5', 'archive', '2', '[{\"changed\": {\"fields\": [\"banner\"]}}]', '11', '1'), ('115', '2018-03-30 11:05:50.814000', '5', 'archive', '2', '[{\"changed\": {\"fields\": [\"banner\"]}}]', '11', '1'), ('116', '2018-03-30 11:06:58.513000', '4', 'tag', '2', '[{\"changed\": {\"fields\": [\"banner\"]}}]', '11', '1'), ('117', '2018-03-30 11:10:29.545000', '3', 'category', '2', '[{\"changed\": {\"fields\": [\"banner\"]}}]', '11', '1'), ('118', '2018-03-30 11:51:44.412000', '8', 'test', '2', '[{\"changed\": {\"fields\": [\"keywords\", \"description\", \"is_pub\"]}}]', '9', '1'), ('119', '2018-03-30 11:54:05.477000', '4', '2017年成为全栈开发工程师的权威指南', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('120', '2018-03-30 11:56:23.361000', '3', 'OOP mysqli入门', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '9', '1'), ('121', '2018-03-31 15:03:28.398000', '9', '测试', '2', '[{\"changed\": {\"fields\": [\"is_pub\"]}}]', '8', '1'), ('122', '2018-03-31 17:25:07.182000', '4', '2017年成为全栈开发工程师的权威指南', '2', '[{\"changed\": {\"fields\": [\"reprint\"]}}]', '9', '1');
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app_label`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`model`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`),
UNIQUE INDEX `django_content_type_app_label_76bd3d3b_uniq` (`app_label`, `model`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=12

;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('4', 'auth', 'group'), ('2', 'auth', 'permission'), ('3', 'auth', 'user'), ('8', 'blog', 'category'), ('11', 'blog', 'column'), ('9', 'blog', 'post'), ('10', 'blog', 'read'), ('7', 'blog', 'tag'), ('5', 'contenttypes', 'contenttype'), ('6', 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
`id`  int(11) NOT NULL AUTO_INCREMENT ,
`app`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`applied`  datetime NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=24

;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-03-21 08:16:10.194000'), ('2', 'auth', '0001_initial', '2018-03-21 08:16:11.889000'), ('3', 'admin', '0001_initial', '2018-03-21 08:16:12.557000'), ('4', 'admin', '0002_logentry_remove_auto_add', '2018-03-21 08:16:12.573000'), ('5', 'contenttypes', '0002_remove_content_type_name', '2018-03-21 08:16:12.803000'), ('6', 'auth', '0002_alter_permission_name_max_length', '2018-03-21 08:16:12.945000'), ('7', 'auth', '0003_alter_user_email_max_length', '2018-03-21 08:16:13.106000'), ('8', 'auth', '0004_alter_user_username_opts', '2018-03-21 08:16:13.126000'), ('9', 'auth', '0005_alter_user_last_login_null', '2018-03-21 08:16:13.468000'), ('10', 'auth', '0006_require_contenttypes_0002', '2018-03-21 08:16:13.476000'), ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-03-21 08:16:13.495000'), ('12', 'auth', '0008_alter_user_username_max_length', '2018-03-21 08:16:13.616000'), ('13', 'blog', '0001_initial', '2018-03-21 08:16:14.861000'), ('14', 'sessions', '0001_initial', '2018-03-21 08:16:14.988000'), ('15', 'blog', '0002_auto_20180322_1247', '2018-03-22 04:47:22.939000'), ('16', 'blog', '0003_auto_20180328_1328', '2018-03-28 13:28:45.269000'), ('17', 'blog', '0004_auto_20180328_1353', '2018-03-28 13:53:29.347000'), ('18', 'blog', '0005_auto_20180328_1720', '2018-03-28 17:20:46.587000'), ('19', 'blog', '0006_auto_20180329_1551', '2018-03-29 15:51:57.353000'), ('20', 'blog', '0007_post_banner', '2018-03-29 16:07:52.228000'), ('21', 'blog', '0008_auto_20180329_1628', '2018-03-29 16:28:54.726000'), ('22', 'blog', '0009_column', '2018-03-29 17:07:21.984000'), ('23', 'blog', '0010_auto_20180331_1707', '2018-03-31 17:07:40.602000');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
`session_key`  varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`session_data`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`expire_date`  datetime NOT NULL ,
PRIMARY KEY (`session_key`),
INDEX `django_session_de54fa62` (`expire_date`) USING BTREE 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('bw16hk2317e0ikou2v1w1zgv2o7jmcuq', 'NGFjNWVhMTY3Mzg2YTI5ZTI1NzhkMWVkZGVjNThhM2E2MTcxYjgyNzp7Il9hdXRoX3VzZXJfaGFzaCI6IjY3Yzg5NzgxYmNmNzZhYmNhMjMwZWJhMzM3ZmMyMmRhOTRlNGFmNTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-04-04 08:34:01.548000');
COMMIT;

-- ----------------------------
-- Auto increment value for auth_group
-- ----------------------------
ALTER TABLE `auth_group` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for auth_group_permissions
-- ----------------------------
ALTER TABLE `auth_group_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for auth_permission
-- ----------------------------
ALTER TABLE `auth_permission` AUTO_INCREMENT=34;

-- ----------------------------
-- Auto increment value for auth_user
-- ----------------------------
ALTER TABLE `auth_user` AUTO_INCREMENT=2;

-- ----------------------------
-- Auto increment value for auth_user_groups
-- ----------------------------
ALTER TABLE `auth_user_groups` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for auth_user_user_permissions
-- ----------------------------
ALTER TABLE `auth_user_user_permissions` AUTO_INCREMENT=1;

-- ----------------------------
-- Auto increment value for blog_category
-- ----------------------------
ALTER TABLE `blog_category` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for blog_column
-- ----------------------------
ALTER TABLE `blog_column` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for blog_post
-- ----------------------------
ALTER TABLE `blog_post` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for blog_post_tag
-- ----------------------------
ALTER TABLE `blog_post_tag` AUTO_INCREMENT=11;

-- ----------------------------
-- Auto increment value for blog_read
-- ----------------------------
ALTER TABLE `blog_read` AUTO_INCREMENT=31;

-- ----------------------------
-- Auto increment value for blog_tag
-- ----------------------------
ALTER TABLE `blog_tag` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for django_admin_log
-- ----------------------------
ALTER TABLE `django_admin_log` AUTO_INCREMENT=123;

-- ----------------------------
-- Auto increment value for django_content_type
-- ----------------------------
ALTER TABLE `django_content_type` AUTO_INCREMENT=12;

-- ----------------------------
-- Auto increment value for django_migrations
-- ----------------------------
ALTER TABLE `django_migrations` AUTO_INCREMENT=24;
