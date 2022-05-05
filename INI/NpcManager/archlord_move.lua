-- 렌스피어로 이동하는 NPC

function Main(CID, NID, EID, STEP)
	print("[archlord.lua Main() called]")
	print(CID, NID, EID, STEP)

	local MenuID = 29
	ShowMenu(CID, NID ,MenuID)

	return 0
end

function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

	if(EID == 1 and STEP == 0)
	then
		local IsAccess = ProcessArchlordCastleAttackGuild(CID, NID)

		if(IsAccess == 1)
		then
			if(NID == 547)
			then
				local PosX = -74798.9
				local PosY = -57869.6
				Move(CID, PosX, PosY)

			elseif(NID == 548)
			then
				local PosX = -30712.8
				local PosY = -50278.9
				Move(CID, PosX, PosY)

			elseif(NID == 549)
			then
				local PosX = -38400
				local PosY = -38400
				Move(CID, PosX, PosY)

			elseif(NID == 550)
			then
				local PosX = -55000
				local PosY = -36400
				Move(CID, PosX, PosY)



			end

			SetDefaultInvincible(CID)		

		else
			local Group = 11
			ShowMessageBox( CID, NID, 0, 0, 1, Group, 1)
		end
	end
end