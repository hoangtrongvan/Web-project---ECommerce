/*
Navicat MySQL Data Transfer

Source Server         : nenjamin2405
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : pineapple

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-22 20:38:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
`CategoryID`  int(11) NOT NULL AUTO_INCREMENT ,
`Category`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Compare_icon`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`CategoryID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=4

;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES ('1', 'Pac', '../icon/mac_comp_large.png'), ('2', 'pPad', '../icon/ipad_comp_large.png'), ('3', 'pPhone', '../icon/iphone_comp_large.png');
COMMIT;

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
`ColorID`  int(11) NOT NULL AUTO_INCREMENT ,
`Name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Color_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`ColorID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=7

;

-- ----------------------------
-- Records of color
-- ----------------------------
BEGIN;
INSERT INTO `color` VALUES ('1', 'Space Gray', '..\\images\\colors\\spacegray.png'), ('2', 'Silver', '..\\images\\colors\\silver.png'), ('3', 'Gold', '..\\images\\colors\\gold.png'), ('4', 'Rose Gold', '..\\images\\colors\\rosegold.png'), ('5', 'Black', '..\\images\\colors\\black.png'), ('6', 'JetBlack', '..\\images\\colors\\jetblack.png');
COMMIT;

-- ----------------------------
-- Table structure for colorproduct
-- ----------------------------
DROP TABLE IF EXISTS `colorproduct`;
CREATE TABLE `colorproduct` (
`ProductID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Color`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ColorID`  int(11) NULL DEFAULT NULL ,
`colorProduct_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of colorproduct
-- ----------------------------
BEGIN;
INSERT INTO `colorproduct` VALUES ('PAC2016', 'Space Gray', null, '../colorProducts/PAC2016Space Gray.jfif'), ('PAC2016', 'Silver', null, '../colorProducts/PAC2016Silver.jfif'), ('PPAD2016', 'Space Gray', null, '../colorProducts/PPAD2016Space Gray.png'), ('PPAD2016', 'Silver', null, '../colorProducts/PPAD2016Silver.png'), ('PPAD2016', 'Gold', null, '../colorProducts/PPAD2016Gold.png'), ('PPAD2016', 'Rose Gold', null, '../colorProducts/PPAD2016Rose Gold.png'), ('PPADMINI', 'Space Gray', null, '../colorProducts/PPADMINISpace Gray.png'), ('PPADMINI', 'Silver', null, '../colorProducts/PPADMINISilver.png'), ('PPADMINI', 'Gold', null, '../colorProducts/PPADMINIGold.png'), ('PPHONE6112', 'Space Gray', null, '../colorProducts/PPHONE6112Space Gray.jfif'), ('PPHONE6112', 'Silver', null, '../colorProducts/PPHONE6112Silver.jfif'), ('PPHONE6112', 'Gold', null, '../colorProducts/PPHONE6112Gold.jfif'), ('PPHONE6112', 'Rose Gold', null, '../colorProducts/PPHONE6112Rose Gold.jfif'), ('PPHONE7', 'Silver', null, '../colorProducts/PPHONE7Silver.png'), ('PPHONE7', 'Gold', null, '../colorProducts/PPHONE7Gold.png'), ('PPHONE7', 'Rose Gold', null, '../colorProducts/PPHONE7Rose Gold.png'), ('PPHONE7', 'Black', null, '../colorProducts/PPHONE7Black.png'), ('PPHONE7', 'JetBlack', null, '../colorProducts/PPHONE7JetBlack.png');
COMMIT;

-- ----------------------------
-- Table structure for orderpineapple
-- ----------------------------
DROP TABLE IF EXISTS `orderpineapple`;
CREATE TABLE `orderpineapple` (
`OrderID`  int(11) NOT NULL AUTO_INCREMENT ,
`Customer`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ProductID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Quantity`  int(11) NULL DEFAULT NULL ,
`Date`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Time`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ProductName`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Price`  float NULL DEFAULT NULL ,
`Total`  float NULL DEFAULT NULL ,
PRIMARY KEY (`OrderID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=71

;

-- ----------------------------
-- Records of orderpineapple
-- ----------------------------
BEGIN;
INSERT INTO `orderpineapple` VALUES ('45', 'neotruong2405@gmail.com', 'PAC2016', '8', '17/12/2016', '09:31:22', 'Pacbook Pro 2016 - Space Gray - Model13', '1200', '9600'), ('47', 'neotruong2405@gmail.com', 'PAC2016', '1', '17/12/2016', '09:55:13', 'Pacbook Pro 2016 - Space Gray - Model13', '1200', '1200'), ('48', 'neotruong2405@gmail.com', 'PAC2016', '10', '17/12/2016', '09:55:35', 'Pacbook Pro 2016 - Space Gray - Model13', '1200', '12000'), ('59', 'neotruong2405@gmail.com', 'PPHONE7', '10', '19/12/2016', '02:52:30', 'pPhone 7 - JetBlack - Model33', '849', '8490'), ('60', 'neotruong2405@gmail.com', 'PPHONE7', '11', '19/12/2016', '02:52:30', 'pPhone 7 - Silver - Model33', '849', '9339'), ('61', 'neotruong2405@gmail.com', 'PPHONE7', '3', '19/12/2016', '03:24:22', 'pPhone 7 - JetBlack - Model33', '849', '2547'), ('62', 'neotruong2405@gmail.com', 'PPHONE7', '5', '19/12/2016', '03:24:22', 'pPhone 7 - Rose Gold - Model32', '749', '3745'), ('63', 'kathyvo1509@gmail.com', 'PPAD2016', '1', '19/12/2016', '03:25:48', 'pPad Pro 2016 - Rose Gold - Model15', '699', '699'), ('64', 'neotruong2405@gmail.com', 'PAC2016', '1', '19/12/2016', '03:32:39', 'Pacbook Pro 2016 - Space Gray - Model13', '1200', '1200'), ('65', 'neotruong2405@gmail.com', 'PPHONE6112', '1', '19/12/2016', '09:00:47', 'pPhone 6S - Rose Gold - Model29', '649', '649'), ('66', 'nenjamin2405@gmail.com', 'PPAD2016', '1', '21/12/2016', '10:13:13', 'pPad Pro 2016 - Space Gray - Model15', '699', '699'), ('67', 'neotruong2405@gmail.com', 'PAC2016', '1', '22/12/2016', '10:14:38', 'Pacbook Pro 2016 - Space Gray - Model13', '1200', '1200'), ('68', 'neotruong2405@gmail.com', 'PPAD2016', '10', '22/12/2016', '10:14:38', 'pPad Pro 2016 - Rose Gold - Model15', '699', '6990'), ('69', 'nenjamin2405@gmail.com', 'PAC2016', '1', '22/12/2016', '02:41:10', 'Pacbook Pro 2016 - Space Gray - Model13', '1200', '1200'), ('70', 'nenjamin2405@gmail.com', 'PPHONE7', '4', '22/12/2016', '02:41:10', 'pPhone 7 - JetBlack - Model35', '749', '2996');
COMMIT;

-- ----------------------------
-- Table structure for productmodel
-- ----------------------------
DROP TABLE IF EXISTS `productmodel`;
CREATE TABLE `productmodel` (
`ModelID`  int(11) NOT NULL AUTO_INCREMENT ,
`ProductID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`GeneralInfo`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Price`  float NULL DEFAULT NULL ,
PRIMARY KEY (`ModelID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=40

;

-- ----------------------------
-- Records of productmodel
-- ----------------------------
BEGIN;
INSERT INTO `productmodel` VALUES ('13', 'PAC2016', 'Touch Bar and Touch IDDDD;\r\n3.1GHz Processor; \r\n256GB;\r\n2.9GHz dual-core Intel Core i5 processor;\r\nTurbo Boost up to 3.3GH;\r\n8GB 2133MHz memory;\r\n256GB PCIe-based;\r\nIntel Iris Graphics 550;\r\nFour Thunderbolt 3 ports;\r\nTouch Bar and Touch ID;', '1200'), ('14', 'PAC2016', 'Touch Bar and Touch ID;\r\n3.1GHz Processor; \r\n512GB Storage;\r\n2.9GHz dual-core Intel Core i5 processor;\r\nTurbo Boost up to 3.3GHz;\r\n32GB 2133MHz memory;\r\n512GB PCIe-based SSD;\r\nIntel Iris Graphics 550;\r\nFour Thunderbolt 3 ports;\r\nTouch Bar an ;', '3000'), ('15', 'PPAD2016', '9.7-inch display;128GB', '699'), ('16', 'PPAD2016', '12.9-inch display;256GB', '999'), ('25', 'PPADMINI', 'ss', '100'), ('26', 'PPADMINI', 'sss', '100'), ('29', 'PPHONE6112', '32GB', '649'), ('30', 'PPHONE6112', '128GB', '749'), ('37', 'PPHONE7', '32GB', '649'), ('38', 'PPHONE7', '128GB', '749'), ('39', 'PPHONE7', '256GB', '849');
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
`ProductID`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`avatar`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Brief_Desc`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Desc1`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Desc2`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Large_img`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`img_desc1`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`img_desc2`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Category`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Caption`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`Small_icon_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`ProductID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci

;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` VALUES ('PAC2016', '../ProductsContainer/PAC2016Ava.jfif', 'Pacbook Pro 2016', 'Thinner, lighter, and available with the revolutionary Touch Bar â the new MacBook Pro is our most powerful notebook ever.', 'It\'s faster and more powerful than before, yet remarkably thinner and lighter. It has the brightest, most colorful Mac notebook display ever. And it introduces the Touch Bar. Multi-Touch enabled strip of glass built into the keyboard for instant access to the tools you want, right when you want them. The new MacBook Pro is built on groundbreaking ideas. And it\'s ready for yours.', '1234', '../ProductsContainer/PAC2016largeIMG.png', '../ProductsContainer/PAC2016desc1.jpg', '../ProductsContainer/PAC2016desc2.png', 'Pac', 'A touch of genius and talent', '../ProductsContainer/PAC2016smallIcon.png'), ('PPAD2016', '../ProductsContainer/PPAD2016Ava.jpg', 'pPad Pro 2016', 'BD', 'D1', 'D2', '../ProductsContainer/PPAD2016largeIMG.jpg', '../ProductsContainer/PPAD2016desc1.jpg', '../ProductsContainer/PPAD2016desc2.png', 'pPad', 'Super. Computer. Now in two sizes.', '../ProductsContainer/PPAD2016smallIcon.png'), ('PPADMINI', '../ProductsContainer/PPADMINIAva.png', 'pPad mini 4', 'It\'s thinner and lighter than ever before, yet powerfully packed with the fast A8 chip.', 'There\'s more to mini than meets the eye. The new iPad mini 4 puts uncompromising performance and potential in your hand. It\'s thinner and lighter than ever before, yet powerful enough to help you take your ideas even further.', 'iPad mini 4 is powered by an A8 chip with second-generation 64-bit desktop-class architecture that can handle even your most demanding apps. Whether you are editing a video, browsing photos, or both, your experience will be smooth and seamless.', '../ProductsContainer/PPADMINIlargeIMG.png', '../ProductsContainer/PPADMINIdesc1.png', '../ProductsContainer/PPADMINIdesc2.png', 'pPad', 'Mighty. Small.', '../ProductsContainer/PPADMINIsmallIcon.png'), ('PPHONE6112', '../ProductsContainer/PPHONE6112Ava.jpg', 'pPhone 6S', 'iPhone 6s and iPhone 6s Plus feature 3D Touch, Live Photos, 12MP pictures, 4K video, and 64-bit A9 chip.', 'hahaha', 'hihi', '../ProductsContainer/PPHONE6112largeIMG.jfif', '../ProductsContainer/PPHONE6112desc1.jpg', '../ProductsContainer/PPHONE6112desc2.jfif', 'pPhone', 'pPhone 6s - Best', '../ProductsContainer/PPHONE6112smallIcon.png'), ('PPHONE7', '../ProductsContainer/PPHONE7Ava.jpg', 'pPhone 7', 'With a redesigned 12MP camera, water resistance, A10 chip, and stereo speakers, iPhone 7 is the ultimate iPhone.', 'redesigned 12MP camera, water resistance, A10 chip, and stereo speakers', 'New', '../ProductsContainer/PPHONE7largeIMG.jpg', '../ProductsContainer/PPHONE7desc1.jpg', '../ProductsContainer/PPHONE7desc2.jpg', 'pPhone', 'New generation', '../ProductsContainer/PPHONE7smallIcon.png');
COMMIT;

-- ----------------------------
-- Table structure for subcriber
-- ----------------------------
DROP TABLE IF EXISTS `subcriber`;
CREATE TABLE `subcriber` (
`subcriber`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`subID`  int(11) NOT NULL AUTO_INCREMENT ,
PRIMARY KEY (`subID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=13

;

-- ----------------------------
-- Records of subcriber
-- ----------------------------
BEGIN;
INSERT INTO `subcriber` VALUES ('neotruong2405@gmail.com', '3'), ('kakaka@', '4'), ('hihi', '5'), ('hahah@yahoo.com', '6'), ('hahahahihihi@gmai.com', '7'), ('haha', '8'), ('hihiihiihhohoho', '9'), ('jj@gmail.com', '10'), ('kathy@gmail.com', '11'), ('lystacheung2405@yahoo.com', '12');
COMMIT;

-- ----------------------------
-- Table structure for useraccount
-- ----------------------------
DROP TABLE IF EXISTS `useraccount`;
CREATE TABLE `useraccount` (
`userID`  int(255) NOT NULL AUTO_INCREMENT ,
`email`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`first_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`last_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`birthday`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`phone_number`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`address`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`recieved`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`isManager`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`ava_url`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`userID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
AUTO_INCREMENT=30

;

-- ----------------------------
-- Records of useraccount
-- ----------------------------
BEGIN;
INSERT INTO `useraccount` VALUES ('10', 'neotruong2405@gmail.com', 'quangnhat', 'Nhatttt', 'Truong', '24/05/96', '09327004722222', '98/14 Nam Chau P11', 'wannaRecieve', '2', '../avatars/10.png'), ('20', 'kathyvo1509@gmail.com', 'thythy', 'Pham Thy', 'Vo', '15/09/95', '0901394602', '1454/10/3 Le Van Luong Nha Be', 'wannaRecieve', '1', '../avatars/20.jpg'), ('21', 'lystacheung0304@gmail.com', 'sameila261214', 'Lysta', 'Cheung', '03/04/1991', '0936192413', '98/12 Nam Chau', null, '1', '../avatars/21.jpg'), ('25', 'gilovino92@gmail.com', '123456', 'Huy', 'Ho', '17/03/96', '123456789', 'gilovino92@gmail.com', 'wannaRecieve', '0', '../avatars/25.JPG'), ('26', 'htvan.ityu@gmail.com', 'chonhat', 'Van', 'Hoang', '03/03/1996', '0968006451', 'B5 Building, Ward 3 , District 4', 'wannaRecieve', '0', '..\\avatars\\defaultAvatar.png'), ('27', 'leminhthien18081996@gmail.com', 'Hon123,.', 'Le', 'Thien', '18/08/1996', '0933396639', '1/45 Hoang Viet P.4 Q.Tan Binh', 'wannaRecieve', '0', '..\\avatars\\defaultAvatar.png'), ('28', 'minhthien896@yahoo.com', 'hon123', 'Le', 'Thien', '18/08/1996', '0933396639', 'IU', 'wannaRecieve', '0', '..\\avatars\\defaultAvatar.png'), ('29', 'nenjamin2405@gmail.com', 'quangnhat', 'Quang Nhat', 'Truong', '15/09/95', '0932700472', '98/14 Nam Chau P11, Q TB', 'wannaRecieve', '1', '../avatars/29.jpg');
COMMIT;

-- ----------------------------
-- Auto increment value for category
-- ----------------------------
ALTER TABLE `category` AUTO_INCREMENT=4;

-- ----------------------------
-- Auto increment value for color
-- ----------------------------
ALTER TABLE `color` AUTO_INCREMENT=7;

-- ----------------------------
-- Auto increment value for orderpineapple
-- ----------------------------
ALTER TABLE `orderpineapple` AUTO_INCREMENT=71;

-- ----------------------------
-- Auto increment value for productmodel
-- ----------------------------
ALTER TABLE `productmodel` AUTO_INCREMENT=40;

-- ----------------------------
-- Auto increment value for subcriber
-- ----------------------------
ALTER TABLE `subcriber` AUTO_INCREMENT=13;

-- ----------------------------
-- Auto increment value for useraccount
-- ----------------------------
ALTER TABLE `useraccount` AUTO_INCREMENT=30;
