<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cfr1_form = {
        init:function() {
            $("#cfr1_btn").click( () => {
                cfr1_form.send();
            });
        },
        send:function() {
            $("#cfr1_form").attr({
                'action':'/cfr1impl',
                'method':'post'

            });
            $("#cfr1_form").submit();
        }
    };


    $(function() {
        cfr1_form.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="page-header">
        <h1>CFR1</h1>
        <h2>결과 : ${result}</h2>
        <h2>정확도 : ${confidence * 100} %</h2>
    </div>
    <br/>
    <form id="cfr1_form" action="/cfr1impl" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="img">Image :</label>
        <input type="file" class="form-control" name="img" id="img" placeholder="Input Image">
      </div>
      <button type="submit" id="cfr1_btn" class="btn btn-default">send</button>
    </form>
</div>
