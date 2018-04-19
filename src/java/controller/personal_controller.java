/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Chart_DAO;
import bean.Record;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author PC
 */
@Controller
public class personal_controller {

    @RequestMapping("/personal")
    public String personal(HttpServletRequest request, ModelMap model) {
        String id = (String) request.getSession().getAttribute("id");
        Chart_DAO dao = new Chart_DAO();
        List list = dao.getListTask(id);
        model.addAttribute("listRecord", list);
        return "personal";
    }
}
