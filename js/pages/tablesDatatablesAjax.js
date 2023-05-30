/*
 *  Document   : tablesDatatables.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Tables Datatables page
 */
$(document).ready(function() {

	App.datatables();
    $('#example-datatable').dataTable( {
	 	"processing": true,
        "serverSide": true,
        "lengthMenu": [[50, 100, 200 , 500 ,  -1], [50, 100, 200 , 500 ,  "ALL"]],
		"ajax": {
            "url": "ajax/contact_list.php",
            "data": function ( d ) {
                d.list_id = "<?php print $_REQUEST['list_id']?>";
            }
        }
    } );
 
	var table = $('#example-datatable').DataTable();
	 
	table.on( 'draw', function () {
 
		$('.dataTables_filter input').addClass('form-control').attr('placeholder', 'Search');
		$('.dataTables_length select').addClass('form-control');

	} );
	
	
} );
