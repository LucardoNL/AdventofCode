SELECT count(*) FROM (
SELECT inputno, threewindowsum, lag(threewindowsum) over (order by inputno) as lag FROM (
SELECT *, depth + lag + lead as threewindowsum from (
SELECT
inputno,
inputtype, 
depth, 
lag(depth) over (order by inputno) as lag, 
lead(depth) over (order by inputno) as lead
FROM day1 
where inputType = "puzzle") a ) b ) c where threewindowsum > lag