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

  def fake_account_alias
    '45678942128'
  end

  def fake_tax
    {
      name: 'TVA (18%)',
      amount: 5000
    }
  end

  def fake_channels
    %w[wari orange]
  end

  def fake_customer
    {
      key: 'name',
      value: 'Badara'
    }
  end

  def fake_custom_data
    {
      key: 'categorie',
      value: 'Jeu concours'
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

  def fake_invoice_token
    'test_Jh2T8skw1j'
  end

  def fake_store
    {
      name: 'NOM_DE_VOTRE_ENTREPRISE',
      tagline: 'SLOGAN_DE_VOTRE_ENTREPRISE',
      postal_address: 'ADRESSE_DE_VOTRE_ENTREPRISE',
      phone_number: 'NUMERO_DE_TELEPHONE_DE_VOTRE_ENTREPRISE',
      website_url: 'URL_DU_SITE_WEB_DE_VOTRE_ENTREPRISE',
      logo_url: 'URL_DU_LOGO_DE_VOTRE_ENTREPRISE'
    }
  end

  def fake_success_response
    '{
        "response_code": "00",
        "response_text": "Transaction Found",
        "hash": "85c6564b0e29c7955633594bc8aca0d007dc1fce3f67bd3accb00ae4e9d39ae528574be9a6ea8bde81fcbb0bc0fae3e56eb1bbedcd4d119a7fd24b0d44ab3770",
        "invoice_data": {
           "invoice": {
            "items": {
                "item_0": {
                "name": "Chaussures Croco",
                "quantity": 3,
                "unit_price": "10000",
                "total_price": "30000",
                "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
            },
            "item_1": {
                "name": "Chemise Glacée",
                "quantity": 1,
                "unit_price": "5000",
                "total_price": "5000",
                "description": ""
            }
            },
            "taxes": {
            "tax_0": {
                "name": "TVA (18%)",
                "amount": 6300
            },
            "tax_1": {
                "name": "Livraison",
                "amount": 1000
            }
            },
            "token": "test_Jh2T8skw1j",
            "total_amount": 42300,
            "description": "Paiement de 42300 FCFA pour article(s) achetés sur Magasin le Choco"
        },
        "custom_data": {
            "categorie": "Jeu concours",
            "periode":  "Noël 2015",
            "numero_gagnant": 5,
            "prix" : "Bon de réduction de 50%"
        },
        "actions": {
            "cancel_url": "http://magasin-le-choco.com/cancel_url.aspx",
            "callback_url": "http://magasin-le-choco.com/callback_url.aspx",
            "return_url": "http://magasin-le-choco.com/return_url.aspx"
        },
        "mode": "test",
        "status": "completed",
        "fail_reason": "",
        "customer": {
            "name": "Alioune Faye",
            "phone": "774563209",
            "email": "aliounefaye@gmail.com"
        },
        "receipt_url": "https://paydunya.com/sandbox-checkout/receipt/pdf/test_Jh2T8skw1j.pdf"
        }
    }'
  end

  def fake_invoice_verification_success_response
    '{
      "response_code": "00",
      "response_text": "Transaction Found",
      "hash": "85c6564b0e29c7955633594bc8aca0d007dc1fce3f67bd3accb00ae4e9d39ae528574be9a6ea8bde81fcbb0bc0fae3e56eb1bbedcd4d119a7fd24b0d44ab3770",
      "invoice": {
          "items": {
              "item_0": {
              "name": "Chaussures Croco",
              "quantity": 3,
              "unit_price": "10000",
              "total_price": "30000",
              "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
          },
          "item_1": {
              "name": "Chemise Glacée",
              "quantity": 1,
              "unit_price": "5000",
              "total_price": "5000",
              "description": ""
          }
          },
          "taxes": {
          "tax_0": {
              "name": "TVA (18%)",
              "amount": 6300
          },
          "tax_1": {
              "name": "Livraison",
              "amount": 1000
          }
          },
          "token": "test_Jh2T8skw1j",
          "total_amount": 42300,
          "description": "Paiement de 42300 FCFA pour article(s) achetés sur Magasin le Choco"
      },
      "custom_data": {
          "categorie": "Jeu concours",
          "periode":  "Noël 2015",
          "numero_gagnant": 5,
          "prix" : "Bon de réduction de 50%"
      },
      "actions": {
          "cancel_url": "http://magasin-le-choco.com/cancel_url.aspx",
          "callback_url": "http://magasin-le-choco.com/callback_url.aspx",
          "return_url": "http://magasin-le-choco.com/return_url.aspx"
      },
      "mode": "test",
      "status": "completed",
      "fail_reason": "",
      "customer": {
          "name": "Alioune Faye",
          "phone": "774563209",
          "email": "aliounefaye@gmail.com"
      },
      "receipt_url": "https://paydunya.com/sandbox-checkout/receipt/pdf/test_Jh2T8skw1j.pdf"
    }'
  end

  def fake_invoice_verification_error_response
    '{
      "response_code": "01",
      "response_text": "Transaction Found",
      "hash": "85c6564b0e29c7955633594bc8aca0d007dc1fce3f67bd3accb00ae4e9d39ae528574be9a6ea8bde81fcbb0bc0fae3e56eb1bbedcd4d119a7fd24b0d44ab3770",
      "invoice": {
          "items": {
              "item_0": {
              "name": "Chaussures Croco",
              "quantity": 3,
              "unit_price": "10000",
              "total_price": "30000",
              "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
          },
          "item_1": {
              "name": "Chemise Glacée",
              "quantity": 1,
              "unit_price": "5000",
              "total_price": "5000",
              "description": ""
          }
          },
          "taxes": {
          "tax_0": {
              "name": "TVA (18%)",
              "amount": 6300
          },
          "tax_1": {
              "name": "Livraison",
              "amount": 1000
          }
          },
          "token": "test_Jh2T8skw1j",
          "total_amount": 42300,
          "description": "Paiement de 42300 FCFA pour article(s) achetés sur Magasin le Choco"
      },
      "custom_data": {
          "categorie": "Jeu concours",
          "periode":  "Noël 2015",
          "numero_gagnant": 5,
          "prix" : "Bon de réduction de 50%"
      },
      "actions": {
          "cancel_url": "http://magasin-le-choco.com/cancel_url.aspx",
          "callback_url": "http://magasin-le-choco.com/callback_url.aspx",
          "return_url": "http://magasin-le-choco.com/return_url.aspx"
      },
      "mode": "test",
      "status": "cancelled",
      "fail_reason": "Payment cancelled by customer",
      "customer": {
          "name": "Alioune Faye",
          "phone": "774563209",
          "email": "aliounefaye@gmail.com"
      },
      "receipt_url": "https://paydunya.com/sandbox-checkout/receipt/pdf/test_Jh2T8skw1j.pdf"
    }'
  end

  def fake_error_response
    '{
        "response_code": "01",
        "response_text": "Transaction Found",
        "hash": "85c6564b0e29c7955633594bc8aca0d007dc1fce3f67bd3accb00ae4e9d39ae528574be9a6ea8bde81fcbb0bc0fae3e56eb1bbedcd4d119a7fd24b0d44ab3770",
        "invoice_data": {
           "invoice": {
            "items": {
                "item_0": {
                "name": "Chaussures Croco",
                "quantity": 3,
                "unit_price": "10000",
                "total_price": "30000",
                "description": "Chaussures faites en peau de crocrodile authentique qui chasse la pauvreté"
            },
            "item_1": {
                "name": "Chemise Glacée",
                "quantity": 1,
                "unit_price": "5000",
                "total_price": "5000",
                "description": ""
            }
            },
            "taxes": {
            "tax_0": {
                "name": "TVA (18%)",
                "amount": 6300
            },
            "tax_1": {
                "name": "Livraison",
                "amount": 1000
            }
            },
            "token": "test_Jh2T8skw1j",
            "total_amount": 42300,
            "description": "Paiement de 42300 FCFA pour article(s) achetés sur Magasin le Choco"
        },
        "custom_data": {
            "categorie": "Jeu concours",
            "periode":  "Noël 2015",
            "numero_gagnant": 5,
            "prix" : "Bon de réduction de 50%"
        },
        "actions": {
            "cancel_url": "http://magasin-le-choco.com/cancel_url.aspx",
            "callback_url": "http://magasin-le-choco.com/callback_url.aspx",
            "return_url": "http://magasin-le-choco.com/return_url.aspx"
        },
        "mode": "test",
        "status": "cancelled",
        "fail_reason": "Payment cancelled by customer",
        "customer": {
            "name": "Alioune Faye",
            "phone": "774563209",
            "email": "aliounefaye@gmail.com"
        },
        "receipt_url": "https://paydunya.com/sandbox-checkout/receipt/pdf/test_Jh2T8skw1j.pdf"
        }
    }'
  end

  def fake_redirect_invoice_request_body
    { invoice: {
      items: {
        'item_0': fake_item
      },
      taxes: {
        'tax_0': { 'name' => fake_tax[:name], 'amount' => fake_tax[:amount] }
      },
      channels: fake_channels,
      total_amount: 0.0,
      description: nil
    },
      store: {
        name: 'Untitled Store',
        tagline: nil,
        postal_address: nil,
        phone: nil,
        logo_url: nil,
        website_url: nil
      },
      custom_data: { fake_custom_data[:key].to_s => fake_custom_data[:value].to_s },
      actions: {
        cancel_url: nil,
        return_url: nil,
        callback_url: nil
      } }
  end

  def fake_onsite_invoice_request_body
    {
      invoice_data: {
        invoice: {
          items: {
            'item_0': fake_item
          },
          taxes: {
            'tax_0': { 'name' => fake_tax[:name], 'amount' => fake_tax[:amount] }
          },
          channels: fake_channels,
          total_amount: 0.0,
          description: nil
        },
        store: {
          name: 'Untitled Store',
          tagline: nil,
          postal_address: nil,
          phone: nil,
          logo_url: nil,
          website_url: nil
        },
        custom_data: { fake_custom_data[:key].to_s => fake_custom_data[:value].to_s },
        actions: {
          cancel_url: nil,
          return_url: nil,
          callback_url: nil
        }
      },
      opr_data: {
        account_alias: fake_account_alias
      }
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
      test_direct_pay_credit_base_url: 'https://app.paydunya.com/sandbox-api/v1/direct-pay/credit-account'
    }
  end

  def fake_headers
    { 'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent' => 'Paydunya Checkout API Ruby client v1 aka Neptune',
      'PAYDUNYA-PUBLIC-KEY' => fake_access_keys[:public_key],
      'PAYDUNYA-PRIVATE-KEY' => fake_access_keys[:private_key],
      'PAYDUNYA-MASTER-KEY' => fake_access_keys[:master_key],
      'PAYDUNYA-TOKEN' => fake_access_keys[:token],
      'PAYDUNYA-MODE' => 'test' }
  end
end
