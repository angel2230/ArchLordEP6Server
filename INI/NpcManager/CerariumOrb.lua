--
-- �ɶ󸮿� ����
--

function Main(CID, NID, EID, STEP)
	print("[�ɶ󸮿� ���� Main() Called]")
	print(CID, NID, EID, STEP)

	if(EID == 0 and STEP == 0)
	then
		ShowMenu(CID, NID, 10001)
	elseif(EID == 101)
	then
		if(STEP == 1) -- success
		then
			local ItemTID = 11405 -- ĳ���� ���� �ֹ���
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 1) -- <Message_1>ĳ���͸� �����Ͽ����ϴ�.</Message_1>
		elseif(STEP < 0 or STEP == 2)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 2) -- <Message_2>������ ĳ���͸� ���� �� �� �����ϴ�.</Message_2>
		elseif(STEP == 3)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 3) -- <Message_3>��忡 �������̰ų� ���ԵǾ� ���� ��� �̿��� �� �����ϴ�.</Message_3>
		elseif(STEP == 4)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 4) -- <Message_4>�ŷ��ҿ� �������� ��ϵǾ� ������ �̿��Ҽ� �����ϴ�.</Message_4>
		end
	elseif(EID == 200) -- ���� ����
	then
		if(STEP == 1) -- success
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 7) -- <Message_7>�ɶ󸮿������ ������ �����Ͽ����ϴ�.</Message_7>
		elseif(STEP == 4)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 9) -- <Message_9>�󽽷��� ���� ������ ���� �� �� �����ϴ�.</Message_9>
		else
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 8) -- <Message_8>������ ���� �� �� �����ϴ�.</Message_8>
		end
	end

	return 0
end


function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString, ItemID)
	print("CerariumOrb::OnMessageBox")
	print(CID, NID, EID, STEP)
	print(bBtnIndex, ItemID)
	
	if(EID == 101 and bBtnIndex == 1)
	then
		CerariumOrb(CID, NID, 101, STEP) -- ĳ���� ���� ��û
	elseif(EID == 201 and bBtnIndex == 1)
	then
		ShowMessageBox(CID, NID, 200, ItemID, 3, 1001, 11)
	elseif(EID == 200 and bBtnIndex == 1)
	then
		CerariumOrb(CID, NID, 200, STEP)
	end

	return 0
end

function OnMenu(CID, NID, EID, STEP)
	print("[�ɶ󸮿� ���� OnMenu() Called]")
	print(CID, NID, EID, STEP)
	
	if(EID == 1 and STEP == 0) -- ���� ��û
	then
		local ItemTID = 11405 -- ĳ���� ���� �ֹ���
		local InvenItemCount = CheckItemCount(CID, ItemTID)
		if(InvenItemCount < 1)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 5) -- <Message_5>ĳ���ͺ����ֹ����� �����ϰ� ���� �ʽ��ϴ�.</Message_5>
			return 0
		end
		
		CerariumOrb(CID, NID, 100, 1) -- ĳ���� ����Ʈ ��û
		
	elseif(EID == 2 and STEP == 0) -- ���� ����
	then
		ShowMessageBox(CID, NID, 201, 1, 4, 1001, 6) -- <Message_6>�ɶ󸮿���긦 ������ �ֽʽÿ�.</Message_6>
	elseif(EID == 100)
	then
		ShowMessageBox(CID, NID, 101, STEP, 3, 1001, 10)
	end
	
	return 0
end



