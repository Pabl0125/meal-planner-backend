ALTER TABLE platos RENAME TO dishes;
ALTER TABLE dishes RENAME COLUMN nombre TO name;
ALTER TABLE dishes RENAME COLUMN descripcion TO description;

ALTER TABLE etiquetas RENAME TO tags;
ALTER TABLE tags RENAME COLUMN nombre TO name;

ALTER TABLE plato_etiquetas RENAME TO dish_tags;
ALTER TABLE dish_tags RENAME COLUMN plato_id TO dish_id;
ALTER TABLE dish_tags RENAME COLUMN etiqueta_id TO tag_id;
