-- 1.ʲô�Ǿۼ�������ʲô�ǷǾۼ�������������������ʲô����˵������ʵ����1����֤���̼����õ��Ľ����

-- 2.�ö��ַ�������ѯ������ͬʱѡ���ˡ����ݿ�ԭ���͡���ɢ��ѧ����ѧ��ѧ�ź�������
	SELECT xh,xm FROM S 
		WHERE xh IN (SELECT xh FROM E,C WHERE E.kh=C.kh AND C.km='���ݿ�ԭ��')
		INTERSECT
		SELECT xh,xm FROM S 
		WHERE xh IN (SELECT xh FROM E,C WHERE E.kh=C.kh AND C.km='��ɢ��ѧ'); 
		
	SELECT xh,xm FROM S 
		WHERE xh IN (SELECT a.xh FROM E a,E b WHERE a.xh=b.xh AND a.kh 
		IN (SELECT kh FROM C WHERE km='���ݿ�ԭ��') 
		AND b.kh IN (SELECT kh FROM C WHERE km='��ɢ��ѧ'));
		
	SELECT xh,xm FROM S WHERE 
		NOT EXISTS (SELECT kh FROM C WHERE km in('���ݿ�ԭ��','��ɢ��ѧ') AND
		NOT EXISTS (SELECT * FROM E WHERE E.kh=C.kh AND E.xh=S.xh))

-- 3.��ѯÿ�ſε�����������γ̺ţ�ѧ�ţ������ɼ������������γ̺����򣬿γ���ͬ�������Ӹߵ��͡�
-- ����ʾ��ĳ��ͬѧһ�ſε��������Ǹ��ſγɼ����ڵ�������������
	SELECT x.kh,x.xh,x.zpcj,COUNT(*) AS pm FROM E AS x,E AS y
		WHERE (x.zpcj<y.zpcj OR (x.zpcj=y.zpcj AND x.xh=y.xh))
		AND x.kh=y.kh 
		GROUP BY x.kh,x.xh,x.zpcj 
		ORDER BY 1,4
--����ѧ��
	SELECT x.xq,x.kh,x.xh,x.zpcj,COUNT(*) pm FROM E AS x,E AS y 
		WHERE (x.zpcj<y.zpcj OR (x.zpcj=y.zpcj AND x.xh=y.xh)) AND x.kh=y.kh AND x.xq=y.xq 
		GROUP BY x.xq,x.kh,x.xh,x.zpcj 
		ORDER BY 1,2,5