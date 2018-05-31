ciFileBrowser.filemanager = {
    root: '/xampp/htdocs/vendor_documents/',
    current: "vendor_documents/",

	data : {},

	urlLoadFolder : '/filemanager/folder/',
	urlUploadFiles : '/filemanager/uploadfiles/',
	urlDeleteFile : '/file/deleteFile/',
	urlRenameFile : '/file/renameFile/',

	urlCreateFolder : '/file/createFolder/',
	urlDeleteFolder : '/file/deleteFolder/',
	urlRenameFolder : '/file/renameFolder/',

	create : function() {
		var base = ciFileBrowser.filemanager;
		base.createRoot();
		base.loadFolder();
	},
	createRoot : function() {
		var base = ciFileBrowser.filemanager;
		var root = base.createFolder(base.root);
		$('#html_map').append(root.elementBag);
	},
	//create data
	createFolder : function(path) {
		var base = ciFileBrowser.filemanager;
		base.data[path] = {};
		var item = base.data[path];
		//.name
		var arrayName = path.split("/");
		var length = arrayName.length;

		item.name = arrayName[length - 2];
		//console.log("item.name :"+item.name);
		//.elementBag
		item.elementBag = $('<div class="bag-folder">');
		//.elementBtnFolder
		item.elementBtnFolder = $('<b class="button-folder fa fa-plus-square-o">').appendTo(item.elementBag);
		item.elementBtnFolder.click(function() {
			base.showFolder(path);
		});
		//.html(item.name)
		item.elementBtnBoard = $('<span class="button-board">').html(item.name).appendTo(item.elementBag);
		item.elementBtnBoard.click(function() {
			  base.setBoard(path);
		});
		//.elementBox
		item.elementBox = $('<div class="box-folder">').appendTo(item.elementBag);

		return item;
	},
	loadFolder : function(path, isAddList) {
		var base = ciFileBrowser.filemanager;
		if ( typeof isAddList == 'undefined') {
			isAddList = true;
		}
		if (!path) {
			path = base.root;
		}

		var data = {
			root : base.root,
			path : path,
		};
		$.ajax({
			url : base.urlLoadFolder,
			type : "post",
			dataType : "json",
			data : data,
			//beforeSend : base.loadFolderBefore,
			success : function(result) {
				var base = ciFileBrowser.filemanager;
				base.loadFolderSuccess(result, path, isAddList);
			},
		});
	},
	loadFolderSuccess : function(result, path, isAddList) {
		var base = ciFileBrowser.filemanager;

		base.data[path].list = result;
		base.data[path].elementBtnFolder.removeClass('fa-plus-square-o').addClass('fa-minus-square-o');

		base.data[path].elementBtnFolder.unbind("click").click(function() {
			base.hideFolder(path);
		});

		base.setBoard(path);
		if (isAddList === true) {
			base.listFolder(path);
		}
	},
	//display contents of the collection
	setBoard:function(path){
		 var base = ciFileBrowser.filemanager;
    	 base.current = path;
		 if(typeof base.data[path].list != 'undefined')
    	 {
    	 	var html = $('<ul>');
    	 	
    	 	$.each(base.data[path].list,function(){
    	 		//console.log(this);
    	 		var extention = /(?:\.([^.]+))?$/.exec(this)[1];
    	 		
    	 		if(typeof extention == 'undefined')
		       	{
		         extention = 'folder';
		        }
		        
		        var  boxFile = null;
		        
		         try {
		          var createFile = base.createFile[extention];
		           boxFile = createFile(path,this);
		        }
		        catch(err) {
		          boxFile = base.createFile.other(path,this);
		        }
		        var elementItem = $('<li>').append(boxFile);
      			html.append(elementItem);
    	 	});
    	 	 $('#path_current').html(base.current);
      		 $('#path_content').html(html);	
        		/*var extention = /(?:\.([^.]+))?$/.exec(this)[1];
		       if(typeof extention == 'undefined')
		       {
		         extention = 'folder';
		       }
		        
		        try {
		          var createFile = base.createFile[extention];
		           boxFile = createFile(path,this);
		        }
		        catch(err) {
		          boxFile = base.createFile.other(path,this);
		        }
		       */
		     
        
    	 }
    	 else{
    	 	base.loadFolder(path);
    	 }
	},
	listFolder : function(path) {
		var base = ciFileBrowser.filemanager;
		var html = '';
		if(base.data[path].list)
		{
			base.data[path].elementBox.empty();
		}
		$.each(base.data[path].list, function() {
			//console.log(this);
			if (this.indexOf('.') < 0) {
				//is folder
				var pathList = path + this + '/';
				var folder = base.createFolder(pathList);
				folder.elementBag.appendTo(base.data[path].elementBox);
			}

		});
	},

	showFolder : function(path) {
		var base = ciFileBrowser.filemanager;
		if ( typeof base.data[path].list == 'undefined') {
			base.loadFolder(path);//ajax
		} 
		else {
			//elementBox not for children
			base.data[path].elementBox.show();
			base.data[path].elementBtnFolder.removeClass('fa-plus-square-o').addClass('fa-minus-square-o');
			base.data[path].elementBtnFolder.unbind("click").click(function() {
				base.hideFolder(path);
			});
		}
	},
	hideFolder : function(path) {
		//console.log(path);
		var base = ciFileBrowser.filemanager;
	    base.data[path].elementBox.hide();
	    base.data[path].elementBtnFolder.removeClass('fa-minus-square-o').addClass('fa-plus-square-o');    
	    base.data[path].elementBtnFolder.unbind( "click" ).click(function(){
	        base.showFolder(path);
      	});
	},
	
	getCurrent: function(){
		var base = ciFileBrowser.filemanager;
		return base.current;
	},
	
	createFolderOnServer: function(){
		var base = ciFileBrowser.filemanager;
    	var name =  prompt("Please enter folder name", "New Folder");
    	
    	$.ajax({
        url: base.urlCreateFolder,
        type: "post",
        dataType:"json",
        data: {
          name:name,
          path:base.current
        },
        beforeSend:function(){},
        success:function(result){
          if(result.status == 'error')
          {
              
          }
          
          if(result.status == 'success')
          {
            var base = ciFileBrowser.filemanager;
            base.loadFolder(base.current);
             
          }
          alert(result.message);
        },
      });
	},
};
