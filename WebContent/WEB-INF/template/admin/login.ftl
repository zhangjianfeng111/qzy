<#escape x as x!"">
<#assign jslevel='${URLUtils.getDateString()}'/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Login -Admin</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- basic styles -->
    <link href="${request.contextPath}/resources/admin/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${request.contextPath}/resources/admin/assets/css/font-awesome.min.css" />

    <!-- ace styles -->

    <link rel="stylesheet" href="${request.contextPath}/resources/admin/assets/css/ace.min.css" />

    <!--[if lte IE 8]>
      <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    
    
    <script type="text/javascript">
		var YS = YS || {data:{},util:{}};
		YS.config = {path:{rootPath:"${request.contextPath}"}}
		</script>
  </head>

  <body class="login-layout">
    <div class="main-container">
      <div class="main-content">
        <div class="row">
          <div class="col-sm-10 col-sm-offset-1">
            <div class="login-container">
              <div class="center">
               <a href="${request.contextPath}/index" >
                <h1>
                  <i class="icon-leaf green"></i>
                  <span class="red">Back To Taste</span>
                </h1>
                </a>
                <h4 class="blue">Admin</h4>
              </div>

              <div class="space-6"></div>

              <div class="position-relative">
                <div id="login-box" class="login-box visible widget-box no-border">
                  <div class="widget-body">
                    <div class="widget-main">
                      <h4 class="header blue lighter bigger">
                        <i class="icon-coffee green"></i>
                        Please Enter Your Information
                      </h4>

                      <div class="space-6"></div>

                      <form id="saveForm">
                        <fieldset>
                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input id="account" name="username" type="text" class="form-control" placeholder="Username" />
                              <i class="icon-user"></i>
                            </span>
                            <span id="accountError" style="color:#cc0000;"></span>
                          </label>

                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input id="pwd" name="password" type="password" class="form-control" placeholder="Password" />
                              <i class="icon-lock"></i>
                            </span>
                            <span id="pwdError" style="color:#cc0000;"></span>
                          </label>
           

                          <label class="block clearfix">
                            <span class="block">
                              <input  id="yzm" name="yzm" type="text" class="" placeholder="Verify Code" />
                              <img id="yzmImg" onclick="changeImg(this)" src="${request.contextPath}/code?1"/>
                            </span>
                             <span id="yzmError" style="color:#cc0000;"></span>
                          </label>
                          
                          <div class="space"></div>

                          <div class="clearfix">
                            <label class="inline">
                              <input type="checkbox" class="ace" />
                              <span class="lbl"> Remember Me</span>
                            </label>
<!--	-->
                            <button id="bt" type="button" onclick="yzmSave('${request.contextPath}/yanzheng','${request.contextPath}/admin/console/ajax/j_spring_security_check','${request.contextPath}/admin/console/index')"  class="width-35 pull-right btn btn-sm btn-primary">
                              <i class="icon-key"></i>
                              Login
                            </button>
                            
                            <!--
                            <button id="bt" type="button" onclick="yzmSave('${request.contextPath}/yanzheng','${request.contextPath}/admin/console/loginIn','${request.contextPath}/admin/order/list/p1')"  class="width-35 pull-right btn btn-sm btn-primary">
                              <i class="icon-key"></i>
                              Login
                            </button>
                            -->
                          </div>

                          <div class="space-4"></div>
                        </fieldset>
                      </form>

                  

                      
                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">
                      <div>
                      	<!--
                        <a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
                          <i class="icon-arrow-left"></i>
                          I forgot my password
                        </a>
                        -->
                      </div>
						
                      <div>
                      <!--
                        <a href="${request.contextPath}/admin/lawyeruser/register"  class="user-signup-link">
                          I want to register
                          <i class="icon-arrow-right"></i>
                        </a>
                         -->
                      </div>
                    </div>
                  </div><!-- /widget-body -->
                </div><!-- /login-box -->

                <div id="forgot-box" class="forgot-box widget-box no-border">
                  <div class="widget-body">
                    <div class="widget-main">
                      <h4 class="header red lighter bigger">
                        <i class="icon-key"></i>
                        Retrieve Password
                      </h4>

                      <div class="space-6"></div>
                      <p>
                        Enter your email and to receive instructions
                      </p>

                      <form id="saveForm2">
                        <fieldset>
                          <label class="block clearfix">
                            <span class="block input-icon input-icon-right">
                              <input id="email" name="email" type="email" class="form-control" placeholder="Email" />
                              <i class="icon-envelope"></i>
                            </span>
                             <span id="emailError" style="color:#cc0000;"></span>
                          </label>
							<input type="hidden" name="pageType" value="1" />
                          <div class="clearfix">
                            <button type="button" id="sendEmail" class="width-35 pull-right btn btn-sm btn-danger">
                              <i class="icon-lightbulb"></i>
                              Send Me!
                            </button>
                          </div>
                        </fieldset>
                      </form>
                    </div><!-- /widget-main -->

                    <div class="toolbar center">
                      <a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
                        Back to login
                        <i class="icon-arrow-right"></i>
                      </a>
                    </div>
                  </div><!-- /widget-body -->
                </div><!-- /forgot-box -->


              </div><!-- /position-relative -->
            </div>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div>
    </div><!-- /.main-container -->


 <!--[if lte IE 8]>
      <link rel="stylesheet" href="${request.contextPath}/resources/yephouse-admin/demo/assets/css/ace-ie.min.css" />
    <![endif]-->

	 <!-- basic scripts -->

    <!--[if !IE]> -->
    <script type="text/javascript">
      window.jQuery || document.write("<script src='${request.contextPath}/resources/admin/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
    </script>
    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
      window.jQuery || document.write("<script src='${request.contextPath}/resources/yephouse-admin/demo/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
    </script>
    <![endif]-->
    
    <script type="text/javascript" src="${request.contextPath}/resources/admin/assets/js/common.js?v=${jslevel}"></script>

    <script type="text/javascript">
      if("ontouchend" in document) document.write("<script src='${request.contextPath}/resources/admin/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>

    <!-- inline scripts related to this page -->

    <script type="text/javascript">
      function show_box(id) {
       jQuery('.widget-box.visible').removeClass('visible');
       jQuery('#'+id).addClass('visible');
      }
    </script>
    
     <script type="text/javascript" src="${request.contextPath}/resources/admin/assets/js/validate_check.js?v=${jslevel}"></script>
     <!--
      <script type="text/javascript" src="${request.contextPath}/resources/admin/myJs/login.js?v=${jslevel}"></script>
      -->
       <script type="text/javascript" src="${request.contextPath}/resources/admin/assets/js/jqueryCookie.js?v=${jslevel}"></script>
  </body>
</html>
 </#escape>   
