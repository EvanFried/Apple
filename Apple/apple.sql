SET NAMES UTF8;
DROP DATABASE IF EXISTS apple;
CREATE DATABASE apple CHARSET=UTF8;
USE apple;

/**笔记本电脑型号家族**/
CREATE TABLE apple_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

/**笔记本电脑**/
CREATE TABLE apple_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(256),      #副标题
  price DECIMAL(10,2),        #价格
  spec VARCHAR(64),           #颜色

  lname VARCHAR(32),          #商品名称
	resolution VARCHAR(32),     #分辨率
  os VARCHAR(32),             #操作系统
	cpu VARCHAR(128),            #处理器
  memory VARCHAR(128),         #内存容量
	disk VARCHAR(128),           #硬盘容量及类型
	keyboard VARCHAR(32)        #键盘类型
);

/**笔记本电脑图片**/
CREATE TABLE apple_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #笔记本电脑编号
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE apple_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE apple_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE apple_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE apple_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE apple_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE apple_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);

/*******************/
/******数据导入******/
/*******************/
/**笔记本电脑型号家族**/
INSERT INTO apple_laptop_family VALUES
(NULL,'MacBookAir'),
(NULL,'MacBookPro'),
(NULL,'iMac'),
(NULL,'iMacPro'),
(NULL,'Macmini'),
(NULL,'iPadPro'),
(NULL,'iPadAir'),
(NULL,'iPad'),
(NULL,'iPadmini'),
(NULL,'iPhoneXs');

