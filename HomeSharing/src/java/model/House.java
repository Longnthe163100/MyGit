/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Array;

/**
 *
 * @author longn
 */
public class House {

    private int house_id;
    private int housemanager_id;
    private String address;
    private Float price;
    private String describe;
    private String city;
    private String img;
    private boolean status;

    public House() {
    }

    public House(int house_id, int housemanager_id, String address, Float price, String describe, String city, String img, boolean status) {
        this.house_id = house_id;
        this.housemanager_id = housemanager_id;
        this.address = address;
        this.price = price;
        this.describe = describe;
        this.city = city;
        this.img = img;
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
    }

    public int getHousemanager_id() {
        return housemanager_id;
    }

    public void setHousemanager_id(int housemanager_id) {
        this.housemanager_id = housemanager_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

}
