# frozen_string_literal: true

require 'spec_helper'

describe Paydunya::Setup do
  before do
    Paydunya::Setup.master_key = 'VOTRE_CLE_PRINCIPALE'
    Paydunya::Setup.public_key = 'VOTRE_CLE_PUBLIQUE'
    Paydunya::Setup.private_key = 'VOTRE_CLE_PRIVEE'
    Paydunya::Setup.mode = 'test'
    Paydunya::Setup.token = 'VOTRE_TOKEN'
  end

  it 'should contain master_key, private_key, public_key, token, mode' do
    expect(Paydunya::Setup.master_key).to eq 'VOTRE_CLE_PRINCIPALE'
    expect(Paydunya::Setup.public_key).to eq 'VOTRE_CLE_PUBLIQUE'
    expect(Paydunya::Setup.private_key).to eq 'VOTRE_CLE_PRIVEE'
    expect(Paydunya::Setup.mode).to eq 'test'
    expect(Paydunya::Setup.token).to eq 'VOTRE_TOKEN'
  end

  it 'should return the ROOT_URL_BASE' do
    expect(Paydunya::Setup::ROOT_URL_BASE).to eq 'https://app.paydunya.com'
  end

  it 'should return LIVE_CHECKOUT_INVOICE_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.checkout_base_url).to eq 'https://app.paydunya.com/api/v1/checkout-invoice/create'
  end

  it 'should return TEST_CHECKOUT_INVOICE_BASE_URL' do
    expect(Paydunya::Setup.checkout_base_url).to eq 'https://app.paydunya.com/sandbox-api/v1/checkout-invoice/create'
  end

  it 'should return LIVE_CHECKOUT_CONFIRM_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.checkout_confirm_base_url).to eq 'https://app.paydunya.com/api/v1/checkout-invoice/confirm/'
  end

  it 'should return TEST_CHECKOUT_CONFIRM_BASE_URL' do
    expect(Paydunya::Setup.checkout_confirm_base_url).to eq 'https://app.paydunya.com/sandbox-api/v1/checkout-invoice/confirm/'
  end

  it 'should return LIVE_OPR_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.opr_base_url).to eq 'https://app.paydunya.com/api/v1/opr/create'
  end

  it 'should return TEST_OPR_BASE_URL' do
    expect(Paydunya::Setup.opr_base_url).to eq 'https://app.paydunya.com/sandbox-api/v1/opr/create'
  end

  it 'should return LIVE_OPR_CHARGE_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.opr_charge_base_url).to eq 'https://app.paydunya.com/api/v1/opr/charge'
  end

  it 'should return LIVE_OPR_CHARGE_BASE_URL' do
    expect(Paydunya::Setup.opr_charge_base_url).to eq 'https://app.paydunya.com/sandbox-api/v1/opr/charge'
  end

  it 'should return LIVE_DIRECT_PAY_CREDIT_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.direct_pay_credit_base_url).to eq 'https://app.paydunya.com/api/v1/direct-pay/credit-account'
  end

  it 'should return TEST_DIRECT_PAY_CREDIT_BASE_URL' do
    expect(Paydunya::Setup.direct_pay_credit_base_url).to eq 'https://app.paydunya.com/sandbox-api/v1/direct-pay/credit-account'
  end
end
