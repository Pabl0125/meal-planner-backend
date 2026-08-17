package com.planner.backend.service;

import com.planner.backend.model.Dish;
import com.planner.backend.repository.DishRepository;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @Service: Le dice a Spring que registre esta clase en su Contenedor IoC.
 * Aquí es donde debe residir toda la "lógica de negocio" de tu aplicación.
 */
@Service
public class DishService {

    private final DishRepository dishRepository;

    // Inyectamos el repositorio aquí en lugar del controlador
    public DishService(DishRepository dishRepository) {
        this.dishRepository = dishRepository;
    }

    public List<Dish> getAllDishes() {
        // Aquí en el futuro puedes añadir filtros, ordenación, etc.
        return dishRepository.findAll();
    }

    public Dish saveDish(Dish dish) {
        // Ejemplo de lógica de negocio: validar que tenga nombre antes de guardar
        if (dish.getName() == null || dish.getName().isEmpty()) {
            throw new IllegalArgumentException("El plato debe tener un nombre");
        }
        return dishRepository.save(dish);
    }
}
