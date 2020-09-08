@if (session('noti'))
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <strong>Thông báo!</strong> {{session('noti')}}
    </div>
@endif