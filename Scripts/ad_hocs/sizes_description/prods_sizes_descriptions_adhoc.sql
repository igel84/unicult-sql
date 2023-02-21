UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'[\s\.\n\r\x2028]+$',
	'',
	'g'
   )
where description ~ '[\s\.\n\r\x2028]+$';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'^[\s\.\n\r\x2028]+',
	'',
	'g'
   )
where description ~ '^[\s\.\n\r\x2028]+';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'(?<=^)[\n\r\x2028]{1,}',
	'',
	'g'
   )
where description ~'(?<=^)[\n\r\x2028]{1,}';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'(?<=.)[\n\r\x2028]{1,}(?=.)',
	',',
	'g'
   )
where description ~ '(?<=.)[\n\r\x2028]{1,}(?=.)';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	';',
	',',
	'g'
   )
where description ~ ';';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'[  ]{1,}(?=[\x78\,\.\-\r\n])',
	'',
	'g'
   )
where description ~ '[  ]{1,}(?=[\x78\,\.\-\r\n])';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'(?<=[\x78\,\.\-\r\n])[  ]{1,}',
	'',
	'g'
   )
where description ~ '(?<=[\x78\,\.\-\r\n])[  ]{1,}';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'(?<=\d),(?=\d)',
	'.',
	'g'
   )
where description ~'(?<=\d),(?=\d)';

UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'см(?=[А-яа-я])',
	'см,',
	'g'
   )
where description ~ 'см(?=[А-яа-я])';
UPDATE 
   product_sizes
SET 
   description  = regexp_replace(
  	description,
	'(?<=\d)см',
	' см',
	'g'
   )
where description ~ '(?<=\d)см';
select p.id, ps.description 
from product_sizes ps
left join products p on ps.product_id = p.id
order by length(ps.description) desc;