-- 1.查询2011年进校年龄大于20岁的男学生的学号与姓名。
SELECT xh,xm FROM S where csrq<'1991-01-01' and xb='男';

-- 2.检索刘晓明不学的课程的课程号。
SELECT DISTINCT kh FROM C
WHERE kh not in
(
	SELECT kh FROM E WHERE xh in 
	(SELECT xh FROM S WHERE xm='刘晓明')
);

-- 3.检索马小红老师所授课程的学年，学期，课程号，上课时间。
SELECT xq,kh,sksj FROM O WHERE gh in
(SELECT gh FROM T WHERE xm='马小红');

-- 4.查询计算机学院男生总评成绩及格、教授开设的课程的课程号、课名、开课教师姓名，按开课教师升序，课程号降序排序。
SELECT C.kh,C.km,T.xm FROM C,O,T,E,S,D WHERE
E.zpcj>=60 AND T.xl='教授' AND C.kh=E.kh AND E.kh=O.kh AND S.xb='男' 
AND T.gh=O.gh AND D.mc='计算机学院' AND S.yxh=D.yxh AND E.xh=S.xh
ORDER BY T.xm ASC, C.kh DESC;

-- 5.检索学号比张颖同学大，年龄比张颖同学小的同学学号、姓名。
SELECT xh,xm FROM S WHERE xh>(SELECT xh FROM S WHERE xm='张颖') 
AND csrq>(SELECT csrq FROM S WHERE xm='张颖')

-- 6.检索同时选修了“08305001”和“08305002”的学生学号和姓名。
SELECT DISTINCT S.xh,S.xm FROM S,E E1,E E2
WHERE E1.kh='08305001' AND E2.kh='08305002' AND S.xh=E1.xh AND S.xh=E2.xh
