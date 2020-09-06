package common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspBulletinBoard.controller.NullComHandler;

//@WebServlet(name = "DispatcherServlet", urlPatterns = { "/" }, initParams = {	@WebInitParam(name = "configFile", value = "/WEB-INF/properties/PathInfo.properties") }, loadOnStartup = 1)
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, ComHandlerInterface> commandHandlerMap = new HashMap<>();

	public void init(ServletConfig config) throws ServletException {
		String configFile = config.getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath = config.getServletContext().getRealPath(configFile);

		try (FileReader fis = new FileReader(configFilePath)) {
			prop.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Iterator<Object> keyIter = prop.keySet().iterator();

		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handerClassName = prop.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handerClassName);
				ComHandlerInterface handlerInstance = (ComHandlerInterface) handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getRequestURI();

		if (command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length()); // 진정한 서블릿 요청경로 매핑을 찾아낸다.
		}
		// System.out.println(command);

		ComHandlerInterface handler = commandHandlerMap.get(command);
		if (handler == null) {
			handler = new NullComHandler();
		}

		String viewPage = null;
		viewPage = handler.process(request, response);
		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
