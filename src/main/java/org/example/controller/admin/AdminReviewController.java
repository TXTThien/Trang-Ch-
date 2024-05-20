package org.example.controller.admin;

import org.example.entities.Account;
import org.example.entities.Book;
import org.example.entities.Review;
import org.example.repository.AccountRepository;
import org.example.repository.BookRepository;
import org.example.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/reviews")
public class AdminReviewController {
    @Autowired
    private  ReviewRepository reviewRepository;

    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private AccountRepository accountRepository;
    @GetMapping
    public List<Review> getAllReview() {
        return reviewRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Review> getReviewById(@PathVariable int id) {
        return reviewRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
//    @GetMapping("/search")
//    public List<Review> getCategoriesByName(@RequestParam String name) {
//        return reviewRepository.findReview(name);
//    }

    @PostMapping("/reviews")
    public ResponseEntity<Review> createReview(@RequestBody Review review) {
        if (review.getReviewID() != null && reviewRepository.findById(review.getReviewID()).isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        Review newReview = reviewRepository.save(review);
        return ResponseEntity.status(HttpStatus.CREATED).body(newReview);
    }


    @PutMapping("/{id}")
    public ResponseEntity<Review> updateReview(@PathVariable int id, @RequestBody Review reviewDetails) {
        return reviewRepository.findById(id)
                .map(existingReview -> {
                    existingReview.setComment(reviewDetails.getComment());

                    return ResponseEntity.ok(reviewRepository.save(existingReview));
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteReview(@PathVariable int id) {
        return reviewRepository.findById(id)
                .map(review -> {
                    reviewRepository.delete(review);
                    return ResponseEntity.ok().build();
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }
    @RequestMapping("/admin/review")
    public ModelAndView reviewPage() {
        List<Review> reviews = reviewRepository.findAll();
        List<Book> books = bookRepository.findAll();
        List<Account> accounts = accountRepository.findAll();

        ModelAndView modelAndView = new ModelAndView("views/admin/Review");
        modelAndView.addObject("reviews", reviews);
        modelAndView.addObject("books", books);
        modelAndView.addObject("accounts", accounts);

        return modelAndView;
    }
}
