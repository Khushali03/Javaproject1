

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%


        String id = request.getParameter("id");
       
        
        Connection con;
        PreparedStatement per;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");
        per = con.prepareStatement("delete from stud_info where id=? ");
      
        per.setString(1,id);
        per.executeUpdate();
        
            out.println("<script>alert('record deleted...');</script>");
            
            

        
   

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="style.css" type="text/css">
    </head>
    <body>
        
    </body>
</html>
