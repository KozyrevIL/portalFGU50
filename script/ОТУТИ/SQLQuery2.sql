	select '���', count(*) "���-��",      
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateCTY is null  then '� ������' 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateCTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateCTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateCTY is not null and 
				 dbo.to_date(ready_dateCTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateCTY is not null and 
				 dbo.to_date(ready_dateCTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateCTY is not null then '������'
		   end "���������"
	from OTUTI_journal a where reg_date>'2013-09-11' and reg_date<'2013-10-08'
	group by 
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateCTY is null then '� ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateCTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateCTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateCTY is not null and 
				 dbo.to_date(ready_dateCTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateCTY is not null and 
				 dbo.to_date(ready_dateCTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateCTY is not null then '������'
		   end
union
	select '������', count(*) "���-��",      
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateRosreh is null  then '� ������' 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateRosreh is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateRosreh is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateRosreh is not null and 
				 dbo.to_date(ready_dateRosreh) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateRosreh is not null and 
				 dbo.to_date(ready_dateRosreh) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateRosreh is not null then '������'
		   end "���������"
	from OTUTI_journal a where reg_date>'2013-09-11' and reg_date<'2013-10-08'
	group by 
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateRosreh is null then '� ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateRosreh is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateRosreh is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateRosreh is not null and 
				 dbo.to_date(ready_dateRosreh) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateRosreh is not null and 
				 dbo.to_date(ready_dateRosreh) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateRosreh is not null then '������'
		   end
union
	select '����', count(*) "���-��",      
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateChBTY is null  then '� ������' 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateChBTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateChBTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateChBTY is not null and 
				 dbo.to_date(ready_dateChBTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateChBTY is not null and 
				 dbo.to_date(ready_dateChBTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateChBTY is not null then '������'
		   end "���������"
	from OTUTI_journal a where reg_date>'2013-09-11' and reg_date<'2013-10-08'
	group by 
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateChBTY is null then '� ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateChBTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateChBTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateChBTY is not null and 
				 dbo.to_date(ready_dateChBTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateChBTY is not null and 
				 dbo.to_date(ready_dateChBTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateChBTY is not null then '������'
		   end
union
	select '����', count(*) "���-��",      
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateOBTY is null  then '� ������' 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateOBTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateOBTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateOBTY is not null and 
				 dbo.to_date(ready_dateOBTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateOBTY is not null and 
				 dbo.to_date(ready_dateOBTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateOBTY is not null then '������'
		   end "���������"
	from OTUTI_journal a where reg_date>'2013-09-11' and reg_date<'2013-10-08'
	group by 
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateOBTY is null then '� ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateOBTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateOBTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateOBTY is not null and 
				 dbo.to_date(ready_dateOBTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateOBTY is not null and 
				 dbo.to_date(ready_dateOBTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateOBTY is not null then '������'
		   end
union
	select '����', count(*) "���-��",      
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateVBTY is null  then '� ������' 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateVBTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateVBTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateVBTY is not null and 
				 dbo.to_date(ready_dateVBTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateVBTY is not null and 
				 dbo.to_date(ready_dateVBTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateVBTY is not null then '������'
		   end "���������"
	from OTUTI_journal a where reg_date>'2013-09-11' and reg_date<'2013-10-08'
	group by 
		   case 
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) > dbo.to_date(getdate()) and  ready_dateVBTY is null then '� ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) = dbo.to_date(getdate()) and  ready_dateVBTY is null then '��������� ���� � ������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateVBTY is null then '��������� � ��� ��� � ������'        
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateVBTY is not null and 
				 dbo.to_date(ready_dateVBTY) > dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������ � ���������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) < dbo.to_date(getdate()) and ready_dateVBTY is not null and 
				 dbo.to_date(ready_dateVBTY) <= dbo.WorkdaysSelectedControlDay1(reg_date,5) then '������'
			when dbo.WorkdaysSelectedControlDay1(reg_date,5) >= dbo.to_date(getdate()) and ready_dateVBTY is not null then '������'
		   end
