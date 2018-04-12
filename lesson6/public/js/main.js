$(document).ready(function() {

  // Форма регистрации
  $('#register_form').submit(function() {
    var pass1 = $('#register_pass').val();
    var pass2 = $('#register_pass_2').val();

    if(pass1 === pass2) {
      return true;
    } else {
      $('.error').text('Пароли не совпадают!');
      $('#register_pass').addClass('error_input');
      $('#register_pass_2').addClass('error_input');
      $('#register_pass').focus();
      return false;
    }

  });

});

function autoriz(){

  var login = encodeURI(document.getElementById('auth_login').value);
  var password = encodeURI(document.getElementById('auth_pass').value);
  var rememberme = encodeURI(document.getElementById('auth_remember').checked);
  $.ajax({
    type: 'POST',
    url: '/index.php',
    data: {
      metod: 'ajax',
      PageAjax: 'autoriz',
      login: login,
      pass: password,
      rememberme: rememberme},
    success: function(){

      location.reload(true);

    },
    dataType:"json"
  });
}

function logout(){

  $.ajax({
    type: 'POST',
    url: '/index.php',
    data: {
      action: 'logout'
    },
    success: function(response){

      location.reload(true);

    },
    dataType:"json"
  });
}

function getProducts() {

  var limit = $('.show_more').attr('data-limit');

  var data = {
    metod: 'ajax',
    PageAjax: 'getProducts',
    limit: limit
  };

  $.ajax({
    type: 'POST',
    url: '/index.php',
    data: data,
    dataType: 'json'
  }).done(function(response) {

    console.log(123);

    $('.grid').html(response);
    $('.show_more').attr('data-limit', +limit+6);

  });

}