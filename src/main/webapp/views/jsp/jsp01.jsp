<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>

</script>

<div class="col-sm-8 text-left">
  <h3 id="jsp01">JSP01</h3><br/>
  <h2>${num}</h2>
  <fmt:parseNumber integerOnly="true" type="number" value="${num}" /><br/>
  <fmt:formatNumber value="${num}" type="currency" /><br/>
  <fmt:formatNumber type="number" pattern="###.###$" value="${num}" /><br/>
  <h2>${cust}</h2>
  <h2><c:out value="${cust.name}"/></h2>
  <h2><c:out value="${cust.id}"/></h2>
  <h2>${cust.pwd}</h2>
  <h2>${cdate}</h2>
  <h2><fmt:formatDate  value="${cdate}" pattern="yyyy-MM-dd" /></h2>

  <h2>${num*2}</h2>
  <c:set var="mynum" value="${num*3}"/>
  <h2><c:out value="${mynum}"/></h2>

</div>
