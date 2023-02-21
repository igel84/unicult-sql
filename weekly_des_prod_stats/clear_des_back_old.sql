SELECT current_date  as date,
	   null as des_desk,
	   count(distinct users.id),
	   null as measure_diff0
FROM "users"
LEFT OUTER JOIN "legal_entities" ON "legal_entities"."user_id" = "users"."id"
LEFT OUTER JOIN "products" ON "products"."user_id" = "users"."id"
LEFT OUTER JOIN "user_delivery_methods" ON "user_delivery_methods"."user_id" = "users"."id"
WHERE "users"."is_publisher" = true and
      "users"."is_test" = false and
      "legal_entities"."is_moderate" = true and
      "products"."is_moderate" = true and
      "products"."is_disparity" = false and
      "products"."is_moderate_dimensions" = true and
      "user_delivery_methods"."id" IS NOT null