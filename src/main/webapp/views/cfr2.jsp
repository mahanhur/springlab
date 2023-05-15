<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let cfr2_form = {
        init:function() {
            $("#cfr2_btn").click( () => {
                cfr2_form.send();
            });
        },
        send:function() {
            $("#cfr2_form").attr({
                'action':'/cfr2impl',
                'method':'post'

            });
            $("#cfr2_form").submit();
        }
    };


    $(function() {
        cfr2_form.init();
    });
</script>

<div class="col-sm-8 text-left">
    <div class="page-header">
        <h1>cfr2</h1>
        <h2>${result.gender}</h2>
        <h2>${result.age}</h2>
        <h2>${result.pose}</h2>
        <h2>${result.emotion}</h2>
    </div>
    <br/>
    <form id="cfr2_form" action="/cfr2impl" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="img">Image :</label>
            <input type="file" class="form-control" name="img" id="img" placeholder="Input Image">
        </div>
        <button type="submit" id="cfr2_btn" class="btn btn-default">send</button>
    </form>
</div>
