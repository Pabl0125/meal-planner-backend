package com.planner.backend.controller;

import com.planner.backend.model.Dish;
import com.planner.backend.service.DishService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @RestController: Combina @Controller y @ResponseBody. Le indica a Spring que esta clase
 * es un Bean gestor de peticiones HTTP y que las respuestas deben transformarse automáticamente
 * a formato JSON (usando la librería Jackson internamente).
 *
 * @RequestMapping("/api/platos"): Establece el prefijo de URL base para todas las rutas definidas dentro.
 *
 * @CrossOrigin: Permite peticiones de origen cruzado (CORS). Es necesario para que tu frontend en Next.js
 * (que correrá en el puerto 3000) pueda consultar a Spring Boot (puerto 8080) sin ser bloqueado por el navegador.
 */

@RestController
@RequestMapping("/api/dishes")
@CrossOrigin(origins = "*")
public class DishController {
    /**
     * Inyección de Dependencias por Constructor (Buenas Prácticas):
     * Spring busca un Bean de tipo PlatoRepository en su contenedor de Inversión de Control (IoC)
     * e inyecta la instancia de forma automática aquí al instanciar el Controlador.
     */

    private final DishService dishService;

    public DishController(DishService dishService) {
        this.dishService = dishService;
    }


    @GetMapping// Metodo que mapea las solicitudes HTTP GET enviadas a '/api/platos
    public List<Dish> listDishes() {
        return dishService.getAllDishes();
    }

    @PostMapping // Metodo que mapea solicitudes HTTP POST ENVIADAS A /api/platos
    public Dish createDish(@RequestBody Dish dish) {
        return dishService.saveDish(dish);
    }

    @PutMapping("/{id}")
    public Dish updateDish(@PathVariable Long id, @RequestBody Dish dish) {
        return dishService.updateDish(id, dish);
    }

    @DeleteMapping("/{id}")
    public org.springframework.http.ResponseEntity<Void> deleteDish(@PathVariable Long id) {
        dishService.deleteDish(id);
        return org.springframework.http.ResponseEntity.noContent().build();
    }
}
