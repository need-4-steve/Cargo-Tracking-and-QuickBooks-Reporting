
<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Documents Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('documents/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>Shipment Id</th>
						<th>Filename</th>
						<th>Filepath</th>
						<th>Creation Timestamp</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($documents as $v){ ?>
                    <tr>
						<td><?php echo $v['id']; ?></td>
						<td><?php echo $v['shipment_id']; ?></td>
						<td><?php echo $v['filename']; ?></td>
						<td><?php echo $v['filepath']; ?></td>
						<td><?php echo $v['creation_timestamp']; ?></td>
						<td>
                            <a href="<?php echo site_url('documents/edit/'.$v['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('documents/remove/'.$v['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
