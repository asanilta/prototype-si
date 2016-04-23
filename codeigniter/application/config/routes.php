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
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

/// API TENAGA AHLI ///
$route['api/tenaga-ahli/get/all'] = 'TenagaAhliController/getTenagaAhli';
$route['api/tenaga-ahli/get/(:num)'] = 'TenagaAhliController/getTenagaAhli/$1';
$route['api/tenaga-ahli/insert']['POST'] = 'TenagaAhliController/insertTenagaAhli';
$route['api/tenaga-ahli/update']['POST'] = 'TenagaAhliController/updateTenagaAhli';
$route['api/tenaga-ahli/delete/(:num)'] = 'TenagaAhliController/deleteTenagaAhli/$1';


/// API TENDER ///
$route['api/tender/get/all'] = 'TenderController/getTender';
$route['api/tender/get/bidang/all'] = 'TenderController/getAllBidang';
$route['api/tender/get/(:num)'] = 'TenderController/getTender/$1';
$route['api/tender/insert']['POST'] = 'TenderController/insertTender';
$route['api/tender/update']['POST'] = 'TenderController/updateTender';
$route['api/tender/delete/(:num)'] = 'TenderController/deleteTender/$1';
$route['api/tender/delete']['POST'] = 'TenderController/deleteTender';
$route['api/tender/delete/(:num)/tenaga-ahli/(:num)'] = 'TenderController/deleteTenagaInTender/$1/$2';
$route['api/tender/update/(:num)/tenaga-ahli/(:num)'] = 'TenderController/addTenagaToTender/$1/$2';
$route['api/tender/delete/(:num)/persyaratan/(:num)'] = 'TenderController/deletePersyaratan/$1/$2';
$route['api/tender/update/(:num)/perusahaan/(:num)']['POST'] = 'TenderController/updatePerusahaan/$1/$2';
$route['api/tender/update/(:num)/persyaratan']['POST'] = 'TenderController/updatePersyaratan/$1';


/// API PERUSAHAAN ///
$route['api/perusahaan/get/all'] = 'PerusahaanController/getPerusahaan';
$route['api/perusahaan/get/(:num)'] = 'PerusahaanController/getPerusahaan/$1';
$route['api/perusahaan/update']['POST'] = 'PerusahaanController/updatePerusahaan';
$route['api/perusahaan/insert']['POST'] = 'PerusahaanController/insertPerusahaan';
$route['api/perusahaan/delete/(:num)'] = 'PerusahaanController/deletePerusahaan/$1';


/// API USER ///
$route['api/user/get/all'] = 'UserController/getUser';
$route['api/user/get/(:any)'] = 'UserController/getUser/$1';

/// API DOKUMEN ///
$route['api/dokumen/get/all'] = 'DokumenController/getDokumen';
$route['api/dokumen/get/(:any)'] = 'DokumenController/getDokumen/$1';
$route['api/dokumen/upload']['POST'] = 'DokumenController/do_upload';
$route['api/folder/insert/(:any)'] = 'DokumenController/createFolder/$1';