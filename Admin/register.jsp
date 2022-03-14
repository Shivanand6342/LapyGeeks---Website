<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <%
        String username = request.getParameter("username");
        String guardian = request.getParameter("guardian");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");

        String driverName = "com.mysql.jdbc.Driver";
        String url = "http://localhost/phpmyadmin/index.php?route=/table/structure&db=adv.+java+project&table=student";
        String user = "root";
        String pwd = "";

        CLass.forName(driverName).newInstance();

        Connection con = DriverManager.getConnection(url, user, pwd);

        PreparedStatement ps = con.preparedStatement("insert into student (Name, Guardian's Name, DOB, E-mail, Gender") values (?, ?, ?, ?, ?)");

        ps.setString(1, username);
        ps.setString(2, guardian);
        ps.setString(3, dob);
        ps.setString(4, email);
        ps.setString(6, gender);
        ps.execute();

        PreparedStatement st = con.prepareStatement("select * from student");
        ResultSet rs = st.executeQuery();
        while(rs.next())
        {
%>
            Hello ${param.username}
<%
        }

        rs.close();
        ps.close();
        st.close();
        con.close();
%>

</body>
</html>