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
	<div class="table-responsive">
		<table class="table table-bordered table-striped table-inverse table-hover">
		<thead>
			<tr>
				<th>#</th>
				<th>Avatar</th>
				<th>Title</th>
				<th>Time Post</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<?php $stt = 0; ?>
			@foreach ($rs as $value)
			<tr>
				<td>{{$stt = $stt + 1}}</td>
				<td><img src="{{asset('media/news').'/'.$value->avatar}}" width="100" alt=""></td>
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
					<form action="{{ route('news.destroy', $value->id)}}" method="POST" style="display: inline-block;">
						<a href="javascript:void(0)" onclick="return confirm('Bạn có muốn xóa bài viết này không?');" type="submit" class="text-danger">
							<i class="fa fa-trash"></i>
						</a>
						{{method_field('DELETE')}}
						<input type="hidden" name="_token" value="{{csrf_token()}}">
					</form>
				</td>
			</tr>
			@endforeach
		</tbody>
	</table>
	</div>
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

@section('js_by_page')
<script>
	$(document).ready(function(){
		$('.view_news').click(function(){
			let id = $(this).attr('id_views');
			let urlShow = '{{route('news.index')}}/'+id;
			$.ajax({
				url     : urlShow,
				type    : 'GET',
				dataType: 'html',
				data    : {id : id},
			})
			.done(function(data) {
				$('#content_news').html(data);
			})
			.fail(function() {
				console.log("error");
			});

		});
	})

	// Funny
	document.getElementById('funny').onclick = function(){
		swal({
					title: "Thông báo",
					text: "Chào bạn, bạn có xác nhận xóa học viên này không?",
					type: "warning",
					showCancelButton: true,
					confirmButtonColor: '#DD6B55',
					confirmButtonText: 'OK',
					cancelButtonText: "Cancel",
					closeOnConfirm: false,
					closeOnCancel: false
				},
				function(isConfirm){
					if (isConfirm){
						swal({
							title: "Thông báo lại",
							text: "Bạn nghĩ quyết định xóa của bạn có đúng hay không?",
							imageUrl: 'https://cdn.pixabay.com/photo/2014/04/02/10/26/attention-303861_960_720.png',
							showCancelButton: true,
							confirmButtonColor: '#DD6B55',
							confirmButtonText: 'OK',
							cancelButtonText: "Cancel",
							closeOnConfirm: false,
							closeOnCancel: false
						}, function(isConfirm){
							if (isConfirm) {
								swal({
									title: "Hỏi lại",
									text: "Bạn chắc chắn chưa?",
									imageUrl: 'https://www.chamdenuocmo.com/wp-content/uploads/2018/10/icon-funny.png',
									showCancelButton: true,
									confirmButtonColor: '#DD6B55',
									confirmButtonText: 'OK',
									cancelButtonText: "Cancel",
									closeOnConfirm: false,
									closeOnCancel: false
								}, function(isConfirm){
									if (isConfirm) {
										swal({
											title: "Hỏi lại",
											text: "Thật sự đây là quyết định của bạn chứ?",
											imageUrl: 'https://cdn4.iconfinder.com/data/icons/smileys-for-fun/128/smiley__10-512.png',
											showCancelButton: true,
											confirmButtonColor: '#DD6B55',
											confirmButtonText: 'OK',
											cancelButtonText: "Cancel",
											closeOnConfirm: false,
											closeOnCancel: false
										}, function(isConfirm){
											if (isConfirm) {
												swal({
													title: "Hỏi lại",
													text: "Bạn đã tham khảo ý kiến của người khác khi xóa dữ liệu này chưa?",
													imageUrl: 'https://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/Users-icon.png',
													showCancelButton: true,
													confirmButtonColor: '#DD6B55',
													confirmButtonText: 'OK',
													cancelButtonText: "Cancel",
													closeOnConfirm: false,
													closeOnCancel: false
												}, function(isConfirm){
													if (isConfirm) {
														swal({
															title: "Hỏi lại",
															text: "Bạn chịu trách nhiệm về việc này chứ?",
															imageUrl: 'https://cdn.pixabay.com/photo/2012/04/01/18/58/danger-24045_960_720.png',
															showCancelButton: true,
															confirmButtonColor: '#DD6B55',
															confirmButtonText: 'OK',
															cancelButtonText: "Cancel",
															closeOnConfirm: false,
															closeOnCancel: false
														}, function(isConfirm){
															if (isConfirm) {
																swal({
																	title: "Hỏi lại",
																	text: "Dữ liệu đã xóa được 50%, bạn có muốn xóa nữa không?",
																	imageUrl: 'https://cdn.pixabay.com/photo/2012/04/12/22/36/danger-30964_960_720.png',
																	showCancelButton: true,
																	confirmButtonColor: '#DD6B55',
																	confirmButtonText: 'OK',
																	cancelButtonText: "Cancel",
																	closeOnConfirm: false,
																	closeOnCancel: false
																}, function(isConfirm){
																	if (isConfirm) {
																		swal({
																			title: "Hỏi lại",
																			text: "Bạn quyết định xóa 50% còn lại chứ?",
																			imageUrl: 'https://pluspng.com/img-png/too-funny-png-you-re-so-funny-emoticon-256.png',
																			showCancelButton: true,
																			confirmButtonColor: '#DD6B55',
																			confirmButtonText: 'OK',
																			cancelButtonText: "Cancel",
																			closeOnConfirm: false,
																			closeOnCancel: false
																		}, function(isConfirm){
																			if (isConfirm) {
																				swal({
																					title: "Hỏi lại",
																					text: "Dữ liệu đã xóa, bạn muốn khôi phục không?",
																					imageUrl: 'https://img.favpng.com/0/12/13/ui-icon-notification-icon-bell-icon-png-favpng-QWnWDcspXKXsD0ABPv7kpTqdP.jpg',
																					showCancelButton: true,
																					confirmButtonColor: '#DD6B55',
																					confirmButtonText: 'OK',
																					cancelButtonText: "Cancel",
																					closeOnConfirm: false,
																					closeOnCancel: false
																				},function(isConfirm){
																					if (isConfirm) {
																						swal({
																							title: "Đùa chứ :))",
																							text: "Bạn nhây thế nhở :))",
																							type: "warning",
																							showCancelButton: true,
																							confirmButtonColor: '#DD6B55',
																							confirmButtonText: 'OK',
																							cancelButtonText: "Cancel",
																							closeOnConfirm: false,
																							closeOnCancel: false
																						}, function(isConfirm){
																							if (isConfirm) {
																								swal({
																									title: "Bạn nhây cực kỳ ý :))",
																									text: "Xem xong video nhớ LIKE nhá bạn êi",
																									imageUrl: 'https://i.dlpng.com/static/png/388800_preview.png',
																									showCancelButton: true,
																									confirmButtonColor: '#DD6B55',
																									confirmButtonText: 'OK',
																									cancelButtonText: "Cancel",
																									closeOnConfirm: false,
																									closeOnCancel: false
																								})
																							}else{
																								swal("Bạn nhây thể nhở :))", "ahihi...");
																							}
																						})
																					}else{
																						swal({
																							title: "Cancel? Dữ liệu lại được khôi phục rồi :))",
																							text: "Xem xong video nhớ LIKE nhá bạn êi",
																							imageUrl: "https://i.dlpng.com/static/png/388800_preview.png",
																							showCancelButton: true,
																							confirmButtonColor: '#DD6B55',
																							confirmButtonText: 'LIKE',
																							cancelButtonText: "LOVE",
																							closeOnConfirm: false,
																							closeOnCancel: false
																						})
																					}
																				})
																			}else{
																				swal("Bạn nhây thể nhở :))", "ahihi...");
																			}
																		})
																	}else{
																		swal("Bạn nhây thể nhở :))", "ahihi...");
																	}
																})
															}else{
																swal("Bạn nhây thể nhở :))", "ahihi...");
															}
														})
													}else {
														swal("Bạn nhây thể nhở :))", "ahihi...");
													}
												})
											}else{
												swal("Bạn nhây thể nhở :))", "ahihi...");
											}
										})
									}else{
										swal("Bạn nhây thể nhở :))", "ahihi...");
									}
								})
							}else{
								swal("Bạn nhây thể nhở :))", "ahihi...");
							}
						});
					}else{
						swal("Bạn nhây thể nhở :))", "ahihi...");
					}
				});
	};

</script>
@endsection