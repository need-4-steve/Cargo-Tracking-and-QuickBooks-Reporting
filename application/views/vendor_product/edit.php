<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Vendor Product Edit</h3>
            </div>
			<?php echo form_open('vendor_product/edit/'.$vendor_product['id']); ?>
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
									$selected = ($vendor['id'] == $vendor_product['vendor_id']) ? ' selected="selected"' : "";

									echo '<option value="'.$vendor['id'].'" '.$selected.'>'.$vendor['abbreviation'].'</option>';
								} 
								?>
							</select>
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
									$selected = ($product['id'] == $vendor_product['product_id']) ? ' selected="selected"' : "";

									echo '<option value="'.$product['id'].'" '.$selected.'>'.$product['product_name'].'</option>';
								} 
								?>
							</select>
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