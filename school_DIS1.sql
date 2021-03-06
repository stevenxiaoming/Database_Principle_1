-- 1.主键和外键
-- 学生表S
--		PRIMARY KEY(xh)
--		FOREIGN KEY(yxh) REFERENCES D(yxh)
-- 院系表D
--		PRIMARY KEY(yxh)
-- 教师表T
--		PRIMARY KEY(gh)
--		FOREIGN KEY(yxh) REFERENCES D(yxh)
-- 课程表C
--		PRIMARY KEY(kh)
--		FOREIGN KEY(yxh) REFERENCES D(yxh)
-- 开课表O
--		PRIMARY KEY(xq,kh,gh)
--		FOREIGN KEY(kh) REFERENCES C(kh),
--		FOREIGN KEY(gh) REFERENCES T(gh),
-- 选课表E
--		PRIMARY KEY(xh,xq,kh,gh),
--		FOREIGN KEY(xh) REFERENCES S(xh)
--		FOREIGN KEY(xq,kh,gh) REFERENCES O(xq,kh,gh)

-- 在学生表中的yxh字段输入“04”，会有什么结果？
INSERT S(xh,yxh) VALUES(1001,'04');
-- INSERT 语句与 FOREIGN KEY 约束"FK__S__yxh__47DBAE45"冲突。该冲突发生于数据库"school"，表"dbo.D", column 'yxh'。
-- 因为外键值在对应主键中没有出现

-- 在院系表中删除yxh为“01”记录，会有什么结果？
DELETE FROM D WHERE yxh='01';
-- DELETE 语句与 REFERENCE 约束"FK__S__yxh__47DBAE45"冲突。该冲突发生于数据库"school"，表"dbo.S", column 'yxh'。
-- 因为外键表中有相应数据 或 级联删除和院系相关的数据


-- 3.	教师表中定义两个检查约束：
-- 1)	性别只能输入“男”和“女”
ALTER TABLE T ADD CONSTRAINT xbcheck CHECK(xb='男' OR xb='女');
-- ALTER TABLE T DROP CONSTRAINT xbcheck;

-- 2)	男老师的基本工资必须超过2500元
ALTER TABLE T ADD CONSTRAINT gzcheck CHECK((xb='男' AND jbgz>2500) OR xb='女');
-- ALTER TABLE T DROP CONSTRAINT gzcheck;
