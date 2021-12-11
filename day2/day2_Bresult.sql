select inputno, inputtype,
 instruction, 
 amount, 
 aim, 
 x, 
 aim * amount,
 sum(aim * amount) FILTER(where instruction = "forward") over (ROWS UNBOUNDED PRECEDING) as depth, 
 x *  sum(aim * amount) FILTER(where instruction = "forward") over (ROWS UNBOUNDED PRECEDING) as result 
from(
select inputno, inputtype, instruction, amount,
sum(CASE 
WHEN instruction = "forward" THEN 0
WHEN instruction = "up" THEN amount * -1
WHEN instruction = "down" THEN amount
ELSE NULL END) over (ROWS UNBOUNDED PRECEDING) as aim,
sum(amount) filter(where instruction = "forward") over (ROWS UNBOUNDED PRECEDING) as x

from day2 where inputType = "puzzle") a
order by inputno desc limit 1