/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Comparator;

/**
 *
 * @author PC
 */
public class Top10 {

    String staffId, name, department, photo, username;
    int like, dislike, total;

    public Top10(String staffId, int like, int dislike) {
        this.staffId = staffId;
        this.like = like;
        this.dislike = dislike;
    }

    public Top10() {
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getDislike() {
        return dislike;
    }

    public void setDislike(int dislike) {
        this.dislike = dislike;
    }

    public int getTotal() {
        this.total = like - dislike;
        return total;
    }

    public static Comparator<Top10> StuRollno = new Comparator<Top10>() {

	public int compare(Top10 s1, Top10 s2) {

	   int rollno1 = s1.getTotal();
	   int rollno2 = s2.getTotal();

	   /*For ascending order*/
	   return rollno2-rollno1;

	   /*For descending order*/
	   //rollno2-rollno1;
   }
    };

    @Override
    public String toString() {
        return "[ ID=" + staffId + ", like=" + like + ", dis=" + dislike + ", total=" + total +", photo=" + photo + "]";
    }

}
