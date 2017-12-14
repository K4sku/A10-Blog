require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest

  test 'login and create new article' do
  visit login_path
  fill_in 'email', with: users(:jake).email
  fill_in 'password', with: default_password
  click_on 'Login'
  # Login and check if redirected to user index path
  assert_equal user_path(users(:jake).id), current_path

  click_on 'New article'
  fill_in 'Title', with: 'Car vs Cobra Attack Helicopter'
  fill_in 'Description', with: 'Supercars race helicopters sometimes,
                                fun stuff and all. This need to be over
                                100 characters long. This is 187 char long.'
  check 'Cars'
  check 'Helicopters'
  click_on 'Create Article'

  # Create article and check if redirected to article show path
  assert_current_path article_path(Article.last)
    # puts page.body

  end
end