
# SQL Questions to solve 

#1. Retrieve all successful bookings.
select * from bookings 
where Booking_Status ='Success';

#2. Find the average ride distance for each vehicle type.
select Vehicle_Type , round(avg(Ride_Distance),2) as average_ride_distance 
from bookings 
group by 1;

#3.	Calculate the total number of Canceled by Customer.
select count(*) from bookings 
where cancelled_Rides_by_Customer is not null;


#4. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) as total_rides_cancelled from bookings 
where cancelled_Rides_by_Driver = 'Personal & Car related issue';


#5. List the top 5 customers who booked the highest number of rides.
select Customer_ID , count(Booking_ID) as total_bookings 
from bookings
group by Customer_ID 
order by total_bookings desc 
limit 5;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings.
select  Vehicle_Type , max(Driver_Ratings) ,min(Driver_Ratings)
from bookings 
where Vehicle_Type ='Prime Sedan';

#7. Retrieve all rides where payment was made using UPI.
select * from bookings where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type.
select Vehicle_Type , round(avg(Customer_Rating),2) as average_customer_rating
from bookings group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully.
 select Booking_Status , sum(Booking_Value) as Total_booking_value 
 from bookings 
 where Booking_Status='Success';
 
#10. List all incomplete rides along with the reason.
select Booking_ID , Incomplete_Rides_Reason from bookings where Incomplete_Rides ='Yes' ;

#11. Identify the top 3 pickup locations with the highest ride demand.

select Pickup_Location , count(Booking_ID) as total_rides 
from bookings 
group by Pickup_Location 
order by count(Booking_ID) desc
limit 3 ;


