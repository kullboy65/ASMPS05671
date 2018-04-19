/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Ad_index_DAO;
import DAO.Chart_DAO;
import DAO.Dept_DAO;
import bean.Dept;
import bean.Notification;
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
public class ad_index_cotroller {

    Ad_index_DAO dao_noti = new Ad_index_DAO();

    @RequestMapping("/post_notification")
    public String Post(@RequestParam("subject") String subject, @RequestParam("detail") String detail, @RequestParam("idStaff") String idStaff) {
        Notification n = new Notification();
        n.setSubject(subject);
        n.setDetail(detail);
        n.setIdStaff(idStaff);
        dao_noti.Insert(n);
        return "redirect:ad_index.htm?dashboard&page=dashboard";
    }

    @RequestMapping("/del_notification")
    public String Del(@RequestParam("id") String[] id) {
        for (int i = 0; i < id.length; i++) {
            dao_noti.Delete(id[i]);
        }
        return "redirect:ad_index.htm?dashboard&page=dashboard";
    }

    @RequestMapping(params = "dashboard")
    public String dashboard(ModelMap model, @RequestParam("page") String page) {
        Chart_DAO dao = new Chart_DAO();

        List listTask = dao.getListTask();
        List list_noti = dao_noti.getListNotification();
        model.addAttribute("page", page);
        model.addAttribute("listTask", listTask);
        model.addAttribute("list_noti", list_noti);
        return "admin/index";
    }

    @RequestMapping(params = "manage-dept")
    public String dept(ModelMap model, @RequestParam("page") String page) {
        Dept_DAO dao = new Dept_DAO();
        List list = dao.getListDept();
        model.addAttribute("page", page);
        model.addAttribute("listD", list);
        return "admin/index";
    }

    @RequestMapping("btnAddDept")
    public String addDept(ModelMap model, Dept dept) {
        Dept_DAO dao = new Dept_DAO();
        dao.insertDept(dept);
        return "redirect:ad_index.htm?manage-dept&page=manage-dept";
    }

    @RequestMapping("btnEditDept")
    public String editDept(Dept dept) {
        Dept_DAO dao = new Dept_DAO();
        dao.updateDept(dept);
        return "redirect:ad_index.htm?manage-dept&page=manage-dept";
    }

    @RequestMapping("btndelDept")
    public String delDept(@RequestParam("idDel") String id) {
        Dept_DAO dao = new Dept_DAO();
        dao.delDept(id);
        return "redirect:ad_index.htm?manage-dept&page=manage-dept";
    }
}
