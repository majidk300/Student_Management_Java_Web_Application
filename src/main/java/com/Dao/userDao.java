package com.Dao;

import org.hibernate.query.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import com.entities.loginEntitty;
import java.util.List;
import org.hibernate.Transaction;

/**
 *
 * @author Majid
 */
public class userDao {

    private SessionFactory factory;

    public userDao(SessionFactory factory) {
        this.factory = factory;
    }

    public loginEntitty checkValidAdmin(String username, String password) {

        loginEntitty user = null;

        try {

            Session s = this.factory.openSession();

            Query q = s.createQuery("from loginEntitty where name=:e and password=:p");

            q.setParameter("e", username);
            q.setParameter("p", password);

            user = (loginEntitty) q.uniqueResult();

            s.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;

    }

//    SAVE NEW ADMIN
    public boolean SaveNewAdmin(loginEntitty newAdmin) {

        boolean flag = false;

        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();

            s.save(newAdmin);

            tx.commit();
            s.close();

            return flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    public List<loginEntitty> getAllUsers() {

        List<loginEntitty> users = null;

        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();

            Query query = s.createQuery("from loginEntitty");

            users = query.list();

            tx.commit();
            s.close();

            return users;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;

    }

//    DELETE ADMIN
    public boolean deleteAdmin(int AdminId) {

        boolean flag = false;

        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();

            String query = "delete loginEntitty where id=:id";

            Query q = s.createQuery(query);

            q.setParameter("id", AdminId);

            q.executeUpdate();

            tx.commit();
            s.close();

            return flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

//    Update Admin Profile 
    public boolean updateProfile(loginEntitty updateProfile) {

        boolean flag = false;

        try {

            Session s = this.factory.openSession();
            Transaction tx = s.beginTransaction();

            String query = "update loginEntitty set name=:name, password=:password, adminPhoto=:adminPhoto where id=:id";

            Query q = s.createQuery(query);

            q.setParameter("name", updateProfile.getName());
            q.setParameter("password", updateProfile.getPassword());
            q.setParameter("adminPhoto", updateProfile.getAdminPhoto());
            q.setParameter("id", updateProfile.getId());

            int result = q.executeUpdate();

            tx.commit();
            s.clear();

            return flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

}
