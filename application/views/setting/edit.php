<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Setting Edit</h3>
            </div>
			<?php echo form_open('setting/edit/'.$setting['id']); ?>
			<div class="box-body">
				<div class="row clearfix">
					<div class="col-md-6">
						<label for="theme_name" class="control-label">Theme Name</label>
						<div class="form-group">
							<input type="text" name="theme_name" value="<?php echo ($this->input->post('theme_name') ? $this->input->post('theme_name') : $setting['theme_name']); ?>" class="form-control" id="theme_name" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font" class="control-label">Table Header Font</label>
						<div class="form-group">
							<input type="text" name="table_header_font" value="<?php echo ($this->input->post('table_header_font') ? $this->input->post('table_header_font') : $setting['table_header_font']); ?>" class="form-control" id="table_header_font" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font_size" class="control-label">Table Header Font Size</label>
						<div class="form-group">
							<input type="text" name="table_header_font_size" value="<?php echo ($this->input->post('table_header_font_size') ? $this->input->post('table_header_font_size') : $setting['table_header_font_size']); ?>" class="form-control" id="table_header_font_size" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font_weight" class="control-label">Table Header Font Weight</label>
						<div class="form-group">
							<input type="text" name="table_header_font_weight" value="<?php echo ($this->input->post('table_header_font_weight') ? $this->input->post('table_header_font_weight') : $setting['table_header_font_weight']); ?>" class="form-control" id="table_header_font_weight" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font_color" class="control-label">Table Header Font Color</label>
						<div class="form-group">
							<input type="text" name="table_header_font_color" value="<?php echo ($this->input->post('table_header_font_color') ? $this->input->post('table_header_font_color') : $setting['table_header_font_color']); ?>" class="form-control" id="table_header_font_color" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_cell_font" class="control-label">Table Cell Font</label>
						<div class="form-group">
							<input type="text" name="table_cell_font" value="<?php echo ($this->input->post('table_cell_font') ? $this->input->post('table_cell_font') : $setting['table_cell_font']); ?>" class="form-control" id="table_cell_font" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_cell_font_size" class="control-label">Table Cell Font Size</label>
						<div class="form-group">
							<input type="text" name="table_cell_font_size" value="<?php echo ($this->input->post('table_cell_font_size') ? $this->input->post('table_cell_font_size') : $setting['table_cell_font_size']); ?>" class="form-control" id="table_cell_font_size" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_cell_font_color" class="control-label">Table Cell Font Color</label>
						<div class="form-group">
							<input type="text" name="table_cell_font_color" value="<?php echo ($this->input->post('table_cell_font_color') ? $this->input->post('table_cell_font_color') : $setting['table_cell_font_color']); ?>" class="form-control" id="table_cell_font_color" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_width" class="control-label">Table Width</label>
						<div class="form-group">
							<input type="text" name="table_width" value="<?php echo ($this->input->post('table_width') ? $this->input->post('table_width') : $setting['table_width']); ?>" class="form-control" id="table_width" />
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