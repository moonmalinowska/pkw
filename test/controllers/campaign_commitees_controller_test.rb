require 'test_helper'

class CampaignCommiteesControllerTest < ActionController::TestCase
  setup do
    @campaign_commitee = campaign_commitees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campaign_commitees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campaign_commitee" do
    assert_difference('CampaignCommitee.count') do
      post :create, campaign_commitee: { logo: @campaign_commitee.logo, name: @campaign_commitee.name, party: @campaign_commitee.party }
    end

    assert_redirected_to campaign_commitee_path(assigns(:campaign_commitee))
  end

  test "should show campaign_commitee" do
    get :show, id: @campaign_commitee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campaign_commitee
    assert_response :success
  end

  test "should update campaign_commitee" do
    patch :update, id: @campaign_commitee, campaign_commitee: { logo: @campaign_commitee.logo, name: @campaign_commitee.name, party: @campaign_commitee.party }
    assert_redirected_to campaign_commitee_path(assigns(:campaign_commitee))
  end

  test "should destroy campaign_commitee" do
    assert_difference('CampaignCommitee.count', -1) do
      delete :destroy, id: @campaign_commitee
    end

    assert_redirected_to campaign_commitees_path
  end
end
