FactoryGirl.define do
  factory :event do
    name %w[birthday, wedding, baby shower, christmas].sample
    sequence(:description) {|n| "Generic description #{n}"}
    event_date "2014-07-03"
  end

  factory :user do
    first_name 'Foo'
    last_name 'Bar'
    sequence(:email) {|n| "foo#{n}@example.com"}
    password '123456789foobar'

  end

end
