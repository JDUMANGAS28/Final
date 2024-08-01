<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ConsultationRecord;
use App\Models\Medicine;

class ConsultationRecordController extends Controller
{
    public function allRecords()
    {
        return response()->json(ConsultationRecord::all(), 200);
    }

    public function createConsultationRecord(Request $request)
    {
        $request->validate([
            'student_id' => 'required|exists:student_profile,student_id',
            'complaint' => 'required|string',
        ]);
    
        $consultationRecord = ConsultationRecord::create($request->all());
    
        return response()->json($consultationRecord, 201);
    }

    public function getAllConsultationRecord($id)
    {
        $consultationRecord = ConsultationRecord::find($id);
        if (!$consultationRecord) {
            return response()->json(['error' => 'Record book not found'], 404);
        }
        return response()->json($consultationRecord, 200);
    }

    public function getAllRecord()
    {
        return response()->json(ConsultationRecord::all(), 200);
    }

    public function updateConsultationRecord(Request $request, $id)
    {
        $consultation = ConsultationRecord::find($id);
        if (!$consultation) {
            return response()->json(['error' => 'Record book not found'], 404);
        }
        $consultation->update($request->all());
        return response()->json(['message' => 'Record status updated successfully'], 200);
    }

    public function updateTimeoutStatus($id)
    {
        $consultation = ConsultationRecord::find($id);
        if (!$consultation) {
            return response()->json(['error' => 'Record not found'], 404);
        }
        
        $consultation->update(['is_timeout' => 1]);

        return response()->json(['message' => 'Timeout status updated successfully'], 200);
    }
}
