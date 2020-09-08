@extends('backend.index')

@section('content')

	<form action="{{ route('orm_insert_member') }}" method="POST" role="form">
		<legend>Thêm mới học viên</legend>
		@include('notification.noti_status')

		@if(count($errors))
			@foreach ($errors->all() as $err)
			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<strong></strong></br> {{$err}} </br>
			</div>
			@endforeach
		@endif
		
		<div class="form-group">
			<label for="name">Name <span style="color: red;">(*)</span></label>
			<input type="text" required="" value="{{old('name')}}" class="form-control" name="name" id="name" placeholder="Input name">
		</div>

		<div class="form-group">
			<label for="faculty">Faculty <span style="color: red;">(*)</span></label>
			<select class="form-control" name="faculty" id="faculty">
				@foreach ($rs as $value)
					<option value="{{$value->id_faculty}}">{{$value->name_faculty}}</option>
				@endforeach			
			</select>
		</div>

		<div class="form-group">
			<label for="email">Email <span style="color: red;">(*)</span></label>
			<input type="email" required="" class="form-control" name="email" id="email" value="{{old('email')}}" placeholder="Input email">
		</div>

		<div class="form-group">
			<label for="phone">Phone <span style="color: red;">(*)</span></label>
			<input type="number" value="{{old('phone')}}" maxlength="10" required="" class="form-control" name="phone" id="phone" placeholder="">
		</div>

		<div class="form-group">
			<label for="addres">Addres <span style="color: red;">(*)</span></label>
			<input type="text" min="10" value="{{old('addres')}}" max="10" required="" class="form-control" name="addres" id="addres" placeholder="">
		</div>
		
		<input type="hidden" name="_token" value="{{csrf_token()}}">
		<button type="submit" name="submit" class="btn btn-primary">Add Member</button>
	</form>

@endsection