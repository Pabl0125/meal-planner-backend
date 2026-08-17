package com.planner.backend.service;

import com.planner.backend.model.Tag;
import com.planner.backend.repository.TagRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagService {
    private final TagRepository tagRepository;
    public TagService(TagRepository tagRepository){this.tagRepository = tagRepository;}

    public List<Tag> getAllTags() {
        // Aquí en el futuro puedes añadir filtros, ordenación, etc.
        return tagRepository.findAll();
    }

    public Tag saveTag(Tag tag) {
        // Ejemplo de lógica de negocio: validar que tenga nombre antes de guardar
        if (tag.getName() == null || tag.getName().isEmpty()) {
            throw new IllegalArgumentException("Etiqueta must have a name");
        }
        return tagRepository.save(tag);
    }
}
