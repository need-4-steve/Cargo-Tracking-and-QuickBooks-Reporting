<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Datatables States Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('datatables_state/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>User Id</th>
						<th>Name</th>
						<th>Timestamp</th>
						<th>State</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($datatables_states as $d){ ?>
                    <tr>
						<td><?php echo $d['id']; ?></td>
						<td><?php echo $d['user_id']; ?></td>
						<td><?php echo $d['name']; ?></td>
						<td><?php echo $d['timestamp']; ?></td>
						<td><?php echo $d['state']; ?></td>
						<td>
                            <a href="<?php echo site_url('datatables_state/edit/'.$d['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('datatables_state/remove/'.$d['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
