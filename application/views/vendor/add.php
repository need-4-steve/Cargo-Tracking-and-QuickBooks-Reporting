<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Vendor Add</h3>
            </div>
            <?php echo form_open('vendor/add'); ?>
          	<div class="box-body">
          		<div class="row clearfix">
					<div class="col-md-6">
						<label for="name" class="control-label">Name</label>
						<div class="form-group">
							<input type="text" name="name" value="<?php echo $this->input->post('name'); ?>" class="form-control" id="name" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="abbreviation" class="control-label">Abbreviation</label>
						<div class="form-group">
							<input type="text" name="abbreviation" value="<?php echo $this->input->post('abbreviation'); ?>" class="form-control" id="abbreviation" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="document_initials" class="control-label">Document Initials</label>
						<div class="form-group">
							<input type="text" name="document_initials" value="<?php echo $this->input->post('document_initials'); ?>" class="form-control" id="document_initials" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="email_addresses" class="control-label">Email Addresses</label>
						<div class="form-group">
							<textarea name="email_addresses" class="form-control" id="email_addresses"><?php echo $this->input->post('email_addresses'); ?></textarea>
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