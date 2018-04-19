/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.Login_DAO;
import bean.Emp;
import bean.Mailer;
import javax.servlet.http.HttpSession;
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
public class login_controller {

    Login_DAO logindao = new Login_DAO();

    @RequestMapping("/login")
    public String userLogin(HttpSession session, @RequestParam("username") String username, @RequestParam("password") String password) {
        try {
            String gioitinh;
            Login_DAO dao = new Login_DAO();
            Emp e = dao.login(username.toLowerCase(), password);
//            session.setAttribute("userlogin", e);
            session.setAttribute("user", e.getUsername());
            session.setAttribute("role", e.getRole());
            session.setAttribute("name", e.getName());
            session.setAttribute("photo", e.getPhoto());
            session.setAttribute("id", e.getId());
            session.setAttribute("email", e.getEmail());
            session.setAttribute("deparment", e.getDepartment());
            if (e.getGender()) {
                gioitinh = "nam";
            } else {
                gioitinh = "nu";
            }
            session.setAttribute("gender", gioitinh);
            return "redirect:home.htm";
        } catch (Exception e) {
            return "index/index";
        }
    }

    @RequestMapping("/logout")
    public String userLogout(HttpSession session) {
        session.invalidate();
        return "index/index";
    }

    @Autowired
    Mailer mailer;

    @RequestMapping("/resetpass")
    public String Reset(ModelMap model, @RequestParam("username") String username, @RequestParam("email") String email) {
        try {
            Login_DAO log_dao = new Login_DAO();
            String newpass = log_dao.resetPassword(username);
            mailer.sendPassword("Administrator", email, "Thông Báo", "Tài khoản của bạn đã thay đổi mật khẩu thành: " + newpass);
            model.addAttribute("mess2", "Sucessful: Thay đổi mật khẩu Thành Công!");
        } catch (Exception e) {
            model.addAttribute("mess", "False: Thay đổi mật khẩu Thất Bại!");
        }
        return "index/index";
    }
}
