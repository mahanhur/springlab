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
        // cfr1_form.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="page-header">
        <h1>OCR2</h1>
        <h2>날짜 : ${result.biznum}</h2>
        <h2>점저 : ${result.bizname}</h2>
        <h2>메인메뉴 : ${result.bizowner}</h2>
        <h2>서브메뉴 : ${result.bizdate}</h2>
    </div>
    <br/>
    <form id="ocr2_form" action="/ocr2impl" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="img">Image :</label>
        <input type="file" class="form-control" name="img" id="img" placeholder="Input Image">
      </div>
      <button type="submit" id="ocr2_btn" class="btn btn-default">send</button>
    </form>
</div>
