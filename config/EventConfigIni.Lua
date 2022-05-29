-----------------------------------------------------------------
-- ��ũ�ε� ���� ���� �������� - arycoat 2008.04.
--
-- use = 1 (�̺�Ʈ ���)
--       0 (�̺�Ʈ �̻��)
-- wday = 1 (�Ͽ���)
--        2 (������)
--        3 (ȭ����)
--        4 (������)
--        5 (�����)
--        6 (�ݿ���)
--        7 (�����)
-- hour = ��(24�ð� ����)
-- min  = ��
--

-- ����
-- �⺻������ time = {... , ...} �ȿ� �����ϵ��� �Ǿ��ִ�.
-- ...�ϳ��ϳ��� ������ �̺�Ʈ�� �����Ǹ� �� ���� {event}�� ���� �����ȴ�.
-- event�ȿ� ������ ������ �Ʒ��� ���� �����ϵ��� �ȴ�.
-- ex)
-- {eventnumber = 1, stime = {wday = 3, hour = 15, min = 0;}, etime = {wday = 3, hour = 16, min = 0;}, 
-- ratio = {exp_ratio = 200, drop_ratio = 200, gheld_drop_ratio = 200, charisma_drop_ratio = 200, pvp_item_drop = true, pvp_exp_drop = false, pvp_enable = true};},
-- eventnumber�� ����� �޽����� ���� ���̸� ini//systemMessage.xml���� DoubleEvent�� eventNumber�� �ǹ��ϸ�
-- eventnumber�� �´� �޽����� ����ϵ��� �Ǿ��ִ�. stime�� ���� �ð��� �ǹ��ϰ� etime�� ������ �ð��� �ǹ��Ѵ�.
-- ratio�ȿ��� ������ ������ ���� �ȴ�. ratio���� exp_ratio�� ���� ������ ���� ������ �ȵȴ�.

DoubleEvent = 
{
	use = 1;
	
--	exp_ratio = 200;
--	drop_ratio = 200;
--	gheld_drop_ratio = 100; -- �ֵ����� ����

	time = {{eventnumber = 1, stime = {wday = 6, hour = 18, min = 0;}, etime = {wday = 7, hour = 18, min = 0;}, 
		ratio = {exp_ratio = 200, drop_ratio = 200, gheld_drop_ratio = 100, charisma_drop_ratio = 100, pvp_item_drop = true, pvp_exp_drop = true, pvp_enable = true;};}
		};

};