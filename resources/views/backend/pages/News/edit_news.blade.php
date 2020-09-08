@extends('backend.index')

@section('content')

	{{-- {!!Form::model($news, ['route' => ['news.update', $news->id], 'method' => 'PATCH'])!!} --}}
	<form action="{{ route('news.update', $news->id) }}" method="POST" enctype='multipart/form-data' role="form" style="padding: 20px 0px;">
		{{-- @method('PUT') --}}
		{{method_field('PUT')}}

		<legend>Sửa bài viết</legend>
		
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
			<input type="text" required="" class="form-control" name="title" id="title" value="{{$news->title}}" />
		</div>	

		<div class="form-group">
			<label for="s_description">Short Description <span style="color: red;">(*)</span></label>
			<textarea min="5" max="255" name="s_description" class="form-control" id="s_description" cols="30" rows="5">{{$news->short_description}}</textarea>
		</div>

		<div class="form-group">
			<label for="avatar">Avatar Now <span style="color: red;">(*)</span></label>
			<img src="images/news/{{$news->avatar}}" width="150" alt="" />
			<hr>
			<label for="avatar">Avatar New</label>
			<input type="file" class="form-control" name="avatar" id="avatar" />
		</div>

		<div class="form-group">
			<label for="description">Description <span style="color: red;">(*)</span></label>
			<textarea name="description" class="form-control" id="description" cols="30" rows="10">{{$news->description}}</textarea>
			<script> CKEDITOR.replace('description'); </script>
		</div>

		<div class="form-group">
			<label>Status <span style="color: red;">(*)</span></label>
			<label for="show">
				<input type="radio" value="1" name="status" id="show" @if($news->status === 1) {{'checked'}} @endif /> Show</label>
			<label for="hide">
				<input type="radio" value="0" name="status" id="hide" @if($news->status === 0) {{'checked'}} @endif /> Hide</label>
		</div>
		
		<input type="hidden" name="_token" value="{{csrf_token()}}">
		<button type="submit" name="submit" class="btn btn-primary">Update News</button>
	</form>
	{{-- {!!Form::close()!!} --}}

@endsection