package org.example.controller.admin;


import org.example.entities.Book;
import org.example.entities.Readbefore;
import org.example.entities.Review;
import org.example.repository.BookRepository;
import org.example.repository.ReadRepository;
import org.example.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/api/reads")
public class AdminReadingController {

    @Autowired
    private ReadRepository readRepository;
    @Autowired
    private BookRepository bookRepository;
    @GetMapping
    public List<Readbefore> getAllRead() {
        return readRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Readbefore> getReadById(@PathVariable int id) {
        return readRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
//    @GetMapping("/search")
//    public List<Review> getCategoriesByName(@RequestParam String name) {
//        return reviewRepository.findReview(name);
//    }

    @PostMapping("/reads")
    public ResponseEntity<Readbefore> createRead(@RequestBody Readbefore readbefore) {
        // Kiểm tra xem CategoryID đã tồn tại chưa
        if (readbefore.getReadID() != null && readRepository.findById(readbefore.getReadID()).isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        Readbefore newRead = readRepository.save(readbefore);
        return ResponseEntity.status(HttpStatus.CREATED).body(newRead);
    }


    @PutMapping("/{id}")
    public ResponseEntity<Readbefore> updateRead(@PathVariable int id, @RequestBody Readbefore readDetails) {
        return readRepository.findById(id)
                .map(existingRead -> {
                    existingRead.setImageLink(readDetails.getImageLink());
                    existingRead.setBookID(readDetails.getBookID());

                    return ResponseEntity.ok(readRepository.save(existingRead));
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteRead(@PathVariable int id) {
        return readRepository.findById(id)
                .map(readbefore -> {
                    readRepository.delete(readbefore);
                    return ResponseEntity.ok().build();
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }
    @RequestMapping("/admin/read")
    public ModelAndView reviewPage() {
        List<Readbefore> readbefores = readRepository.findAll();
        List<Book> books = bookRepository.findAll();

        ModelAndView modelAndView = new ModelAndView("views/admin/ReadBefore");
        modelAndView.addObject("readbefores", readbefores);
        modelAndView.addObject("books", books);

        return modelAndView;
    }
}
