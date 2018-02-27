require 'rails_helper'

RSpec.describe Article, type: :model do

  before do
    FactoryBot.build(:article)
  end

  describe "validation" do
    describe "title" do
      it { should validate_presence_of(:title) }
      it { should validate_length_of(:title).is_at_least(5) }
      it { should validate_length_of(:title).is_at_most(64) }
    end

    describe "text" do
      it { should validate_presence_of(:text) }
    end
  end

  describe "association" do
    describe "comments" do
      it { should have_many(:comments) }
      it { should have_many(:comments).dependent(:destroy) }
    end
  end

  describe "db columns" do
    it { should have_db_column(:title).of_type(:string).with_options(length: { minimum: 5, maximum: 64 }, presence: true) }
    it { should have_db_column(:text).of_type(:text).with_options(presence: true) }
  end
end
