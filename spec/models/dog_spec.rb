require 'rails_helper'

RSpec.describe Dog, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  let(:dog) {FactoryGirl.build(:dog) }

  describe "is invalid without a " do 

  #	let(:dog){ Dog.new(valid_attributes)}  changing over to use FactoryGirl

  	it "name" do
  		dog.name = nil #break it
  		expect(dog).to be_invalid
  	end

  	it "email" do
  		dog.email = nil
  		expect(dog).to be_invalid
  	end

  	it "birthday" do
  		dog.birthday = nil
  		expect(dog).to be_invalid
  	end

  	it "city" do
  		dog.city = nil
  		expect(dog).to be_invalid
  	end

  	it "state" do
  		dog.state = nil
  		expect(dog).to be_invalid
  	end

  	it "must have a unique email" do
  		FactoryGirl.create(:dog)
  		#dog = Dog.create!(attributes_for(dog))
  		#dog2 = Dog.new(attributes_for(dog))
  		#expect(dog2).to be_invalid
  		expect(dog).to be_invalid
  		Dog.destroy_all
  	end

  	it ".newsletter_subscribers" do
  		#dog = Dog.new(valid_attributes)
  		dog.newsletter = true 
  		dog.save! 
  		expect(Dog.newsletter_subscribers).to eq([dog]) #include(dog) also works
  	end

  	describe "#" do
  	#	let(:dog){ Dog.new(valid_attributes)}

  		it "#birthday?" do
  			expect(dog.birthday?).to eq(true)
  			# expect(dog).to be_birthday    #can be written this way
  		end

  		it "#age" do 
  			expect(dog.age).to eq(3)
  		end

  		it "#location" do
  			expect(dog.location).to eq("New York, NY")
  		end

  		it "#puppy?" do
  			expect(dog.puppy?).to eq(false)  #to_not be_puppy
  		end

  		it "age_in_dog_years" do 
  			expect(dog.age_in_dog_years).to eq(21)
  		end

  		it "subscribe_to_newsletter!" do
  			dog.subscribe_to_newsletter
  			expect(dog.newsletter).to eq(true)
  		end

  		it "unsubscribe_from_newsletter" do
  			dog.unsubscribe_from_newsletter
  			expect(dog.newsletter).to eq(false) #.to be false  works too!
  		end

  	end

  end

end
