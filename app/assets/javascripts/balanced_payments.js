   var requestBinURL = 'http://requestb.in/onetigon';  // make sure it doesn't end in ?inspect

   var marketplaceUri = '/v1/marketplaces/TEST-MP6AYyZ4i81jgO8P66ljOWH8';
   balanced.init(marketplaceUri);

   function responseCallbackHandler(response) {
      switch (response.status) {
        case 400:
            // missing or invalid field - check response.error for details
            console.log(response.error);
            break;
        case 404:
            // your marketplace URI is incorrect
            console.log(response.error);
            break;
        case 201:
            // WOO HOO! MONEY!
            // response.data.uri == URI of the bank account resource you
            // should store this bank account URI to later credit it
            console.log(response.data);
            var $form = $("#bank-account-form");
            // the uri is an opaque token referencing the tokenized bank account
            var bank_account_uri = response.data['uri'];
            // append the token as a hidden field to submit to the server
            $('<input>').attr({
               type: 'hidden',
               value: bank_account_uri,
               name: 'balancedBankAccountURI'
            }).appendTo($form);
            $form.attr({action: requestBinURL});
            $form.get(0).submit();
        }
    }

   var tokenizeInstrument = function(e) {
        e.preventDefault();
   
        var $form = $('#bank-account-form');
        var bankAccountData = {
            name: $form.find('.ba-name').val(),
            account_number: $form.find('.ba-an').val(),
            bank_code: $form.find('.ba-rn').val(),
            type: $form.find('select').val()
        };
 
 
        balanced.bankAccount.create(bankAccountData, responseCallbackHandler);
    };
   $('#bank-account-form').submit(tokenizeInstrument);