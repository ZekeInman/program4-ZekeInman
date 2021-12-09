
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Program 4</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div id="wrapper">
            <h1>Project 4</h1>

            <ol>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                    </c:forEach>
            </ol>

            <table>
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Hire Date</th>
                    <th>Employee Type</th>
                    <th>Yearly Cost</th>
                </tr>
                <c:forEach items="${persons}" var="person">
                    <tr>
                        <td>${person.value.employeeID}</td>
                        <td>${person.value.firstName} ${person.value.middleName} ${person.value.lastName}</td>
                        <td>${person.value.hireDate}</td>
                        <td>
                            <c:choose>
                                <c:when test="${person.value.getClass().getName() == 'business.EmpSalary'}">
                                    Salary
                                </c:when>
                                <c:when test="${person.value.getClass().getName() == 'business.EmpHourly'}">
                                    Hourly
                                </c:when>
                                <c:otherwise>
                                    None
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${person.value.calcYearlyCompensation() == 0.0}">
                                    None
                                </c:when>
                                <c:otherwise>
                                    ${person.value.getFormattedCompensation()}
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </body>
</html>
