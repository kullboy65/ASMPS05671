/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Dept_DAO;
import DAO.Record_DAO;
import bean.Dept;
import bean.Mailer;
import bean.Record;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
public class feedback_emp_controller {

    Record_DAO record_dao = new Record_DAO();
    Dept_DAO dept_dao = new Dept_DAO();

    @Autowired
    Mailer mailer;

    @RequestMapping("/femp")
    public String feedbackEmp(ModelMap model, Record record) {
        record_dao.insert(record);
        model.addAttribute("record", record);
        try {
            String to = record.getEmail();
            String from = "FPT-Polytechnic";
            String subject = "Thư Thông Báo - FPT Polytechnic";
            String body = "<h4>Bạn đã nhận giá về lý do: <b>" + record.getReason() + "</b></h4>";
            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy   hh:mm aa");
            Date date = new Date();
            String day = dateFormat.format(date);
            body = body + "<br><br><br>" + "<b>" + "<hr>" + "From : " + from + "<br><br>" + day + "</b>"
                    + "<br><br><img src=\"https://ci5.googleusercontent.com/proxy/j6B6D4p8ubn7V0plS9UEytHEDT5evj7Q40mkxb1msqN341ZSIkHkG5jGG7GRESprWII5bw33J2CPpsK6c2-AgjVlqmahO56HGXA3DmaYaCT_jzLFB3eyeYCHP7DmQc_QAn2y-fVg2EbxoeqqRLdF2njLWioTfHJXgH-o0j08u69VtwFWjdcowT4A_dHIAyD4pLQPZaSbHjcw2wI=s0-d-e1-ft#https://docs.google.com/uc?export=download&amp;id=0BygWZ5EgPsiSVHhST25rTzViV00&amp;revid=0BygWZ5EgPsiST3FCNDNNMDlETkhCYTZhSitOUkpUajRpcTVRPQ\" width=\"420\" height=\"236\" class=\"CToWUd a6T\" tabindex=\"0\">";
            mailer.sendRecord(from, to, subject, body);
//            model.addAttribute("message", "Gửi email thành công !");
        } catch (Exception e) {
//            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "redirect:ad_index.htm?manage-emp&page=manage-emp";
    }

        @RequestMapping("/email")
    public String emailEmp(ModelMap model, @RequestParam("to") String to, @RequestParam("subject") String subject, @RequestParam("content") String content) {
        try {
            String from = "FPT-Polytechnic";
            String body = content;
            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy   hh:mm aa");
            Date date = new Date();
            String day = dateFormat.format(date);
            body = body + "<br><br><br>" + "<b>" + "<hr>" + "From : " + from + "<br><br>" + day + "</b>"
                    + "<br><br><img src=\"https://ci5.googleusercontent.com/proxy/j6B6D4p8ubn7V0plS9UEytHEDT5evj7Q40mkxb1msqN341ZSIkHkG5jGG7GRESprWII5bw33J2CPpsK6c2-AgjVlqmahO56HGXA3DmaYaCT_jzLFB3eyeYCHP7DmQc_QAn2y-fVg2EbxoeqqRLdF2njLWioTfHJXgH-o0j08u69VtwFWjdcowT4A_dHIAyD4pLQPZaSbHjcw2wI=s0-d-e1-ft#https://docs.google.com/uc?export=download&amp;id=0BygWZ5EgPsiSVHhST25rTzViV00&amp;revid=0BygWZ5EgPsiST3FCNDNNMDlETkhCYTZhSitOUkpUajRpcTVRPQ\" width=\"420\" height=\"236\" class=\"CToWUd a6T\" tabindex=\"0\">";
            mailer.sendRecord(from, to, subject, body);
//            model.addAttribute("message", "Gửi email thành công !");
        } catch (Exception e) {
//            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "redirect:ad_index.htm?manage-emp&page=manage-emp";
    }

    @RequestMapping(params = "f-emp")
    public String getList(ModelMap model, @RequestParam("page") String page) {
        List<Record> l = record_dao.getListRecord("", "");
        List<Dept> list_dept = dept_dao.getListDept();
        model.addAttribute("list_record", l);
        model.addAttribute("list_dept", list_dept);
        model.addAttribute("page", page);
        return "admin/index";
    }

    @RequestMapping(params = "fee-emp")
    public String getList_fee(ModelMap model, @RequestParam("page") String page) {
        List<Record> l = record_dao.getListRecord("", "");
        List<Dept> list_dept = dept_dao.getListDept();
        model.addAttribute("list_record", l);
        model.addAttribute("list_dept", list_dept);
        model.addAttribute("page", page);
        return "admin/index";
    }

    @RequestMapping("/searchRecord")
    public String getList2(ModelMap model, @RequestParam("txtSearch") String txtSearch) {
        List<Record> l = record_dao.getListRecord(txtSearch, "");
        List<Dept> list_dept = dept_dao.getListDept();
        model.addAttribute("list_record", l);
        model.addAttribute("list_dept", list_dept);
        model.addAttribute("page", "f-emp");
        return "admin/index";
    }
}
