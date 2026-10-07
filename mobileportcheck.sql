create database mobileportcheck;
use mobileportcheck;
create table user1(Mobile_Number bigint unique, Network char(6), Customer_Name varchar(30), Aadhar_Number bigint unique, Port int, Sim_Status char(8));
insert into user1(Mobile_Number, Network, Customer_Name, Aadhar_Number, Port, Sim_Status) values(1234567890, 'Jio', 'T.Sujith', 123456789123, 2, 'Active');
insert into user1 values(9876543210, 'Airtel', 'P.Priya', 987654321012, 1, 'Inactive');
insert into user1 values(6541235783, 'Jio', 'T.Kiran', 145278963541, 2, 'Active');
insert into user1 values(9947885612, 'Airtel', 'T.Lakshmi', 547896325412, 2, 'Active');
insert into user1 values(6654412351, 'Jio', 'B.Bhagya', 547896512301, 1, 'Inactive');
insert into user1 values(7896544155, 'Airtel', 'S.Navya', 456987123541, 2, 'Active');
insert into user1 values(2544788652, 'Jio', 'G.Ganga', 547896512340, 2, 'Active');
insert into user1 values(2247885514, 'Airtel', 'K.Hari', 547896023402, 1, 'Inactive');
insert into user1 values(2254701364, 'Jio', 'Sk.Shahid', 457896254102, 2, 'Active');
insert into user1 values(5547893301, 'Airtel', 'K.Kavya', 478965120236, 2, 'Active');
select * from user1;

----- Now adding queries ---------

select Mobile_Number, Network, Customer_Name, Aadhar_Number, Port, Sim_Status, CASE port when 0 then 'Not Ported' when 1 then 'Jio to Airtel' when 2 then 'Airtel to Jio' else 'Unknown' end as Port_Direction from user1;
select Customer_Name from user1 where Aadhar_Number=123456789123;
select Customer_Name, Port, Sim_Status from user1 where port=1;
select Customer_Name, Port, Aadhar_Number from user1 order by Customer_Name asc;
select count(Customer_Name) from user1;
select * from user1 where Customer_Name like 'T%';
select count(Port) from user1;
select count(*) from user1;
select Mobile_Number, Customer_Name, Port, Sim_Status, Row_Number() over(partition by Aadhar_Number order by Customer_Name desc) as Aadhar_Number_Row from user1;
