<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Calendar Events Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('calendar_event/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>Shipment Id</th>
						<th>Md5 Container Number And Date</th>
						<th>Title</th>
						<th>Event Type</th>
						<th>Start</th>
						<th>End</th>
						<th>Description</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($calendar_events as $c){ ?>
                    <tr>
						<td><?php echo $c['ID']; ?></td>
						<td><?php echo $c['shipment_id']; ?></td>
						<td><?php echo $c['md5_container_number_and_date']; ?></td>
						<td><?php echo $c['title']; ?></td>
						<td><?php echo $c['event_type']; ?></td>
						<td><?php echo $c['start']; ?></td>
						<td><?php echo $c['end']; ?></td>
						<td><?php echo $c['description']; ?></td>
						<td>
                            <a href="<?php echo site_url('calendar_event/edit/'.$c['ID']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('calendar_event/remove/'.$c['ID']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
