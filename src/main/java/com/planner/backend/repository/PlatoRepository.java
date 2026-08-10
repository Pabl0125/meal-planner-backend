package com.planner.backend.repository;

import com.planner.backend.model.Plato;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @Repository: Marca esta interfaz como un Bean de Spring en la capa de acceso a datos (DAO).
 * Spring detecta esta interfaz al arrancar y crea dinámicamente una implementación en memoria.
 *
 * Al extender de JpaRepository<Plato, Long>:
 * - 'Plato': La entidad que va a gestionar.
 * - 'Long': El tipo de dato de la Clave Primaria (@Id).
 * Nos regala métodos automáticos como: findAll(), findById(), save(), deleteById(), etc.
 */
@Repository
public interface PlatoRepository extends JpaRepository<Plato, Long> {}