package es.com.indra.Test;




import java.util.ArrayList;

import javax.security.sasl.SaslException;

import org.apache.log4j.BasicConfigurator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import org.junit.Before;
import org.junit.Test;

import es.com.indra.dao.EstabelecimentoDAOImpl;
import es.com.indra.domain.Estabelecimento;

public class EstabelecimentoActionTest {
    SessionFactory sessionFactory;
    EstabelecimentoDAOImpl banco;
    Estabelecimento estabelecimento;
    ArrayList<Estabelecimento> listEstabelecimento = new ArrayList<>();
    @Before
    public void init(){
        BasicConfigurator.configure();
        banco = new EstabelecimentoDAOImpl();
        estabelecimento = new Estabelecimento();
        AnnotationConfiguration config=new AnnotationConfiguration();
        config.setProperty("hibernate.connection.url","jdbc:postgresql://localhost:5432/struts");
        config.setProperty("hibernate.connection.username","postgres");
        config.setProperty("connection.password","123456");
        config.setProperty("hibernate.dialect","org.hibernate.dialect.PostgreSQLDialect");
        config.setProperty("hibernate.connection.driver_class","org.postgresql.Driver");
        config.setProperty("hibernate.current_session_context_class", "thread");
        config.setProperty("hibernate.show_sql", "false");
        config.setProperty("hibernate.temp.use_jdbc_metadata_defaults", "false");
        config.setProperty("hbm2ddl.auto", "create");
        config.addAnnotatedClass(Estabelecimento.class);
      
      sessionFactory = config.configure().buildSessionFactory();

    }
    @Test
    public void testListar() throws SaslException {
       
        banco.setSession(getSession());
        banco.setTransaction(getSession().beginTransaction());
        
        
       listEstabelecimento = (ArrayList<Estabelecimento>) banco.listEstabelecimento();
       System.out.println("tamanho lista: "+listEstabelecimento.size());
       for (int i = 0; i < listEstabelecimento.size(); i++) {
           System.out.println(listEstabelecimento.get(i).getCodigo()); 
       }
       getSession().close();
    }

    @Test
    public void testInserir() throws SaslException{
        banco.setSession(getSession());
        banco.setTransaction(getSession().beginTransaction());
        estabelecimento.setCodigo("junit");
        estabelecimento.setDescricao("junit");
        estabelecimento.setSituacao("teste");
        banco.saveOrUpdateEstabelecimento(estabelecimento);
        getSession().getTransaction().commit();
        getSession().close();
    }
    public Session getSession() throws SaslException
    {
        Session session;

        session = sessionFactory.getCurrentSession();

        return session;
    }
}