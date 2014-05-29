FactoryGirl.define do
  factory :spree_store, class: Spree::Store do
    address1 '865 Market St'
    address2 ''
    city     'San Francisco'
    country  'United States of America'
    name     'Westfield San Francisco Centre'
    phone    '(415) 495-5656'
    state    'CA'
    website  'www.westfield.com'
    zip      '94103'
  end

end

