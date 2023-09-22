SELECT 
r.date,
s.first_name,
s.last_name,
s.hourly_rate,
sh.start_time,
sh.end_time,
((HOUR(TIMEDIFF(sh.end_time, sh.start_time))*60) + (MINUTE(TIMEDIFF(sh.end_time, sh.start_time))))/60 AS Hours_In_Shift,
(((HOUR(TIMEDIFF(sh.end_time, sh.start_time))*60) + (MINUTE(TIMEDIFF(sh.end_time, sh.start_time))))/60) * s.hourly_rate AS Staff_Cost
FROM
rota r
JOIN staff s
USING (staff_id)
JOIN shift sh
USING (shift_id)

