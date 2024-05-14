package org.example.controller.admin;

import org.example.entities.Account;
import org.example.entities.Bill;
import org.example.entities.BillInfo;
import org.example.entities.Review;
import org.example.repository.AccountRepository;
import org.example.repository.BillInfoRepository;
import org.example.repository.BillRepository;
import org.example.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@Controller
public class AdminDashBoard {
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private BillRepository billRepository;
    @Autowired
    private ReviewRepository reviewRepository;
    @Autowired
    private BillInfoRepository billInfoRepository;

    @RequestMapping({"/DashBoard"})
    public String DashBoard( Model model) {

        List<Account> accounts = accountRepository.findAll();
        List<Bill> bills = billRepository.findAll();
        List<Review> reviews = reviewRepository.findAll();
        List<BillInfo> BillInfos = billInfoRepository.findAll();

        model.addAttribute("accounts", accounts);
        model.addAttribute("bills", bills);
        model.addAttribute("reviews", reviews);
        model.addAttribute("BillInfos", BillInfos);

        return "views/admin/AdminDashboard";
    }
}
