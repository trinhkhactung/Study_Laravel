@if(Auth::check())
  <script> 
    window.location = "backend/"; // location.href = "backend/"; 
  </script>
@endif

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Trịnh Khắc Tùng">
  <base href="{{ asset('') }}" />
  <link rel="icon" href="../../../../favicon.ico">

  <title>Login</title>

  <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <link rel="stylesheet" href="css/cssLogin.css" />
  <script src='https://www.google.com/recaptcha/api.js'></script>
  
</head>

<body>

  <div class="wrapper fadeInDown">
    <div id="formContent">
     
    @yield('content_ui')

    </div>
  </div>

  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery-3.5.1.min.js"></script>
  <!------ Include the above in your HEAD tag ---------->

</body>
</html>