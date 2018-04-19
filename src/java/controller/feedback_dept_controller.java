/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Dept_DAO;
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
public class feedback_dept_controller {

    @RequestMapping(params = "feedback-dept")
    public String getList(ModelMap model, @RequestParam("page") String page, @RequestParam("year") String year) {
        String now = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
        Dept_DAO dept_dao = new Dept_DAO();
        List l = dept_dao.getListDept();

        if (year.equals("now")) {
            year = now;
        }
        
        model.addAttribute("list", l);
        model.addAttribute("page", page);
        model.addAttribute("setyear", year);
        model.addAttribute("now", now);
        return "admin/index";
    }
}
