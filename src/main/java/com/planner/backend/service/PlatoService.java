package com.planner.backend.service;

import com.planner.backend.model.Plato;
import com.planner.backend.repository.PlatoRepository;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @Service: Le dice a Spring que registre esta clase en su Contenedor IoC.
 * Aquí es donde debe residir toda la "lógica de negocio" de tu aplicación.
 */
@Service
public class PlatoService {

    private final PlatoRepository platoRepository;

    // Inyectamos el repositorio aquí en lugar del controlador
    public PlatoService(PlatoRepository platoRepository) {
        this.platoRepository = platoRepository;
    }

    public List<Plato> obtenerTodosLosPlatos() {
        // Aquí en el futuro puedes añadir filtros, ordenación, etc.
        return platoRepository.findAll();
    }

    public Plato guardarPlato(Plato plato) {
        // Ejemplo de lógica de negocio: validar que tenga nombre antes de guardar
        if (plato.getNombre() == null || plato.getNombre().isEmpty()) {
            throw new IllegalArgumentException("El plato debe tener un nombre");
        }
        return platoRepository.save(plato);
    }
}