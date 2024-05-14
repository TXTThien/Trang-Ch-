package org.example.controller.admin;


import org.example.entities.Account;
import org.example.entities.Bill;
import org.example.repository.AccountRepository;
import org.example.repository.BillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller("AdminBillController")
@RequestMapping("/api/bills")
public class AdminBillController {
    @Autowired
    private  BillRepository billRepository;
    @Autowired
    private  AccountRepository accountRepository;



    @GetMapping
    public ResponseEntity<List<Bill>> getAllBills() {
        List<Bill> bills = billRepository.findAll();
        return ResponseEntity.ok(bills);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Bill> getBillById(@PathVariable Integer id) {
        Optional<Bill> bill = billRepository.findById(id);
        return bill.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<Bill> createBill(@RequestBody Bill bill, @RequestParam("accountId") Integer accountId) {
        Account account = accountRepository.findById(accountId)
                .orElseThrow(() -> new RuntimeException("Account not found"));
        bill.setAccountID(account);
        Bill savedBill = billRepository.save(bill);
        return ResponseEntity.ok(savedBill);
    }



    @PutMapping("/{id}")
    public ResponseEntity<Bill> updateBill(@PathVariable Integer id, @RequestBody Bill updatedBill) {
        Optional<Bill> existingBill = billRepository.findById(id);
        if (existingBill.isPresent()) {
            Bill billToUpdate = existingBill.get();
            billToUpdate.setPaid(updatedBill.getPaid());
            Bill savedBill = billRepository.save(billToUpdate);
            return ResponseEntity.ok(savedBill);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBill(@PathVariable Integer id) {
        billRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
    @RequestMapping("/admin/bill")
    public ModelAndView categoryPage() {
        List<Bill> bills = billRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("views/admin/Bill");
        modelAndView.addObject("bills", bills);
        return modelAndView;
    }
}



