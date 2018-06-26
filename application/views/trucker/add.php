<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Trucker Add</h3>
            </div>
            <?php echo form_open('trucker/add'); ?>
          	<div class="box-body">
          		<div class="row clearfix">
					<div class="col-md-6">
						<label for="trucker_name" class="control-label">Trucker Name</label>
						<div class="form-group">
							<input type="text" name="trucker_name" value="<?php echo $this->input->post('trucker_name'); ?>" class="form-control" id="trucker_name" />
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