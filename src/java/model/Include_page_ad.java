/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author PC
 */
public class Include_page_ad {

    public String Include(String page) {
        String include;
        switch (page) {
            case "dashboard":
                include = "<%@include file= '" + page + "'%>";
                break;

            default:
                include = "<%@include file= 'dashboard'%>";
        }
        return include;
    }
}
