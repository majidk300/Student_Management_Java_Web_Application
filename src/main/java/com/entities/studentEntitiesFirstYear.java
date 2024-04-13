package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class studentEntitiesFirstYear {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int studentId;

    @Column(length = 210)
    private String name;

    @Column(length = 210)
    private String rollNumber;

    @Column(length = 210)
    private String emaiId;

    @Column(length = 210)
    private String phoneNumber;

    @Column(length = 210)
    private String studentYear;

    @Column(length = 210)
    private String studentsession;

    @Column(length = 210)
    private String gender;

    @Column(length = 210)
    private String photo;

    public studentEntitiesFirstYear(String name, String rollNumber, String emaiId, String phoneNumber, String studentYear, String studentsession, String gender, String photo) {
        this.name = name;
        this.rollNumber = rollNumber;
        this.emaiId = emaiId;
        this.phoneNumber = phoneNumber;
        this.studentYear = studentYear;
        this.studentsession = studentsession;
        this.gender = gender;
        this.photo = photo;
    }

    public studentEntitiesFirstYear(int studentId, String name, String rollNumber, String emaiId, String phoneNumber, String studentYear, String studentsession, String gender, String photo) {
        this.studentId = studentId;
        this.name = name;
        this.rollNumber = rollNumber;
        this.emaiId = emaiId;
        this.phoneNumber = phoneNumber;
        this.studentYear = studentYear;
        this.studentsession = studentsession;
        this.gender = gender;
        this.photo = photo;
    }
    
    

    public studentEntitiesFirstYear() {
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getEmaiId() {
        return emaiId;
    }

    public void setEmaiId(String emaiId) {
        this.emaiId = emaiId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getStudentYear() {
        return studentYear;
    }

    public void setStudentYear(String studentYear) {
        this.studentYear = studentYear;
    }

    public String getStudentsession() {
        return studentsession;
    }

    public void setStudentsession(String studentsession) {
        this.studentsession = studentsession;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "studentEntitiesFirstYear{" + "studentId=" + studentId + ", name=" + name + ", rollNumber=" + rollNumber + ", emaiId=" + emaiId + ", phoneNumber=" + phoneNumber + ", studentYear=" + studentYear + ", studentsession=" + studentsession + ", gender=" + gender + ", photo=" + photo + '}';
    }

}
