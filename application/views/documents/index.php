<html>
<head>
	<title>Documents Manager</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/ciFileManager.css" />
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Ubuntu:300italic,400,400italic,700,700italic' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/ciFileBrowser.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/ciFileBrowser.filemanager.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/ciFileBrowser.filemanager.createFile.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/ciFileBrowser.filemanager.createControl.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/ciFileBrowser.input.listfiles.js"></script>
</head>

<body>
	<script>
		$(function () {
			ciFileBrowser.filemanager.create();
			html_board = $('#html_board');
			ciFileBrowser.input.listfiles.create({
				name: 'files',
				path: function () {
					return ciFileBrowser.filemanager.getCurrent();
				},
				btnSend: $('#btn_upload_files'),
				done: function () {
					ciFileBrowser.filemanager.loadFolder(ciFileBrowser.filemanager.getCurrent());
				}
			});
		});
	</script>
	<h3>File Manager</h3>
	<div id="html_map"></div>
	<div id="html_board">
		<div id="path_current"></div>
		<div id="path_content"></div>
	</div>
	<hr>
	<div id="file_uploads">
		<form enctype="multipart/form-data">
			<div class="box-input-list-files">
				<label>Upload file</label>

				<input type="file" name="files" id="files" multiple>

				<div class="bag-list-info-file" for="files"></div>

				<b class="btn" id="btn_upload_files">Upload files</b>

			</div>

		</form>

	</div>
	<div>
		<b class="btn" id="btn_create_forder" onclick="ciFileBrowser.filemanager.createFolderOnServer()">Create forder</b>
	</div>
</body>

</html>
