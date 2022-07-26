-- 문제1. ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다.
-- 동물 보호소에 들어온 모든 동물의 정보를 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요.
select * from animal_ins a order by a.animal_id;

-- 문제2. 동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 ANIMAL_ID 역순으로 보여주세요.
select name, intake_date from animal_ins order by animal_id desc;

-- 문제3. 동물 보호소에 들어온 동물 중 아픈 동물의 아이디와 이름을 조회하는 SQL 문을 작성해주세요.
select animal_id, name from animal_ins where intake_condition = 'sick';

-- 문제4. 동물 보호소에 들어온 동물 중 젊은(normal) 동물의 아이디와 이름을 조회하는 SQL 문을 작성해주세요.
-- 이때 결과는 아이디 순으로 조회해주세요.
select animal_id, name from animal_ins where intake_condition = 'normal';

-- 문제5. 동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요.
select animal_id, name from animal_ins order by animal_id;

-- 문제6. 동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성해주세요.
-- 단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.
select animal_id, name, intake_date from animal_ins
  order by name, intake_date desc;

-- 문제7. 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.
select name from animal_ins
-- order by intake_date limit 1;
where intake_date = (select min(intake_date) from animal_ins);

-- 문제8. 가장 최근에 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.
select * from animal_ins
-- order by intake_date desc limit 1;
where intake_date = (select max(intake_date) from animal_ins);

-- 문제9.동물 보호소에 동물이 몇 마리 들어왔는지 조회하는 SQL 문을 작성해주세요.
select count(animal_id) from animal_ins;

-- 문제10. 동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요.
-- 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.
select count(distinct name) from animal_ins where name is not NULL;

-- 문제11. 동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요.
-- 이때 고양이를 개보다 먼저 조회해주세요. (union)

select animal_type, count(*) from animal_ins where animal_type='cat'
union
select animal_type, count(*) from animal_ins where animal_type='dog';


-- 문제12.[난이도:상] 동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는
-- SQL문을 작성해주세요. 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.
select name 이름, count(*) '이름이 쓰인 횟수'
from animal_ins
group by name
having count(*)>1 and name is not NULL;

-- 문제13. ANIMAL_OUTS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다.
-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.
-- 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 시간대 순으로 정렬해야 합니다.
select count(*) from animal_outs;

select a.hour, count(a.animal_id) count
from (select date_format(outcome_date, '%H')hour, animal_id from animal_outs) a
group by a.HOUR
having a.hour > 8 and a.hour < 20
order by a.hour;

select substring(outcome_date,12,5)as '시간' from animal_outs;
SELECT substring(outcome_date,12,2) AS HOUR, COUNT(substring(outcome_date,12,5)) AS COUNT
FROM ANIMAL_OUTS
WHERE substring(outcome_date,12,5) >= 9 AND substring(outcome_date,12,5) < 20
GROUP BY HOUR(outcome_date)
ORDER BY substring(outcome_date,12,5);


SELECT HOUR(outcome_date) AS HOUR, COUNT(HOUR(outcome_date)) AS COUNT FROM ANIMAL_OUTS
WHERE HOUR(outcome_date) >= 9 AND HOUR(outcome_date) < 20
GROUP BY HOUR(outcome_date)
ORDER BY HOUR(outcome_date);

-- 문제14. 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.
-- 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 시간대 순으로 정렬해야 합니다.

select date_format(outcome_date, '%H')hour, count(animal_id) from animal_outs
group by hour
order by hour;

SELECT HOUR(outcome_date) AS HOUR, COUNT(HOUR(outcome_date)) AS COUNT FROM ANIMAL_OUTS
-- WHERE HOUR(outcome_date) >= 9 AND HOUR(outcome_date) < 24
GROUP BY HOUR(outcome_date)
ORDER BY HOUR(outcome_date);

select DATE_FORMAT(outcome_date, '%H') from animal_outs a;