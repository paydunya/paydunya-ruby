describe Paydunya::Checkout::Invoice do

  before(:each) do
    @invoice = Paydunya::Checkout::Invoice.new
  end

  it 'should add item to the invoice' do
    name = 'Ordinateur Lenovo L44'
    quantity = 1
    unit_price = 400_000
    total_price = 400_000
    description = 'Réduction de 10%'
    @invoice.add_item(name, quantity, unit_price, total_price, description)
    item = @invoice.items[@invoice.items.keys.last]
    expect(item).to include(name: name, quantity: quantity, unit_price: unit_price, total_price: total_price, description: description)
  end

  it 'should add tax to the invoice' do
    name = 'TVA (18%)'
    amount = 5000
    @invoice.add_tax(name, amount)
    tax = @invoice.taxes[@invoice.taxes.keys.last]
    expect(tax).to include(name: name, amount: amount)
  end

  it 'should add custom_data to the invoice' do
    key = 'name'
    value = 'Badara'
    @invoice.add_custom_data(key, value)
    expect(@invoice.custom_data).to include(key.to_s => value)
  end

  it 'should add a channel to the invoice' do
    channels = @invoice.add_channel('wari')
    expect(channels.last).to eq 'wari'
  end

  it 'should add channels to the invoice' do
    channels = @invoice.add_channels(%w[wari orange])
    expect(channels).not_to be_empty
    expect(channels).to match_array %w[wari orange]
  end
end
