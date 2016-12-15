delimiter $$

CREATE TABLE `users` (
  `UserId` varchar(50) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MailingStreet` varchar(50) DEFAULT NULL,
  `MailingCity` varchar(50) DEFAULT NULL,
  `MailingState` varchar(25) DEFAULT NULL,
  `MailingPostal` varchar(25) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB$$

CREATE TABLE `products` (
  `Itemid` int(11) NOT NULL,
  `ItemName` varchar(45) DEFAULT NULL,
  `ItemCategory` varchar(45) DEFAULT NULL,
  `ShortDescription` varchar(45) DEFAULT NULL,
  `LongDescription` varchar(245) DEFAULT NULL,
  `QuantityInStock` int(11) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `ImageReference` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Itemid`)
) ENGINE=InnoDB$$

CREATE TABLE `orders` (
  `OrderId` varchar(50) NOT NULL,
  `CustomerId` varchar(45) DEFAULT NULL,
  `CCNumber` varchar(45) DEFAULT NULL,
  `CCExpiration` varchar(25) DEFAULT NULL,
  `CCType` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB$$ 

CREATE TABLE `orderitems` (
  `OrderItemId` varchar(50) NOT NULL,
  `OrderId` varchar(45) DEFAULT NULL,
  `ItemId` varchar(45) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  PRIMARY KEY (`OrderItemId`),
  KEY `OrderId_idx` (`OrderId`),
  CONSTRAINT `OrderId` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`OrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB$$
