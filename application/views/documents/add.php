<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Document Add</h3>
            </div>
            <?php echo form_open('documents/add'); ?>
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
						<label for="filename" class="control-label">Filename</label>
						<div class="form-group">
							<input type="text" name="filename" value="<?php echo $this->input->post('filename'); ?>" class="form-control" id="filename" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="filepath" class="control-label">Filepath</label>
						<div class="form-group">
							<input type="text" name="filepath" value="<?php echo $this->input->post('filepath'); ?>" class="form-control" id="filepath" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="creation_timestamp" class="control-label">Creation Timestamp</label>
						<div class="form-group">
							<input type="text" name="creation_timestamp" value="<?php echo $this->input->post('creation_timestamp'); ?>" class="form-control" id="creation_timestamp" />
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