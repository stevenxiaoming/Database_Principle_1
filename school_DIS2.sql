-- �����ַ�������ѯ��������С����ʦ���ڿγ̵�ѧ�ڣ��γ̺ţ��Ͽ�ʱ�䡣
SELECT DISTINCT O.xq ѧ��,O.kh �γ̺�,O.sksj �Ͽ�ʱ�� FROM T,O WHERE T.gh=O.gh AND T.xm='��С��';
SELECT DISTINCT xq ѧ��,kh �γ̺�,sksj �Ͽ�ʱ�� FROM O WHERE gh=(SELECT gh FROM T WHERE xm='��С��');
SELECT DISTINCT xq ѧ��,kh �γ̺�,sksj �Ͽ�ʱ�� FROM O WHERE '��С��' in (SELECT DISTINCT xm FROM T WHERE O.gh=T.gh);
SELECT DISTINCT xq ѧ��,kh �γ̺�,sksj �Ͽ�ʱ�� FROM O WHERE EXISTS (SELECT DISTINCT * FROM T WHERE O.gh=T.gh AND xm='��С��');

-- ������ѧ�����޵Ľ�ʦ��ź�������
SELECT DISTINCT T.gh ��ʦ���,T.xm ��ʦ���� FROM T,E WHERE E.gh=T.gh AND (E.zpcj<60 or E.zpcj IS NULL);
select * from E

-- ���O���һ�������α��(��ʶ��)�������ЩӰ��(��ȱ��)?
