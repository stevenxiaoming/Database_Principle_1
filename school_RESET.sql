-- CREATE DATABASE school
-- go
-- USE school

DROP TABLE E;
DROP TABLE O;
DROP TABLE S;
DROP TABLE T;
DROP TABLE C;
DROP TABLE D;

-- 院系表
CREATE TABLE D
(
	yxh VARCHAR(3) PRIMARY KEY NOT NULL,
	mc VARCHAR(30),
	dz VARCHAR(300),
	lxdh CHAR(15)
);

-- 学生表
CREATE TABLE S
(
	xh INT NOT NULL PRIMARY KEY,
	xm VARCHAR(20),
	xb VARCHAR(4),
	csrq DATE,
	jg VARCHAR(20),
	sjhm CHAR(15),
	yxh VARCHAR(3) REFERENCES D(yxh)
);

-- 教师表
CREATE TABLE T
(
	gh VARCHAR(4) PRIMARY KEY NOT NULL,
	xm VARCHAR(20),
	xb VARCHAR(4),
	csrq DATE,
	xl CHAR(10),
	jbgz NUMERIC(7,2),
	yxh VARCHAR(3) REFERENCES D(yxh)
);

-- 课程表
CREATE TABLE C
(
	kh VARCHAR(8) PRIMARY KEY NOT NULL,
	km VARCHAR(20),
	xf SMALLINT DEFAULT 4,
	xs SMALLINT DEFAULT 40,
	yxh VARCHAR(3) REFERENCES D(yxh)
);

-- 开课表
CREATE TABLE O
(
	xq VARCHAR(15),
	kh VARCHAR(8) REFERENCES C(kh),
	gh VARCHAR(4) REFERENCES T(gh),
	sksj VARCHAR(15),
	PRIMARY KEY(xq,kh,gh)
);

-- 选课表
CREATE TABLE E
(
	xh INT REFERENCES S(xh),
	xq VARCHAR(15),
	kh VARCHAR(8),
	gh VARCHAR(4),
	pscj SMALLINT CHECK(pscj BETWEEN 0 AND 100),
	kscj SMALLINT CHECK(kscj BETWEEN 0 AND 100),
	zpcj SMALLINT CHECK(zpcj BETWEEN 0 AND 100),
	PRIMARY KEY(xh,xq,kh,gh),
	FOREIGN KEY(xq,kh,gh) REFERENCES O(xq,kh,gh)
);

-- 索引
CREATE UNIQUE INDEX index1 on S(yxh ASC,xm DESC);
CREATE INDEX index2 on C(km);

-- 插入数据
INSERT D VALUES('01','计算机学院','上大东校区三号楼','65347567');
INSERT D VALUES('02','通信学院','上大东校区二号楼','65341234');
INSERT D VALUES('03','材料学院','上大东校区四号楼','65347890');

INSERT S VALUES(1101,'李明','男','1993-03-06','上海','13613005486','02');
INSERT S VALUES(1102,'刘晓明','男','1992-12-08','安徽','18913457890','01');
INSERT S VALUES(1103,'张颖','女','1993-01-05','江苏','18826490423','01');
INSERT S VALUES(1104,'刘晶晶','女','1994-11-06','上海','13331934111','01');
INSERT S VALUES(1105,'刘成刚','男','1991-06-07','上海','18015872567','01');
INSERT S VALUES(1106,'李二丽','女','1993-05-04','江苏','18107620945','01');
INSERT S VALUES(1107,'张晓峰','男','1992-08-16','浙江','13912341078','01');

INSERT T VALUES('0101','陈迪茂','男','1973/3/6','副教授',3567,'01');
INSERT T VALUES('0102','马小红','女','1972/12/8','讲师',2845,'01');
INSERT T VALUES('0201','张心颖','女','1960/1/5','教授',4200,'02');
INSERT T VALUES('0103','吴宝钢','男','1980/11/6','讲师',2554,'01');

INSERT C VALUES('08305001','离散数学',4,40,'01');
INSERT C VALUES('08305002','数据库原理',4,50,'01');
INSERT C VALUES('08305003','数据结构',4,50,'01');
INSERT C VALUES('08305004','系统结构',6,60,'01');
INSERT C VALUES('08301001','分子物理学',4,40,'03');
INSERT C VALUES('08302001','通信学',3,30,'02');

INSERT O VALUES('2012-2013秋季','08305001','0103','星期三5-8');
INSERT O VALUES('2012-2013冬季','08305002','0101','星期三1-4');
INSERT O VALUES('2012-2013冬季','08305002','0102','星期三1-4');
INSERT O VALUES('2012-2013冬季','08305002','0103','星期三1-4');
INSERT O VALUES('2012-2013冬季','08305003','0102','星期五5-8');
INSERT O VALUES('2013-2014秋季','08305004','0101','星期二1-4');
INSERT O VALUES('2013-2014秋季','08305001','0102','星期一5-8');
INSERT O VALUES('2013-2014冬季','08302001','0201','星期一5-8');

INSERT E VALUES (1101,'2012-2013秋季','08305001','0103',60,60,60);
INSERT E VALUES (1102,'2012-2013秋季','08305001','0103',87,87,87);
INSERT E VALUES (1102,'2012-2013冬季','08305002','0101',82,82,82);
INSERT E VALUES (1102,'2013-2014秋季','08305004','0101',null,null,74);
INSERT E VALUES (1103,'2012-2013秋季','08305001','0103',56,56,56);
INSERT E VALUES (1103,'2012-2013冬季','08305002','0102',75,75,75);
INSERT E VALUES (1103,'2012-2013冬季','08305003','0102',84,84,84);
INSERT E VALUES (1103,'2013-2014秋季','08305001','0102',null,null,80);
INSERT E VALUES (1103,'2013-2014秋季','08305004','0101',78,null,null);
INSERT E VALUES (1104,'2012-2013秋季','08305001','0103',74,74,90);
INSERT E VALUES (1104,'2013-2014冬季','08302001','0201',null,null,75);
INSERT E VALUES (1106,'2012-2013秋季','08305001','0103',85,85,94);
INSERT E VALUES (1106,'2012-2013冬季','08305002','0103',66,66,90);
INSERT E VALUES (1107,'2012-2013秋季','08305001','0103',90,90,90);
INSERT E VALUES (1107,'2012-2013冬季','08305003','0102',79,79,79);
INSERT E VALUES (1107,'2013-2014冬季','08302001','0201',null,null,60);

-- SELECT * FROM S; -- 学生表
-- SELECT * FROM D; -- 院系表
-- SELECT * FROM T; -- 教师表
-- SELECT * FROM C; -- 课程表
-- SELECT * FROM O; -- 开课表
-- SELECT * FROM E; -- 选课表