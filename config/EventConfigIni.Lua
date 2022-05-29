-----------------------------------------------------------------
-- 아크로드 더블 데이 설정파일 - arycoat 2008.04.
--
-- use = 1 (이벤트 사용)
--       0 (이벤트 미사용)
-- wday = 1 (일요일)
--        2 (월요일)
--        3 (화요일)
--        4 (수요일)
--        5 (목요일)
--        6 (금요일)
--        7 (토요일)
-- hour = 시(24시간 기준)
-- min  = 분
--

-- 사용법
-- 기본적으로 time = {... , ...} 안에 세팅하도록 되어있다.
-- ...하나하나가 각각의 이벤트로 구성되며 이 역시 {event}와 같이 구성된다.
-- event안에 들어가야할 내용은 아래와 같이 세팅하도록 된다.
-- ex)
-- {eventnumber = 1, stime = {wday = 3, hour = 15, min = 0;}, etime = {wday = 3, hour = 16, min = 0;}, 
-- ratio = {exp_ratio = 200, drop_ratio = 200, gheld_drop_ratio = 200, charisma_drop_ratio = 200, pvp_item_drop = true, pvp_exp_drop = false, pvp_enable = true};},
-- eventnumber는 출력할 메시지를 위한 것이며 ini//systemMessage.xml안의 DoubleEvent의 eventNumber를 의미하며
-- eventnumber에 맞는 메시지를 출력하도록 되어있다. stime은 시작 시간을 의미하고 etime은 끝나는 시간을 의미한다.
-- ratio안에는 세팅할 값들이 들어가게 된다. ratio안의 exp_ratio와 같은 값들은 절대 빠지면 안된다.

DoubleEvent = 
{
	use = 1;
	
--	exp_ratio = 200;
--	drop_ratio = 200;
--	gheld_drop_ratio = 100; -- 겔드드랍은 제외

	time = {{eventnumber = 1, stime = {wday = 6, hour = 18, min = 0;}, etime = {wday = 7, hour = 18, min = 0;}, 
		ratio = {exp_ratio = 200, drop_ratio = 200, gheld_drop_ratio = 100, charisma_drop_ratio = 100, pvp_item_drop = true, pvp_exp_drop = true, pvp_enable = true;};}
		};

};
