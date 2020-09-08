<?php

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\Member;
use App\Models\Faculty;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can \register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function(){
    return view('pages.login');
})->name('login');

Route::post('/', 'UserController@post_login')->name('post-login');
Route::get('logout', 'UserController@logout')->name('logout');

Route::group(['prefix' => 'backend'], function(){

    Route::get('/', function () {
        return view('backend.pages.home');
    })->name('index');

    /*** START sử dụng Facade DB để truy vấn cơ sở dữ liệu, truy vấn SQL thuần ***/
    Route::group(['prefix' => 'db'], function() {
        Route::get("db-list-member", function(){
            $rs = DB::select("SELECT *FROM member, faculty WHERE member.id_faculty = faculty.id_faculty ORDER BY member.id DESC"); // Viết câu lệnh truy vấn SQL thuần
            return view('backend.pages.DB.db_list_member', ['rs' => $rs]);
            /*
                dd($rs);
                echo "<pre>";
                print_r($rs);
                echo "</pre>";
                foreach ($rs as $key => $value) {
                    echo $value->name;
                }
            */
        })->name('db_list_member');

        Route::get('delete-member/{id}', function($id) {
           $del = DB::delete("DELETE FROM member WHERE id = :id", ['id' => $id]);
           return redirect()->route('db_list_member')->with('noti', 'Xóa thành công!');
        })->name('db_delete_member');

        Route::get('insert-member', function(){ // hiển thị ra form thêm
            $rs = DB::select("SELECT *FROM faculty");
            return view('backend.pages.DB.db_add_member', ['rs' => $rs]);
        })->name('db_insert_member');

        Route::post('insert-member', function(Request $request) {
            $name = $request->name;
            $id_faculty = $request->faculty;
            $email = $request->email;
            $phone = $request->phone;
            $addres = $request->addres;

            DB::insert('INSERT INTO member (name, id_faculty, email, phone, addres) values (:name, :id_faculty, :email, :phone, :addres)', ['name' => $name, 'id_faculty' => $id_faculty, 'email' => $email, 'phone' => $phone, 'addres' => $addres]);
            return redirect()->route('db_list_member')->with('noti', 'Thêm mới thành công!');
        })->name('post_db_add_member');

        Route::get('edit-member/{id}', function($id) {
            $rs = DB::select('SELECT *FROM faculty');
            $member = DB::select('SELECT *FROM member WHERE id = :id', ['id' => $id]);
            foreach ($member as $key => $value) {
                $rs_member = $value;
            }
            return view('backend.pages.DB.db_edit_member', ['id' => $id, 'rs' => $rs, 'member' => $rs_member]); 
        })->name('edit_member');

        Route::post('edit-member/{id}', function(Request $request, $id){
            $name = $request->name;
            $id_faculty = $request->faculty;
            $email = $request->email;
            $phone = $request->phone;
            $addres = $request->addres;

            DB::update('UPDATE member SET name = :name, id_faculty = :id_faculty, email = :email, phone = :phone, addres = :addres WHERE id = :id', ['name' => $name, 'id_faculty' => $id_faculty, 'email' => $email, 'phone' => $phone, 'addres' => $addres, 'id' => $id]);
            return redirect()->route('db_list_member')->with('noti', 'Cập nhật thành công!');
        })->name('edit-member');

        Route::post('db-list-member', function(Request $request) {
            $key = $request->key;
            $rs = DB::select('SELECT *FROM member, faculty WHERE phone LIKE :key AND member.id_faculty = faculty.id_faculty', ['key' => "%".$key."%"]);
            $count = count($rs);
            return view('backend.pages.DB.db_list_member', ['rs' => $rs, 'key' => $key, 'count' => $count]);
        })->name('db_search_member');
    });
    /*** END sử dụng Facade DB để truy vấn cơ sở dữ liệu, truy vấn SQL thuần ***/

    /*** START sử dụng Database: Query Builder ***/
    Route::group(['prefix' => 'dqb'], function() {
        Route::get('list-member', function() {
            // $rs = DB::table("member")->get(); // Lấy ra toàn bộ dữ liệu của bảng member
            // $rs = DB::table("member")->paginate(3); // Lấy ra 3 bản ghi/trang, phân trang

            /*Lấy ra (1 hàng) bản ghi theo điều kiện nào đó
            $rs = DB::table('member')->where('id', '=', 2)->first();
            echo $rs->name; */

            /* Lấy ra (1 hàng) bản ghi theo điều kiện nào đó
            $rs = DB::table('member')->where('id', '=', 2)->get();
            foreach ($rs as $key => $value) {
                echo $value->name;
            } */
            
            // $rs = DB::table('member')->where('id', '=', 3)->value('name'); // Lấy ra một trường nào đó trong bảng có điều kiện

            //$rs = DB::table('member')->find(2); // Tìm kiếm bản ghi theo id khóa chính
            

            // $rs = DB::table('member')->pluck('phone');
            // foreach ($rs as $key => $value) {
            //  echo $value."</br>";
            // } // Lấy toàn bộ dữ liệu của một cột nào đó trong bảng
            
            // $rs = DB::table('member')
            //          ->where('id', '<', '6')
                        // ->where('name', 'like', '%tuấn%')
                        // ->orderBy('id', 'desc')
                        // ->limit(2)
                        // ->get(); // Lấy ra bản ghi với nhiều điều kiện

            // $rs = DB::table('member')
            //          ->where('id', '=', 2)
            //          ->orwhere('name', 'like', '%tuấn%')
            //          ->orderBy('id', 'desc')
            //          ->limit(2)
            //          ->get(); // Lấy ra bản ghi với nhiều điều kiện

            // $rs = DB::table('member')
            //          ->select('name', 'email as gmail')->get(); // Lấy ra một vài trường cụ thể trong bảng
            // // echo count($rs); // số bản ghi trả ra
            // foreach ($rs as $key => $value) {
            //      echo $value->gmail;
            // } 
            // $count = DB::table('member')->count(); // Đếm số bản ghi trả ra
            // $max = DB::table('member')->max('id'); // Lấy ra id lớn nhất
            // $min = DB::table('member')->min('id'); // Lấy ra id nhỏ nhất
            // $avg = DB::table('member')->avg('id'); // Tính trung bình id

            // $users = DB::table('member')
         //                 ->select(DB::raw('count(*) as member_count, status'))
         //                 ->where('status', '=', 1)
         //                 ->groupBy('status')
         //                 ->get();
         //                 dd($users); // Tạo biểu thức thô

            $rs = DB::table('member')
                        ->join('faculty', 'member.id_faculty', 'faculty.id_faculty')
                        ->orderBy('id', 'desc')
                        ->paginate(5);
            $count_rs = count($rs);
            return view('backend.pages.DQB.dqb_list_member', ['rs' => $rs, 'count_rs' => $count_rs]);
        })->name('dqb_list_member');

        Route::get('delete-member/{id}', function($id) {
            $delete = DB::table('member')->where('id', '=', $id)->delete();
            return redirect()->route('dqb_list_member')->with('noti', 'Xóa thành công!');
        })->name('dqb_delete_member');

        Route::get("insert-member", function(){
            $rs = DB::table('faculty')->get();
            return view('backend.pages.DQB.dqb_insert_member', ['rs' => $rs]);
        })->name('dqb_insert_member');

        Route::post("insert-member", function(Request $request){
            $request->validate(
                [
                    'name'      =>  'required|min:5|max:30'
                ],

                [
                    'name.required' =>  'Họ tên không được để trống',
                    'name.min'      =>  'Họ tên đầy đủ tối thiểu 5 và tối đa 30 ký tự',
                    'name.max'      =>  'Họ tên đầy đủ tối thiểu 5 và tối đa 30 ký tự'
                ]
            );

            $insert = DB::table('member')->insert(
                [
                    'name'          => $request->name,
                    'id_faculty'    => $request->faculty,
                    'phone'         => $request->phone,
                    'email'         => $request->email,
                    'addres'        => $request->addres
                ]
            );
            return redirect(route('dqb_list_member'))->with('noti', 'Thêm mới thành công!');
        })->name("dbq-insert-member");

        Route::get('edit-member/{id}', function($id){
            $rs = DB::table('faculty')->get();
            //$member = DB::table('member')->where('id', $id)->first();
            $member = DB::table('member')->find($id);
            return view('backend.pages.DQB.dqb_edit_member', ['rs' => $rs, 'member' => $member]);
        })->name('dqb_edit_member');

        Route::post('edit-member/{id}', function(Request $request, $id){

            $insert = DB::table('member')
                ->where('id', $id)
                ->update(
                    [
                        'name'          => $request->name,
                        'id_faculty'    => $request->faculty,
                        'phone'         => $request->phone,
                        'email'         => $request->email,
                        'addres'        => $request->addres
                    ]
                );

            return redirect(route('dqb_list_member'))->with('noti', 'Cập nhật thành công!');

        })->name('dqb_edit_member');

        Route::post('list-member', function(Request $request) {
            $key = $request->key;
            $rs = DB::table('member')
                        ->join('faculty', 'member.id_faculty', 'faculty.id_faculty')
                        ->where('phone', 'LIKE', '%'.$key.'%')
                        ->orderBy('member.id', 'desc')
                        ->paginate(5);
            $count = count($rs);
            $count_rs = count($rs);
            return view('backend.pages.DQB.dqb_list_member', ['rs' => $rs, 'key' => $key, 'count' => $count, 'count_rs' => $count_rs]);
        });

    });
    /*** END sử dụng Database: Query Builder ***/

    /*** START sử dụng Database: Eloquent ORM ***/
    Route::group(['prefix' => 'orm'], function(){
        Route::get('list-member', function() {
            // $rs = Member::all(); // Lấy ra toàn bộ bản ghi có trong bảng member
            // foreach ($rs as $key => $value) {
            //  echo $value->name;
            // }

            // $rs = Member::where('id', '<', 20) // Lấy ra bản ghi có điều kiện
            //          ->orderBy('id', 'desc')
            //          ->take(2)->get();

            // $rs = Member::where('id', '<', 20) // Lấy ra bản ghi có điều kiện
            //          ->where('name', 'LIKE', '%tuấn%')
            //              ->orderBy('id', 'desc')
            //              ->take(2)->get();

            // $rs = Member::where('id', '<', 20) // Lấy ra bản ghi có điều kiện
            //          ->orwhere('name', 'LIKE', '%tuấn%')
            //              ->orderBy('id', 'asc')
            //              ->take(2)->get();

            //$rs = Member::where('id', '=', '2')->first();
            //$rs = Member::find(2);
            // $rs = Member::find([2,17,3]);
            // foreach ($rs as $key => $value) {
            //      echo $value->name;
            // }

            $count = Member::all()->count();
            $id = Member::all()->max('id');
            $min = Member::all()->min('id');
            $avg = Member::all()->avg('id');

            $select = Member::select('id', 'name', 'phone')->get(); // lấy ra một vài trường cụ thể nào đó

            //dd($select);

            //$rs = Member::all();
            $rs = Member::orderBy('id','desc')->paginate(5);
            $count_rs = count($rs);
            return view('backend.pages.ORM.orm_list_member', ['rs' => $rs, 'count_rs' => $count_rs]);
        })->name('orm_list_member');

        Route::get('insert-member', function() {
            $rs = Faculty::all();
            return view('backend.pages.ORM.orm_insert_member', ['rs' => $rs]);
        })->name('orm_insert_member');

        Route::post('insert-member', function(Request $request) {

            $request->validate(
                [
                    'name'      =>  'required|min:5|max:30'
                ],

                [
                    'name.required'     =>  'Họ tên không được để trống',
                    'name.min'          =>  'Họ tên tối thiểu 5 tối đa 30 ký tự',
                    'name.max'          =>  'Họ tên tối thiểu 5 tối đa 30 ký tự',
                ]
            );

            try {

                $add_member = new Member;
                $name                    = $request->old('name');
                $add_member->name        = $request->name;

                $add_member->id_faculty  = $request->faculty;
                $email                   = $request->old('email');
                $add_member->email       = $request->email;

                $phone                   = $request->old('phone');
                $add_member->phone       = $request->phone;

                $addres                  = $request->old('addres');
                $add_member->addres      = $request->addres;
                $add_member->save();
                return redirect(route('orm_list_member'))->with('noti', 'Thêm mới thành công!');
                
            } catch (Exception $e) {
                return redirect(route('orm_insert_member'))->with('noti', 'Xảy ra lỗi khi thêm mới! '.$e->getMessage());

                // echo $e->getMessage();
                // echo "<script>alert('Thêm mới thất bại!');";
                //  echo "location.href = 'insert-member'; </script>";  
            }
        })->name('orm_insert_member');

        Route::get('edit-member/{id}', function($id) {
            $member = Member::find($id);
            $rs = Faculty::all();
            return view('backend.pages.ORM.orm_edit_member', ['rs' => $rs, 'member' => $member]);
        })->name('orm_edit_member');

        Route::post('edit-member/{id}', function(Request $request, $id) {
            $edit = Member::where('id', $id)
            ->update([
                'name'          =>      $request->name,
                'id_faculty'    =>      $request->faculty,
                'email'         =>      $request->email,
                'phone'         =>      $request->phone,
                'addres'        =>      $request->addres
            ]);
            return redirect(route('orm_list_member'))->with('noti', 'Cập nhật thành công!');
        })->name('orm_edit_member');

        Route::post('list-member', function(Request $request){
            $key = $request->key;
            $rs = Member::where('phone', 'LIKE', '%'.$key.'%')
                        ->orwhere('name', 'LIKE', '%'.$key.'%')
                        ->paginate(5);
            $count_rs = count($rs);
            $count = count($rs);
            return view('backend.pages.ORM.orm_list_member', ['key' => $key, 'rs' => $rs, 'count_rs' => $count_rs, 'count' => $count]);
        })->name('orm_serach_member');

        Route::get('delete-member/{id}', function($id) {
            $delete = Member::find($id)->delete();
            return redirect(route('orm_list_member'))->with('noti', 'Xóa thành công!');
        })->name('orm_delete_member');
    });
    /*** END sử dụng Database: Eloquent ORM ***/

    /* START RESTful Resource Controllers */
    Route::resource('news', 'NewsControllder');
    /* END RESTful Resource Controllers */

});

Route::get('{slug}', 'NewsControllder@view_news')->name('view_news');







