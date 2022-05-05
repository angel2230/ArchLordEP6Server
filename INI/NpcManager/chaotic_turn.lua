-- CID
-- EventID
-- 카오틱프런티어 마을이동

function Main(CID, NID, EID, STEP)
	print("[chaotic_turn.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)

--	local NID = 482	-- 비명의 숲 포탈
--	local NID = 483	-- 얼음의 대지 포탈
--	local NID = 484	-- 지하 감옥 1층 포탈
--	local NID = 485	-- 지하 감옥 2층 포탈
--	local NID = 486	-- 고통의 숲 포탈
--	local NID = 487	-- 절망의 탑 포탈

--[[	if(NID == 482) 포탈마다 다른 메시지를 띄울때 사용
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
		-- <Message_6>경고) - 변신상태 및 탈것 사용중에는 카오틱프런티어 포탈 이용이 불가능합니다. 변신 및 탈것을 해제하신 후에 이용바랍니다.</Message_6>
		
	else
		local Group = 2
		ShowMessageBox( CID, NID, 1, 0, 3, Group, 7)
		-- <Message_7>확인버튼을 누르시면 마을로 이동합니다.</Message_7>

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