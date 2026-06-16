select count(*)as total_customer
from telecom_churn;

--1.overall churn rate.
select round(count(case when churn = true then 1 end)*100.0
/ count(*),2)||'%'as churn_rate 
from telecom_churn;
--Insight:
--The overall churn rate is 14.55% meaning that approximately
--15 out of every 100 customers have left the company.
--Highlight the need to identify key factors driving churn.
--Recommendation:
--Identify the customer behaviour,service usage,plan features 
--to identify the main cause of churn.
--Focus on high risk customer segments to reduce churn further.

--2.international_plan vs churn_rate:
select international_plan,count(*)as total_customers,
round(count(case when churn = true then 1 end)
*100.0 / count(*),2)|| '%'as churn_rate
from telecom_churn
group by international_plan
order by international_plan;
--Insights:
--Customers with an international plan have a significantly higher churn rate
--compared to customers without an international_plan.
--This suggests that the international plan is associated with a higher churn rate.
--Recommendations:
--Improve the service quality of the international plan users.
--Review the pricing*and benefits of the international plan.

--3.customer_service_calls vs churn_rate:
select customer_service_calls,count(*)as total_customers,
round(count(case when churn = true then 1 end)*100.0 
/ count(*),2)|| '%'as churn_rate
from telecom_churn
group by customer_service_calls
order by customer_service_calls;
--Insights:
--Customer who make 4 or more service call have a significantly higher churn rate.
--This indicate the unresolved customer issues or customer support may be contributing customer churn.
--Recommendation:
--Investigate the customer issues faced by customers who contact customer service frequently.
--Improve the first call resolution and customer support quality.

--4.voice_mail_plan vs churn_rate:
select voice_mail_plan,count(*)as total_customers,
round(count(case when churn = true then 1 end)*100.0
/ count(*),2)||'%'as churn_rate
from telecom_churn
group by voice_mail_plan;
--Insights:
--Customer with voice mail plan have a significantly lower churn rate
--compared to customers without  a voice mail plan.
--This suggests the voice mail plan may help improve the customer retention.
--Recommendations:
--Promote the voice mail plan to customers who do not currently use it.
--Analyze which features of the voice mail plan contribute to higher customer retention.

--5.average day minutes by churn status
select churn,
round(avg(total_day_minutes),2)as avg_day_minutes
from telecom_churn
group by churn;
--Insights:
--Customers who churn have a significantly higher average daily usage(205.18 min)
--compared to customers who stayed with the company.
--This suggests that high usage customers are more likely to leave the company.
--Recommendation:
--Offer customized plan and discount for high usage customers.
--Review whether the current pricing meets the need of customers with high usage.

--6.average day minutes by churn:
select churn,
round(avg (total_day_charge),2)as avg_day_charge
from telecom_churn
group by churn;
--Insights:
--Customer who churn have a significantly higher average daily charge(34.88)
--Compared to customers who stayed with the company(29.77)
--This suggests that customer with higher daily charges are more likely to leave the company.
--Recommendations:
--Monitor customers with higher charges and implement customers retention.
--Offer cost-effective plans and discount to high charge customers.

--7.Average account length by churn status:
select churn,
round(avg(account_length),2)as avg_account_length
from telecom_churn
group by churn;
--Insights:
--Average account length is very similar for churned and non churned customers.
--This suggests that account length does not significant impact on customer churn.
--RecommendationS:
--Focus on other factors such as international plan,customer service calls etc.
--Do not rely on account length alone to identify customers at risk of churn.

--8.state vs churn rate:
select state ,
round(count(case when churn = true then 1 end)*100.0 
/ count(*),2)as churn_rate
from telecom_churn
group by state
order by churn_rate desc;
--Insights:
--Texas(tx) and new jersey(nj)show the highest customer churn rate.
--Geographic location appears to influence customer retention,
--as churn rate vary significantly across state.
--Recommendation:
--Investigate customer complaint,service quality and competitors activity in these region.
--Focus retention efforts on high churn rate such as texas and new jersey.

--9.total_intl_minutes vs churn rate
select churn,
round(avg(total_intl_minutes),2)as avg_intl_minutes
from telecom_churn
group by churn;
--Insights:
--Customer who churned had a slightly higher average internal call usage (10.82)
--compared to who stayed(10.14 min).
--This indicate that customer with higher communication needs may be more likely to leave the service.
--Recommendations:
--Monitor customer with higher international calls activity and provide targeted retention offers.
--Combine international usage analysis with other factor such as international plan subscription or customer service calls for better prediction.

--10.total_eve_minutes vs churn rate:
select churn,
round(avg(total_eve_minutes),2)as avg_eve_minutes
from telecom_churn
group by churn;
--Insights:
--Churned customer have higher average evening call (209.39)compared to non churned.
--This suggest that customer with higher evening call usage are slightly more likely to churn.
--Recommendation:
--Monitor customer with high evening call usage and evaluate 
--whether pricing plan and service quality meet their needs.
--Consider targeted retention offers for heavy evening users.






















