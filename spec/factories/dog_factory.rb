FactoryGirl.define do  

  factory :dog do
  		name "Fluffy"
  		email "fluffster@aol.com"
  		password "testtest"
  		birthday Time.now-3.years
  		city "New York"
  		state "NY"
  end

end