package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import model.dao.Dao;
import model.Vene;

@WebServlet("/veneet")
public class Veneet extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public Veneet() {
        super();
       System.out.println("Veneet.Veneet()");
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Veneet.doGet()");
		Dao dao = new Dao();
		  ArrayList<Vene> veneet = dao.listaaKaikki();
		  System.out.println(veneet);
		  String strJSON = new JSONObject().put("veneet", veneet).toString();
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.println(strJSON);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Veneet.doPost()");
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Veneet.doPut()");
	}


	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Veneet.doDelete()");
	}

}