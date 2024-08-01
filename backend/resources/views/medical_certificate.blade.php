<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phyisical Exam Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="border p-4">
        <div class="text-center mb-4">
            <h4>ST.NICHOLAS ACADEMY OF CASTILLEJOS INC.</h4>
        </div>

        <h5 class="text-center mb-4">Phyisical Examination Form</h5>

        <div class="mb-4">
            <h6>Patient Information:</h6>
            <p><strong>Name:</strong> {{$data['name']}}<br>
            <p><strong>School ID:</strong> {{$data['school_id']}}<br>
            
            <p><strong>Date of birth:</strong> {{$data['birthdate']}}<br>
            <p><strong>Age:</strong> {{$data['age']}}<br>
            <p><strong>BP:</strong> {{$data['blood_pressure']}}<br>
            <p><strong>PR:</strong> {{$data['pulse_rate']}}<br>
            <p><strong>Vision L:</strong> {{$data['vision_left']}}<br>
            <p><strong>Vision R:</strong> {{$data['vision_right']}}<br>
            <p><strong>Weight:</strong> {{$data['weight']}}<br>
            <p><strong>Height:</strong> {{$data['height']}}<br>
            
            
            
            
            
        </div>

        <div class="mb-4">
            <h6>Remark:</h6>
            
        </div>

        <div class="mb-4">
            <h6>Doctor’s Signature and Seal:</h6>
            <p>____________________________<br>
            Dr. Jane Smith, MD<br>
            Your Medical Practice Name</p>
            <p><strong>Date:</strong> {{$data['date_created']}}</p>
            <p><em>This certificate is issued for medical and work excuse purposes only.</em></p>
        </div>

        <div class="text-center">
            <p><strong>Contact Information for Verification:</strong><br>
            For any verification, please contact our office at Your Phone Number during business hours.</p>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
