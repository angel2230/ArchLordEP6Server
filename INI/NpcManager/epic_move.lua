-- CID
-- EventID
-- ������ �̵��޴�

function Main(CID, NID, EID, STEP)
	print("[epic_move.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
--	local NID = 481	-- ī��ƽ����Ƽ�� ��ŻNPC

	local MenuID = 19
	ShowMenu(CID, NID, MenuID)

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	if(EID == 1 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 1 -- ")
		local PosX = 524000
		local PosZ = 630000
		Move(CID, PosX, PosZ)

	SetDefaultInvincible(CID)

	end
	
	return 0
end

function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

	if(EID == 1 and STEP == 0)
	then
		local LEVEL = GetLevel(CID)
		local isTransform = IsTransform(CID)
		local IsEquipUnableItem = IsEquipUnableItemInEpicZone(CID)

		if(isTransform == 1)
		then
			local Group = 6
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>���Ż��¿����� �������̵��� �Ұ����մϴ�. ���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_1>
		
		else
			if(IsEquipUnableItem == 1)
			then
				local Group = 6
				ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
				-- <Message_4>���������� ����� �� ���� ��Ʈ �������� �����ϰ� �ֽ��ϴ�. �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>
		
			else
					local Group = 6
					ShowMessageBox( CID, NID, 1, 0, 3, Group, 2)
					-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
			end
		end
	end

	return 0
end