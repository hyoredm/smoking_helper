<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  
    <link href="css/register.css" rel="stylesheet">
</head>
<body>
<%
    String strReferer = request.getHeader("referer");
    
    if(strReferer == null){
    %>
    <script language="javascript">
    alert("get요청 접근불가");
    history.back();
    </script>
<% return;
    }
%>

    <h4>Join Us</h4>
    <div class="wrap">
       
<form id="form">
    <h3>약관 동의</h3>
    <div class="agree">
        <input type="checkbox" name="agree2" value="1" id="agree11">
        <label for="agree11">이용약관 동의 <span class="redspan">(필수)</span></label>
    </div>
    <textarea readonly>
      흡연하는 자들이여 너네는 무조건 해라.. 금연하지 않으면 저주에 걸릴 것이니.. 요즘 담뱃값이 5000원이던데.. 나는 그돈 모아서 치킨사먹겠다..
      약관 동의 안해? 그러면 폐 망가지는 거야~ 알아서 해~ 흡연하는 자들이여 너네는 무조건 해라.. 금연하지 않으면 저주에 걸릴 것이니.. 요즘 담뱃값이 5000원이던데.. 나는 그돈 모아서 치킨사먹겠다..약관 동의 안해? 그러면 폐 망가지는 거야~ 알아서 해~
      흡연하는 자들이여 너네는 무조건 해라.. 금연하지 않으면 저주에 걸릴 것이니.. 요즘 담뱃값이 5000원이던데.. 나는 그돈 모아서 치킨사먹겠다..
      약관 동의 안해? 그러면 폐 망가지는 거야~ 알아서 해~ 흡연하는 자들이여 너네는 무조건 해라.. 금연하지 않으면 저주에 걸릴 것이니.. 요즘 담뱃값이 5000원이던데.. 나는 그돈 모아서 치킨사먹겠다..약관 동의 안해? 그러면 폐 망가지는 거야~ 알아서 해~
    </textarea>

    <div class="agree">
        <input type="checkbox" name="agree3" value="1" id="agree21">
        <label for="agree21">개인정보 수집 및 이용 동의</label>
    </div>
    <textarea readonly>
       너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바
       너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바너희들이 이걸 선택 안 할 수 있지만 동의하게 되면 좋은 일이 생길꺼야.. 한 번해봐바
    </textarea>

    <div class="confirm">
        <a href="index.jsp" class="cancel">CANCEL</a>            
        <a href="register2.jsp" class="join disabled">JOIN</a>                
    </div>
</form>

    </div>


<script>
const agreeCheckbox = document.getElementById('agree11');
const joinButton = document.querySelector('.join');

agreeCheckbox.addEventListener('change', function() {
  joinButton.classList.toggle('disabled', !this.checked);
});

joinButton.addEventListener('click', function(event) {
  if (this.classList.contains('disabled')) {
    event.preventDefault();
  }
});
</script>






  
</body>
</html>