DROP SCHEMA IF EXISTS vendor;
CREATE SCHEMA IF NOT EXISTS vendor;
USE vendor;

CREATE TABLE vendor (
    vend_num INT,
    vend_name VARCHAR(20),
    vend_contact VARCHAR(20),
    vend_phone VARCHAR(14),
    PRIMARY KEY (vend_num)
);
INSERT INTO vendor VALUES(1,'CompuDark, Inc.','H. D. Cable','(123) 333-4567');
INSERT INTO vendor VALUES(2,'MooComp, Inc.','A. A. Grassfield','(234) 543-8902');
INSERT INTO vendor VALUES(3,'Gettum Supply','C. F. Inthere','(433) 456-7654');
INSERT INTO vendor VALUES(4,'PC Country','I. M. Formerly','(234) 214-8790');
INSERT INTO vendor VALUES(5,'Dill Computer, Inc.','I. B. Pickle','(901) 786-3338');
INSERT INTO vendor VALUES(6,'Outeredge Supply','D. N. Whammy','(501) 778-9345');
INSERT INTO vendor VALUES(7,'Compuck, Inc.','C. C. Rider','(433) 190-2229');
INSERT INTO vendor VALUES(8,'Toshboo Supply','H. D. Eyestrain','(344) 996-3124');


CREATE TABLE product (
    prod_id VARCHAR(20),
    prod_description VARCHAR(60),
    prod_price FLOAT(8),
    prod_qoh INT,
    vend_num INT,
    PRIMARY KEY (prod_id),
    FOREIGN KEY (vend_num) REFERENCES vendor (vend_num)
);


INSERT INTO product VALUES('COCBLPAR6','6 ft. parallel cable, shielded metal case','14.34','63',5);
INSERT INTO product VALUES('DRSUCR44MX','Removable cartridge, 44MB, Maxell','45.95','23', NULL);
INSERT INTO product VALUES('DRSUCR88MX','Removable cartridge, 88MB, Maxell','52.99','41', NULL);
INSERT INTO product VALUES('DRSUDI12-3M','3.5" HD/DS Diskettes, 1.44 MB formatted, IBM, 12/box, 3M','5.99','95',5);
INSERT INTO product VALUES('DRSUDI50-3M','3.5" HD/DS Diskettes, 1.44 MB formatted, IBM, 50/box, 3M','16.43','108',2);
INSERT INTO product VALUES('DRSUTC3490E','Tape cartridge, 1,100ft, 36-track, AS400-3480-3490E','21.75','22',2);
INSERT INTO product VALUES('PRCTCANBC02','Canon color cartridge, BJ-100, 2200, 210, 230','36.57','102',4);
INSERT INTO product VALUES('PRCTHPDJ56','HP DeskJet Plus, 500C, 550C, 600','26.95','89',3);
INSERT INTO product VALUES('PRCTLEX4072','IBM (Lexmark) 4072 ExecJet cartridge','22.95','127',8);


SELECT
    product.prod_id				AS 'Product ID',
    product.prod_description	AS 'Product Description',
    product.prod_price			AS 'Product Price',
    product.prod_qoh			AS 'Product QOH',
    product.vend_num			AS 'Product Num'
    
    FROM product WHERE product.vend_num IS NULL
;	

