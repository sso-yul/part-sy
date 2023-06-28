<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Document</title>
</head>
<body>
	<section class="sec00">
		<form action="">
        <div class="ott-logo-box">
        	<input type="checkbox" id="ott1"  name="ott" value="1" />
        		<img class="ott-logo-img"
        			src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/tving.png"/>
        			
          	<input type="checkbox" id="ott2" name="ott" value="2"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/netplix.png"/>
              		
            <input type="checkbox" id="ott3" name="ott" value="3"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/wave.png"/>
            
            <input type="checkbox" id="ott4" name="ott" value="4"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/couple.png"/>
              		
       		<input type="checkbox" id="ott5" name="ott" value="5"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/watcha.png"/>
              		
            <input type="checkbox" id="ott6" name="ott" value="6"/>
            	<img class="ott-logo-img"
              		src="https://myottt.s3.ap-northeast-2.amazonaws.com/ott/disney.png"/>
        </div>
        <hr class="ott-logo-divider" />
        <ul class="ott-logo-text">
          <li>
            <input id="movie" type="checkbox" value="movie">
            <a href="#"><label for="movie">액션</label></a>
          </li>
          <li>
            <input id="movie1" type="checkbox" value="movie">
            <a href="#"><label for="movie1">어드벤쳐</label></a>
          </li>
          <li>
            <input id="movie2" type="checkbox" value="movie">
            <a href="#"><label for="movie2">SF</label></a>
          </li>
          <li>
            <input id="movie3" type="checkbox" value="movie">
            <a href="#"><label for="movie3">판타지</label></a>
          </li>
          <li>
            <input id="movie4" type="checkbox" value="movie">
            <a href="#"><label for="movie4">드라마</label></a>
          </li>
          <li>
            <input id="movie5" type="checkbox" value="movie">
            <a href="#"><label for="movie5">코미디</label></a>
          </li>
          <li>
            <input id="movie6" type="checkbox" value="movie">
            <a href="#"><label for="movie6">시대극</label></a>
          </li>
          <li>
            <input id="movie7" type="checkbox" value="movie">
            <a href="#"><label for="movie7">로맨스/멜로</label></a>
          </li>
          <li>
            <input id="movie8" type="checkbox" value="movie">
            <a href="#"><label for="movie8">공포/스릴러</label></a>
          </li>
          <li>
            <input id="movie9" type="checkbox" value="movie">
            <a href="#"><label for="movie9">미스터리</label></a>
          </li>
          <li>
            <input id="movie10" type="checkbox" value="movie">
            <a href="#"><label for="movie10">범죄</label></a>
          </li>
          <li>
            <input id="movie11" type="checkbox" value="movie">
            <a href="#"><label for="movie11">음악/뮤지컬</label></a>
          </li>
          <li>
            <input id="movie12" type="checkbox" value="movie">
            <a href="#"><label for="movie12">스포츠</label></a>
          </li>
          <li>
            <input id="movie13" type="checkbox" value="movie">
            <a href="#"><label for="movie13">다큐멘터리</label></a>
          </li>
          <li>
            <input id="movie14" type="checkbox" value="movie">
            <a href="#"><label for="movie14">가족</label></a>
          </li>
          <li>
            <input id="movie15" type="checkbox" value="movie">
            <a href="#"><label for="movie15">역사</label></a>
          </li>
        </ul>
        </form>
                  <button class="submit">Click</button>
      </section>
      
	<script type="text/javascript">
      	$(document).ready(function() {
      		$('.ott-logo-img').click(function() {
  			    var checkbox = $(this).prev('input[type="checkbox"]');
  			    checkbox.prop('checked', !checkbox.prop('checked'));
  			});
      		
  			
      		$('.ott-logo-box input:checked').siblings('img').css({
    			  'outline': '3px solid #33ff33',
    			  'border-radius': '10px'
    			});

			})
		
    </script>
    
</body>
</html>