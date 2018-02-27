require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    FactoryBot.create(:user)
  end

  describe "validation" do
    describe "name" do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_least(2) }
      it { should validate_length_of(:name).is_at_most(64) }
    end

    describe "email" do
      it { should validate_presence_of(:email) }
      it { should validate_length_of(:email).is_at_least(5) }
      it { should validate_length_of(:email).is_at_most(64) }
      # TODO: email format
      it { should validate_uniqueness_of(:email).case_insensitive }
    end

    describe "password" do
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(6) }
      it { should validate_length_of(:password).is_at_most(64) }
      it { should validate_confirmation_of(:password) }
    end

    describe "password_confirmation" do
      it { should validate_presence_of(:password_confirmation) }
    end
  end

end
