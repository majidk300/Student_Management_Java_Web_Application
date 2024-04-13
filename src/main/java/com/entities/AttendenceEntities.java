package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AttendenceEntities {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String StudentName;

    private String StudentRollNumber;

    private int StudentId;

    private String attendence;

    private String attendenceDate;

    public AttendenceEntities(String StudentName, String StudentRollNumber, int StudentId, String attendence, String attendenceDate) {
        this.StudentName = StudentName;
        this.StudentRollNumber = StudentRollNumber;
        this.StudentId = StudentId;
        this.attendence = attendence;
        this.attendenceDate = attendenceDate;
    }

    public AttendenceEntities(int id, String StudentName, String StudentRollNumber, int StudentId, String attendence, String attendenceDate) {
        this.id = id;
        this.StudentName = StudentName;
        this.StudentRollNumber = StudentRollNumber;
        this.StudentId = StudentId;
        this.attendence = attendence;
        this.attendenceDate = attendenceDate;
    }

    public AttendenceEntities() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentName() {
        return StudentName;
    }

    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    public String getStudentRollNumber() {
        return StudentRollNumber;
    }

    public void setStudentRollNumber(String StudentRollNumber) {
        this.StudentRollNumber = StudentRollNumber;
    }

    public int getStudentId() {
        return StudentId;
    }

    public void setStudentId(int StudentId) {
        this.StudentId = StudentId;
    }

    public String getAttendence() {
        return attendence;
    }

    public void setAttendence(String attendence) {
        this.attendence = attendence;
    }

    public String getAttendenceDate() {
        return attendenceDate;
    }

    public void setAttendenceDate(String attendenceDate) {
        this.attendenceDate = attendenceDate;
    }

    @Override
    public String toString() {
        return "AttendenceEntities{" + "id=" + id + ", StudentName=" + StudentName + ", StudentRollNumber=" + StudentRollNumber + ", StudentId=" + StudentId + ", attendence=" + attendence + ", attendenceDate=" + attendenceDate + '}';
    }

}
