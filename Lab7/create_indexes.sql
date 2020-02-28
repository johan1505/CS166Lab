CREATE INDEX on_hand_nyc_index
ON part_nyc
USING btree
(on_hand);


CREATE INDEX color_sfo_index
ON part_sfo
USING btree
(color);

CREATE INDEX color_nyc_index
on part_nyc
USING btree
(color);

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

CREATE INDEX part_number_nyc_index
ON part_nyc
USING btree
(part_number);

CREATE INDEX part_number_sfo_index
ON part_sfo
USING btree
(part_number);
