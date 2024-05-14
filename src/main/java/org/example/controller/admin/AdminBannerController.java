package org.example.controller.admin;


import org.example.entities.Banner;
import org.example.entities.Readbefore;
import org.example.entities.Type;
import org.example.repository.BannerRepository;
import org.example.repository.ReadRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/api/banners")
public class AdminBannerController {

    @Autowired
    private BannerRepository bannerRepository;

    @GetMapping
    public List<Banner> getAllBanner() {
        return bannerRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Banner> getBannerById(@PathVariable int id) {
        return bannerRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping("/banners")
    public ResponseEntity<Banner> createBanner(@RequestBody Banner banner) {
        if (banner.getBannerID() != null && bannerRepository.findById(banner.getBannerID()).isPresent()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }

        Banner newBanner = bannerRepository.save(banner);
        return ResponseEntity.status(HttpStatus.CREATED).body(newBanner);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Banner> updateBanner(@PathVariable Integer id, @RequestBody Banner banner) {
        if (!bannerRepository.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }

        banner.setBannerID(id); // Ensure the ID is set for the existing record
        Banner updatedBanner = bannerRepository.save(banner);
        return ResponseEntity.ok(updatedBanner);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteBanner(@PathVariable int id) {
        return bannerRepository.findById(id)
                .map(banner -> {
                    bannerRepository.delete(banner);
                    return ResponseEntity.ok().build();
                }).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @RequestMapping("/admin/banner")
    public ModelAndView bannerPage() {
        List<Banner> banners = bannerRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("views/admin/Banner");
        modelAndView.addObject("banners", banners);
        return modelAndView;
    }
}

