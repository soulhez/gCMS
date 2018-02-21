require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = Article.new(
      title: "Tytuł artykułu",
      text: "To jest przykładowa treść artykułu."
    )
  end

  it "is valid with title and text" do
    expect(@article).to be_valid
  end

  it "is invalid with blank title" do
    @article.title = " "
    expect(@article).not_to be_valid
  end

  it "is invalid with blank text" do
    @article.text = " "
    expect(@article).not_to be_valid
  end

  it "is invalid if title is less than 5 characters" do
    @article.title = "a" * 4
    expect(@article).not_to be_valid
  end

  it "is invalid if title is greater than 64 characters" do
    @article.title = "b" * 65
    expect(@article).not_to be_valid
  end

  # it "should have comments" do
  #  should have_many(:comments).dependent(:destroy)
  # end
end
