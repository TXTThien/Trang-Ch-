package org.example.controller.admin;

import lombok.extern.java.Log;
import org.example.entities.News;
import org.example.entities.Review;
import org.example.entities.Type;
import org.example.repository.NewsRepository;
import org.example.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.Console;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/types")
public class AdminTypeController {
    @Autowired
    private TypeRepository typeRepository;

    @GetMapping
    public List<Type> getAllType() {
        return typeRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Type> getTypeById(@PathVariable int id) {
        return typeRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
//    @GetMapping("/search")
//    public List<Review> getCategoriesByName(@RequestParam String name) {
//        return reviewRepository.findReview(name);
//    }

    @PostMapping("/types")
    public ResponseEntity<Type> createType(@RequestBody Type type) {
        if (type.getTypeID() != null && typeRepository.findById(type.getTypeID()).isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        Type newType = typeRepository.save(type);
        return ResponseEntity.status(HttpStatus.CREATED).body(newType);
    }


    @PutMapping("/{id}")
    public ResponseEntity<Type> updateType(@PathVariable Integer id, @RequestBody Type type) {
        if (!typeRepository.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        type.setTypeID(id); // Ensure the ID is set for the existing record
        Type updatedType = typeRepository.save(type);
        return ResponseEntity.ok(updatedType);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteType(@PathVariable int id) {
        return typeRepository.findById(id)
                .map(readbefore -> {
                    typeRepository.delete(readbefore);
                    return ResponseEntity.ok().build();
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }
    @RequestMapping("/admin/type")
    public ModelAndView reviewPage() {
        List<Type> types = typeRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("views/admin/Type");
        modelAndView.addObject("types", types);
        return modelAndView;
    }
}
