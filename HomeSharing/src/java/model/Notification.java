/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author MANH
 */
public class Notification {
    private int notification_id;
    private int housemanager_id;
    private int house_id;
    private String title;
    private String content;
    private Date create_date;

    public Notification() {
    }

    public Notification(int notification_id, int housemanager_id, int house_id, String title, String content, Date create_date) {
        this.notification_id = notification_id;
        this.housemanager_id = housemanager_id;
        this.house_id = house_id;
        this.title = title;
        this.content = content;
        this.create_date = create_date;
    }

    public int getNotification_id() {
        return notification_id;
    }

    public void setNotification_id(int notification_id) {
        this.notification_id = notification_id;
    }

    public int getHousemanager_id() {
        return housemanager_id;
    }

    public void setHousemanager_id(int housemanager_id) {
        this.housemanager_id = housemanager_id;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }
    
}
