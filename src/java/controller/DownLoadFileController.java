package controller;

import entity.Customer;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DEKUPAC
 */
@WebServlet(name = "DownLoadFileController", urlPatterns = {"/DownLoadFileController"})
public class DownLoadFileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        {
            String fileName = request.getParameter("file");
            ServletContext context = request.getServletContext();
            String fullPath = context.getRealPath("/uploads/" + fileName);
            Path path = Paths.get(fullPath);
            byte[] data = Files.readAllBytes(path);
            response.setContentType("application/octet-stream");
            response.setHeader("Content-disposition", "attachment; filename=" + fileName);
            response.setContentLength(data.length);
            InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));
            OutputStream outStream = response.getOutputStream();
            byte[] buffer = new byte[4096];
            int byteRead = -1;
            while ((byteRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, byteRead);
            }
            inputStream.close();
            outStream.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
