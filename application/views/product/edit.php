<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Product Edit</h3>
            </div>
			<?php echo form_open('product/edit/'.$product['id']); ?>
			<div class="box-body">
				<div class="row clearfix">
					<div class="col-md-6">
						<label for="product_name" class="control-label">Product Name</label>
						<div class="form-group">
							<input type="text" name="product_name" value="<?php echo ($this->input->post('product_name') ? $this->input->post('product_name') : $product['product_name']); ?>" class="form-control" id="product_name" />
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