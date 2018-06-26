<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Update Events Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('update_event/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>Time And Date</th>
						<th>Container Number</th>
						<th>Content</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($update_events as $u){ ?>
                    <tr>
						<td><?php echo $u['id']; ?></td>
						<td><?php echo $u['time_and_date']; ?></td>
						<td><?php echo $u['container_number']; ?></td>
						<td><?php echo $u['content']; ?></td>
						<td>
                            <a href="<?php echo site_url('update_event/edit/'.$u['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('update_event/remove/'.$u['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
