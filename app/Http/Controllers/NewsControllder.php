<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Models\News;

class NewsControllder extends Controller
{
    /**
     * Display a listing of the resource.
     Show ra thông tin trong db được thể hiện ở hàm index.
     Tên route: news.index
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $rs = News::all();
        return view('backend.pages.News.list_news', ['rs' => $rs]);
    }

    /**
     * Show the form for creating a new resource.
     * Hiển thị form thêm mới
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.pages.News.add_news');
    }

    /**
     * Store a newly created resource in storage.
     * Submit thêm mới data
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Xử lý upload file

        if ($request->hasFile('avatar')) { // Kiểm tra xem người dùng đã chọn file để up hay chưa
            $file          = $request->avatar;
            $nameFile      = time().$file->getClientOriginalName(); // Tên file;
            $size          = $file->getSize();
            $type_file     = $file->getClientOriginalExtension(); // định dạng file *.jpg
            $type          = $file->getMimeType(); // Kiểu của file images/jpeg
            $path          = $file->getRealPath(); // Đường dẫn tạm thời
        }

        //$this->validate($request, [],[]);
        $request->validate(
                [
                    'title'            =>  'required|min:10:max:200'
                ],

                [
                    'title.required'   =>      'Title vui lòng không để trống',
                    'title.min'        =>      'Title tối thiểu 10 và tối đa 200 ký tự',
                    'title.max'        =>      'Title tối thiểu 10 và tối đa 200 ký tự',
                ]
            );

        try {

            $add = new News;
            $add->title               =     $request->title;
            $title                    =     old($request->title);

            $slug                     =     str_slug($request->title);
            $add->slug                =     $slug;

            $add->short_description   =     $request->s_description;
            $s_description            =     old($request->s_description);

            $add->avatar              =     $nameFile;

            $add->description         =     $request->description;
            $description              =     old($request->description);

            $add->status              =     $request->status;
            $add->save();
            $file->move('media/news/', $nameFile);
            return redirect(route('news.index'))->with('noti', 'Thêm bài viết thành công!');
            
        } catch (Exception $e) {
            return redirect(route('news.create'))->with('noti', 'Xảy ra lỗi khi thêm mới! '.$e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     * Hiển thị ra thông tin của bản ghi nào đó theo $id
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $content = News::where('id', $id)->first();
        echo "<h1>".$content->title."</h1>"."</br>"."<i>".$content->short_description."</i>"."</br></br>".$content->description;
    }

    // Hiển thị bài viết theo chuẩn SEO về phía người dùng
    public function view_news($slug){
        $content = News::where('slug', $slug)->first();
        echo "<h1>".$content->title."</h1>"."</br>"."<i>".$content->short_description."</i>"."</br></br>".$content->description;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        Log::info('Showing user profile for user: '.$id);
        $news = News::find($id);
        return view('backend.pages.News.edit_news', ['news' => $news]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // $nameFile = News::find($id)->value('avatar'); // Lấy ra tên ảnh hiện tại, bị lỗi luôn luôn lấy ra tên ảnh đầu tiên trong db

        $nameFile = News::where('id', $id)->value('avatar'); // Lấy ra tên ảnh hiện tại

        // Xử lý upload file (nếu có)
        if ($request->hasFile('avatar')){ // Kiểm tra xem người dùng đã chọn file để up hay chưa
            $file          = $request->avatar;
            $nameFile      = time().$file->getClientOriginalName();
            $file->move('images/news/', $nameFile);
        }

        $request->validate(
            [
                'title'     =>  'required|min:10:max:200'
            ],

            [
                'title.required'   =>      'Title vui lòng không để trống',
                'title.min'        =>      'Title tối thiểu 10 và tối đa 200 ký tự',
                'title.max'        =>      'Title tối thiểu 10 và tối đa 200 ký tự',
            ]
        );

        
        try {
            $update = News::where('id', $id)
            ->update(
                [
                    'title'                 => $request->title,
                    'slug'                  => str_slug($request->title),
                    'short_description'     => $request->s_description,
                    'description'           => $request->description,
                    'status'                => $request->status,
                    'avatar'                => $nameFile
                ]
            );                
            return redirect(route('news.index'))->with('noti', 'Cập nhật bài viết thành công!');
        }catch (Exception $e) {
            return redirect(route('news.update', $id))->with('noti', 'Xảy ra lỗi khi cập nhật! '.$e->getMessage());
        }
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $del = News::find($id)->delete();
        return redirect(route('news.index'))->with('noti', 'Xóa bài viết thành công!');
    }
}
