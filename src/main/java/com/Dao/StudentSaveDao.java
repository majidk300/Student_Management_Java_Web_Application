package com.Dao;

import com.entities.studentEntitiesFirstYear;
import java.util.List;
import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import javax.servlet.http.HttpSession;
import org.hibernate.Transaction;

/**
 *
 * @author Majid
 */
public class StudentSaveDao {

    private SessionFactory factory;

    public StudentSaveDao(SessionFactory factory) {
        this.factory = factory;
    }

    //    THIRD YEAR
    public boolean saveStudentDetailsYear(studentEntitiesFirstYear saveStudentDetails) {

        boolean flag = false;

        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();

            s.save(saveStudentDetails);

            tx.commit();
            s.close();

            return flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

//*************************************************************************************************************************
//*************************************************************************************************************************
//*************************************************************************************************************************
//   Fetch  Student by Year For First Year
    public List<studentEntitiesFirstYear> getAllStudentsByYear() {

        List<studentEntitiesFirstYear> students = null;

        Session s = this.factory.openSession();

        String query = "from studentEntitiesFirstYear where studentYear=:year";

        Query q = s.createQuery(query);

        q.setParameter("year", "1st Year");

        students = q.list();

        s.close();

        return students;

    }

//   Fetch  Student by Year For Second Year
    public List<studentEntitiesFirstYear> getAllStudentsBySecondYear() {

        List<studentEntitiesFirstYear> students = null;

        Session s = this.factory.openSession();

        String query = "from studentEntitiesFirstYear where studentYear=:year";

        Query q = s.createQuery(query);

        q.setParameter("year", "2nd Year");

        students = q.list();

        s.close();

        return students;

    }

//   Fetch  Student by Year For First Year
    public List<studentEntitiesFirstYear> getAllStudentsByThirdYear() {

        List<studentEntitiesFirstYear> students = null;

        Session s = this.factory.openSession();

        String query = "from studentEntitiesFirstYear where studentYear=:year";

        Query q = s.createQuery(query);

        q.setParameter("year", "3rd Year");

        students = q.list();

        s.close();

        return students;

    }

//   Fetch  Student by Year For Fourth Year
    public List<studentEntitiesFirstYear> getAllStudentsByFourthYear() {

        List<studentEntitiesFirstYear> students = null;

        Session s = this.factory.openSession();

        String query = "from studentEntitiesFirstYear where studentYear=:year";

        Query q = s.createQuery(query);

        q.setParameter("year", "4th Year");

        students = q.list();

        s.close();

        return students;

    }

//    DELETE STUDENT
    public boolean DeleteStudentById(int StudentID) {

        boolean flag = false;

        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();

            String query = "delete studentEntitiesFirstYear where studentId=:studentId";

            Query q = s.createQuery(query);

            q.setParameter("studentId", StudentID);

            q.executeUpdate();

            tx.commit();
            s.close();

            return flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

    //    GET STUDENT BY ID
    public studentEntitiesFirstYear getStudentById(int studentId) {

        studentEntitiesFirstYear StudentUpdate = null;

        try {

            Session s = this.factory.openSession();

            String query = "from studentEntitiesFirstYear where studentId=:studentId";

            Query q = s.createQuery(query);

            q.setParameter("studentId", studentId);

            StudentUpdate = (studentEntitiesFirstYear) q.uniqueResult();

            s.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return StudentUpdate;
    }

    //    UPDATE STUDENT 
    public boolean UpdateStudent(studentEntitiesFirstYear studentDetail) {

        boolean flag = false;

        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();

            String query = "update studentEntitiesFirstYear set name=:name, rollNumber=:rollNumber, emaiId=:emaiId, phoneNumber=:phoneNumber, studentYear=:studentYear, studentsession=:studentsession, gender=:gender, photo=:photo where studentId=:studentId";

            Query q = s.createQuery(query);

            q.setParameter("name", studentDetail.getName());
            q.setParameter("rollNumber", studentDetail.getRollNumber());
            q.setParameter("emaiId", studentDetail.getEmaiId());
            q.setParameter("phoneNumber", studentDetail.getPhoneNumber());
            q.setParameter("studentYear", studentDetail.getStudentYear());
            q.setParameter("studentsession", studentDetail.getStudentsession());
            q.setParameter("gender", studentDetail.getGender());
            q.setParameter("photo", studentDetail.getPhoto());
            q.setParameter("studentId", studentDetail.getStudentId());

            int result = q.executeUpdate();

            tx.commit();
            s.clear();

            return flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

//    COUNT ALL STUDENTS IN NUMBER
    public Long countAllStudents() {
        Long studentCount = null;

        try {
            Session session = this.factory.openSession();

            Query query = session.createQuery("SELECT COUNT(*) FROM studentEntitiesFirstYear");

            // Execute the query and get the result
            studentCount = (Long) query.uniqueResult();

            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return studentCount;
    }
    
    
     public List<studentEntitiesFirstYear> getAllStudentsByYearLimitedStudent() {

        List<studentEntitiesFirstYear> students = null;

        Session s = this.factory.openSession();

        String query = "from studentEntitiesFirstYear where studentYear=:year order by studentId desc";

        Query q = s.createQuery(query);

        q.setMaxResults(5);
        q.setParameter("year", "1st Year");

        students = q.list();

        s.close();

        return students;

    }

}
