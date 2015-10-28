$( document ).ready(function() {
  $('#contract_equipment_ids').html(""); // remove os equipmentos da lista

  $('#contract_rental_period_id').change(function(){
    var id_rental_period = $('#contract_rental_period_id option:selected').val();

    $.ajax({
      url: "/equipment/"+ id_rental_period +"/?format=js"
    });
  });
});


//get "/equipment/:rental_period_id/", to: "equipment#index"
