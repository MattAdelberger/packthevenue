
 $(document).ready(function(){
 	var marketplaceUri = '/v1/marketplaces/TEST-MP6AYyZ4i81jgO8P66ljOWH8';
	
	balanced.init(marketplaceUri);
});	

function callback(response) {
    switch (response.status) {
        case 201:
            //alert(response.data.uri);
            $('#payment_uri').val(response.data.uri)
            document.forms[0].submit();
          //  response.data.uri == uri of the card or bank account resource
            break;
        case 400:
            // missing field - check response.error for details
            alert('Missing Fields');
            $('#submit-button').prop('disabled', false);
            break;
        case 402:
        alert('Couldnt authorize credit card');
        $('#submit-button').prop('disabled', false);
            // we couldn't authorize the buyer's credit card
            // check response.error for details
            break
        case 404:
        alert('The URI is incorrect');
        $('#submit-button').prop('disabled', false);
            // your marketplace URI is incorrect
            break;
        case 500:
        alert('500');
        $('#submit-button').prop('disabled', false);
            // Balanced did something bad, please retry the request
            break;
    }
}
 
    $(function() {
      $('#new_payment').submit(function(event) {
        // Disable the submit button to prevent repeated clicks
        $('#submit-button').prop('disabled', true);
        var form = $('#new_payment');
        var cardData = {
    name: form.find('[name="name"]').val(),
    card_number: form.find('[name="card_number"]').val(),
    expiration_month: form.find('[name="expiration_month"]').val(),
    expiration_year: form.find('[name="expiration_year"]').val(),
    security_code: form.find('[name="security_code"]').val()
};
 
		balanced.card.create(cardData, callback);
 
        // Prevent the form from submitting with the default action
        return false;
      });
 });







