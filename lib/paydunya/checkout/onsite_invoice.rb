module Paydunya
  module Onsite
    class Invoice < Paydunya::Checkout::Invoice
      attr_accessor :invoice_token

      def charge(opr_token, confirm_token)
        result = send_post_request(Paydunya::Setup.opr_charge_base_url, {
                                     token: opr_token,
                                     confirm_token: confirm_token
                                   })
        rebuild_invoice(result['invoice_data']) if result['response_code'] == '00'
        @response_code = result['response_code']
        @response_text = result['response_text']
        result['response_code'] == '00'
      end

      def create(account_alias)
        result = send_post_request(Paydunya::Setup.opr_base_url, {
                                     invoice_data: build_invoice_payload,
                                     opr_data: {
                                       account_alias: account_alias
                                     }
                                   })
        create_response(result)
      end
    end
  end
end
