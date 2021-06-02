module Paydunya
  module Utilities

    def connection
      Faraday.new(url: Paydunya::Setup.root_url,
                  ssl: { verify: false },
                  headers: {
                    'User-Agent' => 'Paydunya Checkout API Ruby client v1 aka Neptune',
                    'PAYDUNYA-PUBLIC-KEY' => Paydunya::Setup.public_key,
                    'PAYDUNYA-PRIVATE-KEY' => Paydunya::Setup.private_key,
                    'PAYDUNYA-MASTER-KEY' => Paydunya::Setup.master_key,
                    'PAYDUNYA-TOKEN' => Paydunya::Setup.token,
                    'PAYDUNYA-MODE' => Paydunya::Setup.mode
                  })
    end

    def send_post_request(url, payload = {})
      JSON.parse connection.post(url, payload).body
    end

    def send_get_request(url, params = nil)
      JSON.parse connection.get(url, params).body
    end
  end
end
