package org.example.controller.admin;



import org.example.entities.Account;
import org.example.entities.Banner;
import org.example.repository.AccountRepository;
import org.example.repository.BannerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller("AdminAccountController")
@RequestMapping("/api/admin-accounts")
public class AdminAccountController {

    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("/{accountId}")
    public ResponseEntity<Account> getAccountById(@PathVariable int accountId) {
        Optional<Account> optionalAccount = accountRepository.findById(accountId);
        return optionalAccount.map(account -> new ResponseEntity<>(account, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PostMapping
    public ResponseEntity<Account> createAccount(@RequestBody Account account) {
        Account createdAccount = accountRepository.save(account);
        return new ResponseEntity<>(createdAccount, HttpStatus.CREATED);
    }

    @PutMapping("/{accountId}")
    public ResponseEntity<Account> updateAccount(@PathVariable int accountId, @RequestBody Account updatedAccount) {
        Optional<Account> optionalAccount = accountRepository.findById(accountId);
        if (optionalAccount.isPresent()) {
            Account existingAccount = optionalAccount.get();
            existingAccount.setName(updatedAccount.getName());
            existingAccount.setPhoneNumber(updatedAccount.getPhoneNumber());
            existingAccount.setAddress(updatedAccount.getAddress());
            existingAccount.setRole(updatedAccount.getRole()); // Update role
            Account savedAccount = accountRepository.save(existingAccount);
            return new ResponseEntity<>(savedAccount, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{accountId}")
    public ResponseEntity<Void> deleteAccount(@PathVariable int accountId) {
        if (accountRepository.existsById(accountId)) {
            accountRepository.deleteById(accountId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping("/admin/account")
    public ModelAndView accountPage() {
        List<Account> accounts = accountRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("views/admin/Account");
        modelAndView.addObject("accounts", accounts);
        return modelAndView;
    }
}
