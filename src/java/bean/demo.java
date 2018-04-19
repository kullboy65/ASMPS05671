/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import DAO.Dept_DAO;
import DAO.Record_DAO;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author PC
 */
public class demo {

    public static void main(String args[]) {
        ArrayList<Top10> arraylist = new ArrayList<Top10>();
        Record_DAO record_dao = new Record_DAO();
        List<Record> l = record_dao.getListRecord("", "");
        for (Record record : l) {
            Top10 top = new Top10();
            top.setStaffId(record.getId());
            top.setName(record.getId());
            top.setUsername(record.getUsername());
            top.setDepartment(record.getDepartment());
            top.setPhoto(record.getPhoto());
            top.setLike(Integer.parseInt(record_dao.countRecord(1, record.getId(), 2017)));
            top.setDislike(Integer.parseInt(record_dao.countRecord(-1, record.getId(), 2017)));
            arraylist.add(top);
        }
        System.out.println("RollNum Sorting:");
        Collections.sort(arraylist, Top10.StuRollno);
        for (Top10 str : arraylist) {
            System.out.println(str);
        }
    }
}
