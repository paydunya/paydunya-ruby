module Paydunya
  module Utilities
    def http_json_request(baseurl,payload={})
      conn = Faraday.new(:url => baseurl, :ssl => {:verify => false}) do |faraday|
        faraday.request  :json
        faraday.adapter  Faraday.default_adapter
      end

      result = conn.post do |req|
        req.headers["User-Agent"] = "Paydunya Checkout API Ruby client v1 aka Neptune"
        req.headers['PAYDUNYA-PUBLIC-KEY'] = Paydunya::Setup.public_key
        req.headers['PAYDUNYA-PRIVATE-KEY'] = Paydunya::Setup.private_key
        req.headers['PAYDUNYA-MASTER-KEY'] = Paydunya::Setup.master_key
        req.headers['PAYDUNYA-TOKEN'] = Paydunya::Setup.token
        req.headers['PAYDUNYA-MODE'] = Paydunya::Setup.mode
        req.body = hash_to_json payload
      end
      json_to_hash(result.body)
    end

    def http_get_request(baseurl)
      conn = Faraday.new(:url => baseurl, :ssl => {:verify => false})

      result = conn.get do |req|
        req.headers["User-Agent"] = "Paydunya Checkout API Ruby client v1 aka Neptune"
        req.headers['PAYDUNYA-PUBLIC-KEY'] = Paydunya::Setup.public_key
        req.headers['PAYDUNYA-PRIVATE-KEY'] = Paydunya::Setup.private_key
        req.headers['PAYDUNYA-MASTER-KEY'] = Paydunya::Setup.master_key
        req.headers['PAYDUNYA-TOKEN'] = Paydunya::Setup.token
        req.headers['PAYDUNYA-MODE'] = Paydunya::Setup.mode
      end

      json_to_hash(result.body)
    end

    def hash_to_json(params={})
      MultiJson.dump params
    end

    def json_to_hash(params={})
      MultiJson.load params
    end
  end
end