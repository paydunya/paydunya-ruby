module Paydunya
  class DirectPay < Paydunya::Checkout::Core
    def credit_account(payee_account, amount)
      payload = {
        account_alias: payee_account,
        amount: amount
      }

      result = send_post_request(Paydunya::Setup.direct_pay_credit_base_url, payload)
      push_results(result)
      result['response_code'] == '00'
    end
  end
end
