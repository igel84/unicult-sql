WITH product_sizes_temp AS
(SELECT product_id, SUM(count) as count FROM product_sizes  WHERE in_stock = TRUE GROUP BY product_id ORDER BY product_id)
SELECT * FROM products
	JOIN product_sizes_temp ON products.id = product_id 
	JOIN users ON products.user_id = users.id
	JOIN legal_entities ON products.user_id = legal_entities.user_id
	WHERE products.is_active = TRUE AND products.is_moderate AND count>0 
	      AND users.is_test = FALSE AND users.is_confirmed = TRUE AND users.is_publisher = TRUE
		  AND legal_entities.is_moderate = TRUE
		  AND products.user_id IN														
		  (SELECT user_id FROM user_delivery_methods 
 		   JOIN delivery_methods ON delivery_method_id = delivery_methods.id 
 		   WHERE user_delivery_methods.is_active =TRUE AND user_delivery_methods.is_moderate = TRUE AND delivery_methods.is_active = TRUE 
     			  AND delivery_methods.name IN ('Boxberry','Почта России'))
UNION				  
SELECT * FROM products
	JOIN product_sizes_temp ON products.id = product_id 
	JOIN users ON products.user_id = users.id
	JOIN legal_entities ON products.user_id = legal_entities.user_id
	WHERE products.is_active = TRUE AND products.is_moderate AND products.is_moderate_dimensions = TRUE AND count >0
	      AND users.is_test = FALSE AND users.is_confirmed = TRUE AND users.is_publisher = TRUE
		  AND legal_entities.is_moderate = TRUE
		  AND products.user_id IN														
		  (SELECT user_id FROM user_delivery_methods 
 		   JOIN delivery_methods ON delivery_method_id = delivery_methods.id 
 		   WHERE user_delivery_methods.is_active =TRUE AND user_delivery_methods.is_moderate = TRUE AND delivery_methods.is_active = TRUE 
     			  AND delivery_methods.name IN ('СДЭК'))
UNION				  
SELECT * FROM products
	JOIN product_sizes_temp ON products.id = product_id 
	JOIN users ON products.user_id = users.id
	JOIN legal_entities ON products.user_id = legal_entities.user_id
	WHERE products.is_active = TRUE AND products.is_moderate AND is_preorder = TRUE 
	      AND users.is_test = FALSE AND users.is_confirmed = TRUE AND users.is_publisher = TRUE
		  AND legal_entities.is_moderate = TRUE
		  AND products.user_id IN														
		  (SELECT user_id FROM user_delivery_methods 
 		   JOIN delivery_methods ON delivery_method_id = delivery_methods.id 
 		   WHERE user_delivery_methods.is_active =TRUE AND user_delivery_methods.is_moderate = TRUE AND delivery_methods.is_active = TRUE 
     			  AND delivery_methods.name IN ('Boxberry','Почта России'))
UNION				  
SELECT * FROM products
	JOIN product_sizes_temp ON products.id = product_id 
	JOIN users ON products.user_id = users.id
	JOIN legal_entities ON products.user_id = legal_entities.user_id
	WHERE products.is_active = TRUE AND products.is_moderate AND products.is_moderate_dimensions = TRUE AND is_preorder = TRUE 
	      AND users.is_test = FALSE AND users.is_confirmed = TRUE AND users.is_publisher = TRUE
		  AND legal_entities.is_moderate = TRUE
		  AND products.user_id IN														
		  (SELECT user_id FROM user_delivery_methods 
 		   JOIN delivery_methods ON delivery_method_id = delivery_methods.id 
 		   WHERE user_delivery_methods.is_active =TRUE AND user_delivery_methods.is_moderate = TRUE AND delivery_methods.is_active = TRUE 
     			  AND delivery_methods.name IN ('СДЭК'))