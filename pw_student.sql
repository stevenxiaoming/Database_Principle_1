USE pw_student

CREATE TABLE S
(
  sno   CHAR(4) NOT NULL PRIMARY KEY,
  sname CHAR(8) NOT NULL,
  sex   CHAR(2) NOT NULL,
  age   INTEGER NOT NULL,
  sdept CHAR(10)NOT NULL
)
INSERT INTO S VALUES('S1', '���', '��', 19, '��������')
INSERT INTO S VALUES('S2', '������', '��', 20, '�����Ӧ��')
INSERT INTO S VALUES('S3', '���', '��', 22, '�����Ӧ��')
INSERT INTO S VALUES('S4', '�š�ӥ', 'Ů', 21, '��������')
INSERT INTO S VALUES('S5', '������', 'Ů', 22, '��������')
INSERT INTO S VALUES('S6', '���ɸ�', '��', 21, '��������')
INSERT INTO S VALUES('S7', '������', '��', 22, '�����Ӧ��')
INSERT INTO S VALUES('S8', '������', 'Ů', 18, '�����Ӧ��')
INSERT INTO S VALUES('S9', '������', 'Ů', 19, '��������')

CREATE TABLE C
( 
  cno    CHAR(4) NOT NULL PRIMARY KEY,
  cname  CHAR(20),
  credit INTEGER,
  cdept  CHAR(10),
  tname  CHAR(8)
 )
INSERT INTO c VALUES('C1', 'PASCAL', 4, '�����Ӧ��', '������')
INSERT INTO c VALUES('C2', '���ݽṹ', 4, '�����Ӧ��', '������')
INSERT INTO c VALUES('C3', '��ɢ��ѧ', 4, '�����Ӧ��', '���Ͼ�')
INSERT INTO c VALUES('C4', '�����ԭ��', 6, '��������', '������')
INSERT INTO c VALUES('C5', '���ݿ�ԭ��', 4, '�����Ӧ��', '��־��')
INSERT INTO c VALUES('C6', 'Windows ����', 4, '��������', '��־��')
INSERT INTO c VALUES('C8', '����ԭ��', 4, '��������', '��Ө��')
INSERT INTO c VALUES('C9', 'ϵͳ�ṹ', 6, '�����Ӧ��', '������')

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