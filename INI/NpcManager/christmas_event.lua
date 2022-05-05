-- CID
-- EventID
-- 크리스마스 이벤트 메뉴

function Main(CID, NID, EID, STEP)
	print("[christmas_event.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
--	local NID = 573 ~ 590	-- 배틀 스퀘어 포탈NPC

	local MenuID = 36
	ShowMenu(CID, NID, MenuID)

	return 0
end


function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	if(EID == 93 and STEP == 0 and bBtnIndex == 1) --산타방울 10개 교환
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_1>

		else
			local ItemTID = 40018 --산타방울
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 10)
				then
					local COUNT = 10
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40019 -- 산타 양말
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>아이템교환이 완료되었습니다.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>아이템교환이 불가능합니다. 소지하고 있는 아이템개수를 확인하신 후 다시 시도해주세요.</Message_3>
				end
		end

	elseif(EID == 94 and STEP == 0 and bBtnIndex == 1) --산타방울 15개 교환
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_1>
		else
			local ItemTID = 40018--산타방울
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 15)
				then
					local COUNT = 15
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40020 -- 산타 모자
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>아이템교환이 완료되었습니다.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>아이템교환이 불가능합니다. 소지하고 있는 아이템개수를 확인하신 후 다시 시도해주세요.</Message_3>
				end
		end

	elseif(EID == 95 and STEP == 0 and bBtnIndex == 1) --산타방울 20개 교환
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_1>
		else
			local ItemTID = 40018 --산타방울
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 20)
				then
					local COUNT = 20
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40021 -- 산타 장갑
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>아이템교환이 완료되었습니다.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>아이템교환이 불가능합니다. 소지하고 있는 아이템개수를 확인하신 후 다시 시도해주세요.</Message_3>
				end
		end
		
	elseif(EID == 96 and STEP == 0 and bBtnIndex == 1) --루돌프 펫 상자 교환
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_1>
		else

			local InvenItemCountA = CheckItemCount(CID, 40019)
			local InvenItemCountB = CheckItemCount(CID, 40020)
			local InvenItemCountC = CheckItemCount(CID, 40021)

				if(InvenItemCountA >= 1 and InvenItemCountB >= 1 and InvenItemCountC >= 1)
				then
     				RobItem(CID, 40019, 1)
     				RobItem(CID, 40020, 1)
     				RobItem(CID, 40021, 1)

					local ItemTID = 40023 -- 루돌프 펫 상자
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>아이템교환이 완료되었습니다.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>아이템교환이 불가능합니다. 소지하고 있는 아이템개수를 확인하신 후 다시 시도해주세요.</Message_3>
				end
		end




	elseif(EID == 97 and STEP == 0 and bBtnIndex == 1) --산타방울 50개 교환
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>인벤토리에 빈슬롯이 없어 진행할 수 없습니다.</Message_1>
		else
			local ItemTID = 40018 --산타방울
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 50)
				then
					local COUNT = 50
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40022 -- 산타선물상자
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>아이템교환이 완료되었습니다.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>아이템교환이 불가능합니다. 소지하고 있는 아이템개수를 확인하신 후 다시 시도해주세요.</Message_3>
				end
		end
		
		

		
	end
	 
	return 0
end





function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

	if(EID == 90 and STEP == 0)  -- 산타 장신구 교환 매뉴 이동 
	then
		local MenuID = 37
		ShowMenu(CID, NID, MenuID)

	elseif(EID == 91 and STEP == 0)  -- 루돌프 펫상자 교환 매뉴 이동 
	then
		local MenuID = 38
		ShowMenu(CID, NID, MenuID)

	elseif(EID == 92 and STEP == 0)  -- 산타의 선물상자 매뉴 이동 
	then
		local MenuID = 39
		ShowMenu(CID, NID, MenuID)








              
	elseif(EID == 93 and STEP == 0) --  산타 소켓 
	then

		local Group = 6
		ShowMessageBox( CID, NID, 93, 0, 3, Group, 4)
            ---- <Message_4>교환하시겠습니까?</Message_4>    --
              
	elseif(EID == 94 and STEP == 0) --   산타 헷 
	then

		local Group = 6
		ShowMessageBox( CID, NID, 94, 0, 3, Group, 4)
              ---- <Message_4>교환하시겠습니까?</Message_4>    --
              
	elseif(EID == 95 and STEP == 0) --  산타글로브 
	then

		local Group = 6
		ShowMessageBox( CID, NID, 95, 0, 3, Group, 4)
               ---- <Message_4>교환하시겠습니까?</Message_4>    --


 
 
  	elseif(EID == 96 and STEP == 0) --  루돌프 펫 상자 교환
	then

		local Group = 6
		ShowMessageBox( CID, NID, 96, 0, 3, Group, 4)
               ---- <Message_4>교환하시겠습니까?</Message_4>    --
              	



	elseif(EID == 97 and STEP == 0) --  산타 선물 상자 교환
	then

		local Group = 6
		ShowMessageBox( CID, NID, 97, 0, 3, Group, 4)
                ---- <Message_4>교환하시겠습니까?</Message_4>    --
              	
              	
              	
	end
	 
	return 0
end
              	