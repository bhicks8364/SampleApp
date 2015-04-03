$("#assignments a.add_fields").
  data("association-insertion-position", 'before').
  data("association-insertion-node", 'this');

$('#assignments').on('cocoon:after-insert',
     function() {
         $(".assignment-fields a.add_fields").
             data("association-insertion-position", 'before').
             data("association-insertion-node", 'this');
         $('.assignment-fields').on('cocoon:after-insert',
              function() {
                $(this).children("#employee_profile_from_list").remove();
                $(this).children("a.add_fields").hide();
              });
     });