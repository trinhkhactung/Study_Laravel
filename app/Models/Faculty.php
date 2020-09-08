<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Faculty extends Model
{
    protected $table = 'faculty';
    protected $primaryKey = 'id_faculty';


    public function member(){
    	return $this->hasMany('App\Models\Member', 'id_faculty', 'id');
    }

}
