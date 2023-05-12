<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let cart = {
    init: function(){

    }
  };


</script>

<div class="col-sm-8 text-left">
  <h3>My Cart</h3>
  <c:set var="total" value="0"/>
  <table class="table">
    <thead>
    <tr>
      <th>IMG</th>
      <th>ID</th>
      <th>NAME</th>
      <th>PRICE per unit</th>
      <th>COUNT</th>
      <th>TOTAL PRICE</th>
      <th>REGDATE</th>
      <th>DELETE</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="i" items="${allcart}">
      <tr>
        <td><img id="item_img" src="/uimg/${i.item_imgname}" style="height:200px"></td>
        <td>${i.item_id}</td>
        <td>${i.item_name}</td>
        <td><fmt:formatNumber value="${i.item_price}" pattern="###,###원" /></td>
        <td>${i.cnt}</td>
        <td><fmt:formatNumber value="${i.cnt * i.item_price}" pattern="###,###원" /></td>
        <td><fmt:formatDate  value="${i.rdate}" pattern="yy-MM-dd" /></td>
        <td><a href="/item/delcart?id=${i.id}" class="btn btn-info" role="button">DELETE</a></td>
      </tr>
      <c:set var="total" value="${total + (i.cnt * i.item_price)}" />
    </c:forEach>
    </tbody>
  </table>
  <hr/>
  <h4>Cart Total Price : <fmt:formatNumber value="${total}" pattern="###,###원" /></h4>
</div>
