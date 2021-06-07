require 'spec_helper'

describe Paydunya::Checkout::Invoice do
  before(:each) do
    @invoice = Paydunya::Checkout::Invoice.new
    Paydunya::Setup.master_key = fake_access_keys[:master_key]
    Paydunya::Setup.public_key = fake_access_keys[:public_key]
    Paydunya::Setup.private_key = fake_access_keys[:private_key]
    Paydunya::Setup.mode = 'test'
    Paydunya::Setup.token = fake_access_keys[:token]
  end

  it 'should add item to the invoice' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    item = @invoice.items[@invoice.items.keys.last]
    expect(item).to include(name: fake_item[:name], quantity: fake_item[:quantity],
                            unit_price: fake_item[:unit_price], total_price: fake_item[:total_price],
                            description: fake_item[:description])
  end

  it 'should add tax to the invoice' do
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    tax = @invoice.taxes[@invoice.taxes.keys.last]
    expect(tax).to include(name: fake_tax[:name], amount: fake_tax[:amount])
  end

  it 'should add custom_data to the invoice' do
    @invoice.add_custom_data(fake_customer[:key], fake_customer[:value])
    expect(@invoice.custom_data).to include(fake_customer[:key].to_s => fake_customer[:value])
  end

  it 'should add a channel to the invoice' do
    channels = @invoice.add_channel('wari')
    expect(channels.last).to eq 'wari'
  end

  it 'should add channels to the invoice' do
    channels = @invoice.add_channels(fake_channels)
    expect(channels).not_to be_empty
    expect(channels).to match_array fake_channels
  end

  it 'should return a hash containing the different items of the invoice' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    item = @invoice.get_items[@invoice.get_items.keys.last]
    expect(item).to include(name: fake_item[:name], quantity: fake_item[:quantity],
                            unit_price: fake_item[:unit_price], total_price: fake_item[:total_price],
                            description: fake_item[:description])
  end

  it 'should return a hash containing the different taxes of the invoice' do
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    tax = @invoice.get_taxes[@invoice.get_taxes.keys.last]
    expect(tax).to include(name: fake_tax[:name], amount: fake_tax[:amount])
  end

  # it 'should return customer info' do
  #   value = @invoice.get_customer_info(fake_customer[:key])
  #   expect(value).to be_nil
  # end

  it 'should return customer data' do
    @invoice.add_custom_data(fake_customer[:key], fake_customer[:value])
    value = @invoice.get_custom_data(fake_customer[:key])
    expect(value).to eq fake_customer[:value]
  end

  it 'should create a invoice' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    @invoice.add_custom_data(fake_custom_data[:key], fake_custom_data[:value])
    @invoice.add_channels(fake_channels)
    stub_request(:post, urls[:test_checkout_base_url])
      .with(
        body: fake_redirect_invoice_request_body,
        headers: fake_headers
      )
      .to_return(body: fake_success_response, status: 200, headers: {})
    success = @invoice.create
    expect(success).to be_truthy
  end

  it 'should confirm the invoice and return false' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    @invoice.add_custom_data(fake_custom_data[:key], fake_custom_data[:value])
    @invoice.add_channels(fake_channels)
    stub_request(:get, urls[:test_checkout_confirm_base_url] + fake_invoice_token)
      .with(
        headers: fake_headers
      )
      .to_return(body: fake_invoice_verification_success_response, status: 200, headers: {})
    success = @invoice.confirm(fake_invoice_token)
    expect(success).to be_truthy
  end

  it 'should fail to confirm the invoice and return false' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    @invoice.add_custom_data(fake_custom_data[:key], fake_custom_data[:value])
    @invoice.add_channels(fake_channels)
    stub_request(:get, urls[:test_checkout_confirm_base_url] + fake_invoice_token)
      .with(
        headers: fake_headers
      )
      .to_return(body: fake_invoice_verification_error_response, status: 200, headers: {})
    success = @invoice.confirm(fake_invoice_token)
    expect(success).to be_falsey
  end

  it 'should not found the invoice to confirm and return false' do
    @invoice.add_item(fake_item[:name], fake_item[:quantity],
                      fake_item[:unit_price], fake_item[:total_price], fake_item[:description])
    @invoice.add_tax(fake_tax[:name], fake_tax[:amount])
    @invoice.add_custom_data(fake_custom_data[:key], fake_custom_data[:value])
    @invoice.add_channels(fake_channels)
    stub_request(:get, urls[:test_checkout_confirm_base_url] + fake_invoice_token)
      .with(
        headers: fake_headers
      )
      .to_return(body: '{}', status: 200, headers: {})
    success = @invoice.confirm(fake_invoice_token)
    expect(success).to be_falsey
  end
end
