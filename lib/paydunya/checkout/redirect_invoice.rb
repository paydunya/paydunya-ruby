module Paydunya
  module Checkout
    class Invoice < Paydunya::Checkout::Core
      attr_accessor :items, :total_amount, :taxes, :description, :currency, :store, :customer, :custom_data,
                    :cancel_url, :return_url, :callback_url, :invoice_url, :receipt_url

      def initialize
        super
        @items = {}
        @taxes = {}
        @channels = []
        @custom_data = {}
        @customer = {}
        @total_amount = 0.0
        @currency = 'fcfa'
        @store = Paydunya::Checkout::Store
        @return_url = @store.return_url
        @cancel_url = @store.cancel_url
        @callback_url = @store.callback_url
      end

      # Adds invoice items to the @items hash, the idea is to allow this function to be used in a loop
      def add_item(name, quantity, unit_price, total_price, description = '')
        @items.merge!({
                        "item_#{@items.size}": {
                          name: name,
                          quantity: quantity,
                          unit_price: unit_price,
                          total_price: total_price,
                          description: description
                        }
                      })
      end

      # Adds invoice tax to the @taxes hash, the idea is to allow this function to be used in a loop
      def add_tax(name, amount)
        @taxes.merge!({
                        "tax_#{@taxes.size}": {
                          name: name,
                          amount: amount
                        }
                      })
      end

      def add_channel(channel)
        @channels << channel
      end

      def add_channels(channels)
        @channels = []
        channels.each do |channel|
          @channels << channel
        end
      end

      def add_custom_data(key, value)
        @custom_data[key.to_s] = value
      end

      def get_items
        warn '[DEPRECATION] `get_items` is deprecated.  Please use `items` instead.'
        @items
      end

      def get_taxes
        warn '[DEPRECATION] `get_taxes` is deprecated.  Please use `taxes` instead.'
        @taxes
      end

      def get_customer_info(key)
        warn "[DEPRECATION] `get_customer_info(key)` is deprecated.  Please use `customer['some_key]` instead."
        @customer[key.to_s]
      end

      def get_custom_data(key)
        warn "[DEPRECATION] `get_custom_data(key)` is deprecated.  Please use `custom_data['some_key]` instead."
        @custom_data[key.to_s]
      end

      def confirm(token)
        result = send_get_request("#{Paydunya::Setup.checkout_confirm_base_url}#{token}")
        unless result.size > 0
          @response_text = 'Invoice Not Found'
          @response_code = 1002
          @status = Paydunya::FAIL
          return false
        end

        if result['status'] == 'completed'
          rebuild_invoice(result)
          @response_text = result['response_text']
          true
        else
          @status = result['status']
          @items = result['invoice']['items']
          @taxes = result['invoice']['taxes']
          @description = result['invoice']['description']
          @custom_data = result['custom_data']
          @total_amount = result['invoice']['total_amount']
          @response_text = "Invoice status is #{result['status'].upcase}"
          false
        end
      end

      def create
        result = send_post_request(Paydunya::Setup.checkout_base_url, build_invoice_payload)
        create_response(result)
      end

      protected

      def build_invoice_payload
        { invoice: {
          items: @items,
          taxes: @taxes,
          channels: @channels,
          total_amount: @total_amount,
          description: description
        },
          store: {
            name: @store.name,
            tagline: @store.tagline,
            postal_address: @store.postal_address,
            phone: @store.phone_number,
            logo_url: @store.logo_url,
            website_url: @store.website_url
          },
          custom_data: @custom_data,
          actions: {
            cancel_url: @cancel_url,
            return_url: @return_url,
            callback_url: @callback_url
          } }
      end

      def rebuild_invoice(result = {})
        @status = result['status']
        @customer = result['customer']
        @items = result['invoice']['items']
        @taxes = result['invoice']['taxes']
        @description = result['invoice']['description']
        @custom_data = result['custom_data']
        @total_amount = result['invoice']['total_amount']
        @receipt_url = result['receipt_url']
      end

      def create_response(result = {})
        @response_text = result['response_text']
        @response_code = result['response_code']
        @status = result['response_code'] == '00' ? Paydunya::SUCCESS : Paydunya::FAIL
        @invoice_url = result['response_code'] == '00' ? (result['invoice_token'] || result['response_text']) : nil
        result['response_code'] == '00'
      end
    end
  end
end
