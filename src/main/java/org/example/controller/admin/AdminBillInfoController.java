package org.example.controller.admin;

import org.example.entities.Bill;
import org.example.entities.BillInfo;
import org.example.repository.BillInfoRepository;
import org.example.repository.BillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller("AdminBillinfoController")
@RequestMapping("/api/admin-billinfos")
public class AdminBillInfoController {

    @Autowired
    private  BillInfoRepository billInfoRepository;
    @Autowired
    private  BillRepository billRepository;



    @GetMapping
    public ResponseEntity<List<BillInfo>> getAllBillInfos() {
        List<BillInfo> billInfos = billInfoRepository.findAll();
        return ResponseEntity.ok(billInfos);
    }

    @GetMapping("/{id}")
    public ResponseEntity<BillInfo> getBillInfoById(@PathVariable Integer id) {
        Optional<BillInfo> billInfo = billInfoRepository.findById(id);
        return billInfo.map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<BillInfo> createBillInfo(@RequestBody BillInfo billInfo) {
        // Log giá trị nhận được
        System.out.println("Received billID: " + (billInfo.getBillID() != null ? billInfo.getBillID().getBillID() : "null"));

        if (billInfo.getBillID() == null || billInfo.getBillID().getBillID() == null) {
            return ResponseEntity.badRequest().body(null);
        }

        Optional<Bill> bill = billRepository.findById(billInfo.getBillID().getBillID());
        if (!bill.isPresent()) {
            System.out.println("Bill with ID " + billInfo.getBillID().getBillID() + " not found.");
            return ResponseEntity.notFound().build();
        }

        billInfo.setBillID(bill.get());
        BillInfo savedBillInfo = billInfoRepository.save(billInfo);
        return ResponseEntity.ok(savedBillInfo);
    }



    @PutMapping("/{id}")
    public ResponseEntity<BillInfo> updateBillInfo(@PathVariable Integer id, @RequestBody BillInfo updatedBillInfo) {
        Optional<BillInfo> existingBillInfo = billInfoRepository.findById(id);
        if (existingBillInfo.isPresent()) {
            BillInfo billInfoToUpdate = existingBillInfo.get();
            billInfoToUpdate.setNumber(updatedBillInfo.getNumber());
            billInfoToUpdate.setBookid(updatedBillInfo.getBookid());

            BillInfo savedBillInfo = billInfoRepository.save(billInfoToUpdate);
            return ResponseEntity.ok(savedBillInfo);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBillInfo(@PathVariable Integer id) {
        billInfoRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    @RequestMapping("/admin/billinfo")
    public ModelAndView billinfoPage() {
        List<BillInfo> billInfos = billInfoRepository.findAll();
        ModelAndView modelAndView = new ModelAndView("views/admin/BillInfo");
        modelAndView.addObject("billInfos", billInfos);
        return modelAndView;
    }
}
