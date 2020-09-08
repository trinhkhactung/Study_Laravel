<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar" id="col_left">
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="{{ route('index') }}">LARAVEL 5.x <span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="{{ route('db_list_member') }}">Database - SQL Basic</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ route('dqb_list_member') }}">Query Builder</a>
        </li>


        <li class="nav-item">
            <a class="nav-link" href="{{ route('orm_list_member') }}">Eloquent ORM</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="{{ route('news.index') }}">Route::resource (RESTful)</a>
        </li>
    </ul>
</nav>