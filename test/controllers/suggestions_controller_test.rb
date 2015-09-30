require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase
  setup do
    @suggestion = suggestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suggestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suggestion" do
    assert_difference('Suggestion.count') do
      post :create, suggestion: { avatar_content_type: @suggestion.avatar_content_type, avatar_file_name: @suggestion.avatar_file_name, avatar_file_size: @suggestion.avatar_file_size, avatar_updated_at: @suggestion.avatar_updated_at, category: @suggestion.category, city: @suggestion.city, created_at: @suggestion.created_at, packing_list: @suggestion.packing_list, slug: @suggestion.slug, state: @suggestion.state, updated_at: @suggestion.updated_at }
    end

    assert_redirected_to suggestion_path(assigns(:suggestion))
  end

  test "should show suggestion" do
    get :show, id: @suggestion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suggestion
    assert_response :success
  end

  test "should update suggestion" do
    patch :update, id: @suggestion, suggestion: { avatar_content_type: @suggestion.avatar_content_type, avatar_file_name: @suggestion.avatar_file_name, avatar_file_size: @suggestion.avatar_file_size, avatar_updated_at: @suggestion.avatar_updated_at, category: @suggestion.category, city: @suggestion.city, created_at: @suggestion.created_at, packing_list: @suggestion.packing_list, slug: @suggestion.slug, state: @suggestion.state, updated_at: @suggestion.updated_at }
    assert_redirected_to suggestion_path(assigns(:suggestion))
  end

  test "should destroy suggestion" do
    assert_difference('Suggestion.count', -1) do
      delete :destroy, id: @suggestion
    end

    assert_redirected_to suggestions_path
  end
end
