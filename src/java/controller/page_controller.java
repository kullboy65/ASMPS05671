/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Dept_DAO;
import DAO.Record_DAO;
import bean.Record;
import java.util.Calendar;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
public class page_controller {

    @RequestMapping("/index")
    public String index() {
        return "index/index";
    }

    @RequestMapping("/export_emp")
    public String export(ModelMap model) {
        Record_DAO record_dao = new Record_DAO();
        List<Record> l = record_dao.getListRecord("", "");
        model.addAttribute("list_record", l);
        return "admin/export/export_emp";
    }

    @RequestMapping("/export_dept")
    public String export2(ModelMap model, @RequestParam("year") String year) {
        String now = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
        Dept_DAO dept_dao = new Dept_DAO();
        List l = dept_dao.getListDept();

        if (year.equals("now")) {
            year = now;
        }
        
        model.addAttribute("list", l);
        model.addAttribute("setyear", year);
        model.addAttribute("now", now);
        return "admin/export/export_dept";
    }

    @RequestMapping("/personal_fb")
    public String fb() {
        return "home/personal_fb";
    }
//    @RequestMapping("/ad_index")
//    @RequestMapping(params = "dashboard")
//    public String dashboard(ModelMap model, @RequestParam("page") String page) {
//        Chart_DAO dao = new Chart_DAO();
//        List list = dao.getListTask();
//        model.addAttribute("page", page);
//        model.addAttribute("listTask", list);
//        return "admin/index";
//    }
//    @RequestMapping(params = "chart")
//    public String chart(ModelMap model, @RequestParam("page") String page) {
//        model.addAttribute("page", page);
//        return "admin/index";
//    }
    @RequestMapping(params = "feedback-emp")
    public String feedbackEmp(ModelMap model, @RequestParam("page") String page) {
        model.addAttribute("page", page);
        return "admin/index";
    }

    @RequestMapping("/demo2")
    public String Demo2() {
        return "demo2";
    }
//    @RequestMapping("/fee-emp")
//    public String Demo3() {
//        return "admin/fee-emp";
//    }

    @RequestMapping("/demo")
    public String Demo() {
        return "demo";
    }

}
