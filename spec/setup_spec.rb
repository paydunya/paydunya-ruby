# frozen_string_literal: true

require 'spec_helper'

describe Paydunya::Setup do
  before do
    Paydunya::Setup.master_key = fake_access_keys[:master_key]
    Paydunya::Setup.public_key = fake_access_keys[:public_key]
    Paydunya::Setup.private_key = fake_access_keys[:private_key]
    Paydunya::Setup.mode = 'test'
    Paydunya::Setup.token = fake_access_keys[:token]
  end

  it 'should contain master_key, private_key, public_key, token, mode' do
    expect(Paydunya::Setup.master_key).to eq fake_access_keys[:master_key]
    expect(Paydunya::Setup.public_key).to eq fake_access_keys[:public_key]
    expect(Paydunya::Setup.private_key).to eq fake_access_keys[:private_key]
    expect(Paydunya::Setup.mode).to eq 'test'
    expect(Paydunya::Setup.token).to eq fake_access_keys[:token]
  end

  it 'should return the ROOT_URL_BASE' do
    expect(Paydunya::Setup::ROOT_URL_BASE).to eq urls[:root_url]
  end

  it 'should return LIVE_CHECKOUT_INVOICE_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.checkout_base_url).to eq urls[:live_checkout_base_url]
  end

  it 'should return TEST_CHECKOUT_INVOICE_BASE_URL' do
    expect(Paydunya::Setup.checkout_base_url).to eq urls[:test_checkout_base_url]
  end

  it 'should return LIVE_CHECKOUT_CONFIRM_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.checkout_confirm_base_url).to eq urls[:live_checkout_confirm_base_url]
  end

  it 'should return TEST_CHECKOUT_CONFIRM_BASE_URL' do
    expect(Paydunya::Setup.checkout_confirm_base_url).to eq urls[:test_checkout_confirm_base_url]
  end

  it 'should return LIVE_OPR_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.opr_base_url).to eq urls[:live_opr_base_url]
  end

  it 'should return TEST_OPR_BASE_URL' do
    expect(Paydunya::Setup.opr_base_url).to eq urls[:test_opr_base_url]
  end

  it 'should return LIVE_OPR_CHARGE_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.opr_charge_base_url).to eq urls[:live_opr_charge_base_url]
  end

  it 'should return TEST_OPR_CHARGE_BASE_URL' do
    expect(Paydunya::Setup.opr_charge_base_url).to eq urls[:test_opr_charge_base_url]
  end

  it 'should return LIVE_DIRECT_PAY_CREDIT_BASE_URL' do
    Paydunya::Setup.mode = 'live'
    expect(Paydunya::Setup.direct_pay_credit_base_url).to eq urls[:live_direct_pay_credit_base_url]
  end

  it 'should return TEST_DIRECT_PAY_CREDIT_BASE_URL' do
    expect(Paydunya::Setup.direct_pay_credit_base_url).to eq urls[:test_direct_pay_credit_base_url]
  end
end
