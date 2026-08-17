-- 1. Inserción de 10 Etiquetas (Solo categorías/familias de alimentos)
INSERT INTO etiquetas (nombre) VALUES
                                   ('Verdura'),
                                   ('Fruta'),
                                   ('Carne'),
                                   ('Pescado'),
                                   ('Lacteos'),
                                   ('Frutos Secos'),
                                   ('Patatas'),
                                   ('Huevos'),
                                   ('Aceite'),
                                   ('Cereales');

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
(1, 4),
-- Pollo al horno con verduras (Carne, Verdura)
(2, 3), (2, 1),
-- Lentejas estofadas (Verdura, Patatas)
(3, 1), (3, 7),
-- Paella de marisco (Cereales, Pescado)
(4, 10), (4, 4),
-- Tortilla de patatas (Huevos, Patatas, Aceite)
(5, 8), (5, 7), (5, 9),
-- Pasta boloñesa (Cereales, Carne)
(6, 10), (6, 3),
-- Ensalada mixta (Verdura, Pescado, Huevos)
(7, 1), (7, 4), (7, 8),
-- Garbanzos con espinacas (Verdura)
(8, 1),
-- Entrecot de ternera (Carne, Verdura)
(9, 3), (9, 1),
-- Merluza en salsa verde (Pescado)
(10, 4),
-- Crema de calabaza (Verdura, Lacteos)
(11, 1), (11, 5),
-- Risotto de setas (Cereales, Lacteos, Verdura)
(12, 10), (12, 5), (12, 1),
-- Lasaña de carne (Cereales, Carne, Lacteos)
(13, 10), (13, 3), (13, 5),
-- Guiso de pavo con guisantes (Carne, Verdura)
(14, 3), (14, 1),
-- Revuelto de setas y gambas (Huevos, Pescado, Verdura)
(15, 8), (15, 4), (15, 1),
-- Macarrones con queso (Cereales, Lacteos)
(16, 10), (16, 5),
-- Bacalao al pil-pil (Pescado, Aceite)
(17, 4), (17, 9),
-- Hamburguesa completa (Carne, Lacteos, Verdura, Cereales)
(18, 3), (18, 5), (18, 1), (18, 10),
-- Ensalada de frutas (Fruta)
(19, 2),
-- Calamares en su tinta (Pescado, Cereales)
(20, 4), (20, 10);