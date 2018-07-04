<div class="row">
    <div class="col-md-12">
      	<div class="box box-info">
            <div class="box-header with-border">
              	<h3 class="box-title">Setting Add</h3>
            </div>
            <?php echo form_open('setting/add'); ?>
          	<div class="box-body">
          		<div class="row clearfix">
					<div class="col-md-6">
						<label for="theme_name" class="control-label">Theme Name</label>
						<div class="form-group">
							<input type="text" name="theme_name" value="<?php echo $this->input->post('theme_name'); ?>" class="form-control" id="theme_name" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font" class="control-label">Table Header Font</label>
						<div class="form-group">
							<p id="header_font_example">Example Header Font</p>
							
							<input type="text" name="table_header_font" value="<?php echo $this->input->post('table_header_font'); ?>" class="form-control" id="table_header_font" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font_size" class="control-label">Table Header Font Size</label>
						<div class="form-group">
							<span id="header_font_size">Header Font Size Preview</span>
							<input id="table_header_font_size" name="table_header_font_size" value="<?php echo $this->input->post('table_cell_font_size'); ?>">
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font_weight" class="control-label">Table Header Font Weight</label>
						<div class="form-group">
							<input type="range" min="100" max="900" value="<?php echo $this->input->post('table_header_font_weight'); ?>" class="slider" id="table_header_font_weight" name="table_header_font_weight">
							<p>Value: <span id="table_header_font_weight_value"></span></p>
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_header_font_color" class="control-label">Table Header Font Color</label>
						<div class="form-group">
							<input type="text" name="table_header_font_color" id="table_header_font_color" class="form-control" data-format="rgb" data-opacity=".5" value="<?php echo $this->input->post('table_header_font_color'); ?>">
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_cell_font" class="control-label">Table Cell Font</label>
						<div class="form-group">
							<p id="table_cell_font_example">Example Table Cell Font</p>
							<input type="text" name="table_cell_font" value="<?php echo $this->input->post('table_cell_font'); ?>" class="form-control" id="table_cell_font" />
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_cell_font_size" class="control-label">Table Cell Font Size</label>
						<div class="form-group">
							<span id="cell_font_size">Cell Font Size Preview</span>
							<p>
							<input id="table_cell_font_size" name="table_cell_font_size" value="<?php echo $this->input->post('table_cell_font_size'); ?>" >
							</p>
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_cell_font_color" class="control-label">Table Cell Font Color</label>
						<div class="form-group">
							<!-- RGB(A) -->
							<h3>RGB(A)</h3>
							<input type="text" name="table_cell_font_color" id="table_cell_font_color" class="form-control" data-format="rgb" data-opacity=".5" value="<?php echo $this->input->post('table_cell_font_color'); ?>">
						</div>
					</div>
					<div class="col-md-6">
						<label for="table_width" class="control-label">Table Width</label>
						<div class="form-group">
							<div class="slidecontainer">
							  <input type="range" min="1" max="100" value="<?php echo $this->input->post('table_width'); ?>" class="slider" id="table_width" name="table_width">
							  <p>Value: <span id="table_width_value"></span></p>
							</div>
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

<script>
/*table_header_font_weight_value*/
var slider = document.getElementById("table_width");
var output = document.getElementById("table_width_value");
var slider2 = document.getElementById("table_header_font_weight");
var output2 = document.getElementById("table_header_font_weight_value");
output.innerHTML = slider.value;
slider.oninput = function() {
  output.innerHTML = this.value;
}

output2.innerHTML = slider2.value;
slider2.oninput = function() {
  output2.innerHTML = this.value;
}
</script>