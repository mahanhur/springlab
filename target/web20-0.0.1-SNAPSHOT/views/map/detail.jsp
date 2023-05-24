<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-sm-8 text-left">
  <h3>MAP detail</h3>
  <img src="/uimg/${gmarker.img}">
  <h4>${gmarker.id}</h4>
  <h4><a href="${gmarker.target}">${gmarker.title}</a></h4>
  <br/>

  <table class="table">
    <thead>
    <tr>
      <th>imgname</th>
      <th>item</th>
      <th>price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="d" items="${markerd}">
      <tr>
        <td><img src="/uimg/${d.imgname}"></td>
        <td>${d.item}</td>
        <td>${d.price}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
