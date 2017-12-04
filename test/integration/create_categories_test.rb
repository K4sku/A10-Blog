require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'johndoe', email: 'johndoe@example.com', password: 'password', admin: true)
  end

  test 'Get new create form and create category' do
    sign_in_as(@user, 'password')
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'sports' } }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body

  end

  test 'Invalid category submission results in failure' do
    sign_in_as(@user, 'password')
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: '' } }
    end
    assert_template 'categories/new'
    assert_select 'div.alert-warning'
    assert_select 'h2.alert-heading'
  end


end