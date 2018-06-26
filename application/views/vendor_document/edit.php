<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Vendor Document Edit</h3>
            </div>
			<?php echo form_open('vendor_document/edit/'.$vendor_document['id']); ?>
			<div class="box-body">
				<div class="row clearfix">
					<div class="col-md-6">
						<label for="vendor_id" class="control-label">Vendor</label>
						<div class="form-group">
							<select name="vendor_id" class="form-control">
								<option value="">select vendor</option>
								<?php 
								foreach($all_vendors as $vendor)
								{
									$selected = ($vendor['id'] == $vendor_document['vendor_id']) ? ' selected="selected"' : "";

									echo '<option value="'.$vendor['id'].'" '.$selected.'>'.$vendor['abbreviation'].'</option>';
								} 
								?>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<label for="shipment_id" class="control-label">Shipment</label>
						<div class="form-group">
							<select name="shipment_id" class="form-control">
								<option value="">select shipment</option>
								<?php 
								foreach($all_shipments as $shipment)
								{
									$selected = ($shipment['id'] == $vendor_document['shipment_id']) ? ' selected="selected"' : "";

									echo '<option value="'.$shipment['id'].'" '.$selected.'>'.$shipment['container_number'].'</option>';
								} 
								?>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<label for="document_type" class="control-label">Document Type</label>
						<div class="form-group">
							<input type="text" name="document_type" value="<?php echo ($this->input->post('document_type') ? $this->input->post('document_type') : $vendor_document['document_type']); ?>" class="form-control" id="document_type" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="po_number" class="control-label">Po Number</label>
						<div class="form-group">
							<input type="text" name="po_number" value="<?php echo ($this->input->post('po_number') ? $this->input->post('po_number') : $vendor_document['po_number']); ?>" class="form-control" id="po_number" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="filename" class="control-label">Filename</label>
						<div class="form-group">
							<input type="text" name="filename" value="<?php echo ($this->input->post('filename') ? $this->input->post('filename') : $vendor_document['filename']); ?>" class="form-control" id="filename" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="filepath" class="control-label">Filepath</label>
						<div class="form-group">
							<input type="text" name="filepath" value="<?php echo ($this->input->post('filepath') ? $this->input->post('filepath') : $vendor_document['filepath']); ?>" class="form-control" id="filepath" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="file_extension" class="control-label">File Extension</label>
						<div class="form-group">
							<input type="text" name="file_extension" value="<?php echo ($this->input->post('file_extension') ? $this->input->post('file_extension') : $vendor_document['file_extension']); ?>" class="form-control" id="file_extension" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="md5_hash" class="control-label">Md5 Hash</label>
						<div class="form-group">
							<input type="text" name="md5_hash" value="<?php echo ($this->input->post('md5_hash') ? $this->input->post('md5_hash') : $vendor_document['md5_hash']); ?>" class="form-control" id="md5_hash" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="identifying_label" class="control-label">Identifying Label</label>
						<div class="form-group">
							<input type="text" name="identifying_label" value="<?php echo ($this->input->post('identifying_label') ? $this->input->post('identifying_label') : $vendor_document['identifying_label']); ?>" class="form-control" id="identifying_label" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="creation_timestamp" class="control-label">Creation Timestamp</label>
						<div class="form-group">
							<input type="text" name="creation_timestamp" value="<?php echo ($this->input->post('creation_timestamp') ? $this->input->post('creation_timestamp') : $vendor_document['creation_timestamp']); ?>" class="form-control" id="creation_timestamp" />
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