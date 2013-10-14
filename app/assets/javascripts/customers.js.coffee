# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ($) ->
  $("#cpf").mask "999.999.999-99"
  $("#cep").mask "99999-999"

  getCitiesByState = (id) ->
    $.getJSON "/cities_by_state", id, (j) ->
      options = "<option value=\"\">Selecione uma Cidade</option>"
      $.each j.cty, (i, item) ->
        options += "<option value=\"" + item.id + "\">" + item.n + "</option>"
  
      $("#customer_address_attributes_city_id").html options
  
  $(document).ready ->
    $("#state_id").change ->
      getCitiesByState "id=" + $("#state_id").val()
