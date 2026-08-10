-- 1. Inserción de 10 Etiquetas (Solo categorías/familias de alimentos)
INSERT INTO etiquetas (nombre) VALUES
                                   ('Carne'),
                                   ('Pescado'),
                                   ('Marisco'),
                                   ('Legumbres'),
                                   ('Verduras'),
                                   ('Pasta'),
                                   ('Arroz'),
                                   ('Huevos'),
                                   ('Lácteos'),
                                   ('Fruta');

-- 2. Inserción de 20 Platos
INSERT INTO platos (nombre, descripcion) VALUES
                                             ('Salmón a la plancha', 'Filete de salmón fresco cocinado a la plancha con un toque de limón'),
                                             ('Pollo al horno con verduras', 'Pechuga de pollo asada acompañada de calabacín, pimiento y cebolla'),
                                             ('Lentejas estofadas', 'Plato tradicional de lentejas cocinadas con zanahoria y patata'),
                                             ('Paella de marisco', 'Arroz tradicional con calamares, gambas y mejillones'),
                                             ('Tortilla de patatas', 'Clásica tortilla española con huevos y patatas'),
                                             ('Pasta boloñesa', 'Espaguetis con salsa de tomate casera y carne picada de ternera'),
                                             ('Ensalada mixta', 'Mezcla de lechugas, tomate, atún y huevo duro'),
                                             ('Garbanzos con espinacas', 'Guiso saludable de garbanzos con espinacas frescas y ajo'),
                                             ('Entrecot de ternera', 'Corte de ternera a la parrilla servido con guarnición de pimientos'),
                                             ('Merluza en salsa verde', 'Lomo de merluza cocinado con perejil, ajo y almejas'),
                                             ('Crema de calabaza', 'Crema suave de calabaza y zanahoria con un toque de queso mascarpone'),
                                             ('Risotto de setas', 'Arroz cremoso con variedad de setas silvestres y queso parmesano'),
                                             ('Lasaña de carne', 'Capas de pasta rellenas de carne picada, bechamel y queso gratinado'),
                                             ('Guiso de pavo con guisantes', 'Trozos de pavo estofados con guisantes y zanahorias'),
                                             ('Revuelto de setas y gambas', 'Huevos salteados con setas de temporada y gambas peladas'),
                                             ('Macarrones con queso', 'Pasta corta cubierta con una rica salsa casera de tres quesos'),
                                             ('Bacalao al pil-pil', 'Lomo de bacalao confitado con ajo, guindilla y aceite de oliva'),
                                             ('Hamburguesa completa', 'Carne de vacuno con queso cheddar, lechuga y tomate'),
                                             ('Ensalada de frutas', 'Tazón de fruta fresca variada cortada en dados'),
                                             ('Calamares en su tinta', 'Calamares guisados en su propia tinta acompañados de arroz blanco');

-- 3. Emparejamiento de Platos con Etiquetas (Entre 1 y 3 etiquetas por plato)
INSERT INTO plato_etiquetas (plato_id, etiqueta_id) VALUES
-- Salmón a la plancha (Pescado)
(1, 2),
-- Pollo al horno con verduras (Carne, Verduras)
(2, 1), (2, 5),
-- Lentejas estofadas (Legumbres, Verduras)
(3, 4), (3, 5),
-- Paella de marisco (Arroz, Marisco, Pescado)
(4, 7), (4, 3), (4, 2),
-- Tortilla de patatas (Huevos)
(5, 8),
-- Pasta boloñesa (Pasta, Carne)
(6, 6), (6, 1),
-- Ensalada mixta (Verduras, Pescado, Huevos)
(7, 5), (7, 2), (7, 8),
-- Garbanzos con espinacas (Legumbres, Verduras)
(8, 4), (8, 5),
-- Entrecot de ternera (Carne, Verduras)
(9, 1), (9, 5),
-- Merluza en salsa verde (Pescado, Marisco)
(10, 2), (10, 3),
-- Crema de calabaza (Verduras, Lácteos)
(11, 5), (11, 9),
-- Risotto de setas (Arroz, Lácteos)
(12, 7), (12, 9),
-- Lasaña de carne (Pasta, Carne, Lácteos)
(13, 6), (13, 1), (13, 9),
-- Guiso de pavo con guisantes (Carne, Legumbres)
(14, 1), (14, 4),
-- Revuelto de setas y gambas (Huevos, Marisco)
(15, 8), (15, 3),
-- Macarrones con queso (Pasta, Lácteos)
(16, 6), (16, 9),
-- Bacalao al pil-pil (Pescado)
(17, 2),
-- Hamburguesa completa (Carne, Lácteos, Verduras)
(18, 1), (18, 9), (18, 5),
-- Ensalada de frutas (Fruta)
(19, 10),
-- Calamares en su tinta (Marisco, Arroz)
(20, 3), (20, 7);