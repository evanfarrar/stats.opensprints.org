require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  context "on GET to edit" do
    setup do
      @user = Factory(:user)
      @controller.stubs(:current_user).returns(@user)
      get :edit, :id => @user.id
    end
    should_assign_to :user
  end
  context "on PUT to update" do
    setup do
      @user = Factory(:user, :group_name => "Your face")
      @controller.stubs(:current_user).returns(@user)
      post :update, :id => @user.id,
                    :user => {:group_name => "Mary's Mafia",
                              :country => "elbonia",
                              :website => "http://opensprints.org",
                              :description => "description",
                              :city_state => "city_state",
                              :upcoming_events => "tomorrow!"}
    end
    should_assign_to :user
    should "save a user based on the attributes" do
      user = assigns(:user)
      assert_equal "Mary's Mafia", user.group_name.to_s
      assert_equal "mary-s-mafia", user.group_name_for_url.to_s
      assert_equal "tomorrow!", user.upcoming_events.to_s
      assert_equal "elbonia", user.country.to_s
      assert_equal "http://opensprints.org", user.website.to_s
      assert_equal "description", user.description.to_s
      assert_equal "city_state", user.city_state.to_s
    end 
    should_redirect_to("show the user's profile") { profile_path(@user) }
  end

  context "on GET to show" do
    setup do
      @user = Factory(:user, :group_name => "Your face")
      @controller.stubs(:current_user).returns(@user)
      get :show, :id => @user.id
    end
    should_redirect_to("the group's permalink") { "/group/your-face" }
  end

  context "on GET to new" do
    setup do
      get :new
    end
    should_redirect_to("the new user page") { new_user_url }
  end

  context "on POST to create" do
    setup do
      post :create
    end
    should_redirect_to("the new user page") { new_user_url }
  end
end
