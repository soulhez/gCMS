require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: "Nazwa artykułu", text: "To jest przykładowy tekst artykułu")
  end

  test "article should be valid" do
    assert @article.valid?
  end

  test "title should be present" do
    @article.title = " "
    assert_not @article.valid?
  end

  test "text should be present" do
    @article.text = " "
    assert_not @article.valid?
  end

  test "title shouldn't be less than 5 characters" do
    @article.title = "a" * 4
    assert_not @article.valid?
  end

  test "title shouldn't be more than 64 characters" do
    @article.title = "b" * 65
    assert_not @article.valid?
  end

end
