@extends('backend.index')

@section('content')

	<form action="{{ route('news.store') }}" method="POST" enctype='multipart/form-data' role="form" style="padding: 20px 0px;">
		<legend>Thêm mới bài viết</legend>
		
		@include('backend.notification.noti_status')

		@if(count($errors))
			@foreach ($errors->all() as $err)
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<strong></strong></br> {{$err}} </br>
			</div>
			@endforeach
		@endif
		
		<div class="form-group">
			<label for="name">Title <span style="color: red;">(*)</span></label>
			<input type="text" required="" value="{{old('title')}}" class="form-control" name="title" id="title" placeholder="Input title" />
		</div>	
		
		<div class="form-group">
			<label for="s_description">Short Description <span style="color: red;">(*)</span></label>
			<textarea minlength="5" maxlength="255" name="s_description" class="form-control" id="s_description" cols="30" rows="5">{{old('s_description')}}</textarea>
		</div>

		<div class="form-group">
			<label for="avatar">Avatar <span style="color: red;">(*)</span></label>
			<input type="file" required="" class="form-control" name="avatar" id="avatar" />
		</div>

		<div class="form-group">
			<label for="description">Description <span style="color: red;">(*)</span></label>
			<textarea name="description" class="form-control" id="description" cols="30" rows="10">{{old('description')}}</textarea>
			<script> CKEDITOR.replace('description'); </script>
		</div>

		<div class="form-group">
			<label>Status <span style="color: red;">(*)</span></label>
			<label for="show">
				<input type="radio" value="1" name="status" id="show" checked=""> Show</label>
			<label for="hide">
				<input type="radio" value="0" name="status" id="hide"> Hide</label>
		</div>
		
		<input type="hidden" name="_token" value="{{csrf_token()}}">
		<button type="submit" name="submit" class="btn btn-primary">Add News</button>
	</form>

@endsection