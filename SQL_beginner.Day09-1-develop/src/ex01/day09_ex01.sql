create or replace function fnc_trg_person_update_audit() returns trigger AS $person_audit$
    begin
        if (tg_op = 'UPDATE') then
            insert into person_audit(created, type_event, row_id, name, age, gender, address)
            values (current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
        end if;
        return null;
    end;
$person_audit$ language plpgsql;

create trigger trg_person_update_audit after update on
    person
for each row execute function fnc_trg_person_update_audit();

update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' WHERE id = 10;