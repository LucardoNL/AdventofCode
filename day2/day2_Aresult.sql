SELECT inputtype, forwardsum, downsum, upsum, sum(forwardsum) as horizontal, downsum-upsum as vertical, sum(forwardsum) * (downsum-upsum) as position from (
SELECT inputType,
sum(amount) filter(WHERE instruction = "forward") as forwardsum, 
sum(amount) filter(WHERE instruction = "down") as downsum, 
sum(amount) filter(WHERE instruction = "up") as upsum 
from day2 where inputtype = "puzzle" group by inputType) a

