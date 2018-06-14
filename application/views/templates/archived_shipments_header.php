<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Libra Cargo Management</title>
	<link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/custom.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/datatables.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/editor.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/generator-base.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.3/css/fixedHeader.dataTables.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/v/bs4-4.0.0/jq-3.2.1/moment-2.18.1/jszip-2.5.0/pdfmake-0.1.32/dt-1.10.16/af-2.2.2/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/b-html5-1.5.1/b-print-1.5.1/cr-1.4.1/fc-3.2.4/fh-3.1.3/kt-2.3.2/r-2.2.1/rg-1.0.2/rr-1.2.3/sc-1.4.4/sl-1.2.5/datatables.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/dataTables.editor.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/editor.bootstrap4.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/fullcalendar.js"></script>
	<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/table.archived_shipments.js"></script>
	<script src="<?php echo base_url() ?>assets/js/gcal.js"></script>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="<?php echo base_url(); ?>assets/js/custom.js"></script>
	
		<!--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jqc-1.12.3/moment-2.18.1/jszip-2.5.0/pdfmake-0.1.32/dt-1.10.16/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/b-html5-1.5.1/b-print-1.5.1/fh-3.1.3/kt-2.3.2/sc-1.4.4/sl-1.2.5/datatables.min.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/dt.small.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/generator-base.css">
		<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/editor.dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/fullcalendar.css" />

		<script type="text/javascript" charset="utf-8" src="https://cdn.datatables.net/v/dt/jqc-1.12.3/moment-2.18.1/jszip-2.5.0/pdfmake-0.1.32/dt-1.10.16/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/b-html5-1.5.1/b-print-1.5.1/fh-3.1.3/kt-2.3.2/sc-1.4.4/sl-1.2.5/datatables.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/dataTables.editor.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/table.shipments.js"></script>
		<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>
		<script type="text/javascript" charset="utf-8" src="<?php echo base_url(); ?>assets/js/fullcalendar.js"></script>
		<script src="<?php echo base_url() ?>assets/js/gcal.js"></script>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
-->	<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body class="dataTables">
<div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
		<div class="container">
			<a class="navbar-brand" href="<?php echo base_url(); ?>">Libra Shipping Manager </a>
			<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarResponsive" style="">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="<?php echo base_url(); ?>">Home</a>
					</li>
					<li class="nav-item dropdown">
						<?php if(!$this->session->userdata('logged_in')) : ?>
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="userspace" aria-expanded="false">User Space
							<span class="caret"></span>
						</a>
						<div class="dropdown-menu" aria-labelledby="userspace">
							<a class="dropdown-item" href="<?php echo base_url(); ?>users/login">Login</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<?php echo base_url(); ?>users/register">Register</a>
						</div>
						<?php endif; ?>
						<?php if($this->session->userdata('logged_in')) : ?>
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="userspace" aria-expanded="false">
							<?php echo $this->session->userdata('username'); ?>
							<span class="caret"></span>
						</a>
						<div class="dropdown-menu" aria-labelledby="userspace">
							<a class="dropdown-item" href="<?php echo base_url(); ?>shipments/getcurrent">Get Active Shipments</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<?php echo base_url(); ?>shipments/index">Shipment History</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<?php echo base_url(); ?>calendar">Calendar</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="<?php echo base_url(); ?>users/logout">Logout</a>
						</div>
						<?php endif; ?>
					</li>
				</ul>
			</div>
		</div>
	</div>
			<div class="container">

		<div class="page-header" id="banner">
			<div class="row">
				<div class="col-lg-8 col-md-7 col-sm-6">
					<h1>Libra Cargo Management</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-5 col-sm-6">
					<!-- Flash messages -->
					<?php if($this->session->flashdata('user_registered')): ?>
					<div class="alert alert-dismissible alert-success">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<p class="alert alert-success">
							<?php echo $this->session->flashdata('user_registered'); ?>
						</p>
					</div>
					<?php endif; ?>

					<?php if($this->session->flashdata('login_failed')): ?>
					<div class="alert alert-dismissible alert-danger">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<p class="alert alert-danger">
							<?php echo $this->session->flashdata('login_failed'); ?>
						</p>
					</div>
					<?php endif; ?>

					<?php if($this->session->flashdata('user_loggedin')): ?>
					<div class="alert alert-dismissible alert-primary">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<p class="alert alert-primary">
							<?php echo $this->session->flashdata('user_loggedin'); ?>
						</p>
					</div>
					<?php endif; ?>

					<?php if($this->session->flashdata('user_loggedout')): ?>
					<div class="alert alert-dismissible alert-primary">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<p class="alert alert-primary">
							<?php echo $this->session->flashdata('user_loggedout'); ?>
						</p>
					</div>
					<?php endif; ?>

				</div>
			</div>
		</div>
		<div style="height:50px; width:100%; clear:both;"></div>
