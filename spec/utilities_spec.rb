describe Paydunya::Utilities do
  let(:utilities) { Class.new { extend Paydunya::Utilities } }

  it 'should send a post request and return data given an URL and payload' do
    fake_url = 'https://fake.paydunya.com/'
    stub_request(:post, fake_url)
      .with(
        body: '{}',
        headers: { 'Accept' => '*/*',
                   'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                   'Content-Type' => 'application/json',
                   'User-Agent' => 'Paydunya Checkout API Ruby client v1 aka Neptune',
                   'PAYDUNYA-PUBLIC-KEY' => fake_access_keys[:public_key],
                   'PAYDUNYA-PRIVATE-KEY' => fake_access_keys[:private_key],
                   'PAYDUNYA-MASTER-KEY' => fake_access_keys[:master_key],
                   'PAYDUNYA-TOKEN' => fake_access_keys[:token],
                   'PAYDUNYA-MODE' => 'test' }
      )
      .to_return(body: '{}', status: 200, headers: {})
    response = utilities.http_json_request(fake_url, {})
    expect(response).to eq({})
  end

  it 'should send a get request and return some data given a URL' do
    fake_url = 'https://fake.paydunya.com/'
    stub_request(:get, fake_url)
      .with(
        headers: { 'Accept' => '*/*',
                   'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                   'User-Agent' => 'Paydunya Checkout API Ruby client v1 aka Neptune',
                   'PAYDUNYA-PUBLIC-KEY' => fake_access_keys[:public_key],
                   'PAYDUNYA-PRIVATE-KEY' => fake_access_keys[:private_key],
                   'PAYDUNYA-MASTER-KEY' => fake_access_keys[:master_key],
                   'PAYDUNYA-TOKEN' => fake_access_keys[:token],
                   'PAYDUNYA-MODE' => 'test' }
      )
      .to_return(body: '{}', status: 200, headers: {})
    response = utilities.http_get_request(fake_url)
    expect(response).to eq({})
  end
end
