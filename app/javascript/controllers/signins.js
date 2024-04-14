// app/assets/javascripts/signins.js
$(document).on('submit', 'form', function(e) {
    e.preventDefault();
    $.ajax({
        url: $(this).attr('action'),
        method: 'POST',
        data: $(this).serialize(),
        success: function(data) {
            $('.scroll-box').html(data);
        }
    });
});