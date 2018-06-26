<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Vendor Documents Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('vendor_document/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>Vendor Id</th>
						<th>Shipment Id</th>
						<th>Document Type</th>
						<th>Po Number</th>
						<th>Filename</th>
						<th>Filepath</th>
						<th>File Extension</th>
						<th>Md5 Hash</th>
						<th>Identifying Label</th>
						<th>Creation Timestamp</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($vendor_documents as $v){ ?>
                    <tr>
						<td><?php echo $v['id']; ?></td>
						<td><?php echo $v['vendor_id']; ?></td>
						<td><?php echo $v['shipment_id']; ?></td>
						<td><?php echo $v['document_type']; ?></td>
						<td><?php echo $v['po_number']; ?></td>
						<td><?php echo $v['filename']; ?></td>
						<td><?php echo $v['filepath']; ?></td>
						<td><?php echo $v['file_extension']; ?></td>
						<td><?php echo $v['md5_hash']; ?></td>
						<td><?php echo $v['identifying_label']; ?></td>
						<td><?php echo $v['creation_timestamp']; ?></td>
						<td>
                            <a href="<?php echo site_url('vendor_document/edit/'.$v['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('vendor_document/remove/'.$v['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
