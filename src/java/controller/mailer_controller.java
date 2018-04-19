///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
//import bean.Mailer;
//import java.io.File;
//import javax.servlet.ServletContext;
//import model.function;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//
///**
// *
// * @author PC
// */
//@Controller
//@RequestMapping("/mailer2/")
//public class mailer_controller {
//
//    @Autowired
//    Mailer mailer;
//
////    @RequestMapping("form2")
////    public String index() {
////        return "mailer/form2";
////    }
//
//    @Autowired
//    ServletContext context;
//
//    @RequestMapping("send")
//    public String send(ModelMap model, @RequestParam("from") String from, @RequestParam("to") String to, @RequestParam("subject") String subject, @RequestParam("body") String body, @RequestParam("cv") MultipartFile cv) {
//        try {
//            String fileName = cv.getOriginalFilename();
//            String path = context.getRealPath("/files/" + fileName);
//            cv.transferTo(new File(path));
//            mailer.send(from, to, subject, body, path, fileName);
//            model.addAttribute("message", "Gửi email thành công !");
//        } catch (Exception e) {
//            model.addAttribute("message", "Gửi email thất bại !");
//        }
//        return "mailer/form2";
//    }
//
//    @RequestMapping("sendRecord")
//    public String sendRecord(ModelMap model, @RequestParam("to") String to, @RequestParam("content") String content) {
//        try {
//            String from = "FPT-Polytechnic";
//            String subject = "Thư Thông Báo - FPT Polytechnic";
//            String body = "<h4>Bạn đã nhận giá về lý do: <b>" + content+"</b></h4>";
//            String day = function.Date("dd-MM-yyyy");
//            body = body + "<br><br><br>" + "<b>" + "<hr>" + "From : " + from + "<br><br>" + day + "</b>"
//                    + "<br><br><img src=\"https://ci5.googleusercontent.com/proxy/j6B6D4p8ubn7V0plS9UEytHEDT5evj7Q40mkxb1msqN341ZSIkHkG5jGG7GRESprWII5bw33J2CPpsK6c2-AgjVlqmahO56HGXA3DmaYaCT_jzLFB3eyeYCHP7DmQc_QAn2y-fVg2EbxoeqqRLdF2njLWioTfHJXgH-o0j08u69VtwFWjdcowT4A_dHIAyD4pLQPZaSbHjcw2wI=s0-d-e1-ft#https://docs.google.com/uc?export=download&amp;id=0BygWZ5EgPsiSVHhST25rTzViV00&amp;revid=0BygWZ5EgPsiST3FCNDNNMDlETkhCYTZhSitOUkpUajRpcTVRPQ\" width=\"420\" height=\"236\" class=\"CToWUd a6T\" tabindex=\"0\">";
//            mailer.sendRecord(from, to, subject, body);
//            model.addAttribute("message", "Gửi email thành công !");
//        } catch (Exception e) {
//            model.addAttribute("message", "Gửi email thất bại !");
//        }
//        return "mailer/form2";
//    }
//}
//
