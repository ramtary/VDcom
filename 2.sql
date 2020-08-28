/*
Нужно:
1)	Выбрать все книги, а поле дата должно быть заполнено только у тех книг, у которых дата регистрации больше  01.02.2005
2)	Выбрать все книги у которых дата регистрации в библиотеке больше  01.02.2005 либо не задана вообще:
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