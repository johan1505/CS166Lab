CREATE INDEX on_hand_nyc_index
ON part_nyc
[USING BTREE]
(on_hand)

CREATE INDEX on_hand_sfo_index
ON part_sfo
[USING BTREE]
(on_hand)


CREATE INDEX supplie_id_index
ON supplier
[USING BTREE]
(supplier_id)


CREATE INDEX supplier_parts_nyc_index
ON part_nyc
[USING BTREE]
(supplier)

CREATE INDEX supplier_parts_sfo_index
ON part_sfo
[USING BTREE]
(supplier)

CREATE INDEX number_parts_nyc_index
ON part_nyc
[USING BTREE]
(part_number)

CREATE INDEX number_parts_sfo_index
ON part_sfo
[USING BTREE]
(part_number)