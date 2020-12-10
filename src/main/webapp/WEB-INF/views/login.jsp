<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: #ffffff;
        padding: 60px 0;
    }
    
    div {
    display: block;
}
    
    #login-form > div {
        margin: 15px 0;
    }
    
    .btn_global {
    display: block;
    width: 100%;
    height: 56px;
    line-height: 55px;
    margin: 12px 0 14px;
    border-radius: 0;
    border: solid 1px rgba(0,0,0,.1);
    box-shadow: 0 2px 6px 0 rgba(61,80,81,.08);
    background-color: #878787;
    color: #fff;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: -.5px;
    cursor: pointer;
    text-align: center;
    -webkit-appearance: none;
}


@media (max-width: 768px)
#header .h_logo {
    width: 165px;
    height: 32px;
    background-image: url(resources/img/d.png);
    background-position: 50% 0;
    background-size: contain;
}

#header .h_logo {
	background-image: url("resources/img/d.png");
    display: block;
    overflow: hidden;
    width: 250px;
    height: 180px;
    margin: 0 auto;
    background-position: -1px -1px;
    font-size: 15px;
    color: transparent;
}

.blind {
    position: absolute;
    clip: rect(0 0 0 0);
    width: 1px;
    height: 1px;
    margin: -1px;
    overflow: hidden;
}

.bar {
    display: inline-block;
    width: 1px;
    height: 12px;
    text-indent: -999em;
    background: #e4e4e5;
    vertical-align: bottom;
}

</style>
</head>
<body>



<div class="container" align = "center" >
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
        	<div id ="header">
        		<h1>
		            <a href="#" class="sp h_logo"id="log.team">
		                <span class="blind">환영합니다!</span>
		            </a>
           		 </h1>
            </div>
            <div class="panel-body">
                <form id="login-form">
                    <div>
                        <input type="text" class="form-control" name="username" placeholder="ID" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                    <div>
                        <button type="submit" class="btn_global" >로그인</button>
                    </div>
                    <div>
                    	<div>
                    		<span>
                    			<input type ="checkbox" id="login_chk">
                    			<label >
                    				로그인 상태 유지
                    			</label>
                    		</span>
                    	</div>	
                    </div>
                </form>
            </div>
           
        </div>
    </div>
</div>
 <hr>
<div class="position_a" align = "center">
	<div class="find_info">
		<a target="_blank" id="idinquiry" href="#">아이디 찾기</a>
		<span class="bar" aria-hidden="true">|</span>
		<a target="_blank" id="pwdinquiry" href="#">비밀번호 찾기</a>
		<span class="bar" aria-hidden="true">|</span>
		<a target="_blank" id="register" href="#">회원가입</a>
	
	</div>
</div>


</body>
</html>