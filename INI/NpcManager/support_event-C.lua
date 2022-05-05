-- CID
-- EventID
-- 중국이벤트 

function Main(CID, NID, EID, STEP)
	print("[support_event-C.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
	local MenuID = 12
	ShowMenu(CID, NID, MenuID)

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString, ItemID)
	
	return 0
end

function OnMenu(CID, NID, EID, STEP)

    if(EID == 1 and STEP == 0)  -- 레벨업지원 이벤트 [1~40]
	then
		local MenuID = 13
		ShowMenu(CID, NID, MenuID)
	
	elseif(EID == 2 and STEP == 0) -- 레벨업지원 이벤트[41~80]
	then
		local MenuID = 14
		ShowMenu(CID, NID, MenuID)
		
------------------------------------------------------------------------------------------------------		
		
	elseif(EID == 101 and STEP == 0) -- <TEXT>1~5레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 1 and LEVEL <= 5)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 101, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 106 and STEP == 0) --<TEXT>6~10레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 6 and LEVEL <= 10)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 106, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end 
		
	elseif(EID == 111 and STEP == 0) -- <TEXT>11~15레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 11 and LEVEL <= 15)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 111, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 116 and STEP == 0) -- <TEXT>16~20레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 16 and LEVEL <= 20)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 116, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 121 and STEP == 0) -- <TEXT>21~25레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 21 and LEVEL <= 25)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 121, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 126 and STEP == 0) -- <TEXT>26~30레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 26 and LEVEL <= 30)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 126, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 131 and STEP == 0) -- <TEXT>31~35레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 31 and LEVEL <= 35)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 131, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 136 and STEP == 0) -- <TEXT>36~40레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 36 and LEVEL <= 40)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 136, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 141 and STEP == 0) -- <TEXT>41~45레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 41 and LEVEL <= 45)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 141, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 146 and STEP == 0) -- <TEXT>46~50레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 46 and LEVEL <= 50)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 146, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 151 and STEP == 0) -- <TEXT>51~55레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 51 and LEVEL <= 55)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 151, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 156 and STEP == 0) -- <TEXT>56~60레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 56 and LEVEL <= 60)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 156, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 161 and STEP == 0) -- <TEXT>61~65레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 61 and LEVEL <= 65)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 161, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 166 and STEP == 0) -- <TEXT>66~70레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 66 and LEVEL <= 70)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 166, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 171 and STEP == 0) -- <TEXT>71~75레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 71 and LEVEL <= 75)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 171, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
		
	elseif(EID == 176 and STEP == 0)  -- <TEXT>76~80레벨 지원선물</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 76 and LEVEL <= 80)
		then
			local Type = 1 -- 1. 캐릭터 단위 2. 계정단위 3. 월드 단위
			CheckEventUser(CID, NID, 176, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>레벨업지원이벤트에 해당되는 레벨이 아닙니다.</Message_1>
		end
			
	end

	return 0 
end

function OnCheckEventUser(CID, NID, EID, STEP, Type, Result)
	print(CID, NID, EID, STEP, Type, Result)
	
	if(EID == 101)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>

		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
   			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 4)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>

			else
				local ItemTID = 11779	-- 축복받은 초심자 버프 물약
				local COUNT = 5
				GiveItem(CID, ItemTID, COUNT)

				local ItemTID = 6362	-- 소형 생명물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 20009	-- 소형 마나물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11260	-- 유니온 네크리스
				local COUNT = 1
				local Hours = 24 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11262	-- 파괴자의 증표
				local COUNT = 1
				local Hours = 24 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11263	-- 제왕의 증표
				local COUNT = 1
				local Hours = 24 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)

				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
			end

		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 106)
		then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>

		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
   			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>

			else
				local ItemTID = 6495	-- 초심자용 렌즈스톤
				local COUNT = 3000 
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 6496	-- 초심자용 레저렉션 오브
				local COUNT = 10 
				GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 111)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>

			else
				local ItemTID = 6362	-- 소형 생명물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 20009	-- 소형 마나물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
			end

		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 116)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>

			else
				local ItemTID = 11005	-- 각성의 부적<1일>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11007	-- 행운의 부적<1일>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11779	-- 축복받은 초심자 버프 물약
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
			end

		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 121)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 3)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
			
			else
				local ItemTID = 20006	-- 중형 생명물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)

				local ItemTID = 20010	-- 중형 마나물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 10351	-- 바롬 반지
				local COUNT = 1
				local Hours = 48 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10370	-- 행운의 목걸이
				local COUNT = 1
				local Hours = 48 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)

				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
			end		

		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 126)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else	    			
				local ItemTID = 6495	-- 초심자용 렌즈스톤 
				local COUNT = 3000
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 6182	-- 정령의 외침 
				local COUNT = 10
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11511	-- 초강력 각성의 부적<1일>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>				
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 131)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 2)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else	    			
--				local ItemTID = 6360	-- 강화축성제
--				local COUNT = 10 
--         	  	GiveItem(CID, ItemTID, COUNT)
          	  	
				local ItemTID = 20006	-- 중형 생명물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)

				local ItemTID = 20010	-- 중형 마나물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11779	-- 축복받은 초심자 버프 물약
				local COUNT = 5
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 136)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else	    			
				local TID = GetTID(CID) -- 캐릭터별 코스튬 지급
				
				if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
		        then
					if(TID == 96)
					then
						local ItemTID = 12322	--울프쓰론 아머--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1)
					then
						local ItemTID = 12323	--크로노체이서 갑옷--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 6)
					then
						local ItemTID = 12324	--스컬레토 가브--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 4)
					then
						local ItemTID = 12325	--고스트슬레셔 아머--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 8)
					then
						local ItemTID = 12326	--노블피어서 갑옷--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 3)
					then
						local ItemTID = 12327	--배틀레틀 가브--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 377)
					then
						local ItemTID = 12328	--스트롱 팡 재킷--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 460)
					then
						local ItemTID = 12329	--딥 포레스트 퀴래스--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 9)
					then
						local ItemTID = 12330	--트와일라이트 가브--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1724)
					then
						local ItemTID = 12331	--와이즈마스터 아머--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1722)
					then
						local ItemTID = 12331	--와이즈마스터 아머--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1723)
					then
						local ItemTID = 12331	--와이즈마스터 아머--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1732)
					then
						local ItemTID = 12331	--와이즈마스터 아머--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					end

					local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
					
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>변신을 해제하신 후 다시 시도해주세요.</Message_2>
				end
					
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
			
	elseif(EID == 141)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else	    			
				local ItemTID = 11302	-- 렌즈스톤
				local COUNT = 1000
          	  	GiveItem(CID, ItemTID, COUNT)
	
				local ItemTID = 20007	-- 대형 생명물약
				local COUNT = 99
          	  	GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 20011	-- 대형 마나물약
				local COUNT = 99
          	  	GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 146)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else	    			
				local ItemTID = 10352	-- 슈타 반지
				local COUNT = 1
				local Hours = 72 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10363	-- 카르카엔 목걸이
				local COUNT = 1
				local Hours = 72 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11511	-- 초강력 각성의 부적<1일>
				local COUNT = 1
          	  	GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
			end		
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end	
		
	elseif(EID == 151)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else        
				local TID = GetTID(CID) -- 캐릭터별 코스튬 지급
				
				if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
		        then
					local ItemTID = 6389	-- 중형 치료의 물약
					local COUNT = 99
					GiveItem(CID, ItemTID, COUNT)
					
					if(TID == 96)
					then
						local ItemTID = 12332	--플레쉬암 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1)
					then
						local ItemTID = 12333	--마운틴킹 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 6)
					then
						local ItemTID = 12334	--에니그마사인 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 4)
					then
						local ItemTID = 12335	--헬리게이터 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 8)
					then
						local ItemTID = 12336	--모탈리온 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 3)
					then
						local ItemTID = 12337	--그림조커 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 377)
					then
						local ItemTID = 12338	--바이스 레인보우 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 460)
					then
						local ItemTID = 12339	--그레이 클라우드 잼보어--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 9)
					then
						local ItemTID = 12340	--소울 이터 슈즈--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1724)
					then
						local ItemTID = 12341	--오리엔탈 글로리 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1722)
					then
						local ItemTID = 12341	--오리엔탈 글로리 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1723)
					then
						local ItemTID = 12341	--오리엔탈 글로리 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1732)
					then
						local ItemTID = 12341	--오리엔탈 글로리 부츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					end

					local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
					
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>변신을 해제하신 후 다시 시도해주세요.</Message_2>
				end
					
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 156)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 2)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else
--				local ItemTID = 6360	-- 강화축성제
--				local COUNT = 99
--				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 10355	-- 블로드 반지
				local COUNT = 1
				local Hours = 96 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10365	-- 비글로스 목걸이
				local COUNT = 1
				local Hours = 96 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11302	-- 렌즈스톤
				local COUNT = 2000
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end	
		
	elseif(EID == 161)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>

			else
				local TID = GetTID(CID) -- 캐릭터별 코스튬 지급
				
                if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
                then
                	if(TID == 96)
					then
						local ItemTID = 12342	--렌칭룰러 건틀렛--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1)
					then
						local ItemTID = 12343	--러스트로즈 암패드--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 6)
					then
						local ItemTID = 12344	--하이코마 브레이슬릿--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 4)
					then
						local ItemTID = 12345	--트라이브챔피언 건틀렛--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 8)
					then
						local ItemTID = 12346	--스퀴즈하트 암패드--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 3)
					then
						local ItemTID = 12347	--아이즈위셔 브레이슬릿--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 377)
					then
						local ItemTID = 12348	--판데모닉 트리 글러브--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 460)
					then
						local ItemTID = 12349	--블루 워커 브레이서--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 9)
					then
						local ItemTID = 12350	--에쿼티 아비터 슬리브--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1724)
					then
						local ItemTID = 12351	--로드 드래피온 암브레이스--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1722)
					then
						local ItemTID = 12351	--로드 드래피온 암브레이스--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1723)
					then
						local ItemTID = 12351	--로드 드래피온 암브레이스--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1732)
					then
						local ItemTID = 12351	--로드 드래피온 암브레이스--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					end
        
	        		local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>변신을 해제하신 후 다시 시도해주세요.</Message_2>
				end
			end
			
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 166)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>

			else
				local TID = GetTID(CID) -- 캐릭터별 코스튬 지급
				
                if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
                then
                	local ItemTID = 6389	-- 중형 치료의 물약
					local COUNT = 99
					GiveItem(CID, ItemTID, COUNT)
					
					local ItemTID = 11511	-- 초강력 각성의 부적<1일>
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)
					
					if(TID == 96)
					then
						local ItemTID = 12352	--소드크리퍼 그리브--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1)
					then
						local ItemTID = 12353	--시크릿마운틴 레깅--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 6)
					then
						local ItemTID = 12354	--브레인버스터 킬트--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 4)
					then
						local ItemTID = 12355	--오우거이터 그리브--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 8)
					then
						local ItemTID = 12356	--마인드서처 호즈--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 3)
					then
						local ItemTID = 12357	--로어블레이드 킬트--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 377)
					then
						local ItemTID = 12358	--트루 다이아몬드 스캐버드--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 460)
					then
						local ItemTID = 12359	--옐로 마스터 타이츠--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 9)
					then
						local ItemTID = 12360	--마스터마인드 스커트--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1724)
					then
						local ItemTID = 12361	--아이언메이든 큐렛--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1722)
					then
						local ItemTID = 12361	--아이언메이든 큐렛--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1723)
					then
						local ItemTID = 12361	--아이언메이든 큐렛--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1732)
					then
						local ItemTID = 12361	--아이언메이든 큐렛--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					end
        
	        		local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>변신을 해제하신 후 다시 시도해주세요.</Message_2>
				end
			end
			
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end
		
	elseif(EID == 171)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else
				local ItemTID = 10357	-- 로고 반지
				local COUNT = 1
				local Hours = 120 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10367	-- 주커 목걸이
				local COUNT = 1
				local Hours = 120 -- 시간단위
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11302	-- 렌즈스톤
				local COUNT = 3000
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end	

	elseif(EID == 176)
	then
		if(Result == 1) -- Event대상 유저가 아님
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>해당 이벤트 대상 계정 및 캐릭터가 아닙니다.</Message_4>
			
		elseif(Result == 2) -- Event대상 유저이고 아이템을 아직 받지 않은 상태
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_5>
				
			else		
				local ItemTID = 6360	-- 강화축성제
				local COUNT = 20
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11006	-- 천운의 부적<1일>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 6389	-- 중형 치료의 물약
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = 아이템을 받은 상태, 0 = 아이템을 받지 않은 상태)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>레벨업 지원선물 아이템이 지급되었습니다.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event대상 유저이고 아이템을 받은 상태
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>이미 레벨업 지원선물 아이템이 지급되었습니다.</Message_3>
		end		
		
		
	end

	return 0 
end

function OnCheckAttendance(CID, NID, EID, STEP, Type, Result)
	print(CID, NID, EID, STEP, Type, Result)
	
	return 0
end