-----------------------------------------------------------------
-- BattleGround.Lua
--

time_set = BattleGround_time_set

-----------------------------------------------------------------
-- for operator start
if Manual_time_set == nil
then
	Manual_time_set =
	{
		use = 1;
		wday = -1, hour = -1, min = -1;
		during = 0
	}
end

-----------------------------------------------------------------
--
--
local function SetTime(w, h, m)
--print(w .. ":" .. h .. ":" .. m )
return w*60*24 + h*60 + m
end

-----------------------------------------------------------------
--
--
function OnTimer ()
	if (time_set.use == 0) then return end
	--print("[BattleGround.Lua OnTimer() Called]")
	local 	date 		= os.date("*t")
	local 	now 		= SetTime( date.wday, date.hour, date.min )

	-----------------------------------------------------------------
	-- �����Ͽ� �ι�
	local 	time_begin	= SetTime( time_set.wday, time_set.hour, time_set.min ) 
	local	time_end   	= time_begin + time_set.during

	if(time_set.wday2 == date.wday) 
	then 
		time_begin = SetTime( time_set.wday2, time_set.hour2, time_set.min2 )
		time_end   = time_begin + time_set.during
	end

	-----------------------------------------------------------------
	-- ���� �ι�
	--[[
	local 	time_begin	= SetTime( date.wday, time_set.hour, time_set.min ) 
	local	time_end   	= time_begin + time_set.during

	if(time_end + 5 < now) 
	then 
		time_begin = SetTime( date.wday, time_set.hour2, time_set.min2 )
		time_end   = time_begin + time_set.during
	end
	--]]

	-----------------------------------------------------------------
	-- ��� ��ɾ�� ����
	if(date.wday == Manual_time_set.wday) 
	then 
		time_begin = SetTime( Manual_time_set.wday, Manual_time_set.hour, Manual_time_set.min )
		time_end   = time_begin + Manual_time_set.during
	end
		

	--print(os.date("%c"))
	--print(time_begin, time_end, now)

	local nBattleGroundState = GetBattleGroundState()
	--print("BattleGroundState = ", nBattleGroundState)

	if (nBattleGroundState == 0) then
		-- ���÷� ��ȯ
		SetBattleGroundState( 1 )

	elseif (nBattleGroundState == 1) then
		-- �������� 1����
		--print( now, time_begin )
		if (now >= time_begin-10  and now < time_begin) 
		then 
			BattleGroundNotice( 1, (time_begin-now) )
		end
		
		if (now >= time_begin-1 and now < time_end) --time_begin) 
		then 
			print("Getting Start-- �ʵ���͸� ����")
			SetBattleGroundState( 2 )
			-- �ʵ���͸� ����
			BattleGroundNotice( 5, 0 )
			RemoveMonsters()
		end
	elseif (nBattleGroundState == 2) then
		if (now >= time_begin) 
		then
			print("start...")
			SetBattleGroundState( 3 )
					
			--print("\tStart-- �������� ��������� ��ȯ")
			-- Open Notice
			--BattleGroundNotice( 2, 0 )
			
			-- �������� ��������� ��ȯ
			--SpawnCharacters()
		end

	elseif (nBattleGroundState == 3) then
		print("Battling.......")
		
		SpawnAbilityMonster()

		if (now >= time_end)
		then 
			print("close...")
			BattleGroundNotice( 4, 0 )
			RemoveMonsters()
			SetBattleGroundState( 4 )
		elseif ( (time_end-now)%10 == 0 ) 
		then 
			BattleGroundNotice( 3, (time_end-now) )
		end

		if( (time_end-now) % 2 == 0 )
		then
			BattleGroundStatistic()
		end
	elseif (nBattleGroundState == 4) then
		if (now >= time_end+1)
		then 
			-- ���÷� ��ȯ
			SetBattleGroundState( 1 )
			print("Set State - Normal")
		end	
	else
		--SetBattleGroundState( 0 )
		--print("Set State - Zero")
	end
end
