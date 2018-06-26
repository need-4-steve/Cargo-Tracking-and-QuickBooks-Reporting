<div class="row">
    <div class="col-md-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Archived Shipments Listing</h3>
            	<div class="box-tools">
                    <a href="<?php echo site_url('archived_shipment/add'); ?>" class="btn btn-success btn-sm">Add</a> 
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
						<th>Status</th>
						<th>Latest Event</th>
						<th>Container Notes</th>
						<th>Actions</th>
                    </tr>
                    <?php foreach($archived_shipments as $a){ ?>
                    <tr>
						<td><?php echo $a['id']; ?></td>
						<td><?php echo $a['freight']; ?></td>
						<td><?php echo $a['isf_required']; ?></td>
						<td><?php echo $a['customs']; ?></td>
						<td><?php echo $a['is_complete']; ?></td>
						<td><?php echo $a['po_boolean']; ?></td>
						<td><?php echo $a['qb_rt']; ?></td>
						<td><?php echo $a['qb_ws']; ?></td>
						<td><?php echo $a['is_active']; ?></td>
						<td><?php echo $a['requires_payment']; ?></td>
						<td><?php echo $a['do']; ?></td>
						<td><?php echo $a['has_documents']; ?></td>
						<td><?php echo $a['product_id']; ?></td>
						<td><?php echo $a['vendor_id']; ?></td>
						<td><?php echo $a['trucker_id']; ?></td>
						<td><?php echo $a['po']; ?></td>
						<td><?php echo $a['container_number']; ?></td>
						<td><?php echo $a['bill_of_lading']; ?></td>
						<td><?php echo $a['discharge_port']; ?></td>
						<td><?php echo $a['final_destination']; ?></td>
						<td><?php echo $a['eta']; ?></td>
						<td><?php echo $a['lfd']; ?></td>
						<td><?php echo $a['pickup_number']; ?></td>
						<td><?php echo $a['truck_date']; ?></td>
						<td><?php echo $a['bl_status']; ?></td>
						<td><?php echo $a['latest_event_time_and_date']; ?></td>
						<td><?php echo $a['last_update']; ?></td>
						<td><?php echo $a['container_size']; ?></td>
						<td><?php echo $a['vendor_identifier']; ?></td>
						<td><?php echo $a['status']; ?></td>
						<td><?php echo $a['latest_event']; ?></td>
						<td><?php echo $a['container_notes']; ?></td>
						<td>
                            <a href="<?php echo site_url('archived_shipment/edit/'.$a['id']); ?>" class="btn btn-info btn-xs"><span class="fa fa-pencil"></span> Edit</a> 
                            <a href="<?php echo site_url('archived_shipment/remove/'.$a['id']); ?>" class="btn btn-danger btn-xs"><span class="fa fa-trash"></span> Delete</a>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                <div class="pull-right">
                    <?php echo $this->pagination->create_links(); ?>                    
                </div>                
            </div>
        </div>
    </div>
</div>
