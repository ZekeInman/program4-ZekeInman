
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Program 4</title>
    </head>
    <body>
        <div id="wrapper">
            <h1>Project 4</h1>

            <h3>${errors}</h3>



            <c:forEach items="${persons}" var="person">
                <p>${person.value.empID}</p>
            </c:forEach>

        </div>
    </body>
</html>
