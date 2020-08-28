/*
Ќужно:

1)	ќтобрать активные счета по которым есть проводки как минимум по двум разным активам. ¬ыводимые пол€: CounterpartyID, Name, Cnt(количество уникальных активов по которым есть проводки)
2)	ѕосчитать суммарное число актива, образовавшеес€ на активных счетах, в результате проведенных проводок. ¬ыводимые пол€: CounterpartyID, Name, AssetID, Quantity 
3)	ѕосчитать средний дневной оборот по всем счетам по всем проводкам счита€ что AssetID во всех проводках одинаковый. ¬ыводимые пол€: CounterpartyID, Name, Oborot
4)	ѕосчитать средний мес€чный оборот по всем счетам по всем проводкам счита€ что AssetID во всех проводках одинаковый. ¬ыводимые пол€: CounterpartyID, Name, Oborot
*/

--1

select CounterpartyID, Name, Count(distinct AssetID) Cnt
from tblCount c
left join tblTrans t on
	c.CounterpartyID = t.RcvID or c.CounterpartyID = t.SndID 
where IsActive = 1
group by CounterpartyID, Name
having Count(AssetID) >= 2

--2

select CounterpartyID, Name, AssetID, SUM(Quantity) Quantity
from tblCount c
left join tblTrans t on
	c.CounterpartyID = t.RcvID
where IsActive = 1
group by CounterpartyID, Name, AssetID

--3

select CounterpartyID, Name, AVG(tR.Quantity - tS.Quantity) Oborot
from tblCount c
left join tblTrans tR on
	c.CounterpartyID = tR.RcvID
left join tblTrans tS on
	c.CounterpartyID = tS.SndID
where tR.TransDate = '01.01.2012' and tS.TransDate = '01.01.2012'
group by CounterpartyID, Name

--4

select CounterpartyID, Name, AVG(tR.Quantity - tS.Quantity) Oborot
from tblCount c
left join tblTrans tR on
	c.CounterpartyID = tR.RcvID
left join tblTrans tS on
	c.CounterpartyID = tS.SndID
where (tR.TransDate >= '01.01.2012' and tR.TransDate <= '31.01.2012') and (tS.TransDate >= '01.01.2012' and tS.TransDate <= '31.01.2012')
group by CounterpartyID, Name