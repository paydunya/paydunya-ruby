# frozen_string_literal: true
require 'spec_helper'

describe Paydunya::Checkout::Core do
  before do
    @core = Paydunya::Checkout::Core.new
    @result = {
      'transaction_id' => 'TEST000001',
      'description' => 'Success! Amount of 4500 FCFA has been transfered to Sandbox Account BOUBACAR BAH',
      'response_text' => 'Transaction completed successfully',
      'token' => 'test_jkEdPY8SuG'
    }
  end

  it 'should contain a status, response_text, response_code, transaction_id, description, token, result' do
    @result['response_code'] = '00'
    @core.push_results(@result)
    expect(@core.status).to eq Paydunya::SUCCESS
    expect(@core.response_text).to eq 'Transaction completed successfully'
    expect(@core.response_code).to eq '00'
    expect(@core.description).to eq 'Success! Amount of 4500 FCFA has been transfered to Sandbox Account BOUBACAR BAH'
    expect(@core.transaction_id).to eq 'TEST000001'
    expect(@core.token).to eq 'test_jkEdPY8SuG'
  end

  it 'should return Paydunya::SUCCESS' do
    @result['response_code'] = '00'
    expect(@core.push_results(@result)).to eq Paydunya::SUCCESS
  end

  it 'should return Paydunya::FAIL' do
    @result['response_code'] = '01'
    expect(@core.push_results(@result)).to eq Paydunya::FAIL
  end
end
