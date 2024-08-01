<?php

use App\Http\Controllers\MedicalCertificateController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentProfileController;
use App\Http\Controllers\MedicineController;
use App\Http\Controllers\ConsultationRecordController;

// Consultation Record
Route::get('/consultation-records', [ConsultationRecordController::class, 'allRecords']);
Route::post('/consultation-records', [ConsultationRecordController::class, 'createConsultationRecord']);
Route::get('/consultation-records/{id}', [ConsultationRecordController::class, 'getAllConsultationRecord']);
Route::put('/consultation-records/{id}', [ConsultationRecordController::class, 'updateConsultationRecord']);
Route::put('/consultation-records/timeout/{id}', [ConsultationRecordController::class, 'updateTimeoutStatus']);
// Students Profile
Route::get('/students', [StudentProfileController::class, 'allStudents']);
Route::get('/students/{id}', [StudentProfileController::class, 'showAStudent']);
Route::post('/students', [StudentProfileController::class, 'createStudentP']);
Route::put('/students/{id}', [StudentProfileController::class, 'updateStudentP']);
Route::delete('/students/{id}', [StudentProfileController::class, 'deleteStudentP']);
// Medicine
Route::get('/medicines', [MedicineController::class, 'allMedicines']);
Route::get('/medicines/{id}', [MedicineController::class, 'showAMedicine']);
Route::post('/medicines', [MedicineController::class, 'createMedicine']);
Route::put('/medicines/{id}', [MedicineController::class, 'updateMedicineP']);
Route::delete('/medicines/{id}', [MedicineController::class, 'deleteMedicineP']);
Route::post('/generate-medical-certificate', [MedicalCertificateController::class, 'generate']);

?>