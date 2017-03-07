USE pw_student

CREATE TABLE S
(
  sno   CHAR(4) NOT NULL PRIMARY KEY,
  sname CHAR(8) NOT NULL,
  sex   CHAR(2) NOT NULL,
  age   INTEGER NOT NULL,
  sdept CHAR(10)NOT NULL
)
INSERT INTO S VALUES('S1', '李　铭', '男', 19, '计算机软件')
INSERT INTO S VALUES('S2', '刘晓鸣', '男', 20, '计算机应用')
INSERT INTO S VALUES('S3', '李　明', '男', 22, '计算机应用')
INSERT INTO S VALUES('S4', '张　鹰', '女', 21, '计算机软件')
INSERT INTO S VALUES('S5', '刘竞静', '女', 22, '计算机软件')
INSERT INTO S VALUES('S6', '刘成刚', '男', 21, '计算机软件')
INSERT INTO S VALUES('S7', '王　铭', '男', 22, '计算机应用')
INSERT INTO S VALUES('S8', '宣明尼', '女', 18, '计算机应用')
INSERT INTO S VALUES('S9', '柳红利', '女', 19, '计算机软件')

CREATE TABLE C
( 
  cno    CHAR(4) NOT NULL PRIMARY KEY,
  cname  CHAR(20),
  credit INTEGER,
  cdept  CHAR(10),
  tname  CHAR(8)
 )
INSERT INTO c VALUES('C1', 'PASCAL', 4, '计算机应用', '王晓明')
INSERT INTO c VALUES('C2', '数据结构', 4, '计算机应用', '刘　红')
INSERT INTO c VALUES('C3', '离散数学', 4, '计算机应用', '李严劲')
INSERT INTO c VALUES('C4', '计算机原理', 6, '计算机软件', '王晓明')
INSERT INTO c VALUES('C5', '数据库原理', 4, '计算机应用', '吴志钢')
INSERT INTO c VALUES('C6', 'Windows 技术', 4, '计算机软件', '吴志钢')
INSERT INTO c VALUES('C8', '编译原理', 4, '计算机软件', '蒋莹岳')
INSERT INTO c VALUES('C9', '系统结构', 6, '计算机应用', '刘　红')

CREATE TABLE SC
( 
  sno   CHAR(4) REFERENCES S(sno),
  cno   CHAR(4) REFERENCES c(cno),
  grade INTEGER,
  PRIMARY KEY (sno, cno)
)
INSERT INTO SC VALUES('S1', 'C2', 56)
INSERT INTO SC VALUES('S1', 'C4', 78)
INSERT INTO SC VALUES('S1', 'C6', 66)
INSERT INTO SC VALUES('S1', 'C8', 88)
INSERT INTO SC VALUES('S3', 'C1', 88)
INSERT INTO SC VALUES('S3', 'C2', 76)
INSERT INTO SC VALUES('S4', 'C1', 67)
INSERT INTO SC VALUES('S4', 'C2', 76)
INSERT INTO SC VALUES('S4', 'C3', 67)
INSERT INTO SC VALUES('S5', 'C1', 67)
INSERT INTO SC VALUES('S5', 'C2', 78)
INSERT INTO SC VALUES('S5', 'C3', 91)
INSERT INTO SC VALUES('S6', 'C1', 78)