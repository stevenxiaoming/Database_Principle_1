-- 1.补全下面程序段虚线框中的语句，使该程序能够正确地利用给出的数据库，
-- 逐个显示年龄高于某个值（通过共享变量maxagE给出）的学生的学号、姓名、
-- 性别、院系号，并按用户的当场要求，保持或修改这个学生的院系号（通过共
-- 享变量nEwdno中给出）。

-- 2.1）用多种方法表达查询：检索刘晓明不学的课程的课程号。
	SELECT kh FROM C WHERE kh NOT IN (SELECT kh FROM S,E WHERE S.xh=E.xh AND xm='刘晓明');
	SELECT kh FROM C EXCEPT SELECT kh FROM S,E WHERE S.xh=E.xh AND xm='刘晓明';
	SELECT C.kh FROM C LEFT JOIN (SELECT kh FROM S,E WHERE S.xh=E.xh AND xm='刘晓明') AS x ON C.kh=x.kh WHERE x.kh IS NULL;
    SELECT C.kh FROM E JOIN S ON E.xh=S.xh AND xm='刘晓明' RIGHT JOIN C ON E.kh=C.kh WHERE E.kh IS NULL;
--	 2）删除没有开课的学院。
	DELETE FROM C WHERE yxh NOT IN (SELECT yxh FROM C,O WHERE C.kh=O.kh);
	DELETE FROM T WHERE yxh NOT IN (SELECT yxh FROM C);
	DELETE FROM S WHERE yxh NOT IN (SELECT yxh FROM C);
	DELETE FROM D WHERE yxh NOT IN (SELECT yxh FROM C);

-- 3.视图
--	1）	判断实验课第一题的视图能否更新。
	 CREATE VIEW ST AS SELECT * FROM E WHERE zpcj IS NULL AND kh IN (SELECT kn FROM C WHERE km='系统结构') with CHECK OPTION;
--	2）	设计一个能更新的视图，要求更新后的数据满足视图定义的范围：“系统结构”还未有总评成绩的选课视图。
--      写出如下对视图的更新命令，并判断是否可行，如不可行请说出理由
--			插入数据（1107, 2013-2014秋季, 08305004, 0101, null，null，null）
			-- 不能，主键重复
--			插入数据（1107, 2012-2013冬季, 08305002，0102, null，null，null）
			-- 不能，插入的不是“系统结构”
--			将所有学生平时成绩增加10分,但不能超过100分
			UPDATE St SET pSCj=100 WHERE pSCj>90
			UPDATE St SET pSCj=pSCj+10 WHERE pSCj<=90
    

