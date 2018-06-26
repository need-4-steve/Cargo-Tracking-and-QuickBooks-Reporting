<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Archived Shipment Add</h3>
            </div>
            <?php echo form_open('archived_shipment/add'); ?>
          	<div class="box-body">
          		<div class="row clearfix">
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="freight" value="1"  id="freight" />
							<label for="freight" class="control-label">Freight</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="isf_required" value="1"  id="isf_required" />
							<label for="isf_required" class="control-label">Isf Required</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="customs" value="1"  id="customs" />
							<label for="customs" class="control-label">Customs</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="is_complete" value="1"  id="is_complete" />
							<label for="is_complete" class="control-label">Is Complete</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="po_boolean" value="1"  id="po_boolean" />
							<label for="po_boolean" class="control-label">Po Boolean</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="qb_rt" value="1"  id="qb_rt" />
							<label for="qb_rt" class="control-label">Qb Rt</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="qb_ws" value="1"  id="qb_ws" />
							<label for="qb_ws" class="control-label">Qb Ws</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="is_active" value="1"  id="is_active" />
							<label for="is_active" class="control-label">Is Active</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="requires_payment" value="1"  id="requires_payment" />
							<label for="requires_payment" class="control-label">Requires Payment</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="do" value="1"  id="do" />
							<label for="do" class="control-label">Do</label>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="checkbox" name="has_documents" value="1"  id="has_documents" />
							<label for="has_documents" class="control-label">Has Documents</label>
						</div>
					</div>
					<div class="col-md-6">
						<label for="product_id" class="control-label">Product</label>
						<div class="form-group">
							<select name="product_id" class="form-control">
								<option value="">select product</option>
								<?php 
								foreach($all_products as $product)
								{
									$selected = ($product['id'] == $this->input->post('product_id')) ? ' selected="selected"' : "";

									echo '<option value="'.$product['id'].'" '.$selected.'>'.$product['product_name'].'</option>';
								} 
								?>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<label for="vendor_id" class="control-label">Vendor</label>
						<div class="form-group">
							<select name="vendor_id" class="form-control">
								<option value="">select vendor</option>
								<?php 
								foreach($all_vendors as $vendor)
								{
									$selected = ($vendor['id'] == $this->input->post('vendor_id')) ? ' selected="selected"' : "";

									echo '<option value="'.$vendor['id'].'" '.$selected.'>'.$vendor['abbreviation'].'</option>';
								} 
								?>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<label for="trucker_id" class="control-label">Trucker</label>
						<div class="form-group">
							<select name="trucker_id" class="form-control">
								<option value="">select trucker</option>
								<?php 
								foreach($all_truckers as $trucker)
								{
									$selected = ($trucker['id'] == $this->input->post('trucker_id')) ? ' selected="selected"' : "";

									echo '<option value="'.$trucker['id'].'" '.$selected.'>'.$trucker['trucker_name'].'</option>';
								} 
								?>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<label for="po" class="control-label">Po</label>
						<div class="form-group">
							<input type="text" name="po" value="<?php echo $this->input->post('po'); ?>" class="form-control" id="po" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="container_number" class="control-label">Container Number</label>
						<div class="form-group">
							<input type="text" name="container_number" value="<?php echo $this->input->post('container_number'); ?>" class="form-control" id="container_number" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="bill_of_lading" class="control-label">Bill Of Lading</label>
						<div class="form-group">
							<input type="text" name="bill_of_lading" value="<?php echo $this->input->post('bill_of_lading'); ?>" class="form-control" id="bill_of_lading" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="discharge_port" class="control-label">Discharge Port</label>
						<div class="form-group">
							<input type="text" name="discharge_port" value="<?php echo $this->input->post('discharge_port'); ?>" class="form-control" id="discharge_port" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="final_destination" class="control-label">Final Destination</label>
						<div class="form-group">
							<input type="text" name="final_destination" value="<?php echo $this->input->post('final_destination'); ?>" class="form-control" id="final_destination" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="eta" class="control-label">Eta</label>
						<div class="form-group">
							<input type="text" name="eta" value="<?php echo $this->input->post('eta'); ?>" class="has-datepicker form-control" id="eta" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="lfd" class="control-label">Lfd</label>
						<div class="form-group">
							<input type="text" name="lfd" value="<?php echo $this->input->post('lfd'); ?>" class="has-datepicker form-control" id="lfd" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="pickup_number" class="control-label">Pickup Number</label>
						<div class="form-group">
							<input type="text" name="pickup_number" value="<?php echo $this->input->post('pickup_number'); ?>" class="form-control" id="pickup_number" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="truck_date" class="control-label">Truck Date</label>
						<div class="form-group">
							<input type="text" name="truck_date" value="<?php echo $this->input->post('truck_date'); ?>" class="has-datetimepicker form-control" id="truck_date" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="bl_status" class="control-label">Bl Status</label>
						<div class="form-group">
							<input type="text" name="bl_status" value="<?php echo $this->input->post('bl_status'); ?>" class="form-control" id="bl_status" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="latest_event_time_and_date" class="control-label">Latest Event Time And Date</label>
						<div class="form-group">
							<input type="text" name="latest_event_time_and_date" value="<?php echo $this->input->post('latest_event_time_and_date'); ?>" class="has-datetimepicker form-control" id="latest_event_time_and_date" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="last_update" class="control-label">Last Update</label>
						<div class="form-group">
							<input type="text" name="last_update" value="<?php echo $this->input->post('last_update'); ?>" class="form-control" id="last_update" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="container_size" class="control-label">Container Size</label>
						<div class="form-group">
							<input type="text" name="container_size" value="<?php echo $this->input->post('container_size'); ?>" class="form-control" id="container_size" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="vendor_identifier" class="control-label">Vendor Identifier</label>
						<div class="form-group">
							<input type="text" name="vendor_identifier" value="<?php echo $this->input->post('vendor_identifier'); ?>" class="form-control" id="vendor_identifier" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="status" class="control-label">Status</label>
						<div class="form-group">
							<textarea name="status" class="form-control" id="status"><?php echo $this->input->post('status'); ?></textarea>
						</div>
					</div>
					<div class="col-md-6">
						<label for="latest_event" class="control-label">Latest Event</label>
						<div class="form-group">
							<textarea name="latest_event" class="form-control" id="latest_event"><?php echo $this->input->post('latest_event'); ?></textarea>
						</div>
					</div>
					<div class="col-md-6">
						<label for="container_notes" class="control-label">Container Notes</label>
						<div class="form-group">
							<textarea name="container_notes" class="form-control" id="container_notes"><?php echo $this->input->post('container_notes'); ?></textarea>
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