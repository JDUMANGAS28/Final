<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentProfile extends Model
{
    protected $table = 'student_profile';
    protected $primaryKey = 'student_id';
    public $timestamps = false; 
    protected $fillable = [
        'student_lrn', 'first_name', 'last_name', 'middle_name', 'extension', 'birth_date',
        'sex_at_birth', 'grade_level', 'section',
    ];
}

