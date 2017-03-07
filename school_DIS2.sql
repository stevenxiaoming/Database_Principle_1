-- 用四种方法表达查询：检索马小红老师所授课程的学期，课程号，上课时间。
SELECT DISTINCT O.xq 学期,O.kh 课程号,O.sksj 上课时间 FROM T,O WHERE T.gh=O.gh AND T.xm='马小红';
SELECT DISTINCT xq 学期,kh 课程号,sksj 上课时间 FROM O WHERE gh=(SELECT gh FROM T WHERE xm='马小红');
SELECT DISTINCT xq 学期,kh 课程号,sksj 上课时间 FROM O WHERE '马小红' in (SELECT DISTINCT xm FROM T WHERE O.gh=T.gh);
SELECT DISTINCT xq 学期,kh 课程号,sksj 上课时间 FROM O WHERE EXISTS (SELECT DISTINCT * FROM T WHERE O.gh=T.gh AND xm='马小红');

-- 检索有学生重修的教师编号和姓名。
SELECT DISTINCT T.gh 教师编号,T.xm 教师姓名 FROM T,E WHERE E.gh=T.gh AND (E.zpcj<60 or E.zpcj IS NULL);
select * from E

-- 如果O表加一个个开课编号(标识码)会带来哪些影响(优缺点)?
