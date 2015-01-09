$(document).ready(function (){

$('#content').on("click", "#login", function(event){
  event.preventDefault();
  var $target =  $(event.target);
  $.ajax({
    url:'/login',
    type: 'GET'
  }).done(function(response){
    $('#login_signup_space').children().replaceWith(response);
    $('#login').css('display', 'none');
    $('#signup').css('display', 'inline');
  });
});

$('#content').on("click", "#signup", function(event){
  event.preventDefault();
  var $target =  $(event.target);
  $.ajax({
    url:'/signup',
    type: 'GET'
  }).done(function(response){
    $('#login_signup_space').children().replaceWith(response);
    $('#signup').css('display', 'none');
    $('#login').css('display', 'inline');
  });
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
    $('form.add_form').children('input').val('').end().find('#add').val('add');
  }).fail(function(obj){
    alert("Couldn't save entry: " + obj.responseText);
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
    $('#delete_form_id').val(id)
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
$('#content').on("submit", 'form#delete_item_form', function(event){
  event.preventDefault();
  var $target = $(event.target);
  $.ajax({
    url: $target.attr('action'),
    type: 'DELETE',
    data: $target.serialize()
  }).done(function(response){
    $target.closest('tr').remove();
  });

});


// no puedo editar mas de uno al tiempo (arreglar)
});