@extends('backend.index')

@section('content')
	<form action="{{ route('edit-member', $member->id) }}" method="POST" role="form">
		<legend>Sửa thông tin học viên <span><a href="{{ route('db_list_member') }}"><button class="btn btn-warning">Quay lại</button></span></a></legend>
	
		<div class="form-group">
			<label for="name">Name <span style="color: red;">(*)</span></label>
			<input type="text" required="" class="form-control" name="name" id="name" value="{{$member->name}}" />
		</div>

		<div class="form-group">	
			<label for="faculty">Faculty <span style="color: red;">(*)</span></label>
			<select class="form-control" name="faculty" id="faculty">
				@foreach ($rs as $value)
					<option @if($member->id_faculty === $value->id_faculty) {{'selected'}} @endif value="{{$value->id_faculty}}">{{$value->name_faculty}}</option>
				@endforeach			
			</select>
		</div>

		<div class="form-group">
			<label for="email">Email <span style="color: red;">(*)</span></label>
			<input type="email" required="" class="form-control" name="email" id="email" value="{{$member->email}}">
		</div>

		<div class="form-group">
			<label for="phone">Phone <span style="color: red;">(*)</span></label>
			<input type="number" maxlength="10" required="" class="form-control" name="phone" id="phone" value="{{$member->phone}}" />
		</div>

		<div class="form-group">
			<label for="addres">Addres <span style="color: red;">(*)</span></label>
			<input type="text" min="10" max="10" required="" class="form-control" name="addres" id="addres" value="{{$member->addres}}" />
		</div>
		
		<input type="hidden" name="_token" value="{{csrf_token()}}">
		<button type="submit" name="submit" class="btn btn-primary">Update Member</button>
	</form>

@endsection