-- 1. Dishes Table
CREATE TABLE dishes (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tags Table
CREATE TABLE tags (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- 3. Many-to-Many Relationship Table
CREATE TABLE dish_tags (
    dish_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    PRIMARY KEY (dish_id, tag_id),
    CONSTRAINT fk_dish FOREIGN KEY (dish_id) REFERENCES dishes(id) ON DELETE CASCADE,
    CONSTRAINT fk_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);
