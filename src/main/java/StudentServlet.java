import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DBConnection;
import model.Student;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {

    // ===================== GET =====================
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String action = req.getParameter("action");
        Connection con = DBConnection.getConnection();

        try {

            // 👉 VIEW ALL STUDENTS
            if (action == null) {

                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM students");

                List<Student> list = new ArrayList<>();

                while (rs.next()) {
                    Student s = new Student();
                    s.setId(rs.getInt("id"));
                    s.setName(rs.getString("name"));
                    s.setEmail(rs.getString("email"));
                    s.setCourse(rs.getString("course"));
                    s.setMarks(rs.getInt("marks"));
                    list.add(s);
                }

                req.setAttribute("list", list);
                req.getRequestDispatcher("students.jsp").forward(req, res);
            }

            // 👉 DELETE
            else if ("delete".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));

                PreparedStatement ps = con.prepareStatement(
                        "DELETE FROM students WHERE id=?");
                ps.setInt(1, id);
                ps.executeUpdate();

                res.sendRedirect("StudentServlet");
            }

            // 👉 EDIT
            else if ("edit".equals(action)) {

                int id = Integer.parseInt(req.getParameter("id"));

                PreparedStatement ps = con.prepareStatement(
                        "SELECT * FROM students WHERE id=?");
                ps.setInt(1, id);

                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    req.setAttribute("id", rs.getInt("id"));
                    req.setAttribute("name", rs.getString("name"));
                    req.setAttribute("email", rs.getString("email"));
                    req.setAttribute("course", rs.getString("course"));
                    req.setAttribute("marks", rs.getInt("marks"));

                    req.getRequestDispatcher("editStudent.jsp").forward(req, res);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ===================== POST =====================
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String action = req.getParameter("action");
        Connection con = DBConnection.getConnection();

        try {

            // 👉 ADD STUDENT
            if ("add".equals(action)) {

                PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO students(name,email,course,marks) VALUES(?,?,?,?)");

                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("email"));
                ps.setString(3, req.getParameter("course"));
                ps.setInt(4, Integer.parseInt(req.getParameter("marks")));

                ps.executeUpdate();

                res.sendRedirect("StudentServlet");
            }

            // 👉 UPDATE STUDENT
            else if ("update".equals(action)) {

                PreparedStatement ps = con.prepareStatement(
                        "UPDATE students SET name=?,email=?,course=?,marks=? WHERE id=?");

                ps.setString(1, req.getParameter("name"));
                ps.setString(2, req.getParameter("email"));
                ps.setString(3, req.getParameter("course"));
                ps.setInt(4, Integer.parseInt(req.getParameter("marks")));
                ps.setInt(5, Integer.parseInt(req.getParameter("id")));

                ps.executeUpdate();

                res.sendRedirect("StudentServlet");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}