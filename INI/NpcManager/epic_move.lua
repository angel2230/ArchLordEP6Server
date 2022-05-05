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
			-- <Message_1>변신상태에서는 에픽존이동이 불가능합니다. 변신 해제하신 후에 이용바랍니다.</Message_1>
		
		else
			if(IsEquipUnableItem == 1)
			then
				local Group = 6
				ShowMessageBox( CID, NID, 0, 0, 1, Group, 4)
				-- <Message_4>에픽존에서 사용할 수 없는 세트 아이템을 착용하고 있습니다. 해제하신 후에 이용바랍니다.</Message_4>
		
			else
					local Group = 6
					ShowMessageBox( CID, NID, 1, 0, 3, Group, 2)
					-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
			end
		end
	end

	return 0
end