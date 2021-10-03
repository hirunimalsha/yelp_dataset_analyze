-- analyze for the yelp dataset

-- checking the null values
select *  from user where id is null;
	
-- cities with most reviews
select city,sum(review_count)  from Business
group by city
order by sum(review_count) desc;

-- top 3 users based on their total number of reviews
select name, review_count
from user
order by review_count desc
limit 3;

-- reviews correlation with fans
select fans,avg(review_count) as review_count_ang from user
group by fans
order by review_count_ang desc;

-- more reviews with the word "love" or with the word "hate" in them	
select count(*) from review
-- where text like '%love%'
where text like '%hate%';

-- top 10 users with the most fans:
select id,name,fans from user
order by fans desc
limit 10;

-- comparition between toronto city and nightlife category
select b.id,city,category,review_count,stars,hours,
latitude,longitude
from business as b
inner join category as c
on b.id=c.business_id
join hours as h
on b.id=h.business_id
where city='Toronto'and
category='Nightlife';

-- diferences in opened and closed 
select count(is_open) as num, category 
from business as busi 
inner join category as cat
 on busi.id=cat.business_id
where is_open=1
group by category
order by num desc;

select category,is_open, review_count 
from business as busi 
inner join category as cat
 on busi.id=cat.business_id
where is_open=1
group by category
order by review_count desc;

-- analysis for the categories with most reviews
select category,stars,review_count,is_open,city from category as cat
left join business as busi
on busi.id=cat.business_id 
where is_open = 1
group by category
order by review_count desc;
