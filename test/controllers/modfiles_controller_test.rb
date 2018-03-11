require 'test_helper'

class ModfilesControllerTest < ActionController::TestCase
  setup do
    @modfile = modfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modfile" do
    assert_difference('Modfile.count') do
      post :create, modfile: { file: @modfile.file, modfile: @modfile.modfile, sha1: @modfile.sha1 }
    end

    assert_redirected_to modfile_path(assigns(:modfile))
  end

  test "should show modfile" do
    get :show, id: @modfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modfile
    assert_response :success
  end

  test "should update modfile" do
    patch :update, id: @modfile, modfile: { file: @modfile.file, modfile: @modfile.modfile, sha1: @modfile.sha1 }
    assert_redirected_to modfile_path(assigns(:modfile))
  end

  test "should destroy modfile" do
    assert_difference('Modfile.count', -1) do
      delete :destroy, id: @modfile
    end

    assert_redirected_to modfiles_path
  end
end
