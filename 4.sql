/*
Нужно:
1)	Требуется отобрать периоды в которых значение Value отличается от значения Value в предыдущем периоде. Выводимые поля: PeriodID, Value. В примере выше должны быть выведены значения 1, 5, 7, 9

2)	Требуется удалить из таблицы периоды в которых значение Value равно значению Value в предыдущем периоде. Выводимые поля: PeriodID, Value. В примере выше должны быть удалены значения 3, 6, 10
*/

--1
select p1.PeriodID, p1.Value
from tblPeriod p1
left join
(select PeriodID, Value, LAG(Value) OVER(ORDER BY PeriodID) as LagValue
from tblPeriod) p2 on
	p1.PeriodID = p2.PeriodID
where p1.Value != p2.LagValue or p2.LagValue is null

--2

select p1.PeriodID, p1.Value
from tblPeriod p1
left join
(select PeriodID, Value, LAG(Value) OVER(ORDER BY PeriodID) as LagValue
from tblPeriod) p2 on
	p1.PeriodID = p2.PeriodID
where p1.Value = p2.LagValue