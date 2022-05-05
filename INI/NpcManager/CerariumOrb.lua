--
-- 케라리움 오브
--

function Main(CID, NID, EID, STEP)
	print("[케라리움 오브 Main() Called]")
	print(CID, NID, EID, STEP)

	if(EID == 0 and STEP == 0)
	then
		ShowMenu(CID, NID, 10001)
	elseif(EID == 101)
	then
		if(STEP == 1) -- success
		then
			local ItemTID = 11405 -- 캐릭터 봉인 주문서
			local COUNT = 1
			RobItem(CID, ItemTID, COUNT)
			
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 1) -- <Message_1>캐릭터를 봉인하였습니다.</Message_1>
		elseif(STEP < 0 or STEP == 2)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 2) -- <Message_2>선택한 캐릭터를 봉인 할 수 없습니다.</Message_2>
		elseif(STEP == 3)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 3) -- <Message_3>길드에 가입중이거나 가입되어 있을 경우 이용할 수 없습니다.</Message_3>
		elseif(STEP == 4)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 4) -- <Message_4>거래소에 아이템이 등록되어 있으면 이용할수 없습니다.</Message_4>
		end
	elseif(EID == 200) -- 봉인 해제
	then
		if(STEP == 1) -- success
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 7) -- <Message_7>케라리움오브의 봉인을 해제하였습니다.</Message_7>
		elseif(STEP == 4)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 9) -- <Message_9>빈슬롯이 없어 봉인을 해제 할 수 없습니다.</Message_9>
		else
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 8) -- <Message_8>봉인을 해제 할 수 없습니다.</Message_8>
		end
	end

	return 0
end


function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString, ItemID)
	print("CerariumOrb::OnMessageBox")
	print(CID, NID, EID, STEP)
	print(bBtnIndex, ItemID)
	
	if(EID == 101 and bBtnIndex == 1)
	then
		CerariumOrb(CID, NID, 101, STEP) -- 캐릭터 봉인 요청
	elseif(EID == 201 and bBtnIndex == 1)
	then
		ShowMessageBox(CID, NID, 200, ItemID, 3, 1001, 11)
	elseif(EID == 200 and bBtnIndex == 1)
	then
		CerariumOrb(CID, NID, 200, STEP)
	end

	return 0
end

function OnMenu(CID, NID, EID, STEP)
	print("[케라리움 오브 OnMenu() Called]")
	print(CID, NID, EID, STEP)
	
	if(EID == 1 and STEP == 0) -- 봉인 요청
	then
		local ItemTID = 11405 -- 캐릭터 봉인 주문서
		local InvenItemCount = CheckItemCount(CID, ItemTID)
		if(InvenItemCount < 1)
		then
			ShowMessageBox(CID, NID, 0, 0, 1, 1001, 5) -- <Message_5>캐릭터봉인주문서를 소지하고 있지 않습니다.</Message_5>
			return 0
		end
		
		CerariumOrb(CID, NID, 100, 1) -- 캐릭터 리스트 요청
		
	elseif(EID == 2 and STEP == 0) -- 봉인 해제
	then
		ShowMessageBox(CID, NID, 201, 1, 4, 1001, 6) -- <Message_6>케라리움오브를 선택해 주십시요.</Message_6>
	elseif(EID == 100)
	then
		ShowMessageBox(CID, NID, 101, STEP, 3, 1001, 10)
	end
	
	return 0
end



