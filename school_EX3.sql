-- 1.��֤��1000������ϼ�¼ʱ�������Ͳ�����ʱ�Ĳ�ѯʱ������
	-- �����±�
	CREATE TABLE TEST
	(
		id BIGINT PRIMARY KEY,
		no1 BIGINT,
		no2 BIGINT
	);
	CREATE INDEX million ON TEST(no1);
	
	CREATE TABLE TEST2
	(
		id BIGINT PRIMARY KEY,
		no1 BIGINT,
		no2 BIGINT
	);
	CREATE INDEX million10 ON TEST2(no1);
	-- ��������
	DECLARE @i BIGINT
	SET @i=1
	WHILE @i<=1000000
		BEGIN
		INSERT TEST VALUES(@i,@i,@i)
		SET @i=@i+1
		END

	SET @i=1
	WHILE @i<=10000000
		BEGIN
		INSERT TEST2 VALUES(@i,@i,@i)
		SET @i=@i+1
		END
	-- ʹ�þۼ�������ѯ
	SET STATISTICS TIME ON
	SELECT id FROM TEST WHERE id=900000
	SET STATISTICS TIME OFF
	
	SET STATISTICS TIME ON
	SELECT id FROM TEST2 WHERE id=9000000
	SET STATISTICS TIME OFF
	-- ʹ�÷Ǿۼ�������ѯ
	SET STATISTICS TIME ON
	SELECT no1 FROM TEST WHERE no1=900000
	SET STATISTICS TIME OFF
	
	SET STATISTICS TIME ON
	SELECT no1 FROM TEST2 WHERE no1=9000000
	SET STATISTICS TIME OFF
	-- ��ʹ��������ѯ
	SET STATISTICS TIME ON
	SELECT no2 FROM TEST WHERE no2=900000
	SET STATISTICS TIME OFF
	
	SET STATISTICS TIME ON
	SELECT no2 FROM TEST2 WHERE no2=9000000
	SET STATISTICS TIME OFF


-- 2.��ѯÿ��ѧ��ѡ�����������û��ѡ�޿γ̵�ѧ������
	SELECT DISTINCT S.xh,S.xm,E.xq,E.kh,E.gh
		FROM S FULL JOIN E ON S.xh=E.xh
		
-- 3.�������пγ̶�ѡ�޵ĵ�ѧ����ѧ����������
	SELECT S.xh,S.xm FROM S WHERE
		NOT EXISTS (SELECT * FROM O WHERE
		NOT EXISTS (SELECT * FROM E WHERE E.xh=S.xh AND E.kh=O.kh))
			
-- 4.����ѡ�޿γ̰���1106ͬѧ��ѧȫ���γ̵�ѧ��ѧ�ź�������
	SELECT S.xh,S.xm FROM S WHERE
		NOT EXISTS (SELECT * FROM E E1 WHERE E1.xh=1106 AND
		NOT EXISTS (SELECT * FROM E E2 WHERE E1.kh=E2.kh AND E2.xh=S.xh))
		
-- 5.��ѯÿ�ſγ��з�����ߵ�ѧ��ѧ�ź�ѧ��������
	SELECT  DISTINCT S.xh,S.xm  FROM S,E 
		WHERE S.xh = E.xh AND E.zpcj IN (SELECT MAX(zpcj) FROM E E1
		WHERE E1.kh = E.kh 
		GROUP BY kh)

-- 6.��ѯ����С�ڱ�ѧԺƽ�����䣬���пγ������ɼ���������ѡ�γ�ƽ�������ɼ���ѧ��ѧ�š�������ƽ�������ɼ���
-- ����������
	SELECT S1.xh AS ѧ��,S1.xm AS ����,(SELECT AVG(E.zpcj) FROM E WHERE E.xh=S1.xh) AS ��������
		FROM S S1
		WHERE YEAR(S1.csrq)>(SELECT AVG(YEAR(S2.csrq)) FROM S S2 WHERE S2.yxh=S1.yxh)
		AND (SELECT AVG(E.zpcj) FROM E WHERE E.xh=S1.xh)>ALL(SELECT AVG(E.zpcj) FROM E,O GROUP BY E.kh )
		ORDER BY YEAR(GETDATE())-YEAR(S1.csrq);
	
	SELECT DISTINCT S.xh,S.xm,temp1.pj 'pjcj' FROM S,E,
		(SELECT xh,AVG(zpcj) 'pj' FROM E GROUP BY xh) temp1,
		(SELECT kh,AVG(zpcj) 'pj' FROM E GROUP BY kh) temp2
			where S.xh=E.xh AND temp1.xh=S.xh AND temp2.kh=E.kh 
			AND YEAR(GETDATE())-YEAR(S.csrq)<(SELECT AVG(YEAR(GETDATE())-YEAR(S.csrq)) FROM S) 
			AND E.zpcj>temp2.pj
