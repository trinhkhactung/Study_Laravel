<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMemberTable extends Migration
{
    /**
     * Run the migrations.
     * Tạo ra các trường trong 1 bảng nào đó (hàm up)
     * @return void
     */ 
    public function up()
    {
        Schema::create('member', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('phone')->unique();;
            $table->string('addres');
            $table->tinyInteger('status')->default('1');
            $table->dateTime('create_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     * Xóa trường, bảng với hàm down()
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('member');
    }
}
