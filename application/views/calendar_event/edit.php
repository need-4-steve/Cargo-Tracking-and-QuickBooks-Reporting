<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Calendar Event Edit</h3>
            </div>
			<?php echo form_open('calendar_event/edit/'.$calendar_event['ID']); ?>
			<div class="box-body">
				<div class="row clearfix">
					<div class="col-md-6">
						<label for="shipment_id" class="control-label">Shipment</label>
						<div class="form-group">
							<select name="shipment_id" class="form-control">
								<option value="">select shipment</option>
								<?php 
								foreach($all_shipments as $shipment)
								{
									$selected = ($shipment['id'] == $calendar_event['shipment_id']) ? ' selected="selected"' : "";

									echo '<option value="'.$shipment['id'].'" '.$selected.'>'.$shipment['container_number'].'</option>';
								} 
								?>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<label for="md5_container_number_and_date" class="control-label">Md5 Container Number And Date</label>
						<div class="form-group">
							<input type="text" name="md5_container_number_and_date" value="<?php echo ($this->input->post('md5_container_number_and_date') ? $this->input->post('md5_container_number_and_date') : $calendar_event['md5_container_number_and_date']); ?>" class="form-control" id="md5_container_number_and_date" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="title" class="control-label">Title</label>
						<div class="form-group">
							<input type="text" name="title" value="<?php echo ($this->input->post('title') ? $this->input->post('title') : $calendar_event['title']); ?>" class="form-control" id="title" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="event_type" class="control-label">Event Type</label>
						<div class="form-group">
							<input type="text" name="event_type" value="<?php echo ($this->input->post('event_type') ? $this->input->post('event_type') : $calendar_event['event_type']); ?>" class="form-control" id="event_type" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="start" class="control-label">Start</label>
						<div class="form-group">
							<input type="text" name="start" value="<?php echo ($this->input->post('start') ? $this->input->post('start') : $calendar_event['start']); ?>" class="has-datetimepicker form-control" id="start" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="end" class="control-label">End</label>
						<div class="form-group">
							<input type="text" name="end" value="<?php echo ($this->input->post('end') ? $this->input->post('end') : $calendar_event['end']); ?>" class="has-datetimepicker form-control" id="end" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="description" class="control-label">Description</label>
						<div class="form-group">
							<input type="text" name="description" value="<?php echo ($this->input->post('description') ? $this->input->post('description') : $calendar_event['description']); ?>" class="form-control" id="description" />
						</div>
					</div>
				</div>
			</div>
			<div class="box-footer">
            	<button type="submit" class="btn btn-success">
					<i class="fa fa-check"></i> Save
				</button>
	        </div>				
			<?php echo form_close(); ?>
		</div>
    </div>
</div>