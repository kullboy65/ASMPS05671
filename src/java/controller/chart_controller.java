/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Dept_DAO;
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
public class chart_controller {

    @RequestMapping(params = "chart")
    public String getList(ModelMap model, @RequestParam("page") String page) {
        Dept_DAO dept_dao = new Dept_DAO();
        List l = dept_dao.getListDept();
        model.addAttribute("list", l);
        model.addAttribute("page", page);
        return "admin/index";
    }
}
