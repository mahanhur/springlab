<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-sm-8 text-left">
  <h3>JSP02</h3>

  <!--core if문-->
  <c:if test="${rcust != null}">
    <h2>${rcust.id}</h2>
    <c:if test="${rcust.id == 'id01'}">
      <h2>콜센터 직원</h2>
    </c:if>
  </c:if>
  <!--core if else문-->
  <c:choose>
    <c:when test="${num == 3}">
      <h2>Num is 3</h2>
    </c:when>
    <c:when test="${num == 2}">
      <h2>Num is 2</h2>
    </c:when>
    <c:otherwise>
      <h2>Num is 1</h2>
    </c:otherwise>
  </c:choose>

  <h4>End Page</h4>
</div>

