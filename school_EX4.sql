-- 1.���������ѧԺ����������ɼ�ѧ������ͼ������ѧ��ѧ�š��������Ա��ֻ�����ѡ�γ̺ͳɼ���
	CREATE VIEW ZPCJ(ѧ��, ����, �Ա�, �ֻ�, ��ѡ�γ�, �ɼ�)
		AS (SELECT S.xh, S.xm, S.xb, S.sjhm, E.kh, E.zpcj FROM S, E
		WHERE S.xh=E.xh AND E.zpcj<60);
	SELECT * FROM ZPCJ;
-- 2.��E���в����¼����ÿ��ѧ��ûѧ���Ŀγ̶����뵽E���У�ʹ��ÿ��ѧ����ѡ��ÿ�ſΡ�
	INSERT INTO E(xh, xq, kh, gh)
			SELECT S.xh, O.xq, C.kh ,O.gh FROM S, C, O WHERE S.yxh = C.yxh AND O.kh = C.kh 
		AND C.kh NOT IN (SELECT kh FROM E WHERE C.kh = E.kh AND S.xh = E.xh) 
			ORDER BY S.xh
	SELECT * FROM E
	select * from o
	INSERT E(xh,xq,kh,gh) 
		SELECT xh,xq,kh,gh FROM
		(
			SELECT DISTINCT S.xh,O1.xq,O1.kh,O1.gh FROM S,O O1,O O2
			WHERE (O1.xq<>O2.xq OR (O1.xq=O2.xq AND O1.sksj<>O2.sksj)) AND O1.gh=O2.gh AND O1.kh<>O2.kh AND
			NOT EXISTS(SELECT xh,xq,kh,gh FROM E WHERE E.xh=S.xh AND E.xq=O1.xq AND E.kh=O1.kh AND E.gh=O1.gh) 
		) AS temp1 WHERE 
		ORDER BY xh;
	SELECT * FROM E
	
	INSERT E(xh,xq,kh,gh) 
		SELECT DISTINCT temp1.xh,temp1.xq,temp1.kh,temp1.gh FROM
		(SELECT DISTINCT S.xh,O.xq,O.kh,O.gh FROM S,O WHERE O.gh=(SELECT MIN(O1.gh) FROM O O1,O O2 WHERE O1.kh=O2.kh)) AS temp1,
		(SELECT DISTINCT S.xh,O.xq,O.kh,O.gh FROM S,O) AS temp2
		WHERE temp1.xh=temp2.xh
	
-- 3.�������������Ůͬѧ�������ѧ�����������䡣
	SELECT xm, YEAR(GETDATE()) -YEAR(csrq) AS NL FROM S
	WHERE xb='��' AND YEAR(GETDATE()) -YEAR(csrq)>(SELECT MAX(YEAR(GETDATE()) -YEAR(csrq)) FROM S WHERE xb='Ů');
	
-- 4.��E�����޸�08305001�γ̵�ƽʱ�ɼ������ɼ�С�ڵ���75��ʱ���5%�����ɼ�����75��ʱ���4%��
	SELECT * FROM E;
	UPDATE E SET zpcj=ZPCJ*1.04 WHERE zpcj>75;
	UPDATE E SET zpcj=ZPCJ*1.05 WHERE zpcj<=75;
	SELECT * FROM E;
		
-- 5.ɾ��û�п��ε�ѧԺ��
	SELECT * FROM D;
 	DELETE FROM C WHERE yxh NOT IN (SELECT yxh FROM C, O WHERE C.kh = O.kh);   
	DELETE FROM S WHERE yxh NOT IN (SELECT yxh FROM C );
	DELETE FROM T WHERE yxh NOT IN (SELECT yxh FROM C );
	DELETE FROM D WHERE yxh NOT IN (SELECT yxh FROM C );
	SELECT * FROM D;
	
-- 6.��ѯ�š������С����񡢲�����ѧ������
	SELECT DISTINCT E.kh,
	(SELECT COUNT(E1.zpcj) FROM E E1 WHERE E1.zpcj>=90 AND E1.kh=E.kh) AS ��,
	(SELECT COUNT(E2.zpcj) FROM E E2 WHERE E2.zpcj>=80 AND E2.zpcj<90 AND E2.kh=E.kh) AS ��, 
	(SELECT COUNT(E3.zpcj) FROM E E3 WHERE E3.zpcj>=70 AND E3.zpcj<80 AND E3.kh=E.kh) AS ��, 
	(SELECT COUNT(E4.zpcj) FROM E E4 WHERE E4.zpcj>=60 AND E4.zpcj<70 AND E4.kh=E.kh) AS ����, 
	(SELECT COUNT(E5.zpcj) FROM E E5 WHERE E5.zpcj<60 AND E5.kh=E.kh) AS ������
	FROM E E
	GROUP BY E.kh