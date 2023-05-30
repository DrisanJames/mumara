/*
 *  Document   : tablesDatatables.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Tables Datatables page
 */

var TablesDatatables = function() {

    return {
        init: function() {
            /* Initialize Bootstrap Datatables Integration */
 			
            
			$.post( "ajax/datatable.php", { action: "GET_PAGESIZE", page_size: $("option:selected",this).val(), location: window.location.href } )
			  .done(function( size ) {

					App.datatables();
 					 
					/* Initialize Datatables */
					$('#example-datatable').dataTable({
					   "order": [],
						"aoColumnDefs": [{ "bSortable": false, "aTargets": ['no-sort'] }],
						"iDisplayLength": Number(size),
					//	"dom": 'lfrtip',
			          //  dom: 'lBftip',
						buttons: [
							'copyHtml5',
							'excelHtml5',
							'csvHtml5',
							'pdfHtml5'
						],
						"aLengthMenu": [[10 , 20 ,50 , 100 , 200, 300, -1], [10 , 20 ,50, 100, 200 , 300, "All"]]
					});
		
					/* Add Bootstrap classes to select and input elements added by datatables above the table */
					$('.dataTables_filter input').addClass('form-control').attr('placeholder', 'Search');
					$('.dataTables_length select').addClass('form-control');
					$('#example-datatable_length').change(function(){  
							$.post( "ajax/datatable.php", { action: "SAVE_PAGESIZE", page_size: $("option:selected",this).val(), location: window.location.href } );
				   })


			});
			
	  } //init
	}; //return
}();



