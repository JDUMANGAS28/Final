<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ConsultationRecord extends Model
{
    protected $table = 'consultation_record';
    protected $primaryKey = 'id';
    public $timestamps = false; 
    protected $fillable = [
        'student_id', 'complaint', 'blood_pressure', 'pulse_rate', 'oxygen_sat', 'temp', 'treatment', 'medicine_id',
        'time_in', 'time_out', 'is_timeout'
    ];
    public function medicine()
{
    return $this->belongsTo(Medicine::class, 'medicine_id', 'medicine_id');
}
}
