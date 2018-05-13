<div class="bs-docs-section clearfix">
    <?php echo form_open('users/login'); ?>
        <div style="margin: auto;width: 50%;padding: 10px;">
            <div class="jumbotron" style="width: 63%;padding: 4rem 5rem;">
                <div class="row">
                    <h2 class="text-center" style="width: 100%;"><?php echo $title; ?></h2>
                </div>
                <div class="row">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="Enter Username" required autofocus>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Enter Password" required autofocus>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </div>
                </div>
                <div class="row">
                        <a style="padding-left: 25%; width: 100%;" href="<?php echo base_url(); ?>users/register">Register Here </a>
                </div>
            </div>
        </div>
<?php echo form_close(); ?>
</div>
