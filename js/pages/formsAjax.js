// JavaScript Document

$('.AjaxForm').submit(function(){

	$(this).find("input[type=submit][clicked=true]").hide();
	$('#alert_error').hide();
	$('#alert_success').hide();
	$(this).validate();
	if($(this).find('.timymce').length > 0)
		tinyMCE.triggerSave();
	if($(this).find('#form_action').val())
	{
		form_action = 'ajax/'+$(this).find('#form_action').val()+ '.php';
		db_field 	= $(this).serialize(); 
	}
	else
	{
		form_action = 'ajax/ajax_request.php';
		db_field 	= $(this).find('.db_field').serialize(); 
	}
	
	var curr_form = $(this)
	$.ajax({
	  type: "POST",
	  url: form_action,
	  data: { action: "Save_Data", table_name: $(this).find('#table_name').val(), pri_key : $(this).find('#pri_key').val() , db_field:db_field }
	})
	  .done(function( msg ) {
					 
					 
		
		if(msg == 'success')			 
		{
			$('#alert_success').show();
			$('#alert_success').focus();
			if(curr_form.find('#no_reload').val() != 1 && curr_form.find('#pri_key').val() == '' )
			{
				curr_form.find('.db_field').not( ".exclude_reset" ).val('');
				curr_form.find('#pri_key').val('');
				if(curr_form.find('.timymce').length > 0)
					tinyMCE.activeEditor.setContent('');
			}
			
			if(curr_form.find('#on_success').val())
			{
				eval(curr_form.find('#on_success').val() + '()');
			}
			
		}
		else if(msg.indexOf('error_msg') != -1)
		{
			msg_obj = JSON.parse(msg)			 
			alert(msg_obj.error_msg)	
		}
		else
		{
			$('#alert_error').show();
		}
		$(window).scrollTop(0);
		
	});
	return false;
	
});

function deleteRecord(row , table_name , id)
{

	if(confirm('Are you sure to delete this record?'))
	{
		$('#alert_delete').hide();
		$.ajax({
		  type: "POST",
		  url: "ajax/ajax_request.php",
		  data: { action: "Delete_Data", table_name: table_name, pri_key : id  }
		})
		  .done(function( msg ) {
			$('#alert_delete').show();
			$('#alert_delete').focus();
			$('#'+row).hide();
		  });
	}
	return false;
	
}

function deleteRecordAjax(row , table_name , id)
{

	if(confirm('Are you sure to delete this record?'))
	{
		$('#alert_delete').hide();
		$.ajax({
		  type: "POST",
		  url: "ajax/ajax_request.php",
		  data: { action: "Delete_Data", table_name: table_name, pri_key : id  }
		})
		  .done(function( msg ) {
			$('#alert_delete').show();
			$('#alert_delete').focus();
 			$('#example-datatable tbody tr:eq('+row+')').hide();
		  });
	}
	return false;
	
}

function updateCampaignStatus(campaign_id , status )
{
		
		$.ajax({
		  type: "POST",
		  url: "ajax/ajax_request.php",
		  data: { action: "Campaign_Status", campaign_id: campaign_id, status : status  }
		})
		  .done(function( msg ) {
						 
			$('.'+campaign_id+'status').toggle();			 
		  });

}

function updateCampaignStatusEvergreen(campaign_id , status )
{
		
		$.ajax({
		  type: "POST",
		  url: "ajax/ajax_request.php",
		  data: { action: "Campaign_Status_evergreen", campaign_id: campaign_id, status : status  }
		})
		  .done(function( msg ) {
						 
			$('.'+campaign_id+'status').toggle();			 
		  });
}

function updateAutoResponderGroupStatus(campaign_id , status )
{
		
		$.ajax({
		  type: "POST",
		  url: "ajax/ajax_request.php",
		  data: { action: "AutoResponser_Group_Status", campaign_id: campaign_id, status : status  }
		})
		  .done(function( msg ) {
						 
			$('.'+campaign_id+'status').toggle();			 
		  });
}

function updateAutoResponderStatus(autoresponder_id , status )
{
		
		$.ajax({
		  type: "POST",
		  url: "ajax/ajax_request.php",
		  data: { action: "AutoResponder_Status", autoresponder_id: autoresponder_id, status : status  }
		})
		  .done(function( msg ) {
						 
			$('.'+autoresponder_id+'status').toggle();			 
		  });

}


function deleteCampaign(row , campaign_id)
{
	if(confirm('Are you sure to delete this record?'))
	{
		
		$.ajax({
		  type: "POST",
		  url: "ajax/ajax_request.php",
		  data: { action: "delete_campaign", campaign_id: campaign_id }
		})
		  .done(function( msg ) {
						 
			$('#'+row).hide();
		  });
	}
	return false;

}