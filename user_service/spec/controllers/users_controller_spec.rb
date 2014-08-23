require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let!(:user) { User.create(email: "foo@bar.com") }

  describe "#find" do
    it "finds a user by email" do    
      get :find, email: "foo@bar.com", format: :json
      expect(JSON.parse(response.body)["email"]).to eq("foo@bar.com")
      expect(response.status).to eq 200
    end
  end

  describe "#show" do
    it "finds a user by id" do
      get :show, id: user.id, format: :json
      expect(JSON.parse(response.body)["email"]).to eq("foo@bar.com")
      expect(response.status).to eq 200
    end
  end

  describe "#update" do
    it "updates a user" do
      put :update, { id: user.id, user: { email: "bar@baz.com" }, format: :json }
      expect(User.find(user.id).email).to eq("bar@baz.com")
      expect(response.status).to eq 204
    end
  end

  describe "#create" do
    it "creates a user" do
      post :create, { user: { email: "new@bar.com" }, format: :json }
      expect(User.last.email).to eq("new@bar.com")
      expect(response.status).to eq 201
    end

    it "creates and encrypts a password" do
      post :create, { user: { email: "new_with_pw@bar.com", password: "test_pw" }, format: :json }
      expect(User.last.email).to eq("new_with_pw@bar.com")
      expect(response.status).to eq 201
      expect(User.last.password_matches?("test_pw")).to be
    end
  end

  describe "#destroy" do
    it "destroys an existing user" do
      expect { delete :destroy, { id: user.id, format: :json } }.to change { User.count}.by(-1)
      expect { User.find(user.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end