package dao;

import java.util.ArrayList;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import view.AddTODO;

public class Todo {
	public void insertData(AddTODO vo) {
		try {
			SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();

			session.save(vo);

			transaction.commit();

			session.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public List<?> getDATA()
	{
		List ls=new ArrayList();
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query q=session.createQuery("from AddTODO");
        
        ls=q.list();
        transaction.commit();
        return ls;
	}
	public void deleteAll()
	{
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		session.createQuery("delete from AddTODO").executeUpdate();

        transaction.commit();
	}
	public void delete(String email){
		
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		
		Query query=session.createQuery("delete from AddTODO where Email='"+email+"'");
		query.executeUpdate();
        
        transaction.commit();
		
	}
	public List<?> getRecord(String email){
		List ls=new ArrayList();
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();

		Session session = sessionFactory.openSession();

		Transaction transaction = session.beginTransaction();
		
		Query q=session.createQuery("from AddTODO where Email='"+email+"'");
        
        ls=q.list();
        transaction.commit();
        return ls;
	}
	public void update(AddTODO at) {
		
			SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();

			Session session = sessionFactory.openSession();

			Transaction transaction = session.beginTransaction();
			
			session.update(at);
			
			transaction.commit();
			
			session.close();
			
	}
	public List<?> getSearch(String name) {
		
		List ls=new ArrayList();
		
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		Query q=session.createQuery("from AddTODO where Name Like '"+name+"%'");
        
        ls=q.list();
        transaction.commit();
        return ls;
		
	}
}
