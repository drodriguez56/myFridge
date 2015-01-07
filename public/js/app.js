$(document).ready(function (){

$('#login').on("click", function(ev){
  ev.preventDefault();
  $('.login_form').toggle();
});
$('#singup').on("click", function(ev){
  ev.preventDefault();
  $('.singup_form').toggle();
});

$('#content').on("submit", 'form.add_form', function(event){
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: $target.attr('action'),
    type: 'POST',
    data: $target.serialize()
  }).done(function(response){
    $('table').replaceWith(response);
    $('form.add_form').children('input').val('')
    $('form.add_form#add').val('add')
  });

});


$('#content').on("click", '.edit', function(event){
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: '/edit',
    type: 'GET'
  }).done(function(response){
    var name = $target.parent().parent().parent().find('.item_name').text();
    var amount = $target.parent().parent().parent().find('.item_amount').text();
    var days = $target.parent().parent().parent().find('.item_days').text();
    var expires = $target.parent().parent().parent().find('.item_expires').text();
    var id = $target.parent().parent().parent().find('.item_name').attr('data-item-id');
    $target.parent().parent().parent().replaceWith(response)

    $('#edit_form_text').val(name);
    $('#edit_form_amount').val(amount);
    $('#edit_form_days').val(days);
    $('#edit_form_expires').val(expires);
    $('#edit_form_id').val(id);
  });
});

$('#content').on("submit", 'form#edit_form', function(event){
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: $target.attr('action'),
    type: 'POST',
    data: $target.serialize()
  }).done(function(response){
    $('table').replaceWith(response);
  });

});


// no puedo editar mas de uno al tiempo (arreglar)
});