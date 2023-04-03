/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author longn
 */
public class City {

    private String name;
    private ArrayList<House> product = new ArrayList<>();

    public City() {
    }

    public City(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<House> getProduct() {
        return product;
    }

    public void setProduct(ArrayList<House> product) {
        this.product = product;
    }
    
    
}
