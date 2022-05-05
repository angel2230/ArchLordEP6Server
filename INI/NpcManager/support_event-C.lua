-- CID
-- EventID
-- �߱��̺�Ʈ 

function Main(CID, NID, EID, STEP)
	print("[support_event-C.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
	local MenuID = 12
	ShowMenu(CID, NID, MenuID)

	return 0
end

function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString, ItemID)
	
	return 0
end

function OnMenu(CID, NID, EID, STEP)

    if(EID == 1 and STEP == 0)  -- ���������� �̺�Ʈ [1~40]
	then
		local MenuID = 13
		ShowMenu(CID, NID, MenuID)
	
	elseif(EID == 2 and STEP == 0) -- ���������� �̺�Ʈ[41~80]
	then
		local MenuID = 14
		ShowMenu(CID, NID, MenuID)
		
------------------------------------------------------------------------------------------------------		
		
	elseif(EID == 101 and STEP == 0) -- <TEXT>1~5���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 1 and LEVEL <= 5)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 101, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 106 and STEP == 0) --<TEXT>6~10���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 6 and LEVEL <= 10)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 106, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end 
		
	elseif(EID == 111 and STEP == 0) -- <TEXT>11~15���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 11 and LEVEL <= 15)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 111, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 116 and STEP == 0) -- <TEXT>16~20���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 16 and LEVEL <= 20)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 116, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 121 and STEP == 0) -- <TEXT>21~25���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 21 and LEVEL <= 25)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 121, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 126 and STEP == 0) -- <TEXT>26~30���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 26 and LEVEL <= 30)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 126, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 131 and STEP == 0) -- <TEXT>31~35���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 31 and LEVEL <= 35)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 131, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 136 and STEP == 0) -- <TEXT>36~40���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 36 and LEVEL <= 40)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 136, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 141 and STEP == 0) -- <TEXT>41~45���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 41 and LEVEL <= 45)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 141, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 146 and STEP == 0) -- <TEXT>46~50���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 46 and LEVEL <= 50)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 146, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 151 and STEP == 0) -- <TEXT>51~55���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 51 and LEVEL <= 55)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 151, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 156 and STEP == 0) -- <TEXT>56~60���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 56 and LEVEL <= 60)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 156, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 161 and STEP == 0) -- <TEXT>61~65���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 61 and LEVEL <= 65)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 161, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 166 and STEP == 0) -- <TEXT>66~70���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 66 and LEVEL <= 70)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 166, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 171 and STEP == 0) -- <TEXT>71~75���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 71 and LEVEL <= 75)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 171, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
		
	elseif(EID == 176 and STEP == 0)  -- <TEXT>76~80���� ��������</TEXT>
	then
		local LEVEL = GetLevel(CID)

		if(LEVEL >= 76 and LEVEL <= 80)
		then
			local Type = 1 -- 1. ĳ���� ���� 2. �������� 3. ���� ����
			CheckEventUser(CID, NID, 176, 0, Type)
		else
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�����������̺�Ʈ�� �ش�Ǵ� ������ �ƴմϴ�.</Message_1>
		end
			
	end

	return 0 
end

function OnCheckEventUser(CID, NID, EID, STEP, Type, Result)
	print(CID, NID, EID, STEP, Type, Result)
	
	if(EID == 101)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>

		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
   			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 4)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>

			else
				local ItemTID = 11779	-- �ູ���� �ʽ��� ���� ����
				local COUNT = 5
				GiveItem(CID, ItemTID, COUNT)

				local ItemTID = 6362	-- ���� ������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 20009	-- ���� ��������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11260	-- ���Ͽ� ��ũ����
				local COUNT = 1
				local Hours = 24 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11262	-- �ı����� ��ǥ
				local COUNT = 1
				local Hours = 24 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11263	-- ������ ��ǥ
				local COUNT = 1
				local Hours = 24 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)

				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
			end

		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 106)
		then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>

		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
   			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>

			else
				local ItemTID = 6495	-- �ʽ��ڿ� �����
				local COUNT = 3000 
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 6496	-- �ʽ��ڿ� �������� ����
				local COUNT = 10 
				GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 111)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>

			else
				local ItemTID = 6362	-- ���� ������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 20009	-- ���� ��������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
			end

		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 116)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)

			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>

			else
				local ItemTID = 11005	-- ������ ����<1��>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11007	-- ����� ����<1��>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11779	-- �ູ���� �ʽ��� ���� ����
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)

				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
			end

		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 121)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 3)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
			
			else
				local ItemTID = 20006	-- ���� ������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)

				local ItemTID = 20010	-- ���� ��������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 10351	-- �ٷ� ����
				local COUNT = 1
				local Hours = 48 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10370	-- ����� �����
				local COUNT = 1
				local Hours = 48 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)

				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
			end		

		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 126)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else	    			
				local ItemTID = 6495	-- �ʽ��ڿ� ����� 
				local COUNT = 3000
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 6182	-- ������ ��ħ 
				local COUNT = 10
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11511	-- �ʰ��� ������ ����<1��>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>				
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 131)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 2)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else	    			
--				local ItemTID = 6360	-- ��ȭ�༺��
--				local COUNT = 10 
--         	  	GiveItem(CID, ItemTID, COUNT)
          	  	
				local ItemTID = 20006	-- ���� ������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)

				local ItemTID = 20010	-- ���� ��������
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11779	-- �ູ���� �ʽ��� ���� ����
				local COUNT = 5
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 136)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else	    			
				local TID = GetTID(CID) -- ĳ���ͺ� �ڽ�Ƭ ����
				
				if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
		        then
					if(TID == 96)
					then
						local ItemTID = 12322	--�������� �Ƹ�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1)
					then
						local ItemTID = 12323	--ũ�γ�ü�̼� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 6)
					then
						local ItemTID = 12324	--���÷��� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 4)
					then
						local ItemTID = 12325	--��Ʈ������ �Ƹ�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 8)
					then
						local ItemTID = 12326	--����Ǿ ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 3)
					then
						local ItemTID = 12327	--��Ʋ��Ʋ ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 377)
					then
						local ItemTID = 12328	--��Ʈ�� �� ��Ŷ--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 460)
					then
						local ItemTID = 12329	--�� ������Ʈ ������--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 9)
					then
						local ItemTID = 12330	--Ʈ���϶���Ʈ ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1724)
					then
						local ItemTID = 12331	--��������� �Ƹ�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1722)
					then
						local ItemTID = 12331	--��������� �Ƹ�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1723)
					then
						local ItemTID = 12331	--��������� �Ƹ�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					elseif(TID == 1732)
					then
						local ItemTID = 12331	--��������� �Ƹ�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)

					end

					local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
					
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>������ �����Ͻ� �� �ٽ� �õ����ּ���.</Message_2>
				end
					
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
			
	elseif(EID == 141)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else	    			
				local ItemTID = 11302	-- �����
				local COUNT = 1000
          	  	GiveItem(CID, ItemTID, COUNT)
	
				local ItemTID = 20007	-- ���� ������
				local COUNT = 99
          	  	GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 20011	-- ���� ��������
				local COUNT = 99
          	  	GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 146)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else	    			
				local ItemTID = 10352	-- ��Ÿ ����
				local COUNT = 1
				local Hours = 72 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10363	-- ī��ī�� �����
				local COUNT = 1
				local Hours = 72 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11511	-- �ʰ��� ������ ����<1��>
				local COUNT = 1
          	  	GiveItem(CID, ItemTID, COUNT)

				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
			end		
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end	
		
	elseif(EID == 151)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else        
				local TID = GetTID(CID) -- ĳ���ͺ� �ڽ�Ƭ ����
				
				if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
		        then
					local ItemTID = 6389	-- ���� ġ���� ����
					local COUNT = 99
					GiveItem(CID, ItemTID, COUNT)
					
					if(TID == 96)
					then
						local ItemTID = 12332	--�÷����� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1)
					then
						local ItemTID = 12333	--����ƾŷ ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 6)
					then
						local ItemTID = 12334	--���ϱ׸����� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 4)
					then
						local ItemTID = 12335	--�︮������ ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 8)
					then
						local ItemTID = 12336	--��Ż���� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 3)
					then
						local ItemTID = 12337	--�׸���Ŀ ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 377)
					then
						local ItemTID = 12338	--���̽� ���κ��� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 460)
					then
						local ItemTID = 12339	--�׷��� Ŭ���� �뺸��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 9)
					then
						local ItemTID = 12340	--�ҿ� ���� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1724)
					then
						local ItemTID = 12341	--������Ż �۷θ� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1722)
					then
						local ItemTID = 12341	--������Ż �۷θ� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1723)
					then
						local ItemTID = 12341	--������Ż �۷θ� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1732)
					then
						local ItemTID = 12341	--������Ż �۷θ� ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					end

					local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
					
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>������ �����Ͻ� �� �ٽ� �õ����ּ���.</Message_2>
				end
					
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 156)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 2)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else
--				local ItemTID = 6360	-- ��ȭ�༺��
--				local COUNT = 99
--				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 10355	-- ��ε� ����
				local COUNT = 1
				local Hours = 96 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10365	-- ��۷ν� �����
				local COUNT = 1
				local Hours = 96 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11302	-- �����
				local COUNT = 2000
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end	
		
	elseif(EID == 161)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>

			else
				local TID = GetTID(CID) -- ĳ���ͺ� �ڽ�Ƭ ����
				
                if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
                then
                	if(TID == 96)
					then
						local ItemTID = 12342	--��Ī�귯 ��Ʋ��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1)
					then
						local ItemTID = 12343	--����Ʈ���� ���е�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 6)
					then
						local ItemTID = 12344	--�����ڸ� �극�̽���--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 4)
					then
						local ItemTID = 12345	--Ʈ���̺�è�Ǿ� ��Ʋ��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 8)
					then
						local ItemTID = 12346	--��������Ʈ ���е�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 3)
					then
						local ItemTID = 12347	--���������� �극�̽���--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 377)
					then
						local ItemTID = 12348	--�ǵ���� Ʈ�� �۷���--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 460)
					then
						local ItemTID = 12349	--��� ��Ŀ �극�̼�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 9)
					then
						local ItemTID = 12350	--����Ƽ �ƺ��� ������--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1724)
					then
						local ItemTID = 12351	--�ε� �巡�ǿ� �Ϻ극�̽�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1722)
					then
						local ItemTID = 12351	--�ε� �巡�ǿ� �Ϻ극�̽�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1723)
					then
						local ItemTID = 12351	--�ε� �巡�ǿ� �Ϻ극�̽�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1732)
					then
						local ItemTID = 12351	--�ε� �巡�ǿ� �Ϻ극�̽�--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					end
        
	        		local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>������ �����Ͻ� �� �ٽ� �õ����ּ���.</Message_2>
				end
			end
			
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 166)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then          
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>

			else
				local TID = GetTID(CID) -- ĳ���ͺ� �ڽ�Ƭ ����
				
                if(TID == 96 or TID == 1 or TID == 6 or TID == 4 or TID == 8 or TID == 3 or TID == 377 or TID == 460 or TID == 9 or TID == 1724 or TID == 1722 or TID == 1723 or TID == 1732)
                then
                	local ItemTID = 6389	-- ���� ġ���� ����
					local COUNT = 99
					GiveItem(CID, ItemTID, COUNT)
					
					local ItemTID = 11511	-- �ʰ��� ������ ����<1��>
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)
					
					if(TID == 96)
					then
						local ItemTID = 12352	--�ҵ�ũ���� �׸���--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1)
					then
						local ItemTID = 12353	--��ũ������ƾ ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 6)
					then
						local ItemTID = 12354	--�극�ι����� ųƮ--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 4)
					then
						local ItemTID = 12355	--��������� �׸���--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 8)
					then
						local ItemTID = 12356	--���ε弭ó ȣ��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 3)
					then
						local ItemTID = 12357	--�ξ���̵� ųƮ--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 377)
					then
						local ItemTID = 12358	--Ʈ�� ���̾Ƹ�� ��ĳ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 460)
					then
						local ItemTID = 12359	--���� ������ Ÿ����--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 9)
					then
						local ItemTID = 12360	--�����͸��ε� ��ĿƮ--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1724)
					then
						local ItemTID = 12361	--���̾���̵� ť��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1722)
					then
						local ItemTID = 12361	--���̾���̵� ť��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1723)
					then
						local ItemTID = 12361	--���̾���̵� ť��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					elseif(TID == 1732)
					then
						local ItemTID = 12361	--���̾���̵� ť��--
						local COUNT = 1
						GiveItem(CID, ItemTID, COUNT)
	
					end
        
	        		local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
					EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
	
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
					-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
				else
					local Group = 5
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					--  <Message_2>������ �����Ͻ� �� �ٽ� �õ����ּ���.</Message_2>
				end
			end
			
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end
		
	elseif(EID == 171)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else
				local ItemTID = 10357	-- �ΰ� ����
				local COUNT = 1
				local Hours = 120 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 10367	-- ��Ŀ �����
				local COUNT = 1
				local Hours = 120 -- �ð�����
				GiveTimeLimitItem(CID, ItemTID, COUNT, Hours)
				
				local ItemTID = 11302	-- �����
				local COUNT = 3000
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end	

	elseif(EID == 176)
	then
		if(Result == 1) -- Event��� ������ �ƴ�
		then
			local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 4)
			--<Message_4>�ش� �̺�Ʈ ��� ���� �� ĳ���Ͱ� �ƴմϴ�.</Message_4>
			
		elseif(Result == 2) -- Event��� �����̰� �������� ���� ���� ���� ����
		then
			local EmptyCount = GetInventoryEmptyCount(CID)
	
			if(EmptyCount < 1)
			then
			    local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 5)
				--<Message_5>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_5>
				
			else		
				local ItemTID = 6360	-- ��ȭ�༺��
				local COUNT = 20
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 11006	-- õ���� ����<1��>
				local COUNT = 1
				GiveItem(CID, ItemTID, COUNT)
				
				local ItemTID = 6389	-- ���� ġ���� ����
				local COUNT = 99
				GiveItem(CID, ItemTID, COUNT)
	
				local Flag = 1 -- ( 1 = �������� ���� ����, 0 = �������� ���� ���� ����)
				EventUserFlagUpdate(CID, NID, EID, STEP, Type, Flag)
				
				local Group = 5
				ShowMessageBox(CID, NID, 0, 0, 1, Group, 6)
				-- <Message_6>������ �������� �������� ���޵Ǿ����ϴ�.</Message_6>
				
			end
		
		elseif(Result == 3) -- Event��� �����̰� �������� ���� ����
		then
		    local Group = 5
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
			--<Message_3>�̹� ������ �������� �������� ���޵Ǿ����ϴ�.</Message_3>
		end		
		
		
	end

	return 0 
end

function OnCheckAttendance(CID, NID, EID, STEP, Type, Result)
	print(CID, NID, EID, STEP, Type, Result)
	
	return 0
end