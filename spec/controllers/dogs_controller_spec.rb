require 'rails_helper'

RSpec.describe DogsController, :type => :controller do

	let(:valid_attributes) {
		@valid_attributes = {
			name: "fluffy",
			email: "fluffster@aol.com",
			password: "testtest",
			password_confirmation: "testtest",
			birthday: Time.now - 3.years,
			city: "New York",
			state: "NY",
			newsletter: true
		}
	}

	let(:invalid_attributes) {
		@invalid_attributes = {
			email: nil
		}
	}

	let(:valid_session) {  {dog_id: 1} }

	describe "GET index" do
		it "returns http success" do
			get :index
			expect(response).to be_success
		end

		it "assigns all dogs as @dogs" do
			dog = Dog.create! valid_attributes
			get :index, {}, valid_session
			expect(assigns(:dogs)).to eq([dog])
		end
	end

	describe "GET show" do
		it "assigns the requested dog as @dog" do 
			dog = Dog.create! valid_attributes
			get :show, {id: dog.to_param}, valid_session
			expect(assigns(:dog)).to eq(dog)
		end
	end

	describe "GET new" do
		it "assigns a new dog as @dog" do
			get :new, {}, valid_attributes 
			expect(assigns(:dog)).to be_a_new(Dog)  #A new instance of the Dog Class - this is new
		end
	end

	describe "GET edit" do 
		it "assigns the requested dog as @dog" do
			dog = Dog.create! valid_attributes
			get :edit, {id: dog.to_param}, valid_session
			expect(assigns(:dog)).to eq(dog)
		end
	end

	describe "DELETE destroy" do
		it "destroys the requested dog" do
			dog = Dog.create! valid_attributes
			expect {
				delete :destroy, {id: dog.to_param}, valid_session
			}.to change(Dog, :count).by(-1)		
		end

		it "redirects to the dogs list" do
			dog = Dog.create! valid_attributes
			delete :destroy, {id: dog.to_param}, valid_session
			expect(response).to redirect_to(dogs_url)
		end
	end

	describe "POST create" do
		describe "with valid params" do
			it "creates a new dog" do
				expect {
					post :create, {dog: valid_attributes}, valid_session
				}.to change(Dog, :count).by(1)
			end

			it "assigns a newly created dog as @dog" do
				post :create, {dog: valid_attributes}, valid_session
				expect(assigns(:dog)).to be_a(Dog)
				expect(assigns(:dog)).to be_persisted #in rails you can use persisted? Here we can use be_ 
			end

			it "redirects to the created dog" do
				#dog = Dog.create! valid_attributes
				post :create, {dog: valid_attributes}, valid_session
				expect(response).to redirect_to (Dog.last)  #dog_path(1))
			end
		end

		describe "with invalid params" do
			it "assigns a newly created but unsaved dog as @dog" do
				expect {
					post :create, {dog: invalid_attributes}, valid_session
				}.to change(Dog, :count).by(0)

				#expect(assigns(:dog)).to be_a_new(Dog)  will work as well
			end

			it "re-renders the 'new' template" do
				#dog = Dog.create! valid_attributes
				post :create, {dog: invalid_attributes}, valid_session
				expect(response).to render_template(:new)

			end
		end
	end


	describe "PUT update" do 
		describe "with valid params" do
			let (:new_attributes) {
				@valid_attributes = {
				name: "Spot",
				email: "Spot@aol.com",
				password: "testtest",
				password_confirmation: "testtest",
				birthday: Time.now - 3.years,
				city: "New York",
				state: "NY",
				newsletter: true
			}
		}

			it "updates the requested dog" do 
				dog = Dog.create! valid_attributes
				put :update, {id: dog.to_param, dog: new_attributes}, valid_session
				dog.reload 
				# expect {
				# 	post :update, {:dog.id}, valid_session
				# 	}.to change(Dog, :count).by(0) 
				# expect(???).to ??
				expect(assigns(:update)).to eq(@dog)
			end

			it "assigns the requested dog as @dog" do
				dog = Dog.create! valid_attributes
				put :update, {id: dog.to_param, dog: new_attributes}, valid_session

				#put :update, {dog: valid_attributes}, valid_session
				expect(assigns(:dog)).to eq(dog)
				#expect(assigns(:dog)).to be_persisted
			end

			it "redirects to the dog" do
				dog = Dog.create! valid_attributes
				put :update, {id: dog.to_param, dog: new_attributes}, valid_session

				#put :update, {dog: valid_attributes}, valid_session
				expect(response).to redirect_to (dog)
			end
		end

		describe "with invalid params" do
			it "assigns the dog as @dog" do
				dog = Dog.create! valid_attributes
				put :update, {id: dog.to_param, dog: invalid_attributes}, valid_session

				expect(assigns(:dog)).to eq(dog)
				# expect {
				# 	put :update, {dog: invalid_attributes}, valid_session
				# }.to change(Dog, :count).by(0)
			end

			it "re-renders the 'edit' template" do
				dog = Dog.create! valid_attributes
				put :update, {id: dog.to_param, dog: invalid_attributes}, valid_session

				expect(response).to render_template (:edit)

			end
		end

	end

end












