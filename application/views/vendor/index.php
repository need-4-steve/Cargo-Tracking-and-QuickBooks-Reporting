<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Vendors Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('vendor/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>Name</th>
						<th>Abbreviation</th>
						<th>Document Initials</th>
						<th>Email Addresses</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($vendors as $v){ ?>
                    <tr>
						<td><?php echo $v['id']; ?></td>
						<td><?php echo $v['name']; ?></td>
						<td><?php echo $v['abbreviation']; ?></td>
						<td><?php echo $v['document_initials']; ?></td>
						<td><?php echo $v['email_addresses']; ?></td>
						<td>
                            <a href="<?php echo site_url('vendor/edit/'.$v['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('vendor/remove/'.$v['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
