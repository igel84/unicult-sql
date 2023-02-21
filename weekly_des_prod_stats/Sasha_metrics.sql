@set dirty_designers = not u.is_test and u.is_confirmed and is_publisher and not is_admin and le.is_moderate
@set dimensions_for_sdek = (dm.id in (1, 4) or (dm.id in (2) and p.is_moderate_dimensions))
select 
--date
		CURRENT_DATE as "date",
--u
		count(distinct u.id) as "u: all",
		count(distinct u.id) filter(where not u.is_test and not is_admin) as "u: ~test|admin",
		count(distinct u.id) filter(where not u.is_test and not is_admin) as "u: ~(test|admin)&confirmed",
--le
		count(distinct le.id) as "u<-le: all",
		count(distinct le.id) filter(where not u.is_test and le.company_name != '') as "u<-le: ~(empty_name|test)",
		count(distinct le.id) filter(where not u.is_test and le.company_name != '' and u.is_confirmed) as "u<-le: ~(empty_name|test)&confirmed",
		count(distinct le.id) filter(where not u.is_test and le.company_name != '' and u.is_confirmed and u.is_publisher) as "u<-le: ~(empty_name|test)&confirmed&publisher",
		count(distinct le.id) filter(where $dirty_designers) as "u<-le: dirty_designers",
		count(distinct le.id) filter(where $dirty_designers and udm.is_moderate) as "u<-le<-udm: dirty_designers&moderate_udm",
		null as "clear_designers",
--dm
		count(distinct udm.id) filter(where $dirty_designers) as "dd<-udm: all",
		count(distinct udm.id) filter(where $dirty_designers and udm.city != '' and dm.is_active) as "dd<-udm: ~empty_city&active_method",
		count(distinct udm.id) filter(where $dirty_designers and udm.city != '' and dm.is_active and udm.is_moderate) as "dd<-udm: ~empty_city&active_dm&moderate",
		count(distinct udm.id) filter(where $dirty_designers and udm.city != '' and udm.is_active and udm.is_moderate and udm.is_active)
		as "dd<-udm: ~empty_city&active_dm&moderate&active_udm",
--products
		count(distinct p.id) as "p: all",
		count(distinct p.id) filter(where $dirty_designers) as "dd<-p: all",
		count(distinct p.id) filter(where $dirty_designers and p.is_active) as "dd<-p: active",
		count(distinct p.id) filter(where $dirty_designers and p.is_active and not p.is_disparity) as "dd<-p: active&~disparity",
		count(distinct p.id) filter(where $dirty_designers and p.is_active and not p.is_disparity and p.is_moderate) as "dd<-p: active&~disparity&moderate",
		count(distinct p.id) filter(where $dirty_designers and p.is_active and not p.is_disparity and p.is_moderate and $correct_dimensions) as "dd<-p: active&~disparity&moderate&dimensions_for_sdek",
		null as "products_clear"
from users u
left join legal_entities le on u.id = le.user_id
left join user_delivery_methods udm on u.id = udm.user_id
left join delivery_methods dm on dm.id = udm.delivery_method_id
left join products p on u.id = p.user_id