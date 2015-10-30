$( document ).ready(function() {
  $('#contract_equipment_ids').html("");

  $('#contract_rental_period_id').change(function(){
    var id_rental_period = $('#contract_rental_period_id option:selected').val();

    $('#contract_equipment_ids').html(""); // remove os equipmentos da lista
    $.getJSON("/equipment/rental_period/"+ id_rental_period +".json", function(result){
      var equipment_options = $('#contract_equipment_ids');
      $.each(result, function(item, element) {
        console.log(element.to_s);
        equipment_options.append($("<option />").val(element.id).text(element.to_s));
        console.log(equipment_options.html());
      });
    });
  });
});
