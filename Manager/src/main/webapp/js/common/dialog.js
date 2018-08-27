(function($, window){
	var modalHtml = '<div class="modal-wrap">'
		+ '<div class="modal-backend"></div>'
		+ '<div class="modal-scroll">'
			+ '<div class="modal-inner">'
				+ '<div class="modal">'
					+ '<a class="modal-close iconfont icon-xiao64-copy" href="javascript:void(0);" title="关闭"></a>'
					+ '<div class="modal-header"></div>'
					+ '<div class="modal-content"></div>'
					+ '<div class="modal-footer">'
						+ '<button class="modal-submit" type="button">确定</button>'
						+ '<button class="modal-cancel" type="button">取消</button>'
					+ '</div>'
				+ '</div>'
			+ '</div>'
		+ '</div>'
	+ '</div>';

	function Dialog(options){
		this.options = $.extend({
			title: '',
			content: '',
			showFooter: false,
			confirmText:'确定',
			size: 'middle',
			cancelText:'取消',
			confirm: $.noop
		}, options);

		this.init();
	}

	$.extend(Dialog.prototype, {
		init: function(){
			var opt = this.options;
			var modal = this.modal = $(modalHtml);

			var header = modal.find('.modal-header');
			opt.title ? header.text(opt.title) : header.remove();

			var footer = modal.find('.modal-footer');
			if(opt.showFooter && opt.confirmText && opt.cancelText){
				var submit = footer.find('.modal-submit');
				var cancel = footer.find('.modal-cancel');

				opt.confirmText ? submit.text(opt.confirmText) : submit.remove();
				opt.cancelText ? cancel.text(opt.cancelText) : cancel.remove();

				cancel.on('click', $.proxy(this.close, this));
				submit.on('click', $.proxy(this.confirm, this));
			} else {
				footer.remove();
			}

			var close = modal.find('.modal-close')
			close.on('click', $.proxy(this.close, this));

			var content = modal.find('.modal-content');
			content.html(opt.content);

			modal.find('.modal-inner').addClass('modal-' + opt.size);

			modal.appendTo(document.body);

			$('body').addClass('model-open')
		},
		close: function(e){
			this.modal.remove();
			$('body').removeClass('model-open')
		},
		confirm: function(e){
			this.options.confirm(this.options);
		}
	});

	
	$.dialog = function(opt){
		return new Dialog(opt);
	}

	$.modal = $.dialog;
})(jQuery, window)