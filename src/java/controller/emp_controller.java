/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Dept_DAO;
import DAO.Emp_DAO;
import bean.Dept;
import bean.Emp;
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
public class emp_controller {

    Dept_DAO dept_dao = new Dept_DAO();
    Emp_DAO empt_dao = new Emp_DAO();

    @RequestMapping(params = "manage-emp")
    public String dashboard(ModelMap model, @RequestParam("page") String page) {
        List<Dept> list_dept = dept_dao.getListDept();
        List<Emp> list_empt = empt_dao.getListEmp();
        model.addAttribute("page", page);
        model.addAttribute("list_dept", list_dept);
        model.addAttribute("list_empt", list_empt);
        Emp emp = new Emp();
        emp.setPhoto("/PS04803_Assigment_JAVA5_SOF302/web/resources/images/images/avatar%20icon.png");
        model.addAttribute("emp_edit", emp);
        return "admin/index";
    }

    @RequestMapping(params = "btnInsert")
    public String insert(ModelMap model, Emp emp) {
        try {
            empt_dao.Insert(emp);
        } catch (Exception e) {
        }
        return "redirect:ad_index.htm?manage-emp&page=manage-emp";
    }

    @RequestMapping(params = "btnUpdate")
    public String Update(ModelMap model, Emp emp) {
        try {
            empt_dao.Update(emp);
        } catch (Exception e) {
        }
        return "redirect:ad_index.htm?manage-emp&page=manage-emp";
    }

    @RequestMapping(params = "lnkEdit")
    public String edit(ModelMap model, @RequestParam("id") String id) {
        Emp emp = empt_dao.getEmp(id);
        List<Dept> list_dept = dept_dao.getListDept();
        List<Emp> list_empt = empt_dao.getListEmp();
        model.addAttribute("page", "manage-emp");
        model.addAttribute("list_dept", list_dept);
        model.addAttribute("emp_edit", emp);
        model.addAttribute("list_empt", list_empt);
        return "admin/index";

    }

    @RequestMapping("delete_emp")
    public String delEmp(ModelMap model, @RequestParam("id") int id) {
        empt_dao.Delete(id);
        List<Dept> list_dept = dept_dao.getListDept();
        List<Emp> list_empt = empt_dao.getListEmp();
        model.addAttribute("page", "manage-emp");
        model.addAttribute("list_dept", list_dept);
        model.addAttribute("list_empt", list_empt);
        return "admin/index";

    }


}
