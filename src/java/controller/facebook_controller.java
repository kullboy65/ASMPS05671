/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Facebook_DAO;
import bean.Facebook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author PC
 */
@Controller
public class facebook_controller {

    Facebook_DAO fbdao = new Facebook_DAO();

    @RequestMapping("btnpost")
    public String DangBai(Model model, Facebook fb) {
        fbdao.Insert(fb);
        return "redirect: user.htm";
    }

    @RequestMapping("changepass")
    public String changPass(Model model, @RequestParam("old") String oldpass, @RequestParam("new") String newpass, @RequestParam("id") String id) {
        fbdao.ChangePassword(id, oldpass, newpass);
        return "redirect: user.htm";
    }
}
