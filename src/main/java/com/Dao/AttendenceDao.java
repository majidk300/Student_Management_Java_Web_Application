
package com.Dao;
import com.entities.AttendenceEntities;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class AttendenceDao {
    
   private SessionFactory factory;
   
   public AttendenceDao(SessionFactory factory){
       this.factory=factory;
   }
   
   public boolean TakeAttendece(AttendenceEntities studentAttendence){
       
       boolean flag  = false;
       
       try{
           
           Session s = this.factory.openSession();
           Transaction tx = s.beginTransaction();
           
           s.save(studentAttendence);
           
           tx.commit();
           s.close();
           
           return flag = true;
           
       }catch(Exception e){
           e.printStackTrace();
       }
       
       
       return  flag;
   }
   
//   ........................................................................................................................
//   ........................................................................................................................
//   ........................................................................................................................
//COUNT TOTAL STUDENT ATTENDENCE PRESENT AND ABSENT BOTH
 public Long countAttendenceSingleStudent(int StudentId) {
        Long studentCount = null;

        try {
            Session session = this.factory.openSession();

            Query query = session.createQuery("SELECT COUNT(*) FROM AttendenceEntities where StudentId=:StudentId");
            query.setParameter("StudentId", StudentId);

            // Execute the query and get the result
            studentCount = (Long) query.uniqueResult();

            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return studentCount;
    }
 
 //COUNT TOTAL STUDENT ATTENDENCE PRESENT ONLY
   public Long countAttendenceSingleStudenPresentt(int StudentId, String attendence) {
        Long studentCount = null;

        try {
            Session session = this.factory.openSession();

            Query query = session.createQuery("SELECT COUNT(*) FROM AttendenceEntities where StudentId=:StudentId and attendence=:attendence");
            
            query.setParameter("StudentId", StudentId);
            query.setParameter("attendence", attendence);

            // Execute the query and get the result
            studentCount = (Long) query.uniqueResult();

            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return studentCount;
    }
    
}
