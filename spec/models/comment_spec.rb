require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "association" do
    it { should belong_to(:article) }
  end

  # TODO: Refactoring code below
  describe "comments descending" do
    it { expect(Comment.all.to_sql).to eq Comment.all.order(created_at: :desc).to_sql }
  end
end
