<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
	public $timestamps = false;
    protected $table = "member"; // Khai báo tên bảng mà model sẽ làm việc
    protected $primaryKey = 'id'; // Khai báo khóa chỉnh của bảng, để sử dụng cho các phương thức về sau
    // protected $fillable = [
    // 	'name'
    // ]; // Muốn lấy ra trường nào trong bảng thì liệt kê vào fillable;

    public function faculty(){
    	return $this->belongsTo('App\Models\Faculty', 'id_faculty');
    }

}