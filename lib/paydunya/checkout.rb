module Paydunya
  module Checkout
    class Core
      include Paydunya::Utilities
      attr_accessor :status, :response_text, :response_code, :transaction_id, :description, :token, :result

      def push_results(result={})
        @result = result
        @transaction_id = result["transaction_id"]
        @description = result["description"]
        @response_code = result["response_code"]
        @response_text = result["response_text"]
        @token = result["token"]
        @response_code == "00" ? @status = Paydunya::SUCCESS : @status = Paydunya::FAIL
      end
    end
  end
end

%w(checkout/redirect_invoice
  checkout/onsite_invoice
  checkout/store
).each do |lib|
  require File.join(File.dirname(__FILE__), lib)
end