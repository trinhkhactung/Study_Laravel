<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name'        => 'Administrator',
            'email'       => 'admin@gmail.com',
            'password'    => bcrypt('123456'),
            'created_at'  => date('Y-m-d h:m:i'),
            'updated_at'  => date('Y-m-d h:m:i'),
        ]);
    }
}
