-- CID
-- EventID
-- ī��ƽ����Ƽ�� �����̵�

function Main(CID, NID, EID, STEP)
	print("[chaotic_turn.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)

--	local NID = 482	-- ����� �� ��Ż
--	local NID = 483	-- ������ ���� ��Ż
--	local NID = 484	-- ���� ���� 1�� ��Ż
--	local NID = 485	-- ���� ���� 2�� ��Ż
--	local NID = 486	-- ������ �� ��Ż
--	local NID = 487	-- ������ ž ��Ż

--[[	if(NID == 482) ��Ż���� �ٸ� �޽����� ��ﶧ ���
	then
		ShowMessageBox( CID, NID, 1, 0, 3, 7)
	
	elseif(NID == 483)
	then
		ShowMessageBox( CID, NID, 1, 0, 3, 7)
	
	elseif(NID == 484)
	then
		ShowMessageBox( CID, NID, 1, 0, 3, 7)

	elseif(NID == 485)
	then
		ShowMessageBox( CID, NID, 1, 0, 3, 7)

	elseif(NID == 486)
	then
		ShowMessageBox( CID, NID, 1, 0, 3, 7)

	elseif(NID == 487)
	then
		ShowMessageBox( CID, NID, 1, 0, 3, 7)

	end--]]

	local isArchlord = IsArchlord(CID)
	local isTransform = IsTransform(CID)

	if(isArchlord == 1 or isTransform == 1)
		
	then
	    local Group = 2
		ShowMessageBox( CID, NID, 0, 0, 1, Group, 6)
		-- <Message_6>���) - ���Ż��� �� Ż�� ����߿��� ī��ƽ����Ƽ�� ��Ż �̿��� �Ұ����մϴ�. ���� �� Ż���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_6>
		
	else
		local Group = 2
		ShowMessageBox( CID, NID, 1, 0, 3, Group, 7)
		-- <Message_7>Ȯ�ι�ư�� �����ø� ������ �̵��մϴ�.</Message_7>

	end

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	if(EID == 1 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 1 -- ")
		ReturnTown(CID)

	end
	return 0
end

--[[function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

	if(EID == 1 and STEP == 0)
	then
		ShowMessageBox( CID, NID, 1, 0, 3, 7)
	end

	return 0
end--]]