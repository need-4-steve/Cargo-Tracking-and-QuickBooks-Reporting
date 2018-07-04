<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Settings Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('setting/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>Theme Name</th>
						<th>Table Header Font</th>
						<th>Table Header Font Size</th>
						<th>Table Header Font Weight</th>
						<th>Table Header Font Color</th>
						<th>Table Cell Font</th>
						<th>Table Cell Font Size</th>
						<th>Table Cell Font Color</th>
						<th>Table Width</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($settings as $s){ ?>
                    <tr>
						<td><?php echo $s['id']; ?></td>
						<td><?php echo $s['theme_name']; ?></td>
						<td><?php echo $s['table_header_font']; ?></td>
						<td><?php echo $s['table_header_font_size']; ?></td>
						<td><?php echo $s['table_header_font_weight']; ?></td>
						<td><?php echo $s['table_header_font_color']; ?></td>
						<td><?php echo $s['table_cell_font']; ?></td>
						<td><?php echo $s['table_cell_font_size']; ?></td>
						<td><?php echo $s['table_cell_font_color']; ?></td>
						<td><?php echo $s['table_width']; ?></td>
						<td>
                            <a href="<?php echo site_url('setting/edit/'.$s['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('setting/remove/'.$s['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
