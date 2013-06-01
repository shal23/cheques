# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cheque do
    amount "MyString"
    drawer "MyString"
    payee "MyString"
  end
end
