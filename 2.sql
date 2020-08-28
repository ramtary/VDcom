/*
�����:
1)	������� ��� �����, � ���� ���� ������ ���� ��������� ������ � ��� ����, � ������� ���� ����������� ������  01.02.2005
2)	������� ��� ����� � ������� ���� ����������� � ���������� ������  01.02.2005 ���� �� ������ ������:
*/


--1
select b.BookId, Name, Date
from tblBook b
left join tblBookInLibrary l on
	l.BookId = b.BookId
	and l.Date > '01.02.2005'

--2
select b.BookId, Name, Date 
from tblBook b
inner join tblBookInLibrary l on
	l.BookId = b.BookId
where l.Date > '01.02.2005' or l.Date is null