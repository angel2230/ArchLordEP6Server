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

	local MenuID = 18
	ShowMenu(CID, NID, MenuID)

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	-- EpicHeaven's Hell 
	if(EID == 1 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 1 -- ")
		local PosX = 677400		
		local PosZ = 765400
		-- EpicBossZone StartTime Setting
		SetEpicBossZoneStartTime(EID)
		
		-- Move
		MoveIncludeParty(CID, PosX, PosZ)

	end
	
	return 0
end

function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

if((EID == 1 or EID == 2 or EID == 3) and STEP == 0)
then
	local LEVEL = GetLevel(CID)
	local isTransform = IsTransform(CID)
	local IsEquipUnableItem = IsEquipUnableItemInEpicZone(CID)
	local bEntrance = IsEnableEntrance(EID)
	local bLeader = IsPartyLeader(CID)
	local RemainTime = GetBossZoneRemainTime(EID)

	if(isTransform == 1)
	then
		local Group = 6
		ShowMessageBox( CID, NID, 0, 0, 1, Group, 1)
		-- <Message_1>���Ż��¿����� �������̵��� �Ұ����մϴ�. ���� �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_1>

		elseif(bEntrance == 0)
		then
			local Group = 6
			ShowOptionMessageBox( CID, NID, 0, 0, 1, Group, 5, RemainTime)
			-- <Message_5>�ٸ� ��Ƽ�� ����Ʈ �������Դϴ�. �����ð��� %d�� �Դϴ�.</Message_5>
			
		else
			if(IsEquipUnableItem == 1)
			then
				local Group = 6
				ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
				-- <Message_4>���������� ����� �� ���� ��Ʈ �������� �����ϰ� �ֽ��ϴ�. �����Ͻ� �Ŀ� �̿�ٶ��ϴ�.</Message_4>
	
			else
				if(bLeader == 1)
				then
					local Group = 6
					ShowMessageBox( CID, NID, EID, 0, 3, Group, 2)
					-- <Message_2>Ȯ�ι�ư�� �����ø� �̵��մϴ�.</Message_2>
				else
					local Group = 6
					ShowMessageBox( CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>����Ʈ ������ ��Ƽ������ �� �� �ֽ��ϴ�.</Message_6>
				end
			end				
		end
	end

	return 0
end