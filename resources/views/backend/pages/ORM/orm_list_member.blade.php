@extends('backend.index')

@section('content')

<section class="row text-center placeholders">
    <div class="col-6 col-sm-6 placeholder">
       <a href="{{ route('orm_list_member') }}"> <button class="btn btn-primary">Danh sách</button></a>
    </div>
    <div class="col-6 col-sm-6 placeholder">
       <a href="{{ route('orm_insert_member') }}"><button class="btn btn-warning">Thêm mới</button></a>
    </div>
</section>

<h3 class="text-center">DANH SÁCH HỌC VIÊN</h3>

<form class="form-inline" name="frm_search" method="POST">
    <div class="form-group">
        <input type="text" minlength="4" maxlength="50" required="" class="form-control" name="key" id="key" placeholder="Input phone serach..." value="@if(isset($key)){!!$key!!}@endif" />
    </div>

    <input type="hidden" name="_token" value="{{csrf_token('')}}" />
    <button style="margin-left: 20px;" type="submit" class="btn btn-success">Search</button>
</form>

@if (isset($count))
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Có</strong> {{$count}} kết quả được tìm thấy!
    </div>
@endif

@include('backend.notification.noti_status')

@if($count_rs > 0)
    <table class="table table-responsive table-bordered table-hover table-inverse">
        <thead>
            <tr>
                <th class="text-center">#</th>
                <th>Name</th>
                <th>Faculty</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Addres</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php $stt = 0; ?>
            @foreach ($rs as $value)
                <tr>
                    <td class="text-center">{{$stt += 1}}</td>
                    <td>{{$value->name}}</td>
                    <td>{{$value->faculty->name_faculty}}</td>
                    <td>{{$value->phone}}</td>
                    <td>{{$value->email}}</td>
                    <td>{{$value->addres}}</td>
                    <td colspan="2">
                        <a href="{{ route('orm_edit_member', $value->id) }}"><button class="btn btn-primary">Edit</button></a>
                        <a onclick="return confirm('Bạn có muốn xóa học viên này không? ');" href="{{ route('orm_delete_member', $value->id) }}"><button class="btn btn-danger">Delete</button></a>

                        {{-- <button class="btn btn-danger" id="funny">Delete Funny</button> --}}
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
        {{ $rs->links( "pagination::bootstrap-4") }}
@endif
@endsection