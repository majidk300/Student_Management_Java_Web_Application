package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class loginEntitty {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 100)
    private String name;

    @Column(length = 100)
    private String password;

    @Column(length = 200)
    private String adminPhoto;

    public loginEntitty(String name, String password, String adminPhoto) {
        this.name = name;
        this.password = password;
        this.adminPhoto = adminPhoto;
    }

    public loginEntitty(int id, String name, String password, String adminPhoto) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.adminPhoto = adminPhoto;
    }
    
    

    public loginEntitty() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdminPhoto() {
        return adminPhoto;
    }

    public void setAdminPhoto(String adminPhoto) {
        this.adminPhoto = adminPhoto;
    }

    @Override
    public String toString() {
        return "loginEntitty{" + "id=" + id + ", name=" + name + ", password=" + password + ", adminPhoto=" + adminPhoto + '}';
    }

}
