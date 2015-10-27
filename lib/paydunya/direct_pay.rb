module Paydunya
  class DirectPay < Paydunya::Checkout::Core

    def credit_account(payee_account,amount)
      payload = {
        :account_alias => payee_account,
        :amount => amount
      }

      result = http_json_request(Paydunya::Setup.direct_pay_credit_base_url,payload)
      if result["response_code"] == "00"
        push_results(result)
        true
      else
        push_results(result)
        false
      end
    end
  end
end