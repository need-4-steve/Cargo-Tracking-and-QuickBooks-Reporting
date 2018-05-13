
/*
 * Editor client script for DB table shipments
 * Created by http://editor.datatables.net/generator
 */

(function($){

$(document).ready(function() {
	var editor = new $.fn.dataTable.Editor( {
		ajax: 'php/table.shipments.php',
		table: '#shipments',
		fields: [
			{
				"label": "Status:",
				"name": "status"
			},
			{
				"label": "PO:",
				"name": "po"
			},
			{
				"label": "Prod:",
				"name": "prod"
			}
		]
	} );

	var table = $('#shipments').DataTable( {
		ajax: 'php/table.shipments.php',
		columns: [
			{
				"data": "status"
			},
			{
				"data": "po"
			},
			{
				"data": "prod"
			}
		],
		select: true,
		lengthChange: false
	} );

	new $.fn.dataTable.Buttons( table, [
		{ extend: "create", editor: editor },
		{ extend: "edit",   editor: editor },
		{ extend: "remove", editor: editor }
	] );

	table.buttons().container()
		.appendTo( $('.col-md-6:eq(0)', table.table().container() ) );
} );

}(jQuery));

