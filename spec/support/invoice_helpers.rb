module InvoiceHelpers
  def fake_item
    {
      name: 'Ordinateur Lenovo L44',
      quantity: 1,
      unit_price: 400_000,
      total_price: 400_000,
      description: 'Réduction de 10%'
    }
  end

  def fake_tax
    { 
      name: 'TVA (18%)',
      amount: 5000
    }
  end

  def fake_customer
    {
      name: 'name',
      value: 'Badara'
    }
  end

  def fake_access_keys
    {
      master_key: 'VOTRE_CLE_PRINCIPALE',
      public_key: 'VOTRE_CLE_PUBLIQUE',
      private_key: 'VOTRE_CLE_PRIVEE',
      token: 'VOTRE_TOKEN'
    }
  end

  def urls
    {
      root_url: 'https://app.paydunya.com',
      live_checkout_base_url: 'https://app.paydunya.com/api/v1/checkout-invoice/create',
      test_checkout_base_url: 'https://app.paydunya.com/sandbox-api/v1/checkout-invoice/create',
      live_checkout_confirm_base_url: 'https://app.paydunya.com/api/v1/checkout-invoice/confirm/',
      test_checkout_confirm_base_url: 'https://app.paydunya.com/sandbox-api/v1/checkout-invoice/confirm/',
      live_opr_base_url: 'https://app.paydunya.com/api/v1/opr/create',
      test_opr_base_url: 'https://app.paydunya.com/sandbox-api/v1/opr/create',
      live_opr_charge_base_url: 'https://app.paydunya.com/api/v1/opr/charge',
      test_opr_charge_base_url: 'https://app.paydunya.com/sandbox-api/v1/opr/charge',
      live_direct_pay_credit_base_url: 'https://app.paydunya.com/api/v1/direct-pay/credit-account',
      test_direct_pay_credit_base_url: 'https://app.paydunya.com/sandbox-api/v1/direct-pay/credit-account',
    }
  end
end