/**笔记本电脑**/
INSERT INTO apple_laptop VALUES
(1,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 256GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',10399,'深空灰色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(2,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 512GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',11958,'深空灰色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(3,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 1TB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',13517,'深空灰色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(4,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 256GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',11867,'深空灰色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(5,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 512GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',13426,'深空灰色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(6,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 1TB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',14985,'深空灰色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(7,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 256GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',10399,'银色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(8,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 512GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',11958,'银色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(9,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 1TB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',13517,'银色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(10,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 256GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',11867,'银色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(11,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 512GB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',13426,'银色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(12,1,'1.6GHz 双核处理器，Turbo Boost 最高可达 3.6GHz 1TB 存储容量 触控 ID','采用原彩显示技术的视网膜显示屏
1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
Intel UHD Graphics 617 图形处理器
触控 ID
力度触控板
两个雷雳 3 端口',14985,'银色','MacBook Air','13寸','MacOS','1.6GHz 双核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 3.6GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(13,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 256GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',11499,'深空灰色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(14,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 512GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',13058,'深空灰色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(15,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 1TB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',14617,'深空灰色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(16,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 256GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',12967,'深空灰色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(17,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 512GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',14526,'深空灰色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(18,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 1TB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',16085,'深空灰色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(19,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 256GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',13701,'深空灰色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(20,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 512GB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',15260,'深空灰色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(21,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 1TB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',16819,'深空灰色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(22,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 256GB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',15169,'深空灰色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(23,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 512GB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',16728,'深空灰色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(24,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 1TB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',18278,'深空灰色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(25,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 256GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',11499,'银色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(26,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 512GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',13058,'银色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(27,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 1TB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',14617,'银色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(28,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 256GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',12967,'银色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(29,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 512GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',14526,'银色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(30,2,'1.4GHz 四核处理器 (Turbo Boost 最高可达 3.9GHz) 1TB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',16085,'银色','MacBook Pro','13寸','MacOS','1.4GHz 四核第八代 Intel Core i5 处理器, Turbo Boost 最高可达 3.9GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(31,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 256GB 存储容量 触控栏和触控 ID','1.4GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',13701,'银色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(32,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 512GB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 3.9GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',15260,'银色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(33,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 1TB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',16819,'银色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(34,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 256GB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',15169,'银色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(35,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 512GB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',16728,'银色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(36,2,'1.7GHz 四核处理器 (Turbo Boost 最高可达 4.5GHz) 1TB 存储容量 触控栏和触控 ID','1.7GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.5GHz
Intel Iris Plus Graphics 645 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
两个雷雳 3 端口',18278,'银色','MacBook Pro','13寸','MacOS','1.7GHz 四核第八代 Intel Core i7 处理器, Turbo Boost 最高可达 4.5GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(37,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 256GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',13899,'深空灰色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(38,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 512GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',15499,'深空灰色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(39,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 1TB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',17099,'深空灰色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(40,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 256GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',15367,'深空灰色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(41,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 512GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',16967,'深空灰色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(42,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 1TB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',18567,'深空灰色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(43,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 256GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',16101,'深空灰色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(44,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 512GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',17701,'深空灰色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(45,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 1TB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',19301,'深空灰色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(46,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 256GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',17569,'深空灰色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(47,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 512GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',19169,'深空灰色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(48,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 1TB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',20769,'深空灰色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(49,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 256GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',13899,'银色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(50,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 512GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',15499,'银色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(51,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 1TB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',17099,'银色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(52,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 256GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',15367,'银色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(53,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 512GB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',16967,'银色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(54,2,'2.4GHz 四核处理器 (Turbo Boost 最高可达 4.1GHz) 1TB 存储容量触控栏和触控 ID','2.4GHz 四核第八代 Intel Core i5 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',18567,'银色','MacBook Pro','13寸','MacOS','2.4GHz 四核第八代 Intel Core i5 处理器，Turbo Boost 最高可达 4.1GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(55,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 256GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.1GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
256GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',16101,'银色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','8GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(56,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 512GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
512GB 固态硬盘1
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',17701,'银色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','8GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(57,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 1TB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
8GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',19301,'银色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','8GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音'),
(58,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 256GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
256GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',17569,'银色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','16GB 2133MHz LPDDR3 内存','256GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(59,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 512GB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
512GB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',19169,'银色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','16GB 2133MHz LPDDR3 内存','512GB 固态硬盘','背光键盘 - 中文 - 拼音'),
(60,2,'2.8GHz 四核处理器 (Turbo Boost 最高可达 4.7GHz) 1TB 存储容量触控栏和触控 ID','2.8GHz 四核第八代 Intel Core i7 处理器
Turbo Boost 最高可达 4.7GHz
Intel Iris Plus Graphics 655 图形处理器
16GB 2133MHz LPDDR3 内存
1TB 固态硬盘
采用原彩显示技术的视网膜显示屏
触控栏和触控 ID
四个雷雳 3 端口',20769,'银色','MacBook Pro','13寸','MacOS','2.8GHz 四核第八代 Intel Core i7 处理器，Turbo Boost 最高可达 4.7GHz','16GB 2133MHz LPDDR3 内存','1TB 固态硬盘','背光键盘 - 中文 - 拼音')
;

/**笔记本电脑图片**/
INSERT INTO apple_laptop_pic VALUES
(NULL, 1,'image/macbook-air_img/macbook-air.jpg'),
(NULL, 1,'image/macbook-air_img/macbook-air-gallery1.jpg'),
(NULL, 1,'image/macbook-air_img/macbook-air-gallery2.jpg'),
(NULL, 1,'image/macbook-air_img/macbook-air-gallery3.jpg'),
(NULL, 1,'image/macbook-air_img/macbook-air-gallery4.jpg'),
(NULL, 1,'image/macbook-air_img/macbook-air-gallery5.jpg'),
(NULL, 13,'image/macbook-air_img/macbook-pro.jpg'),
(NULL, 13,'image/macbook-air_img/macbook-air-gallery1.jpg'),
(NULL, 13,'image/macbook-air_img/macbook-air-gallery2.jpg'),
(NULL, 13,'image/macbook-air_img/macbook-air-gallery3.jpg')
;

/**用户信息**/
INSERT INTO apple_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO apple_index_carousel VALUES
(NULL, 'img/index/banner1.png','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'img/index/banner2.png','轮播广告商品2','product_details.html?lid=19'),
(NULL, 'img/index/banner3.png','轮播广告商品3','lookforward.html'),
(NULL, 'img/index/banner4.png','轮播广告商品4','lookforward.html');