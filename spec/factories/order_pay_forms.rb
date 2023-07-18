FactoryBot.define do
  factory :order_pay_form do
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number {'09012123434'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
