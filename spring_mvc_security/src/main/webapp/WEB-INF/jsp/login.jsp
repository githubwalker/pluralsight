<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>

    <c:set var="serverpath" scope="session" value="${pageContext.request.contextPath}"/>
    <c:set var="contextPath" scope="session" value="${pageContext.request.contextPath}"/>

    <title>Fitness tracker custom login page</title>
    <style type="text/css">
        .errorblock {
            color: #ff0000;
            background-color: #ffeeee;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
        }
    </style>
</head>

<body onload='document.f.j_username.focus()'>
    <h3>Fitness tracker custom login page</h3>
    <c:if test="${not empty error}">
        <br class="errorblock">
            Your login was unsuccessfull. <br/>
            Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>

    <div>
        <h1>
            Loggen in user: <sec:authentication property="name"/>!
        </h1>
    </div>


    <form action="${serverpath}/j_spring_security_check" name="f" method="POST">
        <table>
            <tr>
                <td>User:</td>
                <td><input type="text" name="j_username" placeholder="User name" required autofocus value=""></td>
            </tr>

            <tr>
                <td>Password:</td>
                <td><input type="password" name="j_password" placeholder="Password" required value=""></td>
            </tr>

            <span>${error}</span>
            <tr>
                <td colspan="2"><input type="submit" name="Submit" value="Submit"></td>
            </tr>

            <tr>
                <td colspan="2"><input type="reset" name="reset"></td>
            </tr>

            <tr>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </tr>
        </table>
    </form>

</body>

</html>

