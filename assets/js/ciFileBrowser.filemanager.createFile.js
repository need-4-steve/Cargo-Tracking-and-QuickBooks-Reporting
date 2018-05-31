ciFileBrowser.filemanager.createFile = {
	jpg : function(path, fileName) {
		return ciFileBrowser.filemanager.createFile.image(path, fileName);
	},
	png : function(path, fileName) {
		return ciFileBrowser.filemanager.createFile.image(path, fileName);
	},
	gif : function(path, fileName) {
		return ciFileBrowser.filemanager.createFile.image(path, fileName);
	},
	image : function(path, fileName) {
		var base = ciFileBrowser.filemanager;
		var pathFile = "/" + path + fileName;

		var boxFile = $('<div class="box-file box-image">');

		$('<img class="image" >').attr({
			src : pathFile,
			path : path,
			fileName : fileName,
			pathFile : pathFile,
		}).appendTo(boxFile);

		$('<span>').text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName)).appendTo(boxFile);
		 var boxControl = base.setControl(['deleteFile','renameFile'],path,fileName);
		 boxControl.appendTo(boxFile);

		return boxFile;
	},
	folder : function(path, fileName) {
		var base = ciFileBrowser.filemanager;
		var pathFolder = path + fileName + "/";

		var boxFile = $('<div class="box-file box-folder">');
		var elmFile = $('<div class="folder fa fa-folder-o">', {
			path : path,
			fileName : fileName,
			pathFile : pathFolder,
		}).text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName));
		elmFile.appendTo(boxFile);
		
		var boxControl = base.setControl(['deleteFolder','renameFolder'], path, fileName);
		boxControl.appendTo(boxFile);

		elmFile.click(function() {
			base.loadFolder(pathFolder);
		});
		return boxFile;
	},
	other : function(path, fileName) {
		var base = ciFileBrowser.filemanager;
		var pathFile = "/" + path + fileName;

		var boxFile = $('<div class="box-file box-other">');
		$('<em class="other fa fa-file-o" >').attr({
			path : path,
			fileName : fileName,
			pathFile : pathFile,
		}).text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName)).appendTo(boxFile);

		// var boxControl = base.createControl({
		//   showImage:pathFile
		//   });
		//  boxControl.appendTo(boxFile);

		return boxFile;
	},
};
ciFileBrowser.filemanager.createFile.formatDisplayedFileName = function(str) {
    var inputLen = str.length,
        inputArray = str.split(""),
        inputArrayLen = inputArray.length,
        formattedStr = "",
        curLen = 0,
        LINE_LENGTH = 10;
    for (var x = 0; x < inputArrayLen; x++) {
        if (curLen + inputArray[x].length < LINE_LENGTH) {
            formattedStr += "" + inputArray[x];
            curLen +=inputArray[x].length;
        } else {
            formattedStr += "\n" + inputArray[x];
            curLen = inputArray[x].length;
        }
    }
    return formattedStr;
};
/*file word*/
ciFileBrowser.filemanager.createFile.doc = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.word(path, fileName);
};
ciFileBrowser.filemanager.createFile.docx = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.word(path, fileName);
};
ciFileBrowser.filemanager.createFile.word = function(path, fileName){
	var base = ciFileBrowser.filemanager;
	var pathFile = "/" + path + fileName;

	var boxFile = $('<div class="box-file box-other">');
	$('<em class="other fa fa-file-word-o" >').attr({
		path : path,
		fileName : fileName,
		pathFile : pathFile,
	}).text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName)).appendTo(boxFile);
	
	var boxControl = base.setControl(['deleteFile'],path,fileName);
	boxControl.appendTo(boxFile);
		 
	return boxFile;
};

/*file powerpoint*/
ciFileBrowser.filemanager.createFile.ppt = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.powerpoint(path, fileName);
};
ciFileBrowser.filemanager.createFile.pptx = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.powerpoint(path, fileName);
};
ciFileBrowser.filemanager.createFile.powerpoint = function(path, fileName){
	var base = ciFileBrowser.filemanager;
	var pathFile = "/" + path + fileName;

	var boxFile = $('<div class="box-file box-other">');
	$('<em class="other fa fa-file-powerpoint-o" >').attr({
		path : path,
		fileName : fileName,
		pathFile : pathFile,
	}).text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName)).appendTo(boxFile);
	
	return boxFile;
};


/*file excel*/
ciFileBrowser.filemanager.createFile.xls = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.excel(path, fileName);
};
ciFileBrowser.filemanager.createFile.xlsx = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.excel(path, fileName);
};
ciFileBrowser.filemanager.createFile.excel = function(path, fileName){
	var base = ciFileBrowser.filemanager;
	var pathFile = "/" + path + fileName;

	var boxFile = $('<div class="box-file box-other">');
	$('<em class="other fa fa-file-excel-o" >').attr({
		path : path,
		fileName : fileName,
		pathFile : pathFile,
	}).text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName)).appendTo(boxFile);
	
	return boxFile;
};

/*file video*/
ciFileBrowser.filemanager.createFile.webm = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.video(path, fileName);
};
ciFileBrowser.filemanager.createFile.mp4 = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.video(path, fileName);
};
ciFileBrowser.filemanager.createFile.flv = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.video(path, fileName);
};
ciFileBrowser.filemanager.createFile.video = function(path, fileName){
	var base = ciFileBrowser.filemanager;
	var pathFile = "/" + path + fileName;

	var boxFile = $('<div class="box-file box-other">');
	$('<em class="other fa fa-file-video-o" >').attr({
		path : path,
		fileName : fileName,
		pathFile : pathFile,
	}).text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName)).appendTo(boxFile);
	
	return boxFile;
};
/*file audio*/
ciFileBrowser.filemanager.createFile.mp3 = function(path, fileName){
	return ciFileBrowser.filemanager.createFile.audio(path, fileName);
};
ciFileBrowser.filemanager.createFile.audio = function(path, fileName){
	var base = ciFileBrowser.filemanager;
	var pathFile = "/" + path + fileName;

	var boxFile = $('<div class="box-file box-other">');
	$('<em class="other fa fa-file-audio-o" >').attr({
		path : path,
		fileName : fileName,
		pathFile : pathFile,
	}).text(ciFileBrowser.filemanager.createFile.formatDisplayedFileName(fileName)).appendTo(boxFile);
	
	return boxFile;
};
