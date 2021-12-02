$(document).ready(function () {
    $('#buildingDropdown').hide();
    $('#batteryDropdown').hide();
    $('#columnDropdown').hide();
    $('#elevatorDropdown').hide();
});

function buildingDropdownList() {
    if ($('#customer').val() == "") {
        $('#buildingDropdown').hide();
        $('#batteryDropdown').hide();
        $('#columnDropdown').hide();
        $('#elevatorDropdown').hide();
    }else{
        $('#buildingDropdown').hide();
        $('#batteryDropdown').hide();
        $('#columnDropdown').hide();
        $('#elevatorDropdown').hide();
        $.ajax({
            url: "/intervention/building",
            type: "GET",
            data: {customer: $('#customer').val()},
            success: function(data) {
                var list = [];
                $.each(data,function(key, value) { 
                    list += '<option value="' + value.id + '">Building: ' + value.id + '</option>';    
                });
                $('#elevator').empty();
                $('#building').empty();
                $('#building').append('<option value="">Select Building</option>');
                $('#building').append(list);
            }
        })
        $('#buildingDropdown').show();
    }
};

function batteryDropdownList() {
    if ($('#building').val() == "") {
        $('#batteryDropdown').hide();
        $('#columnDropdown').hide();
        $('#elevatorDropdown').hide();
    }else{
        $.ajax({
            url: "/intervention/battery",
            type: "GET",
            data: {building: $('#building').val()},
            success: function(data) {
                var list = [];
                $.each(data,function(key, value) { 
                    list += '<option value="' + value.id + '">Battery: ' + value.id + '</option>';    
                });
                $('#elevator').empty();
                $('#battery').empty();
                $('#battery').append('<option value="">Select Battery</option>');
                $('#battery').append(list);
            }
        })
        $('#batteryDropdown').show();
    }
};

function columnDropdownList() {
    if ($('#battery').val() == "") {
        $('#columnDropdown').hide();
        $('#elevatorDropdown').hide();
    }else{
        $.ajax({
            url: "/intervention/column",
            type: "GET",
            data: {battery: $('#battery').val()},
            success: function(data) {
                var list = [];
                $.each(data,function(key, value) { 
                    list += '<option value="' + value.id + '">Column: ' + value.id + '</option>';    
                });
                $('#elevator').empty();
                $('#elevator').append('<option value="">None</option>');
                $('#column').empty();
                $('#column').append('<option value="">None</option>');
                $('#column').append(list);
            }
        })
        $('#columnDropdown').show();
        $('#elevatorDropdown').show();
    }
};

function elevatorDropdownList() {
    $.ajax({
        url: "/intervention/elevator",
        type: "GET",
        data: {column: $('#column').val()},
        success: function(data) {
            var list = [];
            $.each(data,function(key, value) { 
                list += '<option value="' + value.id + '">Elevator: ' + value.id + '</option>';    
            });
            $('#elevator').empty();
            $('#elevator').append('<option value="">None</option>');
            $('#elevator').append(list);
        }
    })
};

$('#submit_intervention').on('click', function (event) {
    if ($('#customer').val() == '' || $('#building').val() == '' || $('#battery').val() == '' || $('#description').val() == '') {
        alert("A required field is empty.");
    } else {
        alert("Thank you!! Your intervention has been submitted.");
        $.ajax({
            url: "/intervention",
            type: "POST",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: {
                customer: $('#customer').val(),
                building: $('#building').val(),
                battery: $('#battery').val(),
                column: $('#column').val(),
                elevator: $('#elevator').val(),
                employee: $('#employee').val(),
                description: $('#description').val()
            },
            success: function(data) {
                
            }
        })   
    }
});