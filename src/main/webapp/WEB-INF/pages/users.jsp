<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users Page</title>
    <style>
        .tableparams{
            position: absolute;
            top: 18%;
            right: 10%;
        }
        #header{
            position: absolute;
            top: 7%;
            right: 13%;
        }
        #hrefPrev{
            font-family: Arial, sans-serif;
            font-size: 12px;
            position: absolute;
            bottom: 40%;
            left: 20%;
        }
        #hrevNext{
            font-family: Arial, sans-serif;
            font-size: 12px;
            position: absolute;
            bottom: 40%;
            left: 30%;
        }

           </style>
    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Users List</h1>

<c:if test="${!empty listUsers}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="120">Age</th>
            <th width="120">isAdmin</th>
            <th width="120">Date</th>
            <th width="60">Update</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listUsersPart}" var="user">
            <tr>
                <td>${user.id}</td>
                <td><a href="/userdata/${user.name}" target="_blank">${user.name}</a></td>
                <td>${user.age}</td>
                <td>${user.admin}</td>
                <td>${user.date}</td>
                <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<div id="header">
<h1>Add User</h1>
</div>

<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
    <div class="divfortable">
        <table class="tableparams">
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="admin">
                    <spring:message text="IsAdmin"/>
                </form:label>
            </td>
            <td>
                <form:input path="admin"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</div>
</form:form>
<div id="hrefPrev">
    <a href="<c:url value="/previous"/>"><--previous</a>
</div>
    <div id="hrevNext">
    <a href="<c:url value="/next"/>">next--></a>
    </div>
<c:url var="getAction" value="/userdata/"/>

<form:form action="${getAction}" commandName="user" method="GET">

           <table>

            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">

                        <input type="submit"
                               value="<spring:message text="Get User"/>"/>
                </td>
            </tr>
        </table>
</form:form>






</body>
</html>
