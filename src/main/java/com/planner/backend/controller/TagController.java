package com.planner.backend.controller;

import com.planner.backend.model.Tag;
import com.planner.backend.service.TagService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tags")
public class TagController {

    private final TagService tagService;

    public TagController(TagService tagService) {
        this.tagService = tagService;
    }


    @GetMapping// Metodo que mapea las solicitudes HTTP GET enviadas a '/api/platos
    public List<Tag> listTags() {
        return tagService.getAllTags();
    }

    @PostMapping // Metodo que mapea solicitudes HTTP POST ENVIADAS A /api/platos
    public Tag createTag(@RequestBody Tag tag) {
        return tagService.saveTag(tag);
    }

    @PutMapping("/{id}")
    public Tag updateTag(@PathVariable Long id, @RequestBody Tag tag) {
        return tagService.updateTag(id, tag);
    }

    @DeleteMapping("/{id}")
    public org.springframework.http.ResponseEntity<Void> deleteTag(@PathVariable Long id) {
        tagService.deleteTag(id);
        return org.springframework.http.ResponseEntity.noContent().build();
    }
}
