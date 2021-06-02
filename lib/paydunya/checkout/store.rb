module Paydunya
  module Checkout
    module Store
      class << self
        attr_accessor :name, :tagline, :postal_address, :phone_number,
                      :website_url, :logo_url, :cancel_url, :return_url, :callback_url
      end

      self.name = 'Untitled Store'
    end
  end
end
