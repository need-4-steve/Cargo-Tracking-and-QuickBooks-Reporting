<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Update Event Add</h3>
            </div>
            <?php echo form_open('update_event/add'); ?>
          	<div class="box-body">
          		<div class="row clearfix">
					<div class="col-md-6">
						<label for="time_and_date" class="control-label">Time And Date</label>
						<div class="form-group">
							<input type="text" name="time_and_date" value="<?php echo $this->input->post('time_and_date'); ?>" class="has-datetimepicker form-control" id="time_and_date" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="container_number" class="control-label">Container Number</label>
						<div class="form-group">
							<input type="text" name="container_number" value="<?php echo $this->input->post('container_number'); ?>" class="form-control" id="container_number" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="content" class="control-label">Content</label>
						<div class="form-group">
							<textarea name="content" class="form-control" id="content"><?php echo $this->input->post('content'); ?></textarea>
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