<div class="container">
	<div class="row">
		<div class="col-md-12">

			<h1>Calendar</h1>

			<div id="calendar">

			</div>

		</div>
	</div>
</div>

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Add Calendar Event</h4>
			</div>
			<div class="modal-body">
				<?php echo form_open(site_url("calendar/add_event"), array("class" => "form-horizontal")) ?>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Event Title</label>
					<div class="col-md-8 ui-front">
						<input type="text" class="form-control" name="title" value="">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Event Type</label>
					<div class="col-md-8 ui-front">
						<input type="text" class="form-control" name="event_type">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Description</label>
					<div class="col-md-8 ui-front">
						<input type="text" class="form-control" name="description">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Start Date</label>
					<div class="col-md-8">
						<input type="datetime" class="form-control" name="start_date">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">End Date</label>
					<div class="col-md-8">
						<input type="datetime" class="form-control" name="end_date">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<input type="submit" class="btn btn-primary" value="Add Event">
				<?php echo form_close() ?>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Update Calendar Event</h4>
			</div>
			<div class="modal-body">
				<?php echo form_open(site_url("calendar/edit_event"), array("class" => "form-horizontal")) ?>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Event Title</label>
					<div class="col-md-8 ui-front">
						<input type="text" class="form-control" name="title" value="" id="title">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Event Type</label>
					<div class="col-md-8 ui-front">
						<input type="text" class="form-control" name="event_type" value="" id="event_type">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Description</label>
					<div class="col-md-8 ui-front">
						<input type="text" class="form-control" name="description" id="description">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Start Date</label>
					<div class="col-md-8">
						<input type="datetime" class="form-control" name="start_date" id="start_date">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">End Date</label>
					<div class="col-md-8">
						<input type="datetime" class="form-control" name="end_date" id="end_date">
					</div>
				</div>
				<div class="form-group">
					<label for="p-in" class="col-md-4 label-heading">Delete Event</label>
					<div class="col-md-8">
						<input type="checkbox" name="delete" value="1">
					</div>
				</div>
				<input type="hidden" name="eventid" id="event_id" value="0" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<input type="submit" class="btn btn-primary" value="Update Event">
				<?php echo form_close() ?>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function () {

		var date_last_clicked = null;

		$('#calendar').fullCalendar({
			eventSources: [{
				events: function (start, end, timezone, callback) {
					$.ajax({
						url: '<?php echo base_url() ?>calendar/get_events',
						dataType: 'json',
						data: {
							// our hypothetical feed requires UNIX timestamps
							start: start.unix(),
							end: end.unix()
						},
						success: function (msg) {
							var events = msg.events;
							callback(events);
						}
					});
				}
			}, ],
			eventRender: function(event, element) {
				element.find('.fc-title').html("<b>"+event.event_type+"</b><hr/> "+event.title); 
				element.css('display', 'block');
				element.css('text-align', 'center');
                if(event.event_type == "ETA") {
					/*DARKER RED
						background-color: #f2dede;
						border-color: #ebcccc;
						color: #a94442;*/
					/*RED
						color: #D14;
						background-color: #fcf6f8;
						border-color: #f7d6df;
					/*PINK
						color: #d119cf;
						background-color: #faebfa;
						border: 1px solid #f3aef2;
					*/
                    element.css('color', '#D14');
					element.css('background-color', '#fcf6f8');
                    element.css('border-color', '#f7d6df');
                } else if (event.event_type=='LFD'){
					/*BLUES
						background-color: #d9edf7;
						border-color: #bcdff1;
						color: #31708f;
					*/
					/* PURPLE
						color: #ad1ee8;
						background-color: #f9f1fc;
						border: 1px solid #ebc9f7;
					*/
					/* YELLOW
						color: #c29f00;
						background-color: #fff9d7;
						border: 1px solid #ffe700;
					*/
                    element.css('color', '#c29f00');
					element.css('background-color', '#fff9d7');
                    element.css('border-color', '#ffe700');
				} else if (event.event_type='N/A') {
					/*color: #c29f00;
					background-color: #fff9d7;
					border-color: #ffe700;*/
                    element.css('color', '#2a839e');
					element.css('background-color', '#f5fafb');
                    element.css('border-color', '#a8ddec');
				} else {
					/*color: #2a839e;
					background-color: #f5fafb;
					border: 1px solid #a8ddec;*/
                    element.css('color', '#c29f00');
					element.css('background-color', '#fff9d7');
                    element.css('border-color', '#ffe700');
				}
			},
			dayRender: function(date, cell){
				if (moment(date).format('YYYY/MM/DD HH:mm') < moment().subtract(1,'days').format('YYYY/MM/DD HH:mm')){
					$(cell).addClass('disabled');
				}
			},
			dayClick: function (date, jsEvent, view) {
				date_last_clicked = $(this);
				$(this).css('background-color', '#bed7f3');
				$('#addModal').modal();
			},
			eventClick: function (event, jsEvent, view) {
				$('#title').val(event.title);
				$('#description').val(event.description);
				$('#event_type').val(event.event_type);
				$('#start_date').val(moment(event.start).format('YYYY/MM/DD HH:mm'));
				if (event.end) {
					$('#end_date').val(moment(event.end).format('YYYY/MM/DD HH:mm'));
				} else {
					$('#end_date').val(moment(event.start).format('YYYY/MM/DD HH:mm'));
				}
				$('#event_id').val(event.id);
				$('#editModal').modal();
			},
		});
		
	});

</script>
