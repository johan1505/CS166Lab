CREATE INDEX on_hand_nyc_index
ON part_nyc
USING btree
(on_hand);

CREATE INDEX on_hand_sfo_index
ON part_sfo
USING btree
(on_hand);


CREATE INDEX supplie_id_index
ON supplier
USING btree
(supplier_id);


CREATE INDEX supplier_parts_nyc_index
ON part_nyc
USING btree
(supplier);

CREATE INDEX supplier_parts_sfo_index
ON part_sfo
USING btree
(supplier);

CREATE INDEX number_parts_nyc_index
ON part_nyc
USING btree
(part_number);

CREATE INDEX number_parts_sfo_index
ON part_sfo
USING btree
(part_number);