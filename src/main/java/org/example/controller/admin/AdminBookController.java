package org.example.controller.admin;


import org.example.entities.Book;
import org.example.entities.Category;
import org.example.entities.Type;
import org.example.repository.BookRepository;
import org.example.repository.CategoryRepository;
import org.example.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller("AdminBookController")
@RequestMapping("/api/books")
public class AdminBookController {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private TypeRepository typeRepository;


    @GetMapping
    public ResponseEntity<List<Book>> getAllBooks() {
        List<Book> books = bookRepository.findAll();
        return ResponseEntity.ok(books);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Book> getBookById(@PathVariable("id") int id) {
        Book book = bookRepository.findBookByBookID(id);
        if (book != null) {
            return ResponseEntity.ok(book);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    @PostMapping("/books")
    public ResponseEntity<Book> createBook(@RequestBody Book book) {
        Integer bookId = book.getBookID();
        if (bookId != null && bookRepository.findById(bookId).isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        Book newBook = bookRepository.save(book);
        return ResponseEntity.status(HttpStatus.CREATED).body(newBook);
    }


    @PutMapping("/{id}")
    public ResponseEntity<Book> updateBook(@PathVariable("id") int id, @RequestBody Book updatedBook) {
        Book existingBook = bookRepository.findBookByBookID(id);
        if (existingBook != null) {
            existingBook.setTitle(updatedBook.getTitle());
            existingBook.setContent(updatedBook.getContent());
            existingBook.setPrice(updatedBook.getPrice());
            existingBook.setAvatar(updatedBook.getAvatar());
            existingBook.setAuthor(updatedBook.getAuthor());
            existingBook.setLanguage(updatedBook.getLanguage());
            existingBook.setAge(updatedBook.getAge());
            existingBook.setStock(updatedBook.getStock());

            if (updatedBook.getCategory() != null && updatedBook.getCategory().getCategoryID() != null) {
                Category category = categoryRepository.findById(updatedBook.getCategory().getCategoryID()).orElse(null);
                existingBook.setCategory(category);
            }

            if (updatedBook.getTypeID() != null && updatedBook.getTypeID().getTypeID() != null) {
                Type type = typeRepository.findById(updatedBook.getTypeID().getTypeID()).orElse(null);
                existingBook.setTypeID(type);
            }

            Book savedBook = bookRepository.save(existingBook);
            return ResponseEntity.ok(savedBook);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBook(@PathVariable("id") int id) {
        Book existingBook = bookRepository.findBookByBookID(id);
        if (existingBook != null) {
            bookRepository.delete(existingBook);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @RequestMapping("/admin/books")
    public ModelAndView booksPage() {
        List<Book> books = bookRepository.findAll();
        List<Category> categories = categoryRepository.findAll();
        List<Type> types = typeRepository.findAll();

        ModelAndView modelAndView = new ModelAndView("views/admin/Books");
        modelAndView.addObject("books", books);
        modelAndView.addObject("categories", categories);
        modelAndView.addObject("types", types);

        return modelAndView;
    }
}
