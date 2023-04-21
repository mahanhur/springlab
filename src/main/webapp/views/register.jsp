<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let rgs_form = {
    init:() => {
      $("#rgs_btn").click( () => {
        rgs_form.send();
      });
    },
    send:() => {
      $("#rgs_form").attr({
        'action':'/rgsimpl',
        'method':'get'
      });
      $("#rgs_form").submit();
    }
  };

  $( () => {
    rgs_form.init();
  });

</script>

<div class="col-sm-8 text-left">
  <div class="page-header">
    <h1>Register</h1>
  </div>
  <div class="alert alert-danger alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>DANGER!</strong> Your information can be used by me.
  </div>
  <div class="well">This page is for register. Please fill in the blanks with your information.</div>
  <br/>
  <form id="rgs_form" class="form-horizontal">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">ID:</label>
      <div class="col-sm-10">
        <input type="id" class="form-control" name="id" id="id" placeholder="Enter ID">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter password">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="Address">Address:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="address" id="address" placeholder="Enter address">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2">Etc:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="etc" id="etc" placeholder="Etc">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="button" id="rgs_btn" class="btn btn-default">register</button>
      </div>
    </div>
  </form>
</div>
