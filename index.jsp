

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

    if(request.getParameter("register")!=null)
    {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String fees = request.getParameter("fees");
        
        Connection con;
        PreparedStatement per;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");
        per = con.prepareStatement("insert into stud_info(name,email,course,fees)values(?,?,?,?)");
        per.setString(1,name);
        per.setString(2,email);
        per.setString(3,course);
        per.setString(4,fees);
        per.executeUpdate();
        
            out.println("<script>alert('record insert...');</script>");

        
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
        <div class="form">
            <form  method="POST" action="#">

                <h3 class="heading">Fill the information</h3>
                <p class="para2"><span class="span2">REGISTER</span></p>

                <div class="register">
                    <label class="title"><b>Student name:</b></label><br>
                    <input type="text" id="name" name="name" required placeholder="Full Name" autocompleter="off"
                           pattern="^[A-Za-z0-9._-]{6,10}$" size="40"  maxlength="100">
                    <br><br>
                    <label class="title"><b>Email:</b></label><br>
                    <input type="email" id="email" name="email" required placeholder="Email" autocompleter="off"
                                        pattern="^[A-Za-z0-9 _.-]+@[A-Za-z.-]+\.[A-Za-z]{3,4}$" size="40" maxlength="30">
                    <br><br>
                    <label class="title"><b>Course:</b></label><br>
                    <input type="text" id="course" name="course" required placeholder="Couse" autocompleter="off"
                                        pattern="^[A-Za-z0-9 _.-]{8,15}$" size="40" maxlength="15">
                    <br><br>
                    <label class="title"><b>Fees</b></label><br>
                    <input type="text" id="fees" name="fees" required placeholder="Fees" 
                                        pattern="^[A-Za-z0-9 _.-]{8,15}$" size="40" maxlength="15" autocompleter="off">
                    <br><br>
                    <input type="submit" id="register" name="register" value="Submit" class="submitbutton">
                    <input type="submit" id="reset" name="reset" value="ReSet" class="submitbutton">

                </div>
            </form>
         <div class="data">
             <p class="para3"><span class="span3">STUDENT DETAIL</span></p>
             <table border="2" id="tbl-student" class="tbl-student" cellpadding="0" width="100%">
                 <tr>
                     <th>no</th>
                     <th>name</th>
                     <th width="260px">email</th>
                     <th>course</th>
                     <th>fees</th>
                     <th></th>
                     <th></th>
                 </tr>

<%
        Connection con;
        PreparedStatement per;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");
        
        String query = "select * from stud_info";
        Statement st = con.createStatement();
        rs=st.executeQuery(query);
        while(rs.next())
        {
            String no = rs.getString("id");
        
        
%>



                 <tr>
                     <td><%=rs.getString("id") %></td>
                     <td><%=rs.getString("name") %></td>
                     <td><%=rs.getString("email") %></td>
                     <td><%=rs.getString("course") %></td>
                     <td><%=rs.getString("fees") %></td>
                     <td class="ed"><a href="update.jsp?id=<%=no%>">Edit</a></td>
                     <td class="ed"><a href="delete.jsp?id=<%=no%>">Delete</a></td> 
                 </tr>
                 
<%
    
           }
%>
                 
             </table>
         </div>
       
 
            </div>
   
    </body>
</html>
