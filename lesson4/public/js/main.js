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

    $.ajax({
      type: 'POST',
      url: '/',
      data: { metod: 'ajax', limit: $('.show_more').attr('data-limit') },
      dataType: 'json',
      success: function (response) {
        alert(response);
      },
      error: function(jqXHR, exception)
      {
        if (jqXHR.status === 0) {
          alert('Not connect.\n Verify Network.'); //  не включен инет
        } else if (jqXHR.status == 404) {
          alert('Requested page not found. [404]'); // нет такой страницы
        } else if (jqXHR.status == 500) {
          alert('Internal Server Error [500].'); // нет сервера такого
        } else if (exception === 'parsererror') {
// ошибка в коде при парсинге
          alert(jqXHR.responseText);
        } else if (exception === 'timeout') {
          alert('Time out error.'); // недождался ответа
        } else if (exception === 'abort') {
          alert('Ajax request aborted.'); // прервался на стороне сервера
        } else {
          alert('Uncaught Error.\n' + jqXHR.responseText); // не знает что это
        }
      } // error
    });

  });

});