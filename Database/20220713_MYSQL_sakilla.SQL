/*예제1 film_next 테이블에서 title에 ice있고 description에 drama 있는 필름아이디film_id*/
select film_id, title, description from film_text
	where title like '%ice%' and description like '%drama%';

/*예제2 actor 테이블에서 first_name가장 앞글자 A, last_name마지막 글자 N*/
select actor_id, first_name, last_name from actor a
where first_name like 'A%'
	and last_name like '%N';

/*예제3 film 테이블에서 rating이 R인 film을 length 긴 상위 10개 내림차순으로 film_id, title, length, rating 조회*/
select film_id, title, length, rating from film
	where rating='R'
	order by length desc
	limit  10;

/*예제4 film 테이블에서 어떤 등급이 있는지 조회 중복 제외*/
select distinct rating from film a; -- distinct를 컬럼명 앞에

/*예제5 film 상영시간이 60~120분인 필름 중 description에 robot이 있는 영화를
짧은 상영시간 순으로 11위에서 13위까지 film_id, title, description, length 조회 */
select film_id, title, description, length from film
where description like '%robot%' and (length between 60 and 120)
order by length limit 10, 3; -- = limit 3 offset 10

/*예제6 film_list_view 뷰에서 카테고리가 sci-fi,animation,drama가 아니고
배우가 ed chase또는 kevin bloom이 포함된 영화리스트에서 상영시간이 긴 순서대로 5개*/

select title, description, category, length, actors from film_list
	where category not in('sci-fi', 'drama','animation')
	and (actors like '%ed chase%' or actors like '%kevin bloom%')
	order by length desc limit 5;
