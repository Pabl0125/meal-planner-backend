-- Labels Insertion
INSERT INTO tags (name) VALUES 
('Verdura'),
('Fruta'),
('Carne'),
('Pescado'),
('Lacteos'),
('Frutos Secos'),
('Patatas'),
('Huevos'),
('Aceite'),
('Cereales'),
('Legumbres'),
('Carne Roja'),
('Carne Blanca'),
('Pescado Azul'),
('Pescado Blanco'),
('Marisco'),
('Setas'),
('Arroz'),
('Pasta'),
('Bocadillos') ON CONFLICT (name) DO NOTHING;



-- Meals & Tag Relationships Insertion
INSERT INTO dishes (name, description) SELECT 'Pimientos rellenos', 'Pimientos asados y rellenos, típicamente de carne picada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pimientos rellenos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pimientos rellenos' AND t.name IN ('Carne', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con verduras', 'Tortilla francesa o española preparada con mezcla de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con verduras' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pasta con boloñesa', 'Plato de pasta servido con salsa boloñesa a base de carne picada y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pasta con boloñesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pasta con boloñesa' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Crema de verduras', 'Sopa triturada y suave de diferentes verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Crema de verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Crema de verduras' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Salmón a la plancha con ensalada simple', 'Filete de salmón hecho a la plancha acompañado de una ensalada básica.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Salmón a la plancha con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Salmón a la plancha con ensalada simple' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con espárragos y setas', 'Huevos a la plancha acompañados de espárragos y setas salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con espárragos y setas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con espárragos y setas' AND t.name IN ('Huevos', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lentejas guisadas', 'Plato de cuchara tradicional de lentejas guisadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lentejas guisadas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lentejas guisadas' AND t.name IN ('Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada completa', 'Ensalada con lechuga, tomate, cebolla, atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada completa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada completa' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo al horno con verduras', 'Piezas de pollo asadas al horno junto con una guarnición de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo al horno con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo al horno con verduras' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Guisantes con jamón', 'Guisantes salteados con taquitos de jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Guisantes con jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Guisantes con jamón' AND t.name IN ('Carne', 'Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado cocido con patatas y judías', 'Pescado blanco cocido servido con patatas y judías verdes.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado cocido con patatas y judías');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado cocido con patatas y judías' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tosta o bocadillo', 'Rebanada de pan tostado o bocadillo relleno al gusto.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tosta o bocadillo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tosta o bocadillo' AND t.name IN ('Bocadillos', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lomo de cerdo con ensalada simple', 'Filetes de lomo de cerdo cocinados a la plancha servidos con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lomo de cerdo con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lomo de cerdo con ensalada simple' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto con espárragos trigueros y gambas', 'Huevos revueltos cocinados con espárragos trigueros y gambas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto con espárragos trigueros y gambas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto con espárragos trigueros y gambas' AND t.name IN ('Huevos', 'Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pulpo, langostinos, aguacate y patata', 'Ensalada fría preparada con pulpo, langostinos, aguacate y patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pulpo, langostinos, aguacate y patata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pulpo, langostinos, aguacate y patata' AND t.name IN ('Marisco', 'Patatas', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de ternera a la plancha con ensalada simple', 'Filete de ternera hecho a la plancha acompañado de una pequeña ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de ternera a la plancha con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de ternera a la plancha con ensalada simple' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Merluza en salsa de mostaza con patata cocida', 'Pescado blanco (merluza) servido en salsa de mostaza con patatas cocidas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Merluza en salsa de mostaza con patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Merluza en salsa de mostaza con patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con jamón, queso y vegetales', 'Tortilla española o francesa rellena de jamón, queso y vegetales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con jamón, queso y vegetales');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con jamón, queso y vegetales' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Garbanzos guisados', 'Plato de cuchara con garbanzos guisados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Garbanzos guisados');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Garbanzos guisados' AND t.name IN ('Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos asados con atún en aceite', 'Ensalada a base de pimientos asados y atún en conserva con aceite.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos asados con atún en aceite');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos asados con atún en aceite' AND t.name IN ('Aceite', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con pisto y arroz blanco', 'Combinación de pisto de verduras, huevos a la plancha y una guarnición de arroz.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con pisto y arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con pisto y arroz blanco' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de pollo con verduras a la plancha', 'Brochetas intercalando trozos de pollo y verduras, cocinadas a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de pollo con verduras a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de pollo con verduras a la plancha' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco con patatas fritas', 'Tira de asado a la parrilla servido con patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco con patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco con patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos cocidos con patata, brócoli y atún', 'Huevos duros servidos con patata cocida, brócoli y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos cocidos con patata, brócoli y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos cocidos con patata, brócoli y atún' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado plancha con ensalada simple', 'Pescado a la plancha servido con una pequeña ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado plancha con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado plancha con ensalada simple' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas gratinadas con jamón y queso', 'Espinacas cocinadas y gratinadas al horno con jamón y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas gratinadas con jamón y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas gratinadas con jamón y queso' AND t.name IN ('Carne', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo plancha con verduras', 'Pechuga o contramuslo de pollo a la plancha servido con verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo plancha con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo plancha con verduras' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lentejas con verduras', 'Lentejas estofadas con distintas verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lentejas con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lentejas con verduras' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos asados y agujas en aceite', 'Ensalada fría de pimientos asados acompañada de agujas (pescado) en aceite.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos asados y agujas en aceite');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos asados y agujas en aceite' AND t.name IN ('Aceite', 'Pescado', 'Pescado Azul', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado cocido con patata', 'Pescado cocido servido con patata hervida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado cocido con patata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado cocido con patata' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Bocadillo tosta o sandwich', 'Bocadillo, tostada o sándwich relleno.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Bocadillo tosta o sandwich');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Bocadillo tosta o sandwich' AND t.name IN ('Bocadillos', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensaladilla rusa', 'Mezcla de patata cocida, zanahoria, guisantes, atún y huevo duro con mayonesa.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensaladilla rusa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensaladilla rusa' AND t.name IN ('Aceite', 'Huevos', 'Legumbres', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con jamón, vegetales y queso', 'Tortilla de huevo rellena o acompañada de jamón, queso y vegetales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con jamón, vegetales y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con jamón, vegetales y queso' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha con verduras salteadas', 'Pechuga de pollo a la plancha acompañada de verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha con verduras salteadas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha con verduras salteadas' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con provolone y tomate', 'Espinacas cocinadas con queso provolone y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con provolone y tomate');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con provolone y tomate' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con arroz blanco', 'Huevos a la plancha acompañados de arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con arroz blanco' AND t.name IN ('Arroz', 'Cereales', 'Huevos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pimientos del piquillo rellenos de atún', 'Pimientos del piquillo rellenos de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pimientos del piquillo rellenos de atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pimientos del piquillo rellenos de atún' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con patata y brócoli', 'Pescado a la plancha acompañado de patata cocida y brócoli.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con patata y brócoli');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con patata y brócoli' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Bocata', 'Bocadillo clásico con pan, embutido o carne y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Bocata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Bocata' AND t.name IN ('Bocadillos', 'Carne', 'Cereales', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pasta boloñesa', 'Plato de pasta servido con salsa boloñesa a base de carne picada y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pasta boloñesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pasta boloñesa' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada completa', 'Ensalada con lechuga, tomate, cebolla, atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada completa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada completa' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la brasa con ensalada', 'Pescado asado a la brasa acompañado de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la brasa con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la brasa con ensalada' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco con patatas', 'Churrasco de carne a la parrilla servido con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Garbanzos guisados', 'Plato de cuchara con garbanzos guisados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Garbanzos guisados');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Garbanzos guisados' AND t.name IN ('Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pisto con huevos a la plancha', 'Pisto de verduras (calabacín, pimiento, tomate, cebolla) acompañado de huevos a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pisto con huevos a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pisto con huevos a la plancha' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con ensalada y patata cocida', 'Pescado a la plancha acompañado de ensalada y patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con ensalada y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con ensalada y patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo plancha con verduras', 'Pechuga o contramuslo de pollo a la plancha servido con verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo plancha con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo plancha con verduras' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espárragos blancos con salmón', 'Espárragos blancos acompañados de salmón.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espárragos blancos con salmón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espárragos blancos con salmón' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con arroz', 'Huevos a la plancha servidos con arroz.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con arroz' AND t.name IN ('Arroz', 'Cereales', 'Huevos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Guisantes con jamón', 'Guisantes salteados con taquitos de jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Guisantes con jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Guisantes con jamón' AND t.name IN ('Carne', 'Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías, zanahorias y patatas con ventresca y huevo duro', 'Plato de judías verdes, zanahorias y patatas cocidas servido con ventresca y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías, zanahorias y patatas con ventresca y huevo duro');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías, zanahorias y patatas con ventresca y huevo duro' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas y pimientos', 'Huevos revueltos preparados con setas y pimientos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas y pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas y pimientos' AND t.name IN ('Huevos', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con ensalada simple y patata cocida', 'Filete de pescado a la plancha acompañado de una ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con ensalada simple y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con ensalada simple y patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco con ensalada o patatas', 'Churrasco de ternera a la parrilla servido con ensalada o patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco con ensalada o patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco con ensalada o patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Verduras al horno con provolone y huevo a la plancha', 'Verduras asadas al horno con queso provolone y un huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Verduras al horno con provolone y huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Verduras al horno con provolone y huevo a la plancha' AND t.name IN ('Huevos', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha con ensalada simple', 'Pechuga de pollo a la plancha acompañada de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha con ensalada simple' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pimientos del piquillo rellenos de aguacate, queso y nueces', 'Pimientos del piquillo rellenos con mezcla de aguacate, queso y nueces.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pimientos del piquillo rellenos de aguacate, queso y nueces');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pimientos del piquillo rellenos de aguacate, queso y nueces' AND t.name IN ('Frutos Secos', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado en salsa de mostaza con patata cocida y brócoli', 'Pescado en salsa de mostaza servido con patata cocida y brócoli.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado en salsa de mostaza con patata cocida y brócoli');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado en salsa de mostaza con patata cocida y brócoli' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas', 'Huevos revueltos preparados con setas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas' AND t.name IN ('Huevos', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Nidos de calabacín con queso y huevo a la plancha', 'Tiras de calabacín en forma de nido cocinadas con queso y huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Nidos de calabacín con queso y huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Nidos de calabacín con queso y huevo a la plancha' AND t.name IN ('Huevos', 'Lacteos', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Puerros gratinados con lacón y queso', 'Puerros horneados y gratinados con lacón y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Puerros gratinados con lacón y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Puerros gratinados con lacón y queso' AND t.name IN ('Carne', 'Carne Roja', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pasta al ajillo con champiñones y gambas', 'Plato de pasta salteada al ajillo con champiñones y gambas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pasta al ajillo con champiñones y gambas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pasta al ajillo con champiñones y gambas' AND t.name IN ('Cereales', 'Marisco', 'Pasta', 'Pescado', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Crepes de espinacas rellenas de pollo y queso', 'Crepes elaboradas con espinacas y rellenas de pollo deshilachado y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Crepes de espinacas rellenas de pollo y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Crepes de espinacas rellenas de pollo y queso' AND t.name IN ('Carne', 'Carne Blanca', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la brasa con ensalada simple', 'Filete de pescado a la brasa con una ensalada sencilla.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la brasa con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la brasa con ensalada simple' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco con patatas fritas', 'Tira de asado a la parrilla servido con patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco con patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco con patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lentejas guisadas', 'Plato de cuchara tradicional de lentejas guisadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lentejas guisadas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lentejas guisadas' AND t.name IN ('Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Arroz guisado con pollo', 'Arroz meloso o guisado preparado con trozos de pollo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Arroz guisado con pollo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Arroz guisado con pollo' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con huevo a la plancha', 'Espinacas salteadas o cocidas servidas con huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con huevo a la plancha' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado o pollo a la plancha con ensalada', 'Filete de pescado o pechuga de pollo a la plancha servido con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado o pollo a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado o pollo a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos con ventresca', 'Ensalada fría a base de pimientos asados y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos con ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos con ventresca' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera a la plancha con ensalada', 'Filete de ternera cocinado a la plancha acompañado de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos con arroz blanco y espinacas', 'Plato combinado de huevos, arroz blanco cocido y espinacas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos con arroz blanco y espinacas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos con arroz blanco y espinacas' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con ensalada y patata', 'Pescado a la plancha servido con ensalada fresca y patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con ensalada y patata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con ensalada y patata' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cocido', 'Guiso tradicional de legumbres, carnes y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Cocido' AND t.name IN ('Carne', 'Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sopa de cocido', 'Sopa de fideos o caldo elaborado a partir del cocido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sopa de cocido');

INSERT INTO dishes (name, description) SELECT 'Espagueti de calabacín con gambas', 'Tiras de calabacín en forma de espagueti salteadas con gambas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espagueti de calabacín con gambas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espagueti de calabacín con gambas' AND t.name IN ('Cereales', 'Marisco', 'Pasta', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con vegetales y queso', 'Tortilla de huevo rellena o preparada con vegetales y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con vegetales y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con vegetales y queso' AND t.name IN ('Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de habas, pimientos, tomate y atún', 'Ensalada fresca de habas cocidas, pimientos, tomate y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de habas, pimientos, tomate y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de habas, pimientos, tomate y atún' AND t.name IN ('Legumbres', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha con ensalada', 'Pechuga de pollo a la plancha acompañada de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de champiñones', 'Huevos revueltos cocinados con champiñones.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de champiñones');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de champiñones' AND t.name IN ('Huevos', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos con pisto y arroz', 'Huevos a la plancha servidos con pisto de verduras y guarnición de arroz.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos con pisto y arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos con pisto y arroz' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Crema de verduras', 'Sopa triturada y suave de diferentes verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Crema de verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Crema de verduras' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lomo de cerdo al horno con patatas fritas', 'Lomo de cerdo asado al horno servido con patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lomo de cerdo al horno con patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lomo de cerdo al horno con patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado con ensalada', 'Filete de pescado a la plancha o asado servido con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado con ensalada' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera con ensalada', 'Filete de ternera a la plancha acompañado de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con provolone y huevo a la plancha', 'Espinacas cocinadas con queso provolone y coronadas con huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con provolone y huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con provolone y huevo a la plancha' AND t.name IN ('Huevos', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos asados y ventresca', 'Ensalada de pimientos asados acompañada de ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos asados y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos asados y ventresca' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de ternera con ensalada', 'Filete de ternera hecho a la plancha servido con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de ternera con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de ternera con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo al horno con arroz blanco', 'Piezas de pollo asadas al horno acompañadas de arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo al horno con arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo al horno con arroz blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas y trigueros', 'Huevos revueltos preparados con setas y espárragos trigueros.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas y trigueros');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas y trigueros' AND t.name IN ('Huevos', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa con queso y jamón', 'Tortilla francesa de huevo rellena de queso y jamón.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa con queso y jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa con queso y jamón' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de pollo con ensalada', 'Filete de pollo a la plancha acompañado de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de pollo con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de pollo con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cena de Nochebuena', 'Cena festiva tradicional de Nochebuena.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cena de Nochebuena');

INSERT INTO dishes (name, description) SELECT 'Comida de Navidad', 'Comida festiva tradicional del día de Navidad.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Comida de Navidad');

INSERT INTO dishes (name, description) SELECT 'Queso y fruta', 'Tabla o plato de queso acompañado de fruta fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Queso y fruta');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Queso y fruta' AND t.name IN ('Fruta', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías con patata, huevo y ventresca', 'Judías verdes cocidas con patata, huevo duro y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías con patata, huevo y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías con patata, huevo y ventresca' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas y pimientos del piquillo', 'Huevos revueltos con setas y pimientos del piquillo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas y pimientos del piquillo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas y pimientos del piquillo' AND t.name IN ('Huevos', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado con ensalada simple', 'Filete de pescado a la plancha servido con ensalada sencilla.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado con ensalada simple' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo con patatas', 'Filetes de lomo de cerdo a la plancha servidos con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cena de Reyes', 'Cena festiva de la Noche de Reyes.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cena de Reyes');

INSERT INTO dishes (name, description) SELECT 'Comida de Reyes', 'Comida festiva del Día de Reyes.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Comida de Reyes');

INSERT INTO dishes (name, description) SELECT 'Fruta y queso', 'Plato de fruta fresca acompañada de queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Fruta y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Fruta y queso' AND t.name IN ('Fruta', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Nabitas cocidas con muslo de pollo', 'Nabitos o nabas cocidas servidas con muslo de pollo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Nabitas cocidas con muslo de pollo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Nabitas cocidas con muslo de pollo' AND t.name IN ('Carne', 'Carne Blanca') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sopa', 'Sopa caliente de caldo tradicional.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sopa');

INSERT INTO dishes (name, description) SELECT 'Espinacas con provolone', 'Espinacas cocinadas con queso provolone fundido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con provolone');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con provolone' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con patata', 'Pescado cocinado a la plancha acompañado de patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con patata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con patata' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos y ventresca', 'Ensalada de pimientos asados con ventresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos y ventresca' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lomo con patatas fritas', 'Filete de lomo de cerdo servido con patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lomo con patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lomo con patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espagueti a la boloñesa', 'Espaguetis servidos con salsa boloñesa de carne picada y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espagueti a la boloñesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espagueti a la boloñesa' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías verdes y patatas con atún y huevo', 'Judías verdes y patatas cocidas acompañadas de atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías verdes y patatas con atún y huevo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías verdes y patatas con atún y huevo' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de pimientos y gulas', 'Huevos revueltos preparados con pimientos y gulas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de pimientos y gulas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de pimientos y gulas' AND t.name IN ('Huevos', 'Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cena de Fin de Año', 'Cena festiva especial de la Nochevieja / Fin de Año.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cena de Fin de Año');

INSERT INTO dishes (name, description) SELECT 'Comida de Año Nuevo', 'Comida festiva del Día de Año Nuevo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Comida de Año Nuevo');

INSERT INTO dishes (name, description) SELECT 'Tosta', 'Tostada de pan con ingredientes variados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tosta');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tosta' AND t.name IN ('Bocadillos', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de lomo de cerdo con patatas', 'Filete de lomo de cerdo a la plancha con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de lomo de cerdo con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de lomo de cerdo con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías verdes con huevo cocido', 'Judías verdes cocidas acompañadas de huevo duro o cocido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías verdes con huevo cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías verdes con huevo cocido' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado en papillote con patatas y verduras', 'Filete de pescado cocinado en papillote al horno con patatas y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado en papillote con patatas y verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado en papillote con patatas y verduras' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pulpo con patatas', 'Pulpo cocido servido con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pulpo con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pulpo con patatas' AND t.name IN ('Marisco', 'Patatas', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lasaña', 'Plato de lasaña al horno con carne o verduras y bechamel.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lasaña');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lasaña' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de garbanzos', 'Ensalada fresca a base de garbanzos cocidos y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de garbanzos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de garbanzos' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa con jamón, queso, atún y vegetales', 'Tortilla francesa de huevo rellena de jamón, queso, atún y vegetales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa con jamón, queso, atún y vegetales');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa con jamón, queso, atún y vegetales' AND t.name IN ('Carne', 'Huevos', 'Lacteos', 'Pescado', 'Pescado Azul') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado y verduras a la plancha con patata cocida', 'Filete de pescado y verduras a la plancha acompañados de patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado y verduras a la plancha con patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado y verduras a la plancha con patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Calabacín relleno', 'Calabacín asado relleno de verduras y carne.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Calabacín relleno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Calabacín relleno' AND t.name IN ('Carne', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pechuga de pollo a la plancha con arroz blanco', 'Pechuga de pollo a la plancha servida con arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pechuga de pollo a la plancha con arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pechuga de pollo a la plancha con arroz blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pisto de verduras con huevo a la plancha', 'Pisto tradicional de verduras acompañado de huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pisto de verduras con huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pisto de verduras con huevo a la plancha' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías con patata cocida, huevo cocido y atún', 'Judías verdes con patata cocida, huevo duro y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías con patata cocida, huevo cocido y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías con patata cocida, huevo cocido y atún' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sándwich, tosta o bocadillo', 'Sándwich, tosta o bocadillo relleno al gusto.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sándwich, tosta o bocadillo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Sándwich, tosta o bocadillo' AND t.name IN ('Bocadillos', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de lomo de cerdo o churrasco', 'Filete de lomo de cerdo o churrasco a la plancha o parrilla.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de lomo de cerdo o churrasco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de lomo de cerdo o churrasco' AND t.name IN ('Carne', 'Carne Roja') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha con ensalada de pimientos', 'Pechuga de pollo a la plancha acompañada de ensalada de pimientos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha con ensalada de pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha con ensalada de pimientos' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de habas', 'Ensalada fresca a base de habas cocidas y hortalizas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de habas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de habas' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con jamón y queso', 'Tortilla de huevo rellena de jamón y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con jamón y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con jamón y queso' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la brasa con ensalada', 'Pescado asado a la brasa acompañado de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la brasa con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la brasa con ensalada' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lasaña de carne', 'Lasaña elaborada con láminas de pasta y relleno de carne picada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lasaña de carne');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lasaña de carne' AND t.name IN ('Carne', 'Cereales', 'Pasta') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Gazpacho con huevo y jamón', 'Sopa fría de tomate y hortalizas acompañada de huevo duro picado y jamón.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Gazpacho con huevo y jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Gazpacho con huevo y jamón' AND t.name IN ('Aceite', 'Carne', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo al horno con ensalada', 'Pollo asado al horno servido con guarnición de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo al horno con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo al horno con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de habas y pimientos', 'Ensalada fresca de habas con pimientos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de habas y pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de habas y pimientos' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías, zanahoria y patata con ventresca y huevo', 'Plato templado o ensalada de judías verdes, zanahoria y patata cocida con ventresca de atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías, zanahoria y patata con ventresca y huevo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías, zanahoria y patata con ventresca y huevo' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con arroz y pisto', 'Huevos a la plancha acompañados de arroz blanco y pisto de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con arroz y pisto');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con arroz y pisto' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con queso', 'Espinacas salteadas o cocidas servidas con queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con queso' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de chantarelas y langostinos', 'Huevos revueltos cocinados con setas chantarelas y langostinos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de chantarelas y langostinos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de chantarelas y langostinos' AND t.name IN ('Huevos', 'Marisco', 'Pescado', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con arroz integral y pisto', 'Huevos a la plancha acompañados de arroz integral y pisto de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con arroz integral y pisto');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con arroz integral y pisto' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de pollo con ensalada simple', 'Filete de pollo a la plancha acompañado de una ensalada sencilla.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de pollo con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de pollo con ensalada simple' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de trigo con huevo, queso, aguacate y rúcula', 'Wrap o tortilla de trigo rellena de huevo, queso, aguacate y rúcula.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de trigo con huevo, queso, aguacate y rúcula');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de trigo con huevo, queso, aguacate y rúcula' AND t.name IN ('Cereales', 'Huevos', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pasta integral con boloñesa', 'Plato de pasta integral servido con salsa boloñesa de carne picada y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pasta integral con boloñesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pasta integral con boloñesa' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de espárragos blancos, aguacate, atún y pimientos', 'Ensalada fría de espárragos blancos, aguacate, pimientos y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de espárragos blancos, aguacate, atún y pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de espárragos blancos, aguacate, atún y pimientos' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Costillas de cerdo con boniato', 'Costillas de cerdo asadas acompañadas de boniato.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Costillas de cerdo con boniato');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Costillas de cerdo con boniato' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Muslos de pollo al horno con patatas fritas', 'Muslos de pollo asados al horno acompañados de patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Muslos de pollo al horno con patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Muslos de pollo al horno con patatas fritas' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con ensalada de remolacha y pepino', 'Filete de pescado a la plancha acompañado de ensalada de remolacha y pepino.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con ensalada de remolacha y pepino');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con ensalada de remolacha y pepino' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Calamares al horno con ensalada simple', 'Calamares asados al horno acompañados de una ensalada fresca simple.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Calamares al horno con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Calamares al horno con ensalada simple' AND t.name IN ('Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con pisto de verduras', 'Huevos a la plancha servidos con pisto de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con pisto de verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con pisto de verduras' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías y patata con huevo y atún', 'Judías verdes con patata cocida, huevo duro y atún en conserva.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías y patata con huevo y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías y patata con huevo y atún' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco con ensalada simple', 'Churrasco de ternera a la parrilla servido con ensalada simple.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco con ensalada simple' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Salpicón de pulpo y langostinos con aguacate y patata cocida', 'Salpicón frío de pulpo y langostinos acompañado de aguacate y patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Salpicón de pulpo y langostinos con aguacate y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Salpicón de pulpo y langostinos con aguacate y patata cocida' AND t.name IN ('Marisco', 'Patatas', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Setas con huevo a la plancha', 'Setas salteadas acompañadas de huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Setas con huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Setas con huevo a la plancha' AND t.name IN ('Huevos', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de pollo con verduras a la plancha', 'Filete de pechuga de pollo a la plancha servido con verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de pollo con verduras a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de pollo con verduras a la plancha' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto con champiñón y gambas', 'Huevos revueltos cocinados con champiñones y gambas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto con champiñón y gambas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto con champiñón y gambas' AND t.name IN ('Huevos', 'Marisco', 'Pescado', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Macarrones con boloñesa', 'Macarrones servidos con salsa boloñesa de carne picada y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Macarrones con boloñesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Macarrones con boloñesa' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con couscous y verduras', 'Huevos a la plancha servidos con cuscús y verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con couscous y verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con couscous y verduras' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de pollo con verduras salteadas', 'Brocheta de trozos de pollo alternados con verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de pollo con verduras salteadas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de pollo con verduras salteadas' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Costillas de cerdo con patatas o ensalada', 'Costillas de cerdo asadas servidas con patatas o ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Costillas de cerdo con patatas o ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Costillas de cerdo con patatas o ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con pisto y arroz', 'Huevos a la plancha acompañados de pisto de verduras y arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con pisto y arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con pisto y arroz' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de pimientos y champiñones', 'Huevos revueltos preparados con pimientos y champiñones.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de pimientos y champiñones');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de pimientos y champiñones' AND t.name IN ('Huevos', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha con ensalada', 'Pechuga de pollo a la plancha servida con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Verduras a la plancha con huevo a la plancha', 'Variado de verduras a la plancha servidas con huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Verduras a la plancha con huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Verduras a la plancha con huevo a la plancha' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías rehogadas con chorizo', 'Judías verdes rehogadas acompañadas de chorizo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías rehogadas con chorizo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías rehogadas con chorizo' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera a la plancha con ensalada', 'Filete de ternera a la plancha servido con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pechuga a la plancha con ensalada', 'Pechuga de pollo a la plancha servida con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pechuga a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pechuga a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Langostinos cocidos con pico de gallo', 'Langostinos cocidos acompañados de pico de gallo (tomate, cebolla y pimiento picados).' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Langostinos cocidos con pico de gallo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Langostinos cocidos con pico de gallo' AND t.name IN ('Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con queso provolone', 'Espinacas cocinadas y gratinadas o servidas con queso provolone.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con queso provolone');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con queso provolone' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa con atún y jamón', 'Tortilla francesa de huevo rellena de atún y jamón.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa con atún y jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa con atún y jamón' AND t.name IN ('Carne', 'Huevos', 'Pescado', 'Pescado Azul') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías y patatas con huevo cocido y atún', 'Plato de judías verdes y patatas cocidas con huevo duro y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías y patatas con huevo cocido y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías y patatas con huevo cocido y atún' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos con huevo cocido', 'Ensalada de pimientos asados acompañada de huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos con huevo cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos con huevo cocido' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Nabizas cocidas', 'Nabizas o brotes de nabo cocidos con un chorro de aceite de oliva.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Nabizas cocidas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Nabizas cocidas' AND t.name IN ('Aceite', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías, zanahoria y huevo duro con atún', 'Ensalada o plato caliente de judías verdes, zanahoria, huevo duro y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías, zanahoria y huevo duro con atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías, zanahoria y huevo duro con atún' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Queso', 'Porción de queso variado.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Queso' AND t.name IN ('Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de patata con ensalada', 'Porción de tortilla de patata servida con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de patata con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de patata con ensalada' AND t.name IN ('Huevos', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Melón con jamón serrano', 'Entrante clásico de rodajas de melón fresco servidas con jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Melón con jamón serrano');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Melón con jamón serrano' AND t.name IN ('Carne', 'Fruta') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías y zanahoria con huevo y atún', 'Judías verdes y zanahoria cocidas servidas con huevo duro y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías y zanahoria con huevo y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías y zanahoria con huevo y atún' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de lentejas', 'Ensalada fría a base de lentejas, hortalizas y vinagreta.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de lentejas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de lentejas' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Arroz con marisco', 'Plato de arroz cocinado con variedad de mariscos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Arroz con marisco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Arroz con marisco' AND t.name IN ('Arroz', 'Cereales', 'Marisco', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de fruta y queso', 'Ensalada fresca mezclando frutas de temporada con trozos de queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de fruta y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de fruta y queso' AND t.name IN ('Fruta', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Grelos, patata y pollo cocido', 'Grelos cocidos acompañados de patata y pollo cocido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Grelos, patata y pollo cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Grelos, patata y pollo cocido' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada completa', 'Ensalada con lechuga, tomate, cebolla, atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada completa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada completa' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con ensalada simple y patata cocida', 'Filete de pescado a la plancha acompañado de una ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con ensalada simple y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con ensalada simple y patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Guisantes con jamón', 'Guisantes salteados con taquitos de jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Guisantes con jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Guisantes con jamón' AND t.name IN ('Carne', 'Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Salpicón de pulpo y langostinos', 'Salpicón frío de pulpo y langostinos con hortalizas picadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Salpicón de pulpo y langostinos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Salpicón de pulpo y langostinos' AND t.name IN ('Marisco', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con queso y vegetales', 'Tortilla de huevo rellena de queso y mezcla de vegetales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con queso y vegetales');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con queso y vegetales' AND t.name IN ('Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías verdes con huevo y ventresca', 'Judías verdes cocidas acompañadas de huevo y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías verdes con huevo y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías verdes con huevo y ventresca' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Crema de verduras', 'Sopa triturada y suave de diferentes verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Crema de verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Crema de verduras' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Arroz con pollo', 'Plato de arroz cocinado con trozos de pollo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Arroz con pollo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Arroz con pollo' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos asados', 'Ensalada de pimientos asados aliñados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos asados');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos asados' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Bocata', 'Bocadillo clásico con pan, embutido o carne y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Bocata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Bocata' AND t.name IN ('Bocadillos', 'Carne', 'Cereales', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lomo de cerdo con patatas fritas', 'Filetes de lomo de cerdo a la plancha servidos con patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lomo de cerdo con patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lomo de cerdo con patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lentejas', 'Lentejas estofadas tradicionales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lentejas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lentejas' AND t.name IN ('Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de espinacas y pimientos', 'Huevos revueltos preparados con espinacas y pimientos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de espinacas y pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de espinacas y pimientos' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías, zanahoria, patata, huevo cocido y ventresca', 'Plato de judías verdes, zanahoria y patata cocida con huevo cocido y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías, zanahoria, patata, huevo cocido y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías, zanahoria, patata, huevo cocido y ventresca' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con tomate y provolone', 'Espinacas cocinadas en salsa de tomate y queso provolone fundido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con tomate y provolone');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con tomate y provolone' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de pollo con ensalada', 'Brochetas de pollo a la plancha acompañadas de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de pollo con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de pollo con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de patata con ensalada', 'Porción de tortilla española de patata acompañada de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de patata con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de patata con ensalada' AND t.name IN ('Huevos', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos y atún', 'Ensalada a base de pimientos asados y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos y atún' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Costilla al horno con ensalada', 'Costillas de cerdo asadas al horno acompañadas de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Costilla al horno con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Costilla al horno con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pasta con verduras y queso', 'Plato de pasta acompañado de verduras salteadas y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pasta con verduras y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pasta con verduras y queso' AND t.name IN ('Cereales', 'Lacteos', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado con ensalada', 'Pescado servido con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado con ensalada' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de trigueros', 'Huevos revueltos cocinados con espárragos trigueros.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de trigueros');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de trigueros' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera con ensalada', 'Filete de ternera a la plancha acompañado de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con provolone', 'Espinacas salteadas acompañadas de queso provolone.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con provolone');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con provolone' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías con huevo duro y ventresca', 'Judías verdes servidas con huevo duro y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías con huevo duro y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías con huevo duro y ventresca' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos con pisto', 'Huevos servidos con pisto tradicional de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos con pisto');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos con pisto' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Costilla al horno con patatas', 'Costillas de cerdo asadas al horno acompañadas de patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Costilla al horno con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Costilla al horno con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Menestra de ternera', 'Guiso de menestra de verduras con trozos de carne de ternera.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Menestra de ternera');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Menestra de ternera' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con jamón y queso', 'Tortilla rellena de jamón y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con jamón y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con jamón y queso' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filloas', 'Filloas tradicionales gallegas elaboradas a base de huevo, leche y harina.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filloas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filloas' AND t.name IN ('Huevos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha con ensalada', 'Pechuga de pollo a la plancha servida con ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de pimientos', 'Huevos revueltos cocinados con pimientos salteados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de pimientos' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado', 'Pescado preparado a la plancha o al horno.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado' AND t.name IN ('Pescado', 'Pescado Blanco') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pato al horno con ensalada', 'Pato asado al horno servido con ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pato al horno con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pato al horno con ensalada' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo cocido con grelos y patata', 'Pollo cocido servido con grelos y patatas cocidas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo cocido con grelos y patata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo cocido con grelos y patata' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías o brécol con huevo cocido y ventresca', 'Judías verdes o brócoli cocido servido con huevo duro y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías o brécol con huevo cocido y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías o brécol con huevo cocido y ventresca' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de champiñones', 'Huevos revueltos cocinados con champiñones salteados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de champiñones');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de champiñones' AND t.name IN ('Huevos', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cena libre', 'Cena libre sin menú fijo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cena libre');

INSERT INTO dishes (name, description) SELECT 'Queso y fruta', 'Ración de queso variado acompañado de fruta fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Queso y fruta');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Queso y fruta' AND t.name IN ('Fruta', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pimientos del piquillo rellenos de atún', 'Pimientos del piquillo rellenos de atún en conserva.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pimientos del piquillo rellenos de atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pimientos del piquillo rellenos de atún' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de pollo a la plancha con ensalada', 'Filete de pechuga de pollo a la plancha acompañado de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de pollo a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de pollo a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías con patatas, zanahoria y huevo cocido', 'Guiso o plato hervido de judías verdes, patatas, zanahorias y huevo cocido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías con patatas, zanahoria y huevo cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías con patatas, zanahoria y huevo cocido' AND t.name IN ('Huevos', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de langostinos con ensalada', 'Brochetas de langostinos a la plancha servidas con ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de langostinos con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de langostinos con ensalada' AND t.name IN ('Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sepia a la plancha con ensalada', 'Sepia fresca hecha a la plancha acompañada de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sepia a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Sepia a la plancha con ensalada' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas', 'Huevos revueltos cocinados con setas variadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas' AND t.name IN ('Huevos', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cocido', 'Cocido tradicional completo con garbanzos, carne, patata y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Cocido' AND t.name IN ('Carne', 'Legumbres', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sopa de cocido', 'Sopa o caldo resultante de la cocción del cocido tradicional con fideos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sopa de cocido');

INSERT INTO dishes (name, description) SELECT 'Navicol con patata y pollo cocido', 'Navicol (colinabo) cocido acompañado de patatas y pollo cocido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Navicol con patata y pollo cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Navicol con patata y pollo cocido' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa', 'Tortilla francesa simple hecha con huevo batido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa' AND t.name IN ('Huevos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Carrilleras de ternera con patatas fritas o arroz', 'Carrilleras de ternera guisadas acompañadas de patatas fritas o arroz.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Carrilleras de ternera con patatas fritas o arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Carrilleras de ternera con patatas fritas o arroz' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Comida libre', 'Comida libre sin menú predeterminado.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Comida libre');

INSERT INTO dishes (name, description) SELECT 'Melón con jamón serrano', 'Entrante fresco de tajadas de melón envueltas o acompañadas con lonchas de jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Melón con jamón serrano');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Melón con jamón serrano' AND t.name IN ('Aceite', 'Carne', 'Fruta') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con pisto de verduras', 'Huevos a la plancha acompañados de pisto de verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con pisto de verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con pisto de verduras' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco con ensalada', 'Churrasco de ternera a la parrilla servido con ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías con huevo duro, bonito y patata', 'Judías verdes cocidas acompañadas de huevo duro, bonito del norte y patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías con huevo duro, bonito y patata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías con huevo duro, bonito y patata' AND t.name IN ('Huevos', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas y pimientos del piquillo', 'Huevos revueltos preparados con setas y pimientos del piquillo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas y pimientos del piquillo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas y pimientos del piquillo' AND t.name IN ('Huevos', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de pollo con ensalada', 'Filete de pollo a la plancha acompañado de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de pollo con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de pollo con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas con queso y tomate', 'Espinacas salteadas con queso y salsa de tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas con queso y tomate');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas con queso y tomate' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de jamón con ensalada de tomate', 'Tortilla de jamón serrano acompañada de ensalada de tomate fresco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de jamón con ensalada de tomate');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de jamón con ensalada de tomate' AND t.name IN ('Carne', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de lomo con patatas', 'Filete de lomo de cerdo a la plancha servido con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de lomo con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de lomo con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con ensalada y patata cocida', 'Filete de pescado a la plancha servido con ensalada y patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con ensalada y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con ensalada y patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa con jamón y queso', 'Tortilla francesa rellena de jamón y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa con jamón y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa con jamón y queso' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos y verduras a la plancha', 'Huevos cocinados a la plancha acompañados de verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos y verduras a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos y verduras a la plancha' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado con patatas y verduras al horno', 'Pescado asado al horno junto con patatas y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado con patatas y verduras al horno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado con patatas y verduras al horno' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pechuga de pollo a la plancha con ensalada', 'Pechuga de pollo a la plancha servida con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pechuga de pollo a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pechuga de pollo a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tosta', 'Tostada de pan de campo con ingredientes variados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tosta');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tosta' AND t.name IN ('Bocadillos', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo con patatas', 'Filetes de lomo de cerdo servidos con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pinchos de pollo y verduras plancha c/ arroz blanco', 'Pinchos de pollo y verduras cocinados a la plancha acompañados de arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pinchos de pollo y verduras plancha c/ arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pinchos de pollo y verduras plancha c/ arroz blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa c/ jamón queso y vegetales', 'Tortilla francesa rellena de jamón, queso y vegetales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa c/ jamón queso y vegetales');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa c/ jamón queso y vegetales' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado plancha c/ ensalada simple', 'Pescado a la plancha servido con una pequeña ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado plancha c/ ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado plancha c/ ensalada simple' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Guisantes c/ jamón', 'Guisantes salteados con taquitos de jamón.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Guisantes c/ jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Guisantes c/ jamón' AND t.name IN ('Carne', 'Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Berenjena rellena', 'Berenjena al horno rellena de carne picada y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Berenjena rellena');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Berenjena rellena' AND t.name IN ('Carne', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada completa', 'Ensalada con lechuga, tomate, cebolla, atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada completa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada completa' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de patata c/ ensalada simple', 'Tortilla española de patatas servida con ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de patata c/ ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de patata c/ ensalada simple' AND t.name IN ('Huevos', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Crema de verduras', 'Sopa triturada y suave de diferentes verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Crema de verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Crema de verduras' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco de ternera c/ verduras al horno', 'Churrasco de ternera a la parrilla acompañado de verduras asadas al horno.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco de ternera c/ verduras al horno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco de ternera c/ verduras al horno' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Bocata', 'Bocadillo clásico con pan, embutido o carne y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Bocata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Bocata' AND t.name IN ('Bocadillos', 'Carne', 'Cereales', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo de cerdo c/ patatas fritas o arroz', 'Filetes de lomo de cerdo servidos con patatas fritas o arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo de cerdo c/ patatas fritas o arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo de cerdo c/ patatas fritas o arroz' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha c/ judías y zanahorias', 'Pechuga de pollo a la plancha acompañada de judías verdes y zanahorias.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha c/ judías y zanahorias');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha c/ judías y zanahorias' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas', 'Huevos revueltos cocinados con setas variadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas' AND t.name IN ('Huevos', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha c/ ensalada simple', 'Filete de pescado a la plancha acompañado de una ensalada simple.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha c/ ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha c/ ensalada simple' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espinacas c/ provolone', 'Espinacas salteadas o al horno cubiertas con queso provolone derretido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espinacas c/ provolone');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espinacas c/ provolone' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de ternera c/ arroz blanco', 'Filete de ternera a la plancha servido con guarnición de arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de ternera c/ arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de ternera c/ arroz blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Berenjena rellena de atún', 'Berenjena asada y rellena de atún y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Berenjena rellena de atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Berenjena rellena de atún' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pasta c/ boloñesa', 'Plato de pasta servido con salsa boloñesa de carne picada y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pasta c/ boloñesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pasta c/ boloñesa' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa', 'Tortilla francesa sencilla hecha con huevos batidos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa' AND t.name IN ('Huevos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco c/ patatas', 'Tira de churrasco de ternera a la parrilla servida con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco c/ patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco c/ patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos plancha c/ arroz blanco y pisto', 'Huevos a la plancha acompañados de arroz blanco y pisto de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos plancha c/ arroz blanco y pisto');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos plancha c/ arroz blanco y pisto' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de ternera c/ ensalada', 'Filete de ternera a la plancha acompañado de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de ternera c/ ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de ternera c/ ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pechuga pollo c/ ensalada', 'Pechuga de pollo a la plancha servida con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pechuga pollo c/ ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pechuga pollo c/ ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla c/ vegetales y queso', 'Tortilla francesa o española rellena de vegetales y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla c/ vegetales y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla c/ vegetales y queso' AND t.name IN ('Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensaladilla', 'Ensaladilla rusa tradicional de patatas, verduras y atún con mayonesa.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensaladilla');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensaladilla' AND t.name IN ('Aceite', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pulpo y langostinos', 'Ensalada fría preparada con pulpo y langostinos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pulpo y langostinos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pulpo y langostinos' AND t.name IN ('Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Fabada', 'Guiso tradicional asturiano de fabes con compango.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Fabada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Fabada' AND t.name IN ('Cereales', 'Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco c/ patatas fritas', 'Tira de asado a la parrilla servido con patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco c/ patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco c/ patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado plancha c/ ensalada', 'Filete de pescado a la plancha acompañado de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado plancha c/ ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado plancha c/ ensalada' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de gulas pimientos y champis', 'Huevos revueltos preparados con gulas, pimientos y champiñones.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de gulas pimientos y champis');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de gulas pimientos y champis' AND t.name IN ('Huevos', 'Marisco', 'Pescado', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías c/ patata cocida huevo y atún', 'Judías verdes cocidas acompañadas de patata cocida, huevo duro y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías c/ patata cocida huevo y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías c/ patata cocida huevo y atún' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa c/ jamón queso etc', 'Tortilla francesa rellena de jamón, queso y otros ingredientes.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa c/ jamón queso etc');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa c/ jamón queso etc' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Muslo de pollo cocido c/ repollo y zanahoria', 'Muslo de pollo cocido servido con guarnición de repollo y zanahoria.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Muslo de pollo cocido c/ repollo y zanahoria');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Muslo de pollo cocido c/ repollo y zanahoria' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sopa', 'Sopa caliente tradicional de caldo con verduras o fideos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sopa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Sopa' AND t.name IN ('Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha c/ arroz blanco', 'Huevos hechos a la plancha servidos con arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha c/ arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha c/ arroz blanco' AND t.name IN ('Arroz', 'Cereales', 'Huevos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado y verduras plancha c/ patata cocida', 'Filete de pescado y verduras a la plancha servidos con patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado y verduras plancha c/ patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado y verduras plancha c/ patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de ternera plancha c/ ensalada simple', 'Filete de ternera cocinado a la plancha acompañado de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de ternera plancha c/ ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de ternera plancha c/ ensalada simple' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo o churrasco c/ patatas fritas', 'Filetes de lomo de cerdo o churrasco servidos con patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo o churrasco c/ patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo o churrasco c/ patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lentejas', 'Plato de lentejas estofadas tradicionales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lentejas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lentejas' AND t.name IN ('Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Caldo de verdura y patatas', 'Caldo ligero preparado con verduras y patatas cocidas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Caldo de verdura y patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Caldo de verdura y patatas' AND t.name IN ('Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de pollo c/ ensalada', 'Filete de pechuga de pollo a la plancha acompañado de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de pollo c/ ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de pollo c/ ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de champiñones', 'Huevos revueltos salteados con champiñones.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de champiñones');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de champiñones' AND t.name IN ('Huevos', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado cocido c/ brécol y zanahoria', 'Pescado blanco hervido acompañado de brócoli y zanahorias cocidas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado cocido c/ brécol y zanahoria');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado cocido c/ brécol y zanahoria' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos plancha c/ arroz', 'Huevos a la plancha servidos con guarnición de arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos plancha c/ arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos plancha c/ arroz' AND t.name IN ('Arroz', 'Cereales', 'Huevos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espagueti c/ langostinos y verduras', 'Espaguetis salteados con langostinos y tiras de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espagueti c/ langostinos y verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espagueti c/ langostinos y verduras' AND t.name IN ('Cereales', 'Marisco', 'Pasta', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías cocidas c/ huevo duro y ventresca', 'Judías verdes cocidas acompañadas de huevo duro y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías cocidas c/ huevo duro y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías cocidas c/ huevo duro y ventresca' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado cocido c/ patatas y brécol', 'Pescado blanco hervido acompañado de patatas y brócoli.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado cocido c/ patatas y brécol');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado cocido c/ patatas y brécol' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pechuga pollo c/ ensalada simple', 'Pechuga de pollo a la plancha acompañada de una ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pechuga pollo c/ ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pechuga pollo c/ ensalada simple' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pulpo con patata cocida', 'Pulpo cocido servido con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pulpo con patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pulpo con patata cocida' AND t.name IN ('Marisco', 'Patatas', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías y zanahorias c/ huevo duro y ventresca', 'Plato de judías verdes y zanahorias con huevo duro y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías y zanahorias c/ huevo duro y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías y zanahorias c/ huevo duro y ventresca' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de salmón c/ ensalada', 'Brocheta de dados de salmón a la plancha servida con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de salmón c/ ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de salmón c/ ensalada' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Solomillo de cerdo con salsa de champiñones y arroz blanco', 'Solomillo de cerdo en salsa de champiñones acompañado de arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Solomillo de cerdo con salsa de champiñones y arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Solomillo de cerdo con salsa de champiñones y arroz blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pimientos del piquillo rellenos de atún y huevo', 'Pimientos del piquillo asados rellenos de mezcla de atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pimientos del piquillo rellenos de atún y huevo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pimientos del piquillo rellenos de atún y huevo' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pasta boloñesa', 'Plato de pasta servido con salsa boloñesa de carne picada y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pasta boloñesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pasta boloñesa' AND t.name IN ('Carne', 'Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado plancha c/ ens. y patata cocida', 'Filete de pescado a la plancha acompañado de ensalada fresca y patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado plancha c/ ens. y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado plancha c/ ens. y patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa con queso y vegetales', 'Tortilla francesa rellena de queso y vegetales salteados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa con queso y vegetales');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa con queso y vegetales' AND t.name IN ('Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pinchos de pollo y verduras c/ arroz blanco', 'Brochetas de pollo y verduras a la plancha acompañadas de arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pinchos de pollo y verduras c/ arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pinchos de pollo y verduras c/ arroz blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pisto de verduras c/ huevo plancha', 'Pisto tradicional de verduras acompañado de huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pisto de verduras c/ huevo plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pisto de verduras c/ huevo plancha' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado patatas y verduras horno', 'Pescado horneado junto con patatas y verduras asadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado patatas y verduras horno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado patatas y verduras horno' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tosta o bocadillo', 'Rebanada de pan tostado o bocadillo relleno al gusto.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tosta o bocadillo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tosta o bocadillo' AND t.name IN ('Bocadillos', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternero patatas y menestra guisada', 'Guiso de ternera con patatas y menestra de verduras variadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternero patatas y menestra guisada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternero patatas y menestra guisada' AND t.name IN ('Carne', 'Carne Roja', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco o filetes de lomo c/ patatas', 'Tira de churrasco o filetes de lomo de cerdo a la parrilla servidos con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco o filetes de lomo c/ patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco o filetes de lomo c/ patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías cocidas c/ patatas y agujas', 'Judías verdes cocidas acompañadas de patatas y agujas en conserva.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías cocidas c/ patatas y agujas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías cocidas c/ patatas y agujas' AND t.name IN ('Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de pollo c/ brócoli cocido', 'Brocheta de pechuga de pollo a la plancha servida con brócoli cocido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de pollo c/ brócoli cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de pollo c/ brócoli cocido' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de trigueros y pimientos piquillo', 'Huevos revueltos preparados con espárragos trigueros y pimientos del piquillo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de trigueros y pimientos piquillo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de trigueros y pimientos piquillo' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete pollo plancha c/ ensalada', 'Filete de pechuga de pollo a la plancha servido con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete pollo plancha c/ ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete pollo plancha c/ ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de remolacha rúcula y sardinillas', 'Ensalada fresca de remolacha, rúcula y sardinillas en conserva.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de remolacha rúcula y sardinillas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de remolacha rúcula y sardinillas' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado plancha c/ verduras', 'Filete de pescado a la plancha servido con guarnición de verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado plancha c/ verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado plancha c/ verduras' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Arroz meloso de mariscos', 'Arroz meloso cocinado con mariscos variados.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Arroz meloso de mariscos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Arroz meloso de mariscos' AND t.name IN ('Arroz', 'Cereales', 'Marisco', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías verdes c/ jamón', 'Judías verdes cocidas y salteadas con jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías verdes c/ jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías verdes c/ jamón' AND t.name IN ('Carne', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo plancha c/ cous cous', 'Pechuga de pollo a la plancha servida con cous cous.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo plancha c/ cous cous');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo plancha c/ cous cous' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete ternera c/ verduras plancha', 'Filete de ternera a la plancha acompañado de verduras a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete ternera c/ verduras plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete ternera c/ verduras plancha' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de gulas', 'Huevos revueltos preparados con gulas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de gulas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de gulas' AND t.name IN ('Huevos', 'Marisco', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensaladilla rusa', 'Mezcla de patata cocida, zanahoria, guisantes, atún y huevo duro con mayonesa.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensaladilla rusa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensaladilla rusa' AND t.name IN ('Aceite', 'Huevos', 'Legumbres', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pisto c/ huevo plancha', 'Pisto de verduras acompañado de huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pisto c/ huevo plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pisto c/ huevo plancha' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado brasa c/ patata cocida', 'Pescado asado a la brasa servido con patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado brasa c/ patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado brasa c/ patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco c/ ensalada o patatas fritas', 'Tira de churrasco de ternera a la parrilla servido con ensalada o patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco c/ ensalada o patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco c/ ensalada o patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos plancha c/ pisto verduras', 'Huevos a la plancha acompañados de pisto de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos plancha c/ pisto verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos plancha c/ pisto verduras' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Bocata o hamburguesa', 'Bocadillo o hamburguesa clásica con pan y carne.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Bocata o hamburguesa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Bocata o hamburguesa' AND t.name IN ('Bocadillos', 'Carne', 'Carne Roja', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cocido', 'Cocido tradicional con garbanzos, verduras, patata y carnes.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Cocido' AND t.name IN ('Carne', 'Legumbres', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo al horno c/ patatas', 'Pollo asado al horno servido con guarnición de patatas asadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo al horno c/ patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo al horno c/ patatas' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos a la plancha con pisto', 'Huevos a la plancha acompañados de pisto de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos a la plancha con pisto');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos a la plancha con pisto' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Rehogado de boniato, garbanzos, calabacín, espinacas y tomate', 'Salteado de boniato, garbanzos, calabacín, espinacas y tomate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Rehogado de boniato, garbanzos, calabacín, espinacas y tomate');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Rehogado de boniato, garbanzos, calabacín, espinacas y tomate' AND t.name IN ('Legumbres', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera con ensalada', 'Filete de ternera cocinado a la plancha servido con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera con ensalada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Guisantes con jamón', 'Guisantes salteados con taquitos de jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Guisantes con jamón');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Guisantes con jamón' AND t.name IN ('Carne', 'Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la plancha con ensalada simple y patata cocida', 'Filete de pescado a la plancha acompañado de una ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la plancha con ensalada simple y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la plancha con ensalada simple y patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de vegetales y queso', 'Tortilla preparada con mezcla de verduras y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de vegetales y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de vegetales y queso' AND t.name IN ('Huevos', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo al horno con verduras y quinoa', 'Pollo asado al horno servido con guarnición de verduras y quinoa.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo al horno con verduras y quinoa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo al horno con verduras y quinoa' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada completa', 'Ensalada con lechuga, tomate, cebolla, atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada completa');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada completa' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pimientos rellenos', 'Pimientos asados y rellenos, típicamente de carne picada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pimientos rellenos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pimientos rellenos' AND t.name IN ('Carne', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de lentejas', 'Ensalada fría a base de lentejas y hortalizas variadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de lentejas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de lentejas' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Bocata', 'Bocadillo clásico con pan, embutido o carne y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Bocata');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Bocata' AND t.name IN ('Bocadillos', 'Carne', 'Cereales', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lomo de cerdo con patatas', 'Filete de lomo de cerdo servido con guarnición de patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lomo de cerdo con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lomo de cerdo con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías cocidas con patata y huevo', 'Judías verdes cocidas acompañadas de patata y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías cocidas con patata y huevo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías cocidas con patata y huevo' AND t.name IN ('Huevos', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de pollo con ensalada simple', 'Brochetas de pollo a la plancha acompañadas de una ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de pollo con ensalada simple');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de pollo con ensalada simple' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete de ternera a la plancha con verduras salteadas', 'Filete de ternera cocinado a la plancha acompañado de verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete de ternera a la plancha con verduras salteadas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete de ternera a la plancha con verduras salteadas' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla con jamón, vegetales y queso', 'Tortilla rellena de jamón, vegetales variados y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla con jamón, vegetales y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla con jamón, vegetales y queso' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Fabada', 'Guiso tradicional asturiano de fabes con embutido.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Fabada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Fabada' AND t.name IN ('Legumbres') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado cocido con patata y brécol', 'Pescado blanco cocido acompañado de patatas y brécol.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado cocido con patata y brécol');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado cocido con patata y brécol' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pisto con huevo y arroz blanco', 'Pisto de verduras servido con huevo y arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pisto con huevo y arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pisto con huevo y arroz blanco' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pimientos y ventresca', 'Ensalada a base de pimientos asados y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pimientos y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pimientos y ventresca' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensaladilla', 'Ensaladilla con patata cocida, verduras, atún y mayonesa.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensaladilla');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensaladilla' AND t.name IN ('Aceite', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brocheta de langostinos con ensalada', 'Brocheta de langostinos a la plancha servida con ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brocheta de langostinos con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brocheta de langostinos con ensalada' AND t.name IN ('Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo a la plancha con ensalada', 'Pechuga de pollo a la plancha acompañada de ensalada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo a la plancha con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo a la plancha con ensalada' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pimientos del piquillo rellenos de atún', 'Pimientos del piquillo asados y rellenos de atún en conserva.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pimientos del piquillo rellenos de atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pimientos del piquillo rellenos de atún' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevo a la plancha con berenjena parmesana', 'Huevo a la plancha acompañado de berenjena asada con queso parmesano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevo a la plancha con berenjena parmesana');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevo a la plancha con berenjena parmesana' AND t.name IN ('Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Lomo de cerdo al horno con patatas', 'Lomo de cerdo asado al horno servido con patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Lomo de cerdo al horno con patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Lomo de cerdo al horno con patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías cocidas y zanahorias con huevo y ventresca', 'Judías verdes y zanahorias cocidas acompañadas de huevo duro y ventresca de atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías cocidas y zanahorias con huevo y ventresca');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías cocidas y zanahorias con huevo y ventresca' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado a la brasa con ensalada', 'Pescado asado a la brasa servido con ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado a la brasa con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado a la brasa con ensalada' AND t.name IN ('Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Paella', 'Plato tradicional de arroz cocinado con marisco, carne o verduras y azafrán.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Paella');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Paella' AND t.name IN ('Arroz', 'Carne', 'Cereales', 'Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías con patata, huevo cocido y atún', 'Judías verdes cocidas con patata, huevo duro y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías con patata, huevo cocido y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías con patata, huevo cocido y atún' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de pasta', 'Ensalada fría de pasta con vegetales y hortalizas variadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de pasta');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de pasta' AND t.name IN ('Cereales', 'Pasta', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Salteado de verduras y gambas', 'Salteado a la sartén de verduras frescas con gambas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Salteado de verduras y gambas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Salteado de verduras y gambas' AND t.name IN ('Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pinchos de pollo y verduras a la plancha con arroz blanco', 'Brochetas/pinchos de pollo y verduras cocinados a la plancha con arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pinchos de pollo y verduras a la plancha con arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pinchos de pollo y verduras a la plancha con arroz blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Bocata, sándwich o similares', 'Bocadillo o sándwich con relleno variado de carne, queso y vegetales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Bocata, sándwich o similares');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Bocata, sándwich o similares' AND t.name IN ('Bocadillos', 'Carne', 'Cereales', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco de ternera con verduras al horno', 'Churrasco de ternera a la parrilla servido con guarnición de verduras al horno.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco de ternera con verduras al horno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco de ternera con verduras al horno' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo de cerdo a la plancha con patatas fritas', 'Filetes de lomo de cerdo a la plancha acompañados de patatas fritas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo de cerdo a la plancha con patatas fritas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo de cerdo a la plancha con patatas fritas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo plancha con arroz blanco y verduras', 'Pechuga de pollo a la plancha con guarnición de arroz blanco y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo plancha con arroz blanco y verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo plancha con arroz blanco y verduras' AND t.name IN ('Arroz', 'Carne', 'Carne Blanca', 'Cereales', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de setas y pimientos del piquillo', 'Huevos revueltos cocinados con setas y pimientos del piquillo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de setas y pimientos del piquillo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de setas y pimientos del piquillo' AND t.name IN ('Huevos', 'Setas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera plancha con ensalada de remolacha y rúcula', 'Filete de ternera a la plancha acompañado de ensalada de remolacha y rúcula.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera plancha con ensalada de remolacha y rúcula');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera plancha con ensalada de remolacha y rúcula' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de trigo con queso, jamón y vegetales', 'Wrap o tortilla de trigo rellena de queso, jamón y vegetales.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de trigo con queso, jamón y vegetales');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de trigo con queso, jamón y vegetales' AND t.name IN ('Carne', 'Cereales', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de habas o lentejas', 'Ensalada fría de legumbres (habas o lentejas) acompañadas de hortalizas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de habas o lentejas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de habas o lentejas' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Melón con jamón serrano', 'Entrante clásico de lonchas de melón fresco servido con jamón serrano.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Melón con jamón serrano');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Melón con jamón serrano' AND t.name IN ('Carne', 'Fruta') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Churrasco con ensalada simple o patatas', 'Churrasco a la parrilla acompañado de ensalada o patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Churrasco con ensalada simple o patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Churrasco con ensalada simple o patatas' AND t.name IN ('Carne', 'Carne Roja', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Espárragos blancos con langostinos, huevo cocido y pan', 'Espárragos blancos servidos con langostinos, huevo cocido y pan.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Espárragos blancos con langostinos, huevo cocido y pan');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Espárragos blancos con langostinos, huevo cocido y pan' AND t.name IN ('Cereales', 'Huevos', 'Marisco', 'Pescado', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo plancha con verduras rehogadas', 'Pechuga de pollo a la plancha servida con un salteado de verduras rehogadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo plancha con verduras rehogadas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo plancha con verduras rehogadas' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías verdes con ventresca y huevo cocido', 'Judías verdes cocidas acompañadas de ventresca de atún y huevo duro.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías verdes con ventresca y huevo cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías verdes con ventresca y huevo cocido' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera con verduras', 'Filete de ternera asado a la plancha servido con verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera con verduras' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Revuelto de gulas con gambas', 'Huevos revueltos cocinados con gulas y gambas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Revuelto de gulas con gambas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Revuelto de gulas con gambas' AND t.name IN ('Huevos', 'Marisco', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos plancha con verduras', 'Huevos a la plancha acompañados de verduras salteadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos plancha con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos plancha con verduras' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos plancha con pisto y arroz', 'Huevos a la plancha servidos con pisto de verduras y arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos plancha con pisto y arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos plancha con pisto y arroz' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo de cerdo con arroz blanco o patatas', 'Filetes de lomo de cerdo a la plancha acompañados de arroz blanco o patatas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo de cerdo con arroz blanco o patatas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo de cerdo con arroz blanco o patatas' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pulpo y patata cocida', 'Pulpo cocido servido sobre patatas cocidas con pimentón y aceite.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pulpo y patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pulpo y patata cocida' AND t.name IN ('Aceite', 'Marisco', 'Patatas', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado y verduras a la plancha con patata cocida', 'Filete de pescado y verduras a la plancha acompañados de patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado y verduras a la plancha con patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado y verduras a la plancha con patata cocida' AND t.name IN ('Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera y menestra guisada', 'Guiso de ternera tierna con menestra de verduras variadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera y menestra guisada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera y menestra guisada' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla francesa con jamón y queso', 'Tortilla francesa clásica rellena de jamón y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla francesa con jamón y queso');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla francesa con jamón y queso' AND t.name IN ('Carne', 'Huevos', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sándwich', 'Sándwich de pan de molde relleno de jamón y queso.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sándwich');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Sándwich' AND t.name IN ('Bocadillos', 'Carne', 'Cereales', 'Lacteos') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tortilla de patatas con ensalada', 'Tortilla de patatas tradicional acompañada de ensalada fresca.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tortilla de patatas con ensalada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tortilla de patatas con ensalada' AND t.name IN ('Huevos', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pastel de patatas y espinacas', 'Pastel horneado a base de capas de patata cocida y espinacas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pastel de patatas y espinacas');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pastel de patatas y espinacas' AND t.name IN ('Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensalada de remolacha y rúcula con queso feta', 'Ensalada fresca de remolacha, rúcula y dados de queso feta.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensalada de remolacha y rúcula con queso feta');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensalada de remolacha y rúcula con queso feta' AND t.name IN ('Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Gulas y champiñones con huevo a la plancha', 'Salteado de gulas y champiñones acompañado de un huevo a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Gulas y champiñones con huevo a la plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Gulas y champiñones con huevo a la plancha' AND t.name IN ('Huevos', 'Marisco', 'Pescado', 'Setas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Judías y zanahoria con huevo cocido y atún', 'Judías verdes y zanahorias cocidas acompañadas de huevo duro y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías y zanahoria con huevo cocido y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías y zanahoria con huevo cocido y atún' AND t.name IN ('Huevos', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pinchos de pollo con ensalada de pimientos', 'Brochetas de pollo a la plancha servidas con ensalada de pimientos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pinchos de pollo con ensalada de pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pinchos de pollo con ensalada de pimientos' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Cocido', 'Guiso tradicional de garbanzos, carne, embutidos y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Cocido');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Cocido' AND t.name IN ('Carne', 'Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Sopa', 'Sopa caliente de caldo tradicional con fideos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Sopa');

INSERT INTO dishes (name, description) SELECT 'Judías verdes con huevo duro', 'Judías verdes cocidas acompañadas de huevo duro picado.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Judías verdes con huevo duro');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Judías verdes con huevo duro' AND t.name IN ('Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos con arroz y pisto de verduras', 'Huevos a la plancha servidos con arroz blanco y pisto de verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos con arroz y pisto de verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos con arroz y pisto de verduras' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo patatas y verduras al horno', 'Pollo asado al horno junto con patatas y verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo patatas y verduras al horno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo patatas y verduras al horno' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Huevos y verdura plancha c/ arroz blanco', 'Huevos y verduras a la plancha servidos con arroz blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Huevos y verdura plancha c/ arroz blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Huevos y verdura plancha c/ arroz blanco' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Salteado de verduras y pollo', 'Tiras de pechuga de pollo salteadas con verduras variadas.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Salteado de verduras y pollo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Salteado de verduras y pollo' AND t.name IN ('Carne', 'Carne Blanca', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filete ternera y verduras plancha', 'Filete de ternera y verduras cocinados a la plancha.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filete ternera y verduras plancha');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filete ternera y verduras plancha' AND t.name IN ('Carne', 'Carne Roja', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo o churrasco c/ patatas o arroz', 'Filetes de lomo de cerdo o churrasco servidos con patatas o arroz.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo o churrasco c/ patatas o arroz');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo o churrasco c/ patatas o arroz' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales', 'Patatas') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Filetes de lomo de cerdo a la plancha con arroz en blanco', 'Filetes de lomo de cerdo a la plancha con arroz en blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Filetes de lomo de cerdo a la plancha con arroz en blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Filetes de lomo de cerdo a la plancha con arroz en blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brócoli con patata cocida, huevo cocido y atún', 'Brócoli con patata cocida, huevo cocido y atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brócoli con patata cocida, huevo cocido y atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brócoli con patata cocida, huevo cocido y atún' AND t.name IN ('Huevos', 'Patatas', 'Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Brócoli con atún', 'Brócoli con atún.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Brócoli con atún');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Brócoli con atún' AND t.name IN ('Pescado', 'Pescado Azul', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Tostada de huevo, queso fresco y aguacate', 'Tostada de huevo, queso fresco y aguacate.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Tostada de huevo, queso fresco y aguacate');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Tostada de huevo, queso fresco y aguacate' AND t.name IN ('Bocadillos', 'Cereales', 'Huevos', 'Lacteos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ensaladilla con filete de pollo', 'Ensaladilla con filete de pollo.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ensaladilla con filete de pollo');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ensaladilla con filete de pollo' AND t.name IN ('Carne', 'Carne Blanca') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Albóndigas con salsa de tomate y arroz en blanco', 'Albóndigas con salsa de tomate y arroz en blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Albóndigas con salsa de tomate y arroz en blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Albóndigas con salsa de tomate y arroz en blanco' AND t.name IN ('Arroz', 'Carne', 'Carne Roja', 'Cereales', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pollo, patatas y verduras al horno', 'Pollo, patatas y verduras al horno.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pollo, patatas y verduras al horno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pollo, patatas y verduras al horno' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pisto de verduras con huevo a la plancha y arroz en blanco', 'Pisto de verduras con huevo a la plancha y arroz en blanco.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pisto de verduras con huevo a la plancha y arroz en blanco');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pisto de verduras con huevo a la plancha y arroz en blanco' AND t.name IN ('Arroz', 'Cereales', 'Huevos', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Fajitas de pollo con pimientos', 'Fajitas de pollo con pimientos.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Fajitas de pollo con pimientos');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Fajitas de pollo con pimientos' AND t.name IN ('Bocadillos', 'Carne', 'Carne Blanca', 'Cereales', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Calamar guisado con patata cocida', 'Calamar guisado con patata cocida.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Calamar guisado con patata cocida');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Calamar guisado con patata cocida' AND t.name IN ('Marisco', 'Patatas', 'Pescado') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Conejo, patatas y verduras al horno', 'Conejo, patatas y verduras al horno.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Conejo, patatas y verduras al horno');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Conejo, patatas y verduras al horno' AND t.name IN ('Carne', 'Carne Blanca', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Ternera, patatas y menestra guisada', 'Ternera, patatas y menestra guisada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Ternera, patatas y menestra guisada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Ternera, patatas y menestra guisada' AND t.name IN ('Carne', 'Carne Roja', 'Patatas', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Garbanzos con verduras', 'Garbanzos con verduras.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Garbanzos con verduras');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Garbanzos con verduras' AND t.name IN ('Legumbres', 'Verdura') ON CONFLICT DO NOTHING;

INSERT INTO dishes (name, description) SELECT 'Pescado y patata cocida con brocoli y salsa ajada', 'Pescado y patata cocida con brocoli y salsa ajada.' WHERE NOT EXISTS (SELECT 1 FROM dishes WHERE name = 'Pescado y patata cocida con brocoli y salsa ajada');
INSERT INTO dish_tags (dish_id, tag_id) SELECT d.id, t.id FROM dishes d, tags t WHERE d.name = 'Pescado y patata cocida con brocoli y salsa ajada' AND t.name IN ('Aceite', 'Patatas', 'Pescado', 'Pescado Blanco', 'Verdura') ON CONFLICT DO NOTHING;
