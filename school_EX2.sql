-- 1.��ѯ2011���У�������20�����ѧ����ѧ����������
SELECT xh,xm FROM S where csrq<'1991-01-01' and xb='��';

-- 2.������������ѧ�Ŀγ̵Ŀγ̺š�
SELECT DISTINCT kh FROM C
WHERE kh not in
(
	SELECT kh FROM E WHERE xh in 
	(SELECT xh FROM S WHERE xm='������')
);

-- 3.������С����ʦ���ڿγ̵�ѧ�꣬ѧ�ڣ��γ̺ţ��Ͽ�ʱ�䡣
SELECT xq,kh,sksj FROM O WHERE gh in
(SELECT gh FROM T WHERE xm='��С��');

-- 4.��ѯ�����ѧԺ���������ɼ����񡢽��ڿ���Ŀγ̵Ŀγ̺š����������ν�ʦ�����������ν�ʦ���򣬿γ̺Ž�������
SELECT C.kh,C.km,T.xm FROM C,O,T,E,S,D WHERE
E.zpcj>=60 AND T.xl='����' AND C.kh=E.kh AND E.kh=O.kh AND S.xb='��' 
AND T.gh=O.gh AND D.mc='�����ѧԺ' AND S.yxh=D.yxh AND E.xh=S.xh
ORDER BY T.xm ASC, C.kh DESC;

-- 5.����ѧ�ű���ӱͬѧ���������ӱͬѧС��ͬѧѧ�š�������
SELECT xh,xm FROM S WHERE xh>(SELECT xh FROM S WHERE xm='��ӱ') 
AND csrq>(SELECT csrq FROM S WHERE xm='��ӱ')

-- 6.����ͬʱѡ���ˡ�08305001���͡�08305002����ѧ��ѧ�ź�������
SELECT DISTINCT S.xh,S.xm FROM S,E E1,E E2
WHERE E1.kh='08305001' AND E2.kh='08305002' AND S.xh=E1.xh AND S.xh=E2.xh
