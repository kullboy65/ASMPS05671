/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Ad_index_DAO;
import DAO.Chart_DAO;
import DAO.Facebook_DAO;
import DAO.Record_DAO;
import bean.Record;
import bean.Top10;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.ir.BreakNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author PC
 */
@Controller
public class home_controller {

    @RequestMapping("/home")
    public String Home(ModelMap model) {
        Ad_index_DAO dao_noti = new Ad_index_DAO();
        List list_noti = dao_noti.getListNotification();
        model.addAttribute("list_post", list_noti);
        model.addAttribute("top10", "false");
        return "home/home";
    }

    @RequestMapping("/user")
    public String User(ModelMap model, HttpSession session) {
        String id = (String) session.getAttribute("id");
        Facebook_DAO fbdao = new Facebook_DAO();
        List listnewfeed = fbdao.getNewFeed(id);
        Chart_DAO dao = new Chart_DAO();
        List list = dao.getListTask(id);
        model.addAttribute("avatar", fbdao.getAvatar(id));
        model.addAttribute("listRecord", list);
        model.addAttribute("listnewfeed", listnewfeed);
        model.addAttribute("top10", "user");
        return "home/home";
    }

    @RequestMapping("/top10")
    public String Top10(ModelMap model) {
        ArrayList<Top10> arraylist = new ArrayList<Top10>();
        Record_DAO record_dao = new Record_DAO();
        List<Record> l = record_dao.getListRecord("", "");
        int i = 1;
        for (Record record : l) {

            Top10 top = new Top10();
            top.setStaffId(record.getId());
            top.setName(record.getName());
            top.setUsername(record.getUsername());
            top.setDepartment(record.getDepartment());
            top.setPhoto(record.getPhoto());
            top.setLike(Integer.parseInt(record_dao.countRecord(1, record.getId(), 2017)));
            top.setDislike(Integer.parseInt(record_dao.countRecord(-1, record.getId(), 2017)));
            arraylist.add(top);
            if (i == 10) {
                break;
            } else {
                i++;
            }
        }
        System.out.println("RollNum Sorting:");
        Collections.sort(arraylist, Top10.StuRollno);

        model.addAttribute("top10", "true");
        model.addAttribute("listTOP", arraylist);
        return "home/home";
    }
}
