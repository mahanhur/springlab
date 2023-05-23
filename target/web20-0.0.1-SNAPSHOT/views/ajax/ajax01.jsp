<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let ajax01 = {
    init: () => {

      setInterval( () => {
        $.ajax({
          url:'/getservertime',
          success: (data) => {
            ajax01.display(data);
          },
          error: () => {
            alert('ERROR...............');
          }
        });
      }, 1000);
    },
    display: (data) => {
      $('#server_time').text(data);
    }
  };

  $( () => {
    ajax01.init();
  })
</script>

<div class="col-sm-8 text-left">
  <h3>ajax01</h3><br/>
  <h4>Server Time</h4>
  <h5 id="server_time"></h5>
</div>