
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

    if(request.getParameter("register")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String fees = request.getParameter("fees");
        
        Connection con;
        PreparedStatement per;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");
        per = con.prepareStatement("update stud_info set name=?,email=?,course=?,fees=? where id=?");
        per.setString(1,name);
        per.setString(2,email);
        per.setString(3,course);
        per.setString(4,fees);
        per.setString(5,id);
        per.executeUpdate();
        
            out.println("<script>alert('record update...');</script>");
   

        
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
         <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
     
        <div class="div"></div><br><br>
        <h1 class="upfateheading">Student Update</h1>
        <div class="form">
            <form  method="POST" action="#">
                
<%
                Connection con;
                PreparedStatement per;
                ResultSet rs;

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");

                String id = request.getParameter("id");
                per = con.prepareStatement("select * from stud_info where id = ?");
                per.setString(1, id);
                rs = per.executeQuery();
                while(rs.next())
                {


 %>

                <h3 class="heading">Fill the information <a href="index.jsp" class="back"> Click Back</a></h3>
                <br>

                <div class="register">
                    <label class="title"><b>Student name:</b></label><br>
                    <input type="text" id="name" value="<%= rs.getString("name") %>" name="name" required placeholder="Full Name" autocompleter="off"
                           pattern="^[A-Za-z0-9._-]{6,10}$" size="40"  maxlength="100">
                    <br><br>
                    <label class="title"><b>Email:</b></label><br>
                    <input type="email" id="email" value="<%= rs.getString("email") %>" name="email" required placeholder="Email" autocompleter="off"
                                        pattern="^[A-Za-z0-9 _.-]+@[A-Za-z.-]+\.[A-Za-z]{3,4}$" size="40" maxlength="30">
                    <br><br>
                    <label class="title"><b>Course:</b></label><br>
                    <input type="text" id="course" value="<%= rs.getString("course") %>" name="course" required placeholder="Couse" autocompleter="off"
                                        pattern="^[A-Za-z0-9 _.-]{8,15}$" size="40" maxlength="15">
                    <br><br>
                    <label class="title"><b>Fees</b></label><br>
                    <input type="text" id="fees" value="<%= rs.getString("fees") %>" name="fees" required placeholder="Fees" 
                                        pattern="^[A-Za-z0-9 _.-]{8,15}$" size="40" maxlength="15" autocompleter="off">
                    <br><br>
                    
<%
                        }
%>
                    
                    <input type="submit" id="register" name="register" value="Submit" class="submitbutton">
                    <input type="submit" id="reset" name="reset" value="ReSet" class="submitbutton">
                    <br><br>
                   

                </div>
            </form>

        </div>
    </body>
</html>
