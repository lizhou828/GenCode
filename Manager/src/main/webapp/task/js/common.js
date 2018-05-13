$(function(){

	// 自定义弹窗
	(function() {
		$('.base-modal').on('click',function(e) {
			e.preventDefault();
			var modalBox = $('.' + $(this).data('modal'));
			modalBox.show();
			var modalBody = modalBox.children('.base-modal-body');
			modalBody.css('margin-top', -(modalBody.outerHeight() / 2));
		})
		$('.base-modal-footer .cancel').click(function() {$('.base-modal-box').hide()})
	})();

});



// 提示 message
function globalTips(msg, t) {
	var time = 1500;
	if (t) time = t;
	var html = '<div class="global-msg"><span>' + msg + '</span></div>';
	$('body').append(html);
	setTimeout(function() {
		$('.global-msg').remove();
	}, time);
}



//IE placeholder;
(function() {
	if (/MSIE 9|MSIE 8|MSIE 7|MSIE 6/g.test(navigator.userAgent)) {
    function resetPlaceholder() {
      if ($(this).val() === '') {
        $(this).val($(this).attr('placeholder'))
          .attr('data-placeholder', true)
          .addClass('ie-placeholder');
        if ($(this).is(':password')) {
          var field = $('<input />');
          $.each(this.attributes, function (i, attr) {
            if (attr.name !== 'type') {
              field.attr(attr.name, attr.value);
            }
          });
          field.attr({
            'type': 'text',
            'data-input-password': true,
            'value': $(this).val()
          });
          $(this).replaceWith(field);
        }
      }
    }

    $('[placeholder]').each(function () {
      //ie user refresh don't reset input values workaround
      if ($(this).attr('placeholder') !== '' && $(this).attr('placeholder') === $(this).val()){
        $(this).val('');
      }
      resetPlaceholder.call(this);
    });
    $(document).on('focus', '[placeholder]', function () {
      if ($(this).attr('data-placeholder')) {
        $(this).val('').removeAttr('data-placeholder').removeClass('ie-placeholder');
      }
    }).on('blur', '[placeholder]', function () { resetPlaceholder.call(this); });
    $(document).on('focus', '[data-input-password]', function () {
      var field = $('<input />');
      $.each(this.attributes, function (i, attr) {
        if (['type','data-placeholder','data-input-password','value'].indexOf(attr.name) === -1) {
          field.attr(attr.name, attr.value);
        }
      });
      field.attr('type', 'password').on('focus', function () { this.select(); });
      $(this).replaceWith(field);
      field.trigger('focus');
    });
  }
})();

