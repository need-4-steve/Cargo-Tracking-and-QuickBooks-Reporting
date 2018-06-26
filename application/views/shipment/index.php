<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Shipments Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('shipment/add'); ?>" class="btn btn-success btn-sm">Add</a> 
                </div>
            </div>
            <div class="box-body">
                <table class="table table-striped">
                    <tr>
						<th>ID</th>
						<th>Freight</th>
						<th>Isf Required</th>
						<th>Customs</th>
						<th>Is Complete</th>
						<th>Po Boolean</th>
						<th>Qb Rt</th>
						<th>Qb Ws</th>
						<th>Is Active</th>
						<th>Requires Payment</th>
						<th>Do</th>
						<th>Has Documents</th>
						<th>Product Id</th>
						<th>Vendor Id</th>
						<th>Trucker Id</th>
						<th>Status</th>
						<th>Po</th>
						<th>Container Number</th>
						<th>Bill Of Lading</th>
						<th>Discharge Port</th>
						<th>Final Destination</th>
						<th>Eta</th>
						<th>Lfd</th>
						<th>Pickup Number</th>
						<th>Truck Date</th>
						<th>Bl Status</th>
						<th>Latest Event Time And Date</th>
						<th>Last Update</th>
						<th>Container Size</th>
						<th>Vendor Identifier</th>
						<th>Latest Event</th>
						<th>Container Notes</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($shipments as $s){ ?>
                    <tr>
						<td><?php echo $s['id']; ?></td>
						<td><?php echo $s['freight']; ?></td>
						<td><?php echo $s['isf_required']; ?></td>
						<td><?php echo $s['customs']; ?></td>
						<td><?php echo $s['is_complete']; ?></td>
						<td><?php echo $s['po_boolean']; ?></td>
						<td><?php echo $s['qb_rt']; ?></td>
						<td><?php echo $s['qb_ws']; ?></td>
						<td><?php echo $s['is_active']; ?></td>
						<td><?php echo $s['requires_payment']; ?></td>
						<td><?php echo $s['do']; ?></td>
						<td><?php echo $s['has_documents']; ?></td>
						<td><?php echo $s['product_id']; ?></td>
						<td><?php echo $s['vendor_id']; ?></td>
						<td><?php echo $s['trucker_id']; ?></td>
						<td><?php echo $s['status']; ?></td>
						<td><?php echo $s['po']; ?></td>
						<td><?php echo $s['container_number']; ?></td>
						<td><?php echo $s['bill_of_lading']; ?></td>
						<td><?php echo $s['discharge_port']; ?></td>
						<td><?php echo $s['final_destination']; ?></td>
						<td><?php echo $s['eta']; ?></td>
						<td><?php echo $s['lfd']; ?></td>
						<td><?php echo $s['pickup_number']; ?></td>
						<td><?php echo $s['truck_date']; ?></td>
						<td><?php echo $s['bl_status']; ?></td>
						<td><?php echo $s['latest_event_time_and_date']; ?></td>
						<td><?php echo $s['last_update']; ?></td>
						<td><?php echo $s['container_size']; ?></td>
						<td><?php echo $s['vendor_identifier']; ?></td>
						<td><?php echo $s['latest_event']; ?></td>
						<td><?php echo $s['container_notes']; ?></td>
						<td>
                            <a href="<?php echo site_url('shipment/edit/'.$s['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('shipment/remove/'.$s['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                                
            </div>
        </div>
    </div>
</div>
