-- 1.什么是聚集索引？什么是非聚集索引？索引的作用是什么？请说明上述实验题1的验证过程及所得到的结果？

-- 2.用多种方法表达查询：检索同时选修了“数据库原理”和“离散数学”的学生学号和姓名。
	SELECT xh,xm FROM S 
		WHERE xh IN (SELECT xh FROM E,C WHERE E.kh=C.kh AND C.km='数据库原理')
		INTERSECT
		SELECT xh,xm FROM S 
		WHERE xh IN (SELECT xh FROM E,C WHERE E.kh=C.kh AND C.km='离散数学'); 
		
	SELECT xh,xm FROM S 
		WHERE xh IN (SELECT a.xh FROM E a,E b WHERE a.xh=b.xh AND a.kh 
		IN (SELECT kh FROM C WHERE km='数据库原理') 
		AND b.kh IN (SELECT kh FROM C WHERE km='离散数学'));
		
	SELECT xh,xm FROM S WHERE 
		NOT EXISTS (SELECT kh FROM C WHERE km in('数据库原理','离散数学') AND
		NOT EXISTS (SELECT * FROM E WHERE E.kh=C.kh AND E.xh=S.xh))

-- 3.查询每门课的排名，输出课程号，学号，总评成绩，排名；按课程号升序，课程相同按排名从高到低。
-- （提示：某个同学一门课的排名就是该门课成绩大于等于他的人数）
	SELECT x.kh,x.xh,x.zpcj,COUNT(*) AS pm FROM E AS x,E AS y
		WHERE (x.zpcj<y.zpcj OR (x.zpcj=y.zpcj AND x.xh=y.xh))
		AND x.kh=y.kh 
		GROUP BY x.kh,x.xh,x.zpcj 
		ORDER BY 1,4
--加上学期
	SELECT x.xq,x.kh,x.xh,x.zpcj,COUNT(*) pm FROM E AS x,E AS y 
		WHERE (x.zpcj<y.zpcj OR (x.zpcj=y.zpcj AND x.xh=y.xh)) AND x.kh=y.kh AND x.xq=y.xq 
		GROUP BY x.xq,x.kh,x.xh,x.zpcj 
		ORDER BY 1,2,5