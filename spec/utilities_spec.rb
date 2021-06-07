require 'spec_helper'

describe Paydunya::Utilities do
  let(:utilities) { Class.new { extend Paydunya::Utilities } }

  before do
    Paydunya::Setup.master_key = fake_access_keys[:master_key]
    Paydunya::Setup.public_key = fake_access_keys[:public_key]
    Paydunya::Setup.private_key = fake_access_keys[:private_key]
    Paydunya::Setup.mode = 'test'
    Paydunya::Setup.token = fake_access_keys[:token]
  end

  it 'should send a get request' do
    fake_url = "#{urls[:root_url]}/fake"
    stub_request(:get, fake_url)
      .with(
        headers: fake_headers
      )
      .to_return(body: '{}', status: 200, headers: {})
    response = utilities.send_get_request(fake_url)
    expect(response).to eq({})
  end

  it 'should send a post request and return some data' do
    fake_url = "#{urls[:root_url]}/fake"
    stub_request(:post, fake_url)
      .with(
        body: { data: 'fake' },
        headers: fake_headers
      )
      .to_return(body: '{}', status: 200, headers: {})
    response = utilities.send_post_request(fake_url, { data: 'fake' })
    expect(response).to eq({})
  end

  it 'should return a Faraday::Connection Object' do
    connection = utilities.connection
    expect(connection).to be_a Faraday::Connection
  end
end
