-- CID
-- EventID
-- 에픽존 이동메뉴

function Main(CID, NID, EID, STEP)
	print("[epic_move.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
--	local NID = 481	-- 카오틱프런티어 포탈NPC

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
		-- <Message_1>변신상태에서는 에픽존이동이 불가능합니다. 변신 해제하신 후에 이용바랍니다.</Message_1>

		elseif(bEntrance == 0)
		then
			local Group = 6
			ShowOptionMessageBox( CID, NID, 0, 0, 1, Group, 5, RemainTime)
			-- <Message_5>다른 파티가 퀘스트 진행중입니다. 남은시간은 %d분 입니다.</Message_5>
			
		else
			if(IsEquipUnableItem == 1)
			then
				local Group = 6
				ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
				-- <Message_4>에픽존에서 사용할 수 없는 세트 아이템을 착용하고 있습니다. 해제하신 후에 이용바랍니다.</Message_4>
	
			else
				if(bLeader == 1)
				then
					local Group = 6
					ShowMessageBox( CID, NID, EID, 0, 3, Group, 2)
					-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
				else
					local Group = 6
					ShowMessageBox( CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>퀘스트 수락은 파티리더만 할 수 있습니다.</Message_6>
				end
			end				
		end
	end

	return 0
end