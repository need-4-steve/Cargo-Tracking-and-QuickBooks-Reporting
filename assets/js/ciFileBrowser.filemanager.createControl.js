ciFileBrowser.filemanager.setControl = function(arrayControl, path, fileName) {
	var base = ciFileBrowser.filemanager;
	var boxControl = $('<div class="box-control">');
	for (var key in arrayControl) {
		var control = arrayControl[key];
		var createControl = base.createControl[control];
		var elmControl = createControl(path, fileName);
		elmControl.appendTo(boxControl);
	}
	return boxControl;
};
ciFileBrowser.filemanager.createControl = {};
/*fileInfo*/
ciFileBrowser.filemanager.createControl.fileInfo = function(path, fileName) {
	var base = ciFileBrowser.filemanager;
	var elmControl = $('<i class="fa fa-info-circle file-info" title="file info">');
	elmControl.click(function() {
		info = "file Name: " + fileName + " \n";
		info += "path: " + path;
		alert(info);
	});
	return elmControl;
};
/*copyPathFile*/
ciFileBrowser.filemanager.createControl.copyPathFile = function(path, fileName) {
	var base = ciFileBrowser.filemanager;
	var elmControl = $('<i class="fa fa-link copy-path-file" title="copy path file">');
	elmControl.click(function() {
		pathFile = "http://localhost/" + path + fileName;
		prompt("Please copy path file", pathFile);
	});

	return elmControl;
};

/*deleteFile*/
ciFileBrowser.filemanager.createControl.deleteFile = function(path, fileName) {
	var base = ciFileBrowser.filemanager;
	var elmControl = $('<i class="fa fa-times-circle-o delete-file" title="delete file">');

	var pathFile = "/" + path + fileName;
	var data = {
		pathFile : pathFile
	};

	elmControl.click(function() {

		$.ajax({
			url : base.urlDeleteFile,
			type : "post",
			dataType : "json",
			data : data,

			beforeSend : function() {
			},
			success : function(result) {
				if (result.status == 'error') {
					alert(result.message);
				}

				if (result.status == 'success') {
					base.loadFolder(path);
					alert(result.message);
				}
			},
		});
	});
	return elmControl;

};

/*rename File*/
ciFileBrowser.filemanager.createControl.renameFile = function(path, fileName) {
	var base = ciFileBrowser.filemanager;
	var elmControl = $('<i class="fa fa-pencil-square-o rename-file" title="rename file">');

	elmControl.click(function() {
		var oldname = fileName.replace(/\.[^/.]+$/, "");
		var extention = /(?:\.([^.]+))?$/.exec(fileName)[0];
		var newname = prompt("Please enter file name", oldname);

		var data = {
			path : path,
			extention : extention,
			oldname : oldname,
			newname : newname
		};

		$.ajax({
			url : base.urlRenameFile,
			type : "post",
			dataType : "json",
			data : data,

			beforeSend : function() {
			},
			success : function(result) {
				if (result.status == 'error') {

				}
				if (result.status == 'success') {
					base.loadFolder(path);
				}
				alert(result.message);
			},
		});
	});
	return elmControl;
};

/*delete Folder*/
ciFileBrowser.filemanager.createControl.deleteFolder = function(path, fileName) {
	var base = ciFileBrowser.filemanager;
	var elmControl = $('<i class="fa fa-times-circle-o delete-folder" title="delete folder">');
	elmControl.click(function() {
		var pathFolder = "/" + path + fileName;
		
		var r = confirm("Ban co chac chan xoa thu muc nay khong");
	if (r == false) { return;}
	
	
		var data = {
			pathFolder : pathFolder
		};
		
		$.ajax({
			url : base.urlDeleteFolder,
			type : "post",
			dataType : "json",
			data : data,

			beforeSend : function() {},
			success : function(result) {
				if (result.status == 'error') {
					
				}

				if (result.status == 'success') {
					base.loadFolder(path);
				}
				alert(result.message);
			},
		});
	});
	return elmControl;

};
/*rename Folder*/
ciFileBrowser.filemanager.createControl.renameFolder = function(path, fileName){
	var base = ciFileBrowser.filemanager;
	var elmControl = $('<i class="fa fa-pencil-square-o rename-folder" title="rename folder">');
	elmControl.click(function(){
		 var newname =   prompt("Please enter folder name", fileName);
		 var data = {
            path:path,
            oldname:fileName,
            newname:newname
         };
         
          $.ajax({
              url: base.urlRenameFolder,
              type: "post",
              dataType:"json",
              data: data,

              beforeSend:function(){},
              success:function(result){
                if(result.status == 'error')
                {
                    
                }

                if(result.status == 'success')
                {
                  base.loadFolder(path);
                  
                }
                alert(result.message);
              },
          });
	});
	return elmControl;
	
};
