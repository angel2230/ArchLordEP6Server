-- CID
-- EventID
-- 부가서비스

function Main(CID, NID, EID, STEP)
	print("[extra_service.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
	local MenuID = 11
	ShowMenu(CID, NID, MenuID)

	return 0
end

function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

	if(EID == 1 and STEP == 0)
	then
	    CallSystemNPC(CID, 10000, 0, 0) -- 캐릭터 이름 변경
	elseif(EID == 2 and STEP == 0)
	then
	    CallSystemNPC(CID, 10001, 0, 0) -- 케라리움 오브
	end
	
	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

    if(EID == 1 and STEP == 0 and bBtnIndex == 1)
	then			
	end
	
	return 0
end