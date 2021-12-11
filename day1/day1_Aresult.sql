SELECT inputtype, count(*) FROM (
SELECT inputtype, depth, lag(depth) over (order by inputno) as lag FROM day1) as a where depth > lag group by inputType;

