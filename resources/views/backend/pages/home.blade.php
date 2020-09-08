@extends('backend.index')

@section('content')

<section class="row text-center placeholders">
    <div class="col-6 col-sm-4 col-md-4 col-lg-4 placeholder">
        <a href="{{ route('db_list_member') }}">
            <img src="https://user-images.githubusercontent.com/15979712/27070335-deffe080-5018-11e7-82e8-2a299cb9e99b.png" width="200" class="img-fluid" alt="Laravel">
            <h4 class="m-4">DB - Database</h4>
        </a>
        <div class="text-muted">Truy vấn SQL thuần trong Laravel</div>
    </div>
    <div class="col-6 col-sm-4 col-md-4 col-lg-4 placeholder">
        <a href="{{ route('dqb_list_member') }}">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Laravel.svg/220px-Laravel.svg.png" width="200" class="img-fluid" alt="Laravel">
            <h4 class="m-4">Database: Query Builder</h4>
        </a>
        <span class="text-muted">Truy vấn nâng cao - ngắn gọn</span>
    </div>

    <div class="col-6 col-sm-4 col-md-4 col-lg-4 placeholder">
        <a href="{{ route('orm_list_member') }}">
            <img src="https://plugins.jetbrains.com/files/7532/62662/icon/pluginIcon.svg" width="200" class="img-fluid" alt="Laravel">
            <h4 class="m-4">Eloquent ORM</h4>
        </a>
        <span class="text-muted">Truy vấn thông qua Model</span>
    </div>

</section>

@endsection