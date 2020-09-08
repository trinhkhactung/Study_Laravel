@if(!Auth::check())
  <script> 
    window.location = "index.php"; // location.href = "backend/"; 
  </script>
@endif


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Học laravel quá đơn giản khi bạn đã nắm cơ chắc về PHP thuần, MVC...">
        <meta name="author" content="Tung TK">
        
        <base href="{{ asset('') }}" />
        <link rel="icon" href="https://user-images.githubusercontent.com/15979712/27070335-deffe080-5018-11e7-82e8-2a299cb9e99b.png">
        <title>LARAVEL STUDY DEMO</title>
    
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Custom styles for this template -->
        <link href="css/myCSS.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
        <script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>
        <script src="ckd/ckeditor.js"></script>
        <script src="ckf/ckfinder.js"></script>
    </head>
    <body>
        
        @include('backend.layout.header')
        
        <div class="container-fluid content-main" id="main">
            <div class="row content-main">
                @include('backend.layout.col_left')

                <main class="col-sm-9 ml-sm-auto col-md-10 pt-3 content-main" role="main">
                    @yield('content')
                </main>
            </div>
            
        </div>

        <div id="footer">
            <p class="text-center">
                © Design by: 
                <a href="http://facebook.com/trinhkhactung.trinh" style="text-decoration: none; color: #fac93b;">Tung TK
                </a>
            </p>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery-3.3.1.slim.min.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myJavascript.js"></script>
    </body>
</html>