drop trigger if exists total_credit;
delimiter //
create trigger total_credit
after insert on register_details for each row
begin
	declare total int;
    select sum(Credit) into total from register_details
    join sections using (section_id)
    join courses using (couse_id)
    where register_id = new.register_id;
    
    update registers set total_credit = total 
    where register_id = new.register_id;
end//
delimiter ;

show triggers;