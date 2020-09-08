@extends('backend.index')

@section('content')

<section class="row text-center placeholders">
	<div class="col-6 col-sm-6 placeholder">
		<a href="{{ route('news.index') }}"> <button class="btn btn-primary">Danh sách</button></a>
	</div>
	<div class="col-6 col-sm-6 placeholder">
		<a href="{{ route('news.create') }}"><button class="btn btn-warning">Thêm mới</button></a>
	</div>
</section>

<h3 class="text-center">DANH SÁCH BÀI VIẾT</h3>

<form class="form-inline" name="frm_search" method="POST">
	<div class="form-group">
		<input type="text" minlength="4" maxlength="50" required="" class="form-control" name="key" id="key" placeholder="Input title news serach..." value="@if(isset($key)){!!$key!!}@endif" />
	</div>

	<input type="hidden" name="_token" value="{{csrf_token('')}}" />
	<button style="margin-left: 20px;" type="submit" class="btn btn-success">Search</button>
</form>

@include('backend.notification.noti_status')

<table class="table table-bordered table-striped table-responsive table-inverse table-hover">
	<thead>
		<tr>
			<th>#</th>
			<th>Avatar</th>
			<th width="600">Title</th>
			<th>Time Post</th>
			<th>Status</th>
			<th width="100">Action</th>
		</tr>
	</thead>
	<tbody>
		<?php $stt = 0; ?>
		@foreach ($rs as $value)
		<tr>
			<td>{{$stt = $stt + 1}}</td>
			<td><img src="images/news/{{$value->avatar}}" width="100" alt=""></td>
			<td style="color: blue;"><a href="{{ $value->slug }}" target="_blank">{{$value->title}}</a></td>
			<td>{{date('d-m-Y/h:m:s',strtotime($value->times_at))}}</td>
			<td>
				@if($value->status == 1)
				{!!'<p style="color: green; font-weight: bold;">Show</p>'!!}
				@else
				{!!'<p style="color: red; font-weight: bold;">Hide</p>'!!}
				@endif
			</td>
			<td>
				<a href="javascript:void(0)" id_views="{{$value->id}}" class="view_news" data-toggle="modal" data-target="#bd-example-modal" style="padding: 0px 3px;">
					<i class="fa fa-eye"></i>
				</a>

				<a href="{{ route('news.edit', $value->id) }}" style="padding: 0px 3px;"><i class="fa fa-edit"></i></a>
				<form action="{{ route('news.destroy', $value->id)}}" method="POST">
				    <button onclick="return confirm('Bạn có muốn xóa bài viết này không?');" type="submit" class="btn btn-danger">
				    	<i class="fa fa-trash"></i>
				    </button>
				    {{method_field('DELETE')}}
    				<input type="hidden" name="_token" value="{{csrf_token()}}">
				</form>
			</td>
		</tr>
		@endforeach
	</tbody>
</table>

<button style="margin-bottom: 20px;" id="funny" class="btn btn-info">Button Funny</button>


{{-- START Hiển thị nội dung bài viết xem trước --}}
<div class="modal fade" id="bd-example-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">

		<div class="modal-content" id="content_news" style="padding: 20px 10px;">
			
		</div>

	</div>
</div>
{{-- END Hiển thị nội dung bài viết xem trước --}}

@endsection