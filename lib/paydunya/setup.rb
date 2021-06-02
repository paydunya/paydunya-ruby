module Paydunya
  module Setup
    class << self
      attr_accessor :root_url, :master_key, :private_key, :public_key, :token, :mode
    end

    self.root_url = 'https://app.paydunya.com'

    self.mode = 'test'

    def self.checkout_base_url
      "#{mode == 'live' ? '/api' : '/sandbox-api'}/v1/checkout-invoice/create"
    end

    def self.checkout_confirm_base_url
      "#{mode == 'live' ? '/api' : '/sandbox-api'}/v1/checkout-invoice/confirm/"
    end

    def self.opr_base_url
      "#{mode == 'live' ? '/api' : '/sandbox-api'}/v1/opr/create"
    end

    def self.opr_charge_base_url
      "#{mode == 'live' ? '/api' : '/sandbox-api'}/v1/opr/charge"
    end

    def self.direct_pay_credit_base_url
      "#{mode == 'live' ? '/api' : '/sandbox-api'}/v1/direct-pay/credit-account"
    end
  end
end
