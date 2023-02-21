select item_id, replace((string_to_array(old_object_changes, E'\n'))[7],'- ', '')::date as history_date, max(replace((string_to_array(old_object_changes, E'\n'))[4],'- ', '')::int) as history_status 
from versions v 
where item_type = 'Order' and (string_to_array(old_object_changes, E'\n'))[2] = 'status:'
group by item_id, history_date