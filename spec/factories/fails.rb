# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fail do
    name "MyString"
    description "MyString"
    lesson "MyString"
    user_id 1
  end
end
