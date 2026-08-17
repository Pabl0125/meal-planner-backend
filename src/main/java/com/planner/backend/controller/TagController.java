package com.planner.backend.controller;

import com.planner.backend.model.Tag;
import com.planner.backend.service.TagService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tags")
@CrossOrigin(origins = "*")

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

}
