@extends('index')

@section('content_ui')

 <!-- Tabs Titles -->

<!-- Icon -->
<div class="fadeIn first">
	<img src="https://img.icons8.com/cotton/2x/login-rounded-right--v2.png" width="50" id="icon" alt="User Icon" />
</div>

<!-- Login Form -->
<form action="" method="POST">
	<input type="email" required="" id="login" class="fadeIn second" name="username" placeholder="username">
	<input type="password" required="" id="password" class="fadeIn third" name="passw" placeholder="password">


	<input type="hidden" name="_token" value="{{ csrf_token('') }}" />
	<input type="submit" name="login" class="fadeIn fourth" value="Log In">
	@if(Session::get('err') != null)
	  <div class="alert alert-danger">
	    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	    <strong>Thông báo!</strong> {{ Session::get('err') }}
	  </div>
	@endif
</form>

<!-- Remind Passowrd -->
<div id="formFooter">
<a class="underlineHover" href="#">Forgot Password?</a>
</div>

@endsection