-- =========================================
-- Criação da tabela de usuários
-- =========================================

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- Criação da tabela de notas
-- =========================================

CREATE TABLE notes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(200),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);

-- =========================================
-- Criação da tabela de imagens das notas
-- =========================================

CREATE TABLE note_images (
    id SERIAL PRIMARY KEY,
    note_id INTEGER NOT NULL,
    image_url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_note
        FOREIGN KEY (note_id)
        REFERENCES notes(id)
        ON DELETE CASCADE
);

-- =========================================
-- Índices para melhorar performance
-- =========================================

CREATE INDEX idx_notes_user_id
ON notes(user_id);

CREATE INDEX idx_note_images_note_id
ON note_images(note_id);