package org.example.controller.admin;


import org.example.entities.News;
import org.example.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/news")
public class AdminNewsController {

    @Autowired
    private NewsRepository newsRepository;

    @PostMapping
    public ResponseEntity<?> createNews(@RequestBody News news) {
        Integer newsId = news.getNewsID();
        if (newsId != null && newsRepository.existsById(newsId)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
        News newNews = newsRepository.save(news);
        return ResponseEntity.status(HttpStatus.CREATED).body(newNews);
    }
    @GetMapping("/all")
    public List<News> getAllNews() {
        return newsRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getNewsById(@PathVariable("id") Integer id) {
        News news = newsRepository.findById(id).orElse(null);
        if (news == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("News có ID " + id + " không có");
        }
        return ResponseEntity.ok(news);
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateNews(@PathVariable("id") Integer id, @RequestBody News updatedNews) {
        News existingNews = newsRepository.findById(id).orElse(null);
        if (existingNews == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("News có ID " + id + " không có");
        }
        existingNews.setNewsImage(updatedNews.getNewsImage());
        existingNews.setNewsTitle(updatedNews.getNewsTitle());
        News savedNews = newsRepository.save(existingNews);
        return ResponseEntity.ok(savedNews);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteNews(@PathVariable("id") Integer id) {
        if (!newsRepository.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("News with ID " + id + " not found");
        }
        newsRepository.deleteById(id);
        return ResponseEntity.ok(null);
    }
}

