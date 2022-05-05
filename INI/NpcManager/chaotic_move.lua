-- CID
-- EventID
-- ī��ƽ����Ƽ�� �̵��޴�

function Main(CID, NID, EID, STEP)
	print("[chaotic_move.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
--	local NID = 481	-- ī��ƽ����Ƽ�� ��ŻNPC

	local MenuID = 1
	ShowMenu(CID, NID, MenuID)

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	if(EID == 1 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 1 -- ")

		local ItemTID = 7007	-- ����� �� �̵�����
		local InvenItemCount = CheckItemCount(CID, ItemTID)

		if(InvenItemCount >= 1)

		then
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			local PosX = -269200
			local PosZ = -432600
			Move(CID, PosX, PosZ)

			SetDefaultInvincible(CID)
		else
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 5)
			-- <Message_5>�̵������� �����ϰ� ���� �ʽ��ϴ�.</Message_5>
		end

	elseif(EID == 2 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 2 -- ")

		local ItemTID = 7004 -- ������ ���� �̵�����
		local InvenItemCount = CheckItemCount(CID, ItemTID)

		if(InvenItemCount >= 1)

		then
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			local PosX = -382400
			local PosZ = -498400
			Move(CID, PosX, PosZ)

			SetDefaultInvincible(CID)
		else
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 5)
			-- <Message_5>�̵������� �����ϰ� ���� �ʽ��ϴ�.</Message_5>
		end

	elseif(EID == 3 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 3 -- ")

		local ItemTID = 7005 -- ���� ���� 1�� �̵�����
		local InvenItemCount = CheckItemCount(CID, ItemTID)

		if(InvenItemCount >= 1)

		then
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			local PosX = -379400
			local PosZ = -449800
			Move(CID, PosX, PosZ)

			SetDefaultInvincible(CID)
		else
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 5)
			-- <Message_5>�̵������� �����ϰ� ���� �ʽ��ϴ�.</Message_5>
		end

	elseif(EID == 4 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 4 -- ")

		local ItemTID = 7006 -- ���� ���� 2�� �̵�����
		local InvenItemCount = CheckItemCount(CID, ItemTID)

		if(InvenItemCount >= 1)

		then
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			local PosX = -342200
			local PosZ = -424200
			Move(CID, PosX, PosZ)

			SetDefaultInvincible(CID)
		else
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 5)
			-- <Message_5>�̵������� �����ϰ� ���� �ʽ��ϴ�.</Message_5>
		end

	elseif(EID == 5 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 5 -- ")

		local ItemTID = 7002 -- ������ �� �̵�����
		local InvenItemCount = CheckItemCount(CID, ItemTID)

		if(InvenItemCount >= 1)

		then
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			local PosX = -476651
			local PosZ = -479765
			Move(CID, PosX, PosZ)

			SetDefaultInvincible(CID)
		else
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 5)
			-- <Message_5>�̵������� �����ϰ� ���� �ʽ��ϴ�.</Message_5>
		end

	elseif(EID == 6 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 6 -- ")

		local ItemTID = 7003 -- ������ ž �̵�����
		local InvenItemCount = CheckItemCount(CID, ItemTID)

		if(InvenItemCount >= 1)

		then
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			local PosX = -431479
			local PosZ = -435783
			Move(CID, PosX, PosZ)

			SetDefaultInvincible(CID)
		else
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 5)
			-- <Message_5>�̵������� �����ϰ� ���� �ʽ��ϴ�.</Message_5>
		end

	elseif(EID == 7 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 7 -- ")
		ReturnTown(CID)

	end
	return 0
end

function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

	if(EID == 1 and STEP == 0)
	then
		local isArchlord = IsArchlord(CID)
		local isTransform = IsTransform(CID)
		local isRide = IsRide(CID)

		if(isArchlord == 1 or isTransform == 1 or isRide ==1)
		
		then
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
			-- <Message_4>���Ż��� �� Ż�� ����߿��� ī��ƽ����Ƽ�� ��Ż �̿��� �Ұ����մϴ�. ���� �� Ż���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>
		
		else
			local Group = 1
			ShowMessageBox( CID, NID, 1, 0, 3, Group, 2)
			-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
		end
	
	elseif(EID == 2 and STEP == 0)
	then
		local isArchlord = IsArchlord(CID)
		local isTransform = IsTransform(CID)
		local isRide = IsRide(CID)

		if(isArchlord == 1 or isTransform == 1 or isRide ==1)
		
		then
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
			-- <Message_4>���Ż��� �� Ż�� ����߿��� ī��ƽ����Ƽ�� ��Ż �̿��� �Ұ����մϴ�. ���� �� Ż���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 2, 0, 3, Group, 2)
			-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
		end
	
	elseif(EID == 3 and STEP == 0)
	then
		local isArchlord = IsArchlord(CID)
		local isTransform = IsTransform(CID)
		local isRide = IsRide(CID)

		if(isArchlord == 1 or isTransform == 1 or isRide ==1)
		
		then
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
			-- <Message_4>���Ż��� �� Ż�� ����߿��� ī��ƽ����Ƽ�� ��Ż �̿��� �Ұ����մϴ�. ���� �� Ż���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 3, 0, 3, Group, 2)
			-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
		end
	
	elseif(EID == 4 and STEP == 0)
	then
		local isArchlord = IsArchlord(CID)
		local isTransform = IsTransform(CID)
		local isRide = IsRide(CID)

		if(isArchlord == 1 or isTransform == 1 or isRide ==1)
		
		then
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
			-- <Message_4>���Ż��� �� Ż�� ����߿��� ī��ƽ����Ƽ�� ��Ż �̿��� �Ұ����մϴ�. ���� �� Ż���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 4, 0, 3, Group, 2)
			-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
		end
	
	elseif(EID == 5 and STEP == 0)
	then
		local isArchlord = IsArchlord(CID)
		local isTransform = IsTransform(CID)
		local isRide = IsRide(CID)

		if(isArchlord == 1 or isTransform == 1 or isRide ==1)
		
		then
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
			-- <Message_4>���Ż��� �� Ż�� ����߿��� ī��ƽ����Ƽ�� ��Ż �̿��� �Ұ����մϴ�. ���� �� Ż���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 5, 0, 3, Group, 2)
			-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
		end
	
	elseif(EID == 6 and STEP == 0)
	then
		local isArchlord = IsArchlord(CID)
		local isTransform = IsTransform(CID)
		local isRide = IsRide(CID)

		if(isArchlord == 1 or isTransform == 1 or isRide ==1)
		
		then
		    local Group = 1
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
			-- <Message_4>���Ż��� �� Ż�� ����߿��� ī��ƽ����Ƽ�� ��Ż �̿��� �Ұ����մϴ�. ���� �� Ż���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 6, 0, 3, Group, 2)
			-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
		end

	end

	return 0
end