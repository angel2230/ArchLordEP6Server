-----------------------------------------------------------------
-- BattleGround.Lua
--


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
	
	local 	date 		= os.date("*t")
	local 	now 		= SetTime( date.wday, date.hour, date.min )
	
	if (DoubleEvent.use == 1) 
	then 
		print("[EventConfig.Lua OnTimer() Called]")
		local 	DoubleEvent_time1_begin 	= SetTime( DoubleEvent.stime1.wday, DoubleEvent.stime1.hour, DoubleEvent.stime1.min )
		local	DoubleEvent_time1_end   	= SetTime( DoubleEvent.etime1.wday, DoubleEvent.etime1.hour, DoubleEvent.etime1.min )
		print(DoubleEvent_time1_begin, DoubleEvent_time1_end, now)

		local 	DoubleEvent_time2_begin 	= SetTime( DoubleEvent.stime2.wday, DoubleEvent.stime2.hour, DoubleEvent.stime2.min )
		local	DoubleEvent_time2_end   	= SetTime( DoubleEvent.etime2.wday, DoubleEvent.etime2.hour, DoubleEvent.etime2.min )
		print(DoubleEvent_time2_begin, DoubleEvent_time2_end, now)
		
		local bDoubleEventState = GetDoubleEventState()
		--print("bDoubleEventState = ", bDoubleEventState)
		--print("exp_ratio = ", DoubleEvent.exp_ratio)
		--print("drop_ratio = ", DoubleEvent.drop_ratio)
		--print("gheld_drop_ratio = ", DoubleEvent.gheld_drop_ratio)
		
		if(bDoubleEventState == false) 
		then
			if((DoubleEvent_time1_begin < now and DoubleEvent_time1_end > now)
				or (DoubleEvent_time2_begin < now and DoubleEvent_time2_end > now))
			then
				SetDoubleEventState(true, DoubleEvent.exp_ratio, DoubleEvent.drop_ratio, DoubleEvent.gheld_drop_ratio)
			end
		else
			if((DoubleEvent_time1_begin > now or DoubleEvent_time1_end < now)
				and (DoubleEvent_time2_begin > now or DoubleEvent_time2_end < now))
			then
				SetDoubleEventState(false, 100, 100, 100) -- 1.0f
			end
		end
	end
end
