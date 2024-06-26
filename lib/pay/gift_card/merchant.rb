module Pay
  module GiftCard
    class Merchant
      attr_reader :pay_merchant
      delegate :processor_id, to: :pay_merchant

      def initialize(pay_merchant)
        @pay_merchant = pay_merchant
      end

      def create_account(**options)
        fake_account = Struct.new(:id).new("gift_card_account_id")
        pay_merchant.update(processor_id: fake_account.id)
        fake_account
      end

      def account_link(refresh_url:, return_url:, type: "account_onboarding", **options)
        Struct.new(:url).new("/gift_card/account_link")
      end

      def login_link(**options)
        Struct.new(:url).new("/gift_card/login_link")
      end
    end
  end
end
