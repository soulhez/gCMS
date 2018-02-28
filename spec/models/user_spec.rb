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
      it " format email with regular expression" do
        # TODO: validate email format
      end
      it { should validate_uniqueness_of(:email).case_insensitive }
      it "downcase before saving in database" do
          # TODO: email must be lowercase before save
      end
    end

    describe "password" do
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(6) }
      it { should validate_length_of(:password).is_at_most(64) }
      it { should validate_confirmation_of(:password).with_message("Hasła nie pasują do siebie.") }

      it "encrypt password before save in database" do
        # TODO: password must be hashed before saving
      end

      # let(:temp) do
        # FactoryBot.build(:user)
      # end

      it "clear password after save in database" do
        # temp.save
        # expect(temp.password).to be_nil
        # TODO: set password to nil after save
      end

    end

    describe "password_confirmation" do
      it { should validate_presence_of(:password_confirmation) }
    end
  end

  describe "database" do
    it { should have_db_column(:name).of_type(:string).with_options(length: { minimum: 2, maximum: 64 }, presence: true) }
    it { should have_db_column(:email).of_type(:string).with_options(length: { minimum: 5, maximum: 64 }, presence: true, case_sensitive: false) }
    it { should have_db_column(:password).of_type(:string).with_options(length: { minimum: 6, maximum: 64 }, presence: true, confirmation: true) }
    it { should have_db_index(:email).unique(true) }
  end

end
