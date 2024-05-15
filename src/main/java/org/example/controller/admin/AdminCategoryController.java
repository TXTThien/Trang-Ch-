package org.example.controller.admin;

import org.example.entities.Category;
import org.example.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller("AdminCategoryController")
@RequestMapping("/api/categories")
public class AdminCategoryController {

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Category> getCategoryById(@PathVariable int id) {
        return categoryRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    @GetMapping("/search")
    public List<Category> getCategoriesByName(@RequestParam String name) {
        return categoryRepository.findCategoryByCategoryName(name);
    }

    @PostMapping("/categories")
    public ResponseEntity<Category> createCategory(@RequestBody Category category) {
        // Kiểm tra xem CategoryID đã tồn tại chưa
        if (category.getCategoryID() != null && categoryRepository.findById(category.getCategoryID()).isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        Category newCategory = categoryRepository.save(category);
        return ResponseEntity.status(HttpStatus.CREATED).body(newCategory);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Category> updateCategory(@PathVariable int id, @RequestBody Category categoryDetails) {
        return categoryRepository.findById(id)
                .map(existingCategory -> {
                    existingCategory.setCategoryName(categoryDetails.getCategoryName());

                    return ResponseEntity.ok(categoryRepository.save(existingCategory));
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCategory(@PathVariable int id) {
        return categoryRepository.findById(id)
                .map(category -> {
                    categoryRepository.delete(category);
                    return ResponseEntity.ok().build();
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @RequestMapping("/admin/category")
    public ModelAndView categoryPage() {
        List<Category> categories = categoryRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("views/admin/Category");
        modelAndView.addObject("categories", categories);
        return modelAndView;
    }

}
