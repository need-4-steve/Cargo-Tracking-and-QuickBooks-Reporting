<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
/*$route['containers/index.php'] = 'containers/index';
$route['index.php'] = 'containers/index';
$route['containers'] = 'containers/index';
$route['containers/index'] = 'containers/index';
$route['containers/index'] = 'containers/index';
$route['ajax/containers'] = 'ajax/containers';
$route['containers/remove/(:any)'] = 'containers/delete_record/$1';
$route['containers/update/(:any)'] = 'containers/update_record/$1';
$route['containers/ajax_edit/(:any)'] = 'containers/ajax_edit/$1';
$route['containers/create'] = 'containers/create';
$route['containers/billoflading/(:any)'] = 'containers/viewbybol/$1';
$route['containers/getcurrent'] = 'containers/getcurrent';
$route['containers/viewall'] = 'containers/viewall';
$route['containers/daterange/(:any)/(:any)'] = 'containers/viewbydate/$1/$2';
$route['containers/(:any)'] = 'containers/view/$1';
$route['containers/edit/(:any)'] = 'containers/edit/$1';*/
$route['default_controller'] = 'Shipments/getcurrent';
$route['dashboard'] = 'dashboard/index';
$route['dashboard/index'] = 'dashboard/index';
$route['administration'] = 'dashboard/index';
$route['index'] = 'Shipments/getcurrent';
$route['index.php'] = 'Shipments/getcurrent';
$route['Shipments'] = 'Shipments/getcurrent';
$route['Shipments/check_for_vendor_emails'] = 'Shipments/check_for_vendor_emails';
$route['Shipments/index'] = 'Shipments/getcurrent';
$route['Ajax/Shipments'] = 'Ajax/Shipments';
$route['Ajax/save_state/(:any)'] = 'Ajax/save_state/$1';
$route['Ajax/load_state/(:any)'] = 'Ajax/load_state/$1';
$route['users'] = 'users/login';
$route['calendar'] = 'calendar';
$route['users/register'] = 'users/register';
$route['richfilemanager'] = 'richfilemanager';
