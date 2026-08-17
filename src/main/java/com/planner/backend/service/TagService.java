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

    public Tag updateTag(Long id, Tag updatedTag) {
        return tagRepository.findById(id).map(existingTag -> {
            if (updatedTag.getName() != null && !updatedTag.getName().isEmpty()) {
                existingTag.setName(updatedTag.getName());
            }
            return tagRepository.save(existingTag);
        }).orElseThrow(() -> new IllegalArgumentException("Tag not found with id: " + id));
    }

    public void deleteTag(Long id) {
        if (!tagRepository.existsById(id)) {
            throw new IllegalArgumentException("Tag not found with id: " + id);
        }
        tagRepository.deleteById(id);
    }
}
