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

  $('.show_more').click(function () {

    var limit = $('.show_more').attr('data-limit');

    var data = {
      metod: 'ajax',
      limit: limit
    };

    $.ajax({
      type: 'POST',
      url: '/index.php',
      data: data,
      dataType: 'json',
      error: function(jqXHR, exception)
      {

        if (jqXHR.status === 0) {
          alert('Not connect.\n Verify Network.');        //  не включен инет
        } else if (jqXHR.status == 404) {
          alert('Requested page not found. [404]');       // нет такой страницы
        } else if (jqXHR.status == 500) {
          alert('Internal Server Error [500].');          // нет сервера такого
        } else if (exception === 'parsererror') {
          alert(jqXHR.responseText);                      // ошибка в коде при парсинге
        } else if (exception === 'timeout') {
          alert('Time out error.');                       // недождался ответа
        } else if (exception === 'abort') {
          alert('Ajax request aborted.');                 // прервался на стороне сервера
        } else {
          alert('Uncaught Error.\n' + jqXHR.responseText);// не знает что это
        }
      } // error

    }).done(function(response) {

      console.log(response);

      $('.catalog-grid').html(response);
      $('.show_more').attr('data-limit', +limit+6);

    });

  });

  function autoriz(){
    var login = encodeURI(document.getElementById('register_login').value);
    var password = encodeURI(document.getElementById('register_pass').value);
    var rememberme = encodeURI(document.getElementById('rememberme').checked);
    $.ajax({ type: 'POST', url: '/index.php', data: { metod: 'ajax', PageAjax: 'register', var3: rememberme2, login: login, pass: password, rememberme: rememberme}, success: function(response){
        $('#autorize').html(response);
      },
      dataType:"json"
    });
  };

});