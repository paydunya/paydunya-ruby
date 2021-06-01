require 'spec_helper'

describe Paydunya::Onsite::Invoice do
  before do
    @invoice = Paydunya::Onsite::Invoice.new
    Paydunya::Setup.master_key = fake_access_keys[:master_key]
    Paydunya::Setup.public_key = fake_access_keys[:public_key]
    Paydunya::Setup.private_key = fake_access_keys[:private_key]
    Paydunya::Setup.mode = 'test'
    Paydunya::Setup.token = fake_access_keys[:token]
  end

  it 'Should charge the customer and return true on success' do
    stub_request(:post, urls[:test_opr_charge_base_url])
      .with(
        body: '{"token":"TOKEN_PSR","confirm_token":"CODE_DE_CONFIRMATION_DU_CLIENT"}',
        headers: fake_headers
      )
      .to_return(body: fake_success_response, status: 200, headers: {})
    success = @invoice.charge('TOKEN_PSR', 'CODE_DE_CONFIRMATION_DU_CLIENT')
    expect(success).to be_truthy
  end

  it 'Should charge the customer and return false on error' do
    stub_request(:post, urls[:test_opr_charge_base_url])
      .with(
        body: '{"token":"TOKEN_PSR","confirm_token":"CODE_DE_CONFIRMATION_DU_CLIENT"}',
        headers: fake_headers
      )
      .to_return(body: fake_error_response, status: 200, headers: {})
    success = @invoice.charge('TOKEN_PSR', 'CODE_DE_CONFIRMATION_DU_CLIENT')
    expect(success).to be_falsey
  end

  it 'Should create a onsite invoice' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    @invoice.add_custom_data(fake_custom_data[:key], fake_custom_data[:value])
    channels = @invoice.add_channels(fake_channels)
    stub_request(:post, urls[:test_opr_base_url])
      .with(
        body: fake_onsite_invoice_request_body,
        headers: fake_headers
      )
      .to_return(body: fake_success_response, status: 200, headers: {})
    success = @invoice.create(fake_account_alias)
    expect(success).to be_truthy 
    expect(@invoice.status).to eq Paydunya::SUCCESS 
  end

  it 'Should failed creating a onsite invoice' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    @invoice.add_custom_data(fake_custom_data[:key], fake_custom_data[:value])
    @invoice.add_channels(fake_channels)
    stub_request(:post, urls[:test_opr_base_url])
      .with(
        body: fake_onsite_invoice_request_body,
        headers: fake_headers
      )
      .to_return(body: fake_error_response, status: 200, headers: {})
    success = @invoice.create(fake_account_alias)
    expect(success).to be_falsey
    expect(@invoice.status).to eq Paydunya::FAIL
  end
end
