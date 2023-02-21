--select regexp_matches('a2b3c4', '\w(?=\d)', 'g')
select regexp_replace(
  	'Обхват груди: 88 см
Обхват талии: 75 см
Обхват бедер: 100 см

',
	'[\n\r]{1,}(?=$)',
	''
   )