require 'spec_helper'

describe Paydunya::DirectPay do
  before do
    @direct_pay = Paydunya::DirectPay.new
    Paydunya::Setup.master_key = fake_access_keys[:master_key]
    Paydunya::Setup.public_key = fake_access_keys[:public_key]
    Paydunya::Setup.private_key = fake_access_keys[:private_key]
    Paydunya::Setup.mode = 'test'
    Paydunya::Setup.token = fake_access_keys[:token]
    fake_headers = { 'Accept' => '*/*',
                 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                 'User-Agent' => 'Paydunya Checkout API Ruby client v1 aka Neptune',
                 'PAYDUNYA-PUBLIC-KEY' => fake_access_keys[:public_key],
                 'PAYDUNYA-PRIVATE-KEY' => fake_access_keys[:private_key],
                 'PAYDUNYA-MASTER-KEY' => fake_access_keys[:master_key],
                 'PAYDUNYA-TOKEN' => fake_access_keys[:token],
                 'PAYDUNYA-MODE' => 'test' }
  end

  it 'should credit user account' do
    stub_request(:post, urls[:test_direct_pay_credit_base_url])
      .with(
        body: { account_alias: 'email@exemple.com', amount: 2000 },
        headers: fake_headers
      )
      .to_return(body: '{"response_code": "00"}', status: 200, headers: {})
    success = @direct_pay.credit_account('email@exemple.com', 2000)
    expect(success).to be_truthy
  end

  it 'should not credit user account' do
    stub_request(:post, urls[:test_direct_pay_credit_base_url])
      .with(
        body: { account_alias: 'email@exemple.com', amount: 2000 },
        headers: fake_headers
      )
      .to_return(body: '{"response_code": "01"}', status: 200, headers: {})
    success = @direct_pay.credit_account('email@exemple.com', 2000)
    expect(success).to be_falsey
  end
end
