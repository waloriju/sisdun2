# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#cnpj").mask "99.999.999/9999-99"
  $("#phone1").mask "(99) 9999-9999?9"
  $("#phone2").mask "(99) 9999-9999?9"
  $("#phone3").mask "(99) 9999-9999?9"
 
 # $('#state_id').change ->
 #   state_id = $(this).val()
 #   $.get "/companies/find_cities_by_state", { state_id:state_id }

  getCitiesByState = (id) ->
    $.getJSON "/cities_by_state", id, (j) ->
      options = "<option value=\"\">Selecione uma Cidade</option>"
      $.each j.cty, (i, item) ->
        options += "<option value=\"" + item.id + "\">" + item.n + "</option>"
  
      $("#company_address_attributes_city_id").html options
  
  $(document).ready ->
    $("#state_id").change ->
      getCitiesByState "id=" + $("#state_id").val()
