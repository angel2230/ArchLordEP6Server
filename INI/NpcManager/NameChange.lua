--
-- �̸����� NPC
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
		-- ��å1. ��ũ�ε�� �̿��� �� �����ϴ�.
		local bArchlord = IsArchlord(CID)
		if(bArchlord == 1)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 2)
			return 0
		end
		
		-- ��å2. ��忡 �������̰ų� ���ԵǾ� ���� ��� �̿��� �� �����ϴ�.
		local lRank = GetGuildMemberRank(CID)
		if(lRank > 0)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 3)
			return 0
		end
		
		-- ��å3. �ŷ��ҿ� �������� ��ϵǾ� ������ �̿��Ҽ� �����ϴ�.
		local lAuctionCount = GetAuctionCount(CID)
		if(lAuctionCount > 0)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 4)
			return 0
		end

		-- ��å4. ����������̸� �̿��� �� �����ϴ�.
		local bIsCriminal = IsCriminal(CID)
		if(bIsCriminal == 1)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1000, 9)
			return 0
		end
		
		local ItemTID = 11404 -- �̸����� �ֹ���
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
			local ItemTID = 11404 -- �̸����� �ֹ���
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
