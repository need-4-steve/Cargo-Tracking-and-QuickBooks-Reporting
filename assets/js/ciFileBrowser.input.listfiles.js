if ( typeof ciFileBrowser.input == 'undefined') {
	ciFileBrowser.input = {};
}
ciFileBrowser.input.listfiles = {
	data : [],
	create : function(parameters) {
		var base = ciFileBrowser.input.listfiles;

		var name = ciFileBrowser.get(parameters.name, 'listfiles');
		var data = parameters;
		base.data[name] = data;

		//when change file
		$("[name='" + name + "']").change(function(event) {
			base.setChangeFile(name, event);
		});

		//when click btn Sent
		if (data.btnSend)
			data.btnSend.click(function(event) {
				base.sendFileToServer(name);
			});
	},

	setChangeFile : function(name, event) {

		var base = ciFileBrowser.input.listfiles;
		var target = event.target || window.event.srcElement;
		var files = target.files;

		base.data[name].files = {};
		if (files) {
			$.each(files, function() {
				base.addFileToData(name, this);
			});
			base.appFileToList(name);
		}
	},

	addFileToData : function(name, file) {
		var base = ciFileBrowser.input.listfiles;
		var reader = new FileReader();
		var id = ciFileBrowser.id.new();
		reader.readAsDataURL(file);
		base.data[name].files[id] = file;
	},

	appFileToList : function(name) {
		var base = ciFileBrowser.input.listfiles;
		var box_list = $('<div class="box-list-info-file">');
		for (var id in base.data[name].files) {
			var file = base.data[name].files[id];
			var box_file = $('<div class="box-info-file" data-file-name="' + base.data[name].files[id].name + '">');
			box_list.append(box_file.html(file.name));
		}
		$('.bag-list-info-file[for="' + name + '"]').empty().append(box_list);
	},

	sendFileToServer : function(name) {
		var base = ciFileBrowser.input.listfiles;
		var data = base.data[name];
		data.path = ciFileBrowser.get(data.path, 'vendor_documents/');
		data.url = ciFileBrowser.get(data.url, '/file/upload/');
		data.btnSend = ciFileBrowser.get(data.btnSend, base.btnSend);

		var count = 0;
		var length = 0;
		$.each(data.files, function(index) {

			length++;
			var dataSent = new FormData();

			var nameFile = this.name;

			dataSent.append(name, this);
			dataSent.append('name', name);
			dataSent.append('path', data.path);

			$.ajax({
				url : data.url,
				type : 'POST',
				data : dataSent,
				dataType : "json",
				beforeSend : function() {},
				success : function(result) {
					
					count++;
					$('[data-file-name="' + nameFile + '"]').append(' - '+result.status);
					if (count == length) {
						data.done();
					}
				},

				processData : false,
				contentType : false,
			});
		});
	},
};
