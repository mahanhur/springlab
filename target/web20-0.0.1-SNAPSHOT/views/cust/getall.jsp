<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-sm-8 text-left">
  <h3>Cust All Page</h3>
  <table class="table">
    <thead>
    <tr>
      <th>ID</th>
      <th>NAME</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${clist}">
      <tr>
        <td><a href="/cust/get?id=${c.id}">${c.id}</a></td>
        <td>${c.name}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
