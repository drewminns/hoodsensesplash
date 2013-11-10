# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :registrant do
    email "MyString"
    is_confirmed false
  end
end
