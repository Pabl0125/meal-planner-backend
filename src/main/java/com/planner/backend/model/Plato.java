package com.planner.backend.model;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "platos")
public class Plato {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String nombre;

    private String descripcion;
    /*
    *  fetch = FetchType.EAGER ->
    *  Carga las etiquetas inmediatamente cuando se consulta un plato
    *  (ideal para enviarle toda la información junta al frontend).
     */
    @ManyToMany(fetch = FetchType.EAGER) // Se trata de una relacion de muchos a muchos
    @JoinTable( // Configura la tabla intermedia que une ambas
            name = "plato_etiquetas",
            joinColumns = @JoinColumn(name = "plato_id"), // La columna que apunta a la tabla actual
            inverseJoinColumns = @JoinColumn(name = "etiqueta_id") // La columna que apunta a la otra tabla
    )
    private Set<Etiqueta> etiquetas = new HashSet<>();

    public Plato() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public Set<Etiqueta> getEtiquetas() { return etiquetas; }
    public void setEtiquetas(Set<Etiqueta> etiquetas) { this.etiquetas = etiquetas; }
}