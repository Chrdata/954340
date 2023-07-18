use food_order;
drop procedure if exists ass4;
delimiter //
create procedure ass4()
begin
	insert into foods values (1, 'Noodles', 'Food', 50);
    insert into orders values (1, 1, '2023-08-08', '12:00:00', 100);
    insert into order_details values (1, 1, 1, 2);

	insert into foods values (2, 'Pizza', 'Food', 1500);
    insert into orders values (2, 2, '2023-08-08', '20:00:00', 1500);
    insert into order_details values (2, 2, 2, 1);
end//
delimiter ;

call ass4();

create view OrderAndOrderDetail as
select order_id, table_number, date, time, sum(quantity*price) AS total_price
from orders 
join order_details using (order_id)
join foods using (food_id)
group by order_id
order by date desc;

select * from OrderAndOrderDetail;

drop view if exists OrderAndOrderDetail;
select * from OrderAndOrderDetail LIMIT 0, 1000
