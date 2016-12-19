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



$$

INSERT INTO `DEVdmw2shapestoredb`.`products` (`Itemid`, `ItemName`, `ItemCategory`, `ShortDescription`, `LongDescription`, `QuantityInStock`, `UnitPrice`, `ImageReference`) VALUES ('1', 'Square', 'Quadrilateral', 'Boxy and reliable.', 'Boxy and traditional shape with equal sides.', '500', '4.99', 'https://dmw-shapestoreresources.s3.amazonaws.com/productimages/product_square.png');
INSERT INTO `DEVdmw2shapestoredb`.`products` (`Itemid`, `ItemName`, `ItemCategory`, `ShortDescription`, `LongDescription`, `QuantityInStock`, `UnitPrice`, `ImageReference`) VALUES ('2', 'Circle', 'Circle', 'Perfectly round.', 'No beginning and no end, and perfectly round.', '750', '3.99', 'https://dmw-shapestoreresources.s3.amazonaws.com/productimages/product_circle.png');
INSERT INTO `DEVdmw2shapestoredb`.`products` (`Itemid`, `ItemName`, `ItemCategory`, `ShortDescription`, `LongDescription`, `QuantityInStock`, `UnitPrice`, `ImageReference`) VALUES ('3', 'Isosceles Triangle', 'Triangle', 'Two sides the same', 'Long and lean, two sides are the same length.', '150', '9.99', 'https://dmw-shapestoreresources.s3.amazonaws.com/productimages/product_isoscelestriangle.png');
INSERT INTO `DEVdmw2shapestoredb`.`products` (`Itemid`, `ItemName`, `ItemCategory`, `ShortDescription`, `LongDescription`, `QuantityInStock`, `UnitPrice`, `ImageReference`) VALUES ('4', 'Octagon', 'Quadrilateral', 'Regular polyglon with eight sides', 'Eight sides of equal length.', '600', '5.99', 'https://dmw-shapestoreresources.s3.amazonaws.com/productimages/product_octagon.png');
INSERT INTO `DEVdmw2shapestoredb`.`products` (`Itemid`, `ItemName`, `ItemCategory`, `ShortDescription`, `LongDescription`, `QuantityInStock`, `UnitPrice`, `ImageReference`) VALUES ('5', 'Dodecagon', 'Quadrilateral', 'Twelve-sided polyglon', 'Not for the faint-hearted, the dodecagon has twelve sides.', '800', '6.99', 'https://dmw-shapestoreresources.s3.amazonaws.com/productimages/product_dodecagon.png');
INSERT INTO `DEVdmw2shapestoredb`.`products` (`Itemid`, `ItemName`, `ItemCategory`, `ShortDescription`, `LongDescription`, `QuantityInStock`, `UnitPrice`, `ImageReference`) VALUES ('6', 'Cylinder', '3D', 'Curvilinear geometric shape', '3D and  one of the most basic curvilinear geometric shapes', '200', '11.99', 'https://dmw-shapestoreresources.s3.amazonaws.com/productimages/product_cylinder.png');
