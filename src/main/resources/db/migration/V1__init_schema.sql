-- 1. Tabla de Platos
CREATE TABLE platos (
                        id BIGSERIAL PRIMARY KEY,
                        nombre VARCHAR(150) NOT NULL,
                        descripcion TEXT,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabla de Etiquetas
CREATE TABLE etiquetas (
                           id BIGSERIAL PRIMARY KEY,
                           nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Tabla de Relación (Muchos a Muchos)
CREATE TABLE plato_etiquetas (
                                 plato_id BIGINT NOT NULL,
                                 etiqueta_id BIGINT NOT NULL,
                                 PRIMARY KEY (plato_id, etiqueta_id),
                                 CONSTRAINT fk_plato FOREIGN KEY (plato_id) REFERENCES platos(id) ON DELETE CASCADE,
                                 CONSTRAINT fk_etiqueta FOREIGN KEY (etiqueta_id) REFERENCES etiquetas(id) ON DELETE CASCADE
);