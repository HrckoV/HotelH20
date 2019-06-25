$(document).ready(function () {
    // Datepicker Popups calender to Choose date.
    $(function () {
        $("#dateTo").datepicker();
        // Pass the user selected date format.
        $("#format").change(function () {
            $("#dateTo").datepicker("option", "dateFormat", $(this).val());
        });

        $("#dateFrom").datepicker();
        // Pass the user selected date format.
        $("#format").change(function () {
            $("#dateFrom").datepicker("option", "dateFormat", $(this).val());
        });
    });
});