-- CID
-- EventID
-- ÀÌµ¿ÁÂÇ¥

function Main(CID, NID, EID, STEP)
	print("[chaotic_turn.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)

	local PosX = -52015
	local PosZ = 25723
	Move(CID, PosX, PosZ)


	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	return 0
end
