INSERT INTO product_features ON CONFLICT (id) DO UPDATE SET (product_id, feature_id, value, percentage, created_at, updated_at) = 
															(excluded.product_id, excluded.feature_id, excluded.value, excluded.percentage, excluded.created_at, excluded.updated_at)
SELECT *
FROM product_features_dump_v1 pf
WHERE pf.feature_id = 2;