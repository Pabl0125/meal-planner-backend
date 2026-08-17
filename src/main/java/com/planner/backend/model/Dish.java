package com.planner.backend.model;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "dishes")
public class Dish {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String name;

    private String description;
    /*
    *  fetch = FetchType.EAGER ->
    *  Carga las etiquetas inmediatamente cuando se consulta un plato
    *  (ideal para enviarle toda la información junta al frontend).
     */
    @ManyToMany(fetch = FetchType.EAGER) // Se trata de una relacion de muchos a muchos
    @JoinTable( // Configura la tabla intermedia que une ambas
            name = "dish_tags",
            joinColumns = @JoinColumn(name = "dish_id"), // La columna que apunta a la tabla actual
            inverseJoinColumns = @JoinColumn(name = "tag_id") // La columna que apunta a la otra tabla
    )
    private Set<Tag> tags = new HashSet<>();

    public Dish() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Set<Tag> getTags() { return tags; }
    public void setTags(Set<Tag> tags) { this.tags = tags; }
}
