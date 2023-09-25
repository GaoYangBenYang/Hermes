-- Active: 1694646506791@@127.0.0.1@3306@codefixer
CREATE DATABASE codefixer
  DEFAULT CHARACTER SET = 'utf8mb4';

-- 1.用户模块
create Table user (
  user_id INT PRIMARY KEY AUTO_INCREMENT COMMENT "用户ID",
  user_uuid VARCHAR(255) UNIQUE COMMENT "uuid",
  user_name VARCHAR(20) default NULL COMMENT "姓名",
  user_sex CHAR(1) COMMENT "性别",
  user_birthday CHAR(20) default NULL COMMENT "出生日期",
  user_id_number CHAR(20) UNIQUE default NULL COMMENT "身份证号",
  user_location VARCHAR(100) default NULL COMMENT "所在地",
  user_school VARCHAR(100) default NULL COMMENT "学校",
  user_intro VARCHAR(100) default NULL COMMENT "个人简介",
  user_nick_name VARCHAR(20) default NULL COMMENT "昵称",
  user_telephone VARCHAR(20) NULL UNIQUE COMMENT "电话号码",
  user_email VARCHAR(30) UNIQUE default NULL COMMENT "邮箱",
  user_password VARCHAR(16) default NULL COMMENT "密码",
  user_avatar VARCHAR(255) default NULL COMMENT "头像图片地址",
  user_create DATETIME DEFAULT now() COMMENT "创建时间",
  user_edited DATETIME DEFAULT now() COMMENT "修改时间",
  user_state VARCHAR(10) NOT NULL DEFAULT 0 COMMENT "用户状态 0=正常 时间字符串=冻结结束日期",
  user_delete TINYINT(1) NOT NULL DEFAULT 0 COMMENT "逻辑删除:0=未删除,1=已删除"
)engine = innoDB CHARACTER SET = utf8 COMMENT "用户表";

create Table role (
  role_id INT PRIMARY KEY AUTO_INCREMENT COMMENT "角色ID",
  role_code INT(10) DEFAULT NULL COMMENT '角色唯一代码',
  role_name VARCHAR(64) DEFAULT NULL COMMENT "角色名称",
  role_intro VARCHAR(64) DEFAULT NULL COMMENT "角色介绍",
  role_create DATETIME DEFAULT now() COMMENT "创建时间",
  role_edited DATETIME DEFAULT now() COMMENT "修改时间",
  role_delete INT(1) NOT NULL DEFAULT 0 COMMENT "逻辑删除:0=未删除,1=已删除"
)engine = innoDB CHARACTER SET = utf8 COMMENT "角色表";

insert into `role` (`role_code`,`role_name`,`role_intro`) VALUES (1001,"超级管理员","权力之巅");
insert into `role` (`role_code`,`role_name`,`role_intro`) VALUES (1002,"管理员","管理部分数据");
insert into `role` (`role_code`,`role_name`,`role_intro`) VALUES (1003,"用户","指定范围内使用");

create Table permission (
  permission_id INT PRIMARY KEY AUTO_INCREMENT COMMENT "权限ID",
  permission_code INT(100) DEFAULT NULL COMMENT '权限唯一代码',
  permission_name varchar(64)  DEFAULT NULL COMMENT '权限名称',
  permission_intro varchar(64)  DEFAULT NULL COMMENT '权限介绍',
  permission_category TINYINT(1) DEFAULT NULL COMMENT '权限类别',
  permission_uri INT(20) DEFAULT NULL COMMENT 'URL规则',
  permission_create DATETIME DEFAULT now() COMMENT "创建时间",
  permission_edited DATETIME DEFAULT now() COMMENT "修改时间",
  permission_delete INT(1) NOT NULL DEFAULT 0 COMMENT "逻辑删除:0=未删除,1=已删除"
)engine = innoDB CHARACTER SET = utf8 COMMENT "权限表";

create Table user_role (
  user_role_id INT PRIMARY KEY AUTO_INCREMENT COMMENT "用户-角色ID",
  user_id INT NOT NULL COMMENT '用户ID，外键',
  role_id INT NOT NULL COMMENT '角色ID，外键',
  user_role_create DATETIME DEFAULT now() COMMENT "创建时间",
  user_role_edited DATETIME DEFAULT now() COMMENT "修改时间",
  user_role_delete INT(1) NOT NULL DEFAULT 0 COMMENT "逻辑删除:0=未删除,1=已删除",
  FOREIGN KEY (user_id) REFERENCES user (user_id),
  FOREIGN KEY (role_id) REFERENCES role (role_id)
)engine = innoDB CHARACTER SET = utf8 COMMENT "用户-角色表";


