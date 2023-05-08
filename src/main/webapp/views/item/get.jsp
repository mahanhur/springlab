<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let item_get={
    init: () => {
     $('#cart_btn').click( function(){
       // $('#cart_form').attr({
       //   method:'get',
       //   action:'/item/addcart'
       // });
       // $('#cart_form').submit();
       let cust_id = '${logincust.id}';
       let item_id = ${gitem.id};
       let cnt = $("#cnt").val();
       $.ajax({
         url:'/addcart',
         data:{cust_id:cust_id, item_id:item_id, cnt:cnt},
         success: function(){
           $('#myModal').modal();
         },
         error: function() {
           alert('ajax connection error')
         }
       });
      });
    }
  };

  $( () => {
    item_get.init();
  });

</script>


<div class="col-sm-8 text-left">
  <h3>Item Info</h3>
  <hr/>
  <img src="/uimg/${gitem.imgname}" style="height:400px;">
  <hr/>
  <h4>ID : ${gitem.id}</h4>
  <h4>Name : ${gitem.name}</h4>
  <h4>Price : ${gitem.price}</h4>
  <c:if test="${logincust != null}">
    <form id="cart_form" class="form-inline well">
      <input type="hidden" name="cust_id" value="${logincust.id}">
      <input type="hidden" name="item_id" value="${gitem.id}">
      <div class="form-group">
        <label for="cnt">Count : </label>
        <input type="number" class="form-control" name="cnt" id="cnt" placeholder="Enter count">
      </div>
      <button type="button" id="cart_btn" class="btn btn-default">Cart Add</button>
    </form>
  </c:if>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <a href="/item/allcart?id=${logincust.id}" class="btn btn-info" role="button">장바구니로 이동</a>
        <a href="/item/allpage" class="btn btn-info" role="button">계속 쇼핑</a>
      </div>
      <div class="modal-footer">
      </div>
    </div>

  </div>
</div>