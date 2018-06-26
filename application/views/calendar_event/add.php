<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Calendar Event Add</h3>
            </div>
            <?php echo form_open('calendar_event/add'); ?>
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
									$selected = ($shipment['id'] == $this->input->post('shipment_id')) ? ' selected="selected"' : "";

									echo '<option value="'.$shipment['id'].'" '.$selected.'>'.$shipment['container_number'].'</option>';
								} 
								?>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<label for="md5_container_number_and_date" class="control-label">Md5 Container Number And Date</label>
						<div class="form-group">
							<input type="text" name="md5_container_number_and_date" value="<?php echo $this->input->post('md5_container_number_and_date'); ?>" class="form-control" id="md5_container_number_and_date" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="title" class="control-label">Title</label>
						<div class="form-group">
							<input type="text" name="title" value="<?php echo $this->input->post('title'); ?>" class="form-control" id="title" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="event_type" class="control-label">Event Type</label>
						<div class="form-group">
							<input type="text" name="event_type" value="<?php echo $this->input->post('event_type'); ?>" class="form-control" id="event_type" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="start" class="control-label">Start</label>
						<div class="form-group">
							<input type="text" name="start" value="<?php echo $this->input->post('start'); ?>" class="has-datetimepicker form-control" id="start" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="end" class="control-label">End</label>
						<div class="form-group">
							<input type="text" name="end" value="<?php echo $this->input->post('end'); ?>" class="has-datetimepicker form-control" id="end" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="description" class="control-label">Description</label>
						<div class="form-group">
							<input type="text" name="description" value="<?php echo $this->input->post('description'); ?>" class="form-control" id="description" />
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