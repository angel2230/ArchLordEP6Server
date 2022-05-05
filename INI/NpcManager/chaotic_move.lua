-- CID
-- EventID
-- 카오틱프런티어 이동메뉴

function Main(CID, NID, EID, STEP)
	print("[chaotic_move.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
--	local NID = 481	-- 카오틱프런티어 포탈NPC

	local MenuID = 1
	ShowMenu(CID, NID, MenuID)

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	if(EID == 1 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 1 -- ")

		local ItemTID = 7007	-- 비명의 숲 이동문서
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
			-- <Message_5>이동문서를 소지하고 있지 않습니다.</Message_5>
		end

	elseif(EID == 2 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 2 -- ")

		local ItemTID = 7004 -- 얼음의 대지 이동문서
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
			-- <Message_5>이동문서를 소지하고 있지 않습니다.</Message_5>
		end

	elseif(EID == 3 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 3 -- ")

		local ItemTID = 7005 -- 지하 감옥 1층 이동문서
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
			-- <Message_5>이동문서를 소지하고 있지 않습니다.</Message_5>
		end

	elseif(EID == 4 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 4 -- ")

		local ItemTID = 7006 -- 지하 감옥 2층 이동문서
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
			-- <Message_5>이동문서를 소지하고 있지 않습니다.</Message_5>
		end

	elseif(EID == 5 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 5 -- ")

		local ItemTID = 7002 -- 고통의 숲 이동문서
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
			-- <Message_5>이동문서를 소지하고 있지 않습니다.</Message_5>
		end

	elseif(EID == 6 and STEP == 0 and bBtnIndex == 1)
	then
		--print("  -- 6 -- ")

		local ItemTID = 7003 -- 절망의 탑 이동문서
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
			-- <Message_5>이동문서를 소지하고 있지 않습니다.</Message_5>
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
			-- <Message_4>변신상태 및 탈것 사용중에는 카오틱프런티어 포탈 이용이 불가능합니다. 변신 및 탈것을 해제하신 후에 이용바랍니다.</Message_4>
		
		else
			local Group = 1
			ShowMessageBox( CID, NID, 1, 0, 3, Group, 2)
			-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
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
			-- <Message_4>변신상태 및 탈것 사용중에는 카오틱프런티어 포탈 이용이 불가능합니다. 변신 및 탈것을 해제하신 후에 이용바랍니다.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 2, 0, 3, Group, 2)
			-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
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
			-- <Message_4>변신상태 및 탈것 사용중에는 카오틱프런티어 포탈 이용이 불가능합니다. 변신 및 탈것을 해제하신 후에 이용바랍니다.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 3, 0, 3, Group, 2)
			-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
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
			-- <Message_4>변신상태 및 탈것 사용중에는 카오틱프런티어 포탈 이용이 불가능합니다. 변신 및 탈것을 해제하신 후에 이용바랍니다.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 4, 0, 3, Group, 2)
			-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
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
			-- <Message_4>변신상태 및 탈것 사용중에는 카오틱프런티어 포탈 이용이 불가능합니다. 변신 및 탈것을 해제하신 후에 이용바랍니다.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 5, 0, 3, Group, 2)
			-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
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
			-- <Message_4>변신상태 및 탈것 사용중에는 카오틱프런티어 포탈 이용이 불가능합니다. 변신 및 탈것을 해제하신 후에 이용바랍니다.</Message_4>

		else
			local Group = 1
			ShowMessageBox( CID, NID, 6, 0, 3, Group, 2)
			-- <Message_2>확인버튼을 누르시면 이동합니다.</Message_2>
		end

	end

	return 0
end