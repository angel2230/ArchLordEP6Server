-- CID
-- EventID
-- ũ�������� �̺�Ʈ �޴�

function Main(CID, NID, EID, STEP)
	print("[christmas_event.lua Main() Called]")
	print(CID, NID, EID, STEP)

	local TID = GetTID(CID)
	local RACE = GetRace(CID)
	local LEVEL = GetLevel(CID)
	local EXP = GetExp(CID)

	print(TID, RACE, LEVEL, EXP)
	
--	local NID = 573 ~ 590	-- ��Ʋ ������ ��ŻNPC

	local MenuID = 36
	ShowMenu(CID, NID, MenuID)

	return 0
end


function OnMessageBox(CID, NID, EID, STEP, bBtnIndex, strString)

	if(EID == 93 and STEP == 0 and bBtnIndex == 1) --��Ÿ��� 10�� ��ȯ
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_1>

		else
			local ItemTID = 40018 --��Ÿ���
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 10)
				then
					local COUNT = 10
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40019 -- ��Ÿ �縻
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>�����۱�ȯ�� �Ϸ�Ǿ����ϴ�.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>�����۱�ȯ�� �Ұ����մϴ�. �����ϰ� �ִ� �����۰����� Ȯ���Ͻ� �� �ٽ� �õ����ּ���.</Message_3>
				end
		end

	elseif(EID == 94 and STEP == 0 and bBtnIndex == 1) --��Ÿ��� 15�� ��ȯ
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_1>
		else
			local ItemTID = 40018--��Ÿ���
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 15)
				then
					local COUNT = 15
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40020 -- ��Ÿ ����
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>�����۱�ȯ�� �Ϸ�Ǿ����ϴ�.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>�����۱�ȯ�� �Ұ����մϴ�. �����ϰ� �ִ� �����۰����� Ȯ���Ͻ� �� �ٽ� �õ����ּ���.</Message_3>
				end
		end

	elseif(EID == 95 and STEP == 0 and bBtnIndex == 1) --��Ÿ��� 20�� ��ȯ
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_1>
		else
			local ItemTID = 40018 --��Ÿ���
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 20)
				then
					local COUNT = 20
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40021 -- ��Ÿ �尩
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>�����۱�ȯ�� �Ϸ�Ǿ����ϴ�.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>�����۱�ȯ�� �Ұ����մϴ�. �����ϰ� �ִ� �����۰����� Ȯ���Ͻ� �� �ٽ� �õ����ּ���.</Message_3>
				end
		end
		
	elseif(EID == 96 and STEP == 0 and bBtnIndex == 1) --�絹�� �� ���� ��ȯ
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_1>
		else

			local InvenItemCountA = CheckItemCount(CID, 40019)
			local InvenItemCountB = CheckItemCount(CID, 40020)
			local InvenItemCountC = CheckItemCount(CID, 40021)

				if(InvenItemCountA >= 1 and InvenItemCountB >= 1 and InvenItemCountC >= 1)
				then
     				RobItem(CID, 40019, 1)
     				RobItem(CID, 40020, 1)
     				RobItem(CID, 40021, 1)

					local ItemTID = 40023 -- �絹�� �� ����
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>�����۱�ȯ�� �Ϸ�Ǿ����ϴ�.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>�����۱�ȯ�� �Ұ����մϴ�. �����ϰ� �ִ� �����۰����� Ȯ���Ͻ� �� �ٽ� �õ����ּ���.</Message_3>
				end
		end




	elseif(EID == 97 and STEP == 0 and bBtnIndex == 1) --��Ÿ��� 50�� ��ȯ
	then
		local EmptyCount = GetInventoryEmptyCount(CID)
		if(EmptyCount < 1)
		then
   			local Group = 6
			ShowMessageBox(CID, NID, 0, 0, 1, Group, 1)
			-- <Message_1>�κ��丮�� �󽽷��� ���� ������ �� �����ϴ�.</Message_1>
		else
			local ItemTID = 40018 --��Ÿ���
			local InvenItemCount = CheckItemCount(CID, ItemTID)

				if(InvenItemCount >= 50)
				then
					local COUNT = 50
					RobItem(CID, ItemTID, COUNT)

					local ItemTID = 40022 -- ��Ÿ��������
					local COUNT = 1
					GiveItem(CID, ItemTID, COUNT)

					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 2)
					-- <Message_2>�����۱�ȯ�� �Ϸ�Ǿ����ϴ�.</Message_2>
				else
					local Group = 6
					ShowMessageBox(CID, NID, 0, 0, 1, Group, 3)
					-- <Message_3>�����۱�ȯ�� �Ұ����մϴ�. �����ϰ� �ִ� �����۰����� Ȯ���Ͻ� �� �ٽ� �õ����ּ���.</Message_3>
				end
		end
		
		

		
	end
	 
	return 0
end





function OnMenu(CID, NID, EID, STEP)
	print(CID, NID, EID, STEP)

	if(EID == 90 and STEP == 0)  -- ��Ÿ ��ű� ��ȯ �Ŵ� �̵� 
	then
		local MenuID = 37
		ShowMenu(CID, NID, MenuID)

	elseif(EID == 91 and STEP == 0)  -- �絹�� ����� ��ȯ �Ŵ� �̵� 
	then
		local MenuID = 38
		ShowMenu(CID, NID, MenuID)

	elseif(EID == 92 and STEP == 0)  -- ��Ÿ�� �������� �Ŵ� �̵� 
	then
		local MenuID = 39
		ShowMenu(CID, NID, MenuID)








              
	elseif(EID == 93 and STEP == 0) --  ��Ÿ ���� 
	then

		local Group = 6
		ShowMessageBox( CID, NID, 93, 0, 3, Group, 4)
            ---- <Message_4>��ȯ�Ͻðڽ��ϱ�?</Message_4>    --
              
	elseif(EID == 94 and STEP == 0) --   ��Ÿ �� 
	then

		local Group = 6
		ShowMessageBox( CID, NID, 94, 0, 3, Group, 4)
              ---- <Message_4>��ȯ�Ͻðڽ��ϱ�?</Message_4>    --
              
	elseif(EID == 95 and STEP == 0) --  ��Ÿ�۷κ� 
	then

		local Group = 6
		ShowMessageBox( CID, NID, 95, 0, 3, Group, 4)
               ---- <Message_4>��ȯ�Ͻðڽ��ϱ�?</Message_4>    --


 
 
  	elseif(EID == 96 and STEP == 0) --  �絹�� �� ���� ��ȯ
	then

		local Group = 6
		ShowMessageBox( CID, NID, 96, 0, 3, Group, 4)
               ---- <Message_4>��ȯ�Ͻðڽ��ϱ�?</Message_4>    --
              	



	elseif(EID == 97 and STEP == 0) --  ��Ÿ ���� ���� ��ȯ
	then

		local Group = 6
		ShowMessageBox( CID, NID, 97, 0, 3, Group, 4)
                ---- <Message_4>��ȯ�Ͻðڽ��ϱ�?</Message_4>    --
              	
              	
              	
	end
	 
	return 0
end
              	