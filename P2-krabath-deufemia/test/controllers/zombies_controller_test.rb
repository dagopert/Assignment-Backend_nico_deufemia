require 'test_helper'

class ZombiesControllerTest < ActionController::TestCase
  setup do
    @zombie = zombies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zombies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zombie" do
    assert_difference('Zombie.count') do
      post :create, zombie: { Day_Of_Death: @zombie.Day_Of_Death, Description: @zombie.Description, Graveyard: @zombie.Graveyard, Name: @zombie.Name, No_Of_Arms: @zombie.No_Of_Arms }
    end

    assert_redirected_to zombie_path(assigns(:zombie))
  end

  test "should show zombie" do
    get :show, id: @zombie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zombie
    assert_response :success
  end

  test "should update zombie" do
    patch :update, id: @zombie, zombie: { Day_Of_Death: @zombie.Day_Of_Death, Description: @zombie.Description, Graveyard: @zombie.Graveyard, Name: @zombie.Name, No_Of_Arms: @zombie.No_Of_Arms }
    assert_redirected_to zombie_path(assigns(:zombie))
  end

  test "should destroy zombie" do
    assert_difference('Zombie.count', -1) do
      delete :destroy, id: @zombie
    end

    assert_redirected_to zombies_path
  end
end
