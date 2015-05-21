$(document).ready(function() {
    $('#assignments-table').DataTable( {
        "paging":   true,
        "ordering": true,
        "info":     true
    } );
    
    $('#timesheets-table').dataTable( {
        "paging":   true,
        "info":     true,
        "ordering": true,
        // "scrollY":        200,
        // "scrollCollapse": true,
        "jQueryUI":       true,
        "dom": 'T<"clear">lfrtip'
    } );
    
    $('#job-orders-table').dataTable( {
        "paging":   true,
        "ordering": true,
        "info":     true,
        "jQueryUI": true
    } );
    
    $('#employees-table').dataTable( {
        "paging":   true,
        "ordering": true,
        "info":     true
    } );
    
    $('#company_profiles-table').DataTable( {
        "paging":   true,
        "ordering": true,
        "info":     true
    } );
    
    $( "#job_order_fill_date" ).datepicker({ minDate: -1, maxDate: "+1M +10D", dateFormat: "yy-mm-dd" });
    $( ".dragme" ).draggable();
    $( "#menu" ).menu();
    
    
//     $('#jobOrderModal').on('show.bs.modal', function (event) {
//         var button = $(event.relatedTarget) // Button that triggered the modal
//         var recipient = button.data('whatever') // Extract info from data-* attributes
//         // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
//         // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
//         var modal = $(this)
//         modal.find('.modal-title').text('New message to ' + recipient)
//         modal.find('.modal-body input').val(recipient)
// })
    
    
} );


$(document).ready(function() {
  $('.has-tooltip').tooltip();
});


