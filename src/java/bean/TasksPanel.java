/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author PC
 */
public class TasksPanel {

    int userID;
    String id, type, name, username, currenttime, reason, date;
    boolean see;

    public TasksPanel() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        if (type.equals("1")) {
            this.type = "fa fa-thumbs-o-up text-primary";
        } else {
            this.type = "fa fa-thumbs-o-down text-danger";
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCurrenttime() {
        return currenttime;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setCurrenttime(String currenttime) {
        int time = Integer.parseInt(currenttime);

        if (time < 1) {
            this.currenttime = "just now";
        }
        if (time >= 1) {
            this.currenttime = time + " minutes ago";
        }
        if ((time / 60) >= 1) {
            this.currenttime = time / 60 + " hour ago";
        }
        if ((time / 1440) >= 1 && (time / 1440) < 2) {
            this.currenttime = "yesterday";
        }
        if ((time / 1440) >= 2) {
            this.currenttime = getDate();
        }

    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public boolean getSee() {
        return see;
    }

    public void setSee(boolean see) {
        this.see = see;
    }
    
    

    public static void main(String[] args) {
        TasksPanel t = new TasksPanel();
        t.setCurrenttime("64");
        System.out.println(t.getCurrenttime());
    }

}
