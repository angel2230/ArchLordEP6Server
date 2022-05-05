--
-- 이름변경 NPC
--

function Main(CID, NID, EID, STEP)
	print("[NameChange Main() Called]")
	print(CID, NID, EID, STEP)

--	local TID = GetTID(CID)
--	local RACE = GetRace(CID)
--	local LEVEL = GetLevel(CID)
--	local EXP = GetExp(CID)

--	print(TID, RACE, LEVEL, EXP)

	if(EID == 0 and STEP == 0)
	then
		ShowMessageBox(CID, NID, 2, 0, 3, 1000, 1)
		
	elseif(EID == 0  and STEP == 1)
	then
		-- 정책1. 아크로드는 이용할 수 없습니다.
		local bArchlord = IsArchlord(CID)
		if(bArchlord == 1)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 2)
			return 0
		end
		
		-- 정책2. 길드에 가입중이거나 가입되어 있을 경우 이용할 수 없습니다.
		local lRank = GetGuildMemberRank(CID)
		if(lRank > 0)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 3)
			return 0
		end
		
		-- 정책3. 거래소에 아이템이 등록되어 있으면 이용할수 없습니다.
		local lAuctionCount = GetAuctionCount(CID)
		if(lAuctionCount > 0)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 4)
			return 0
		end

		-- 정책4. 현상수배자이면 이용할 수 없습니다.
		local bIsCriminal = IsCriminal(CID)
		if(bIsCriminal == 1)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 9)
			return 0
		end
		
		local ItemTID = 11404 -- 이름변경 주문서
		local InvenItemCount = CheckItemCount(CID, ItemTID)
		if(InvenItemCount < 1)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 5)
			return 0
		end
		
		SetChangeName(CID, NID, 3, 0)
		
	elseif(EID == 3)
	then
		if(STEP == 0)
		then
			local ItemTID = 11404 -- 이름변경 주문서
			RobItem(CID, ItemTID, 1)

			ShowMessageBox(CID, NID, 1, 0, 1, 1000, 6)
		else
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 8)
		end
	end

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)
	print("ChangeName OnMessageBox")
	print(CID, NID, EID, STEP)
	
	if(EID == 2 and STEP == 0 and bBtnIndex == 1)
	then
		CallSystemNPC(CID, NID, 0, 1)
	elseif(EID == 1 and STEP == 0 and bBtnIndex == 1)
	then
		ReturnToLogin(CID)
	end

	return 0
end
