require 'spec_helper'

describe Paydunya::Checkout::Store do
  it 'should initialize the store' do
    Paydunya::Checkout::Store.name = fake_store[:name]
    Paydunya::Checkout::Store.tagline = fake_store[:tagline]
    Paydunya::Checkout::Store.postal_address = fake_store[:postal_address]
    Paydunya::Checkout::Store.phone_number = fake_store[:phone_number]
    Paydunya::Checkout::Store.website_url = fake_store[:website_url]
    Paydunya::Checkout::Store.logo_url = fake_store[:logo_url]

    expect(Paydunya::Checkout::Store.name).to eq fake_store[:name]
    expect(Paydunya::Checkout::Store.tagline).to eq fake_store[:tagline]
    expect(Paydunya::Checkout::Store.postal_address).to eq fake_store[:postal_address]
    expect(Paydunya::Checkout::Store.phone_number).to eq fake_store[:phone_number]
    expect(Paydunya::Checkout::Store.website_url).to eq fake_store[:website_url]
    expect(Paydunya::Checkout::Store.logo_url).to eq fake_store[:logo_url]
  end
end
