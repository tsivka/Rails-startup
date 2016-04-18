require 'test_helper'

class TreatmenttypesControllerTest < ActionController::TestCase
  setup do
    @treatmenttype = treatmenttypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treatment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treatmenttype" do
    assert_difference('Treatmenttype.count') do
      post :create, treatmenttype: { name: @treatmenttype.name }
    end

    assert_redirected_to treatmenttype_path(assigns(:treatmenttype))
  end

  test "should show treatmenttype" do
    get :show, id: @treatmenttype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treatmenttype
    assert_response :success
  end

  test "should update treatmenttype" do
    patch :update, id: @treatmenttype, treatmenttype: { name: @treatmenttype.name }
    assert_redirected_to treatmenttype_path(assigns(:treatmenttype))
  end

  test "should destroy treatmenttype" do
    assert_difference('Treatmenttype.count', -1) do
      delete :destroy, id: @treatmenttype
    end

    assert_redirected_to treatmenttypes_path
  end
end