CREATE TABLE role_permission (
  role_permission_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '角色-权限ID',
  role_id INT NOT NULL COMMENT '角色ID 外键',
  permission_id INT NOT NULL COMMENT '权限ID 外键',
  role_permission_create DATETIME DEFAULT now() COMMENT "创建时间",
  role_permission_edited DATETIME DEFAULT now() COMMENT "修改时间",
  role_permission_deleted TINYINT(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除:0=未删除,1=已删除',
  FOREIGN KEY (role_id) REFERENCES role (role_id),
  FOREIGN KEY (permission_id) REFERENCES permission (permission_id)
) ENGINE = InnoDB CHARACTER SET = utf8  COMMENT = '角色-权限表';

-- 2.提问模块
CREATE TABLE question (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT "问题ID,主键,自增长",
title VARCHAR(255) NOT NULL COMMENT "问题标题，不为空",
description TEXT COMMENT "问题描述，可为空",
code TEXT COMMENT "问题代码，可为空",
language VARCHAR(50) COMMENT "问题代码语言，可为空",
views INT UNSIGNED NOT NULL DEFAULT 0 COMMENT "问题浏览次数,不为空,默认值为0",
votes INT UNSIGNED NOT NULL DEFAULT 0 COMMENT "问题投票次数,不为空,默认值为0",
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "问题创建时间，不为空",
updated_at TIMESTAMP COMMENT "问题更新时间，可为空",
user_id INT UNSIGNED NOT NULL COMMENT "问题发布者ID,外键,关联用户表中的id字段",
status TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT "问题状态,不为空,默认值为0,0表示未解决,1表示已解决",
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE COMMENT "外键约束，当用户被删除时，其发布的问题也会被删除"
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "问题表";

CREATE TABLE tag (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 标签ID，主键，自增长
name VARCHAR(50) UNIQUE NOT NULL -- 标签名称，唯一，不为空
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "标签表";

CREATE TABLE question_tag (
question_id INT UNSIGNED NOT NULL, -- 问题ID，外键，关联问题表中的id字段
tag_id INT UNSIGNED NOT NULL, -- 标签ID，外键，关联标签表中的id字段
PRIMARY KEY (question_id, tag_id), -- 主键，由问题ID和标签ID组成
FOREIGN KEY (question_id) REFERENCES question (id) ON DELETE CASCADE, -- 外键约束，当问题被删除时，与之相关的标签也会被删除
FOREIGN KEY (tag_id) REFERENCES tag (id) ON DELETE CASCADE -- 外键约束，当标签被删除时，与之相关的问题也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "问题-标签关联表";

-- 3.回答模块
CREATE TABLE answer (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 回答ID，主键，自增长
content TEXT NOT NULL, -- 回答内容，不为空
code TEXT, -- 回答代码，可为空
language VARCHAR(50), -- 回答代码语言，可为空
votes INT UNSIGNED NOT NULL DEFAULT 0, -- 回答投票次数，不为空，默认值为0
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 回答创建时间，不为空
updated_at TIMESTAMP, -- 回答更新时间，可为空
user_id INT UNSIGNED NOT NULL, -- 回答者ID，外键，关联用户表中的id字段
question_id INT UNSIGNED NOT NULL, -- 所回答问题ID，外键，关联问题表中的id字段
is_accepted TINYINT UNSIGNED NOT NULL DEFAULT 0, -- 回答是否被采纳，不为空，默认值为0，0表示未被采纳，1表示已被采纳
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当用户被删除时，其回答也会被删除
FOREIGN KEY (question_id) REFERENCES question (id) ON DELETE CASCADE -- 外键约束，当问题被删除时，与之相关的回答也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "回答表" ;

--4.评论模块
CREATE TABLE comment (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 评论ID，主键，自增长
content TEXT NOT NULL, -- 评论内容，不为空
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 评论创建时间，不为空
updated_at TIMESTAMP, -- 评论更新时间，可为空
user_id INT UNSIGNED NOT NULL, -- 评论者ID，外键，关联用户表中的id字段
question_id INT UNSIGNED, -- 所评论问题ID，外键，关联问题表中的id字段，可为空
answer_id INT UNSIGNED, -- 所评论回答ID，外键，关联回答表中的id字段，可为空
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当用户被删除时，其评论也会被删除
FOREIGN KEY (question_id) REFERENCES question (id) ON DELETE CASCADE, -- 外键约束，当问题被删除时，与之相关的评论也会被删除
FOREIGN KEY (answer_id) REFERENCES answer (id) ON DELETE CASCADE -- 外键约束，当回答被删除时，与之相关的评论也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT"评论表";

-- 6.通知模块
CREATE TABLE notification (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 通知ID，主键，自增长
content TEXT NOT NULL, -- 通知内容，不为空
create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 通知创建时间，不为空
sender_id INT UNSIGNED NOT NULL, -- 通知发送者ID，外键，关联用户表中的id字段
receiver_id INT UNSIGNED NOT NULL, -- 通知接收者ID，外键，关联用户表中的id字段
question_id INT UNSIGNED, -- 相关问题ID，可为空，外键，关联问题表中的id字段
answer_id INT UNSIGNED, -- 相关回答ID，可为空，外键，关联回答表中的id字段
FOREIGN KEY (sender_id) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当发送者被删除时，其发送的通知也会被删除
FOREIGN KEY (receiver_id) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当接收者被删除时，其接收的通知也会被删除
FOREIGN KEY (question_id) REFERENCES question (id) ON DELETE CASCADE, -- 外键约束，当问题被删除时，与之相关的通知也会被删除
FOREIGN KEY (answer_id) REFERENCES answer (id) ON DELETE CASCADE -- 外键约束，当回答被删除时，与之相关的通知也会被删除
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT "通知表";

-- 7.代码编辑模块
CREATE TABLE code (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 代码ID，主键，自增长
title VARCHAR(200) NOT NULL, -- 代码标题，不为空
content TEXT NOT NULL, -- 代码内容，不为空
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 代码创建时间，不为空
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 代码更新时间，不为空
user_id INT UNSIGNED NOT NULL, -- 用户ID，外键，关联用户表中的id字段
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE -- 外键约束，当用户被删除时，其保存的代码也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码表';

CREATE TABLE code_share (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 代码分享ID，主键，自增长
code_id INT UNSIGNED NOT NULL, -- 代码ID，外键，关联代码表中的id字段
shared_by INT UNSIGNED NOT NULL, -- 分享者ID，外键，关联用户表中的id字段
shared_to INT UNSIGNED NOT NULL, -- 被分享者ID，外键，关联用户表中的id字段
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 分享时间，不为空
FOREIGN KEY (code_id) REFERENCES code (id) ON DELETE CASCADE, -- 外键约束，当被分享的代码被删除时，其分享信息也会被删除
FOREIGN KEY (shared_by) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当分享者被删除时，其分享的代码信息也会被删除
FOREIGN KEY (shared_to) REFERENCES user (id) ON DELETE CASCADE -- 外键约束，当被分享者被删除时，其被分享的代码信息也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码分享表';

-- 社交模块
CREATE TABLE follow (
follower_id INT UNSIGNED NOT NULL, -- 关注者ID，外键，关联用户表中的id字段
followee_id INT UNSIGNED NOT NULL, -- 被关注者ID，外键，关联用户表中的id字段
PRIMARY KEY (follower_id, followee_id), -- 主键，由关注者ID和被关注者ID组成
FOREIGN KEY (follower_id) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当关注者被删除时，其关注信息也会被删除
FOREIGN KEY (followee_id) REFERENCES user (id) ON DELETE CASCADE -- 外键约束，当被关注者被删除时，其被关注信息也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='关注表';

CREATE TABLE fan (
user_id INT UNSIGNED NOT NULL, -- 用户ID，外键，关联用户表中的id字段
fan_id INT UNSIGNED NOT NULL, -- 粉丝ID，外键，关联用户表中的id字段
PRIMARY KEY (user_id, fan_id), -- 主键，由用户ID和粉丝ID组成
FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当用户被删除时，其粉丝信息也会被删除
FOREIGN KEY (fan_id) REFERENCES user (id) ON DELETE CASCADE -- 外键约束，当粉丝被删除时，其关注信息也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='粉丝表';

CREATE TABLE message (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 私信ID，主键，自增长
content TEXT NOT NULL, -- 私信内容，不为空
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 私信创建时间，不为空
sender_id INT UNSIGNED NOT NULL, -- 发送者ID，外键，关联用户表中的id字段
receiver_id INT UNSIGNED NOT NULL, -- 接收者ID，外键，关联用户表中的id字段
FOREIGN KEY (sender_id) REFERENCES user (id) ON DELETE CASCADE, -- 外键约束，当发送者被删除时，其发送的私信也会被删除
FOREIGN KEY (receiver_id) REFERENCES user (id) ON DELETE CASCADE -- 外键约束，当接收者被删除时，其接收的私信也会被删除
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='私信表';


--群组模块和功能
CREATE TABLE `group_info` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '群组 ID',
  `group_name` varchar(255) NOT NULL COMMENT '群组名称',
  `group_description` varchar(255) NOT NULL COMMENT '群组描述',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='群组基本信息表';

CREATE TABLE `group_members` (
  `group_id` int(11) NOT NULL COMMENT '群组 ID',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `join_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
  PRIMARY KEY (`group_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='群组成员信息表';

CREATE TABLE `group_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子 ID',
  `group_id` int(11) NOT NULL COMMENT '群组 ID',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `title` varchar(255) NOT NULL COMMENT '帖子标题',
  `content` text NOT NULL COMMENT '帖子内容',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='群组帖子信息表';

CREATE TABLE `group_post_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论 ID',
  `post_id` int(11) NOT NULL COMMENT '帖子 ID',
  `user_id` int(11) NOT NULL COMMENT '评论者 ID',
  `content` text NOT NULL COMMENT '评论内容',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='群组帖子评论信息表';

CREATE TABLE `group_permissions` (
  `group_id` int(11) NOT NULL COMMENT '群组 ID',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `permission` varchar(255) NOT NULL COMMENT '权限',
  PRIMARY KEY (`group_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='群组权限信息表';