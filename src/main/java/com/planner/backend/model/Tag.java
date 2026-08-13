package com.planner.backend.model;

import jakarta.persistence.*;

@Entity //Mapeamos una tabla
@Table(name = "tags") //Especificamos el nombre de la tabla
public class Tag {
    @Id //Este atributo es la clave primaria de la tabla
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Le indicamos a postgres que genere una clave automatica del ID
    private Long id;

    @Column(nullable = false, unique = true) // Restricciones sobre la columna (no nula y unica)
    private String name;
    // Constructor vacia para JPA
    public Tag() {}
    // Getters y setters de los dos atributos
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}
