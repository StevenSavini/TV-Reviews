# Acceptance Criteria
# [ ] Navigate to Profile page and see button to change profile picture
# [ ] Click button and see form to add new picture
# [ ] See default picture options on form
# [ ] Add profile picture to form
# [ ] Save form and see profile picture on Profile Page (redirect to there)

feature "user adds profile picture to account" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)
  end

  scenario "see Change Picture button on Profile page" do
    visit user_path(@user)

    click_link "Change Picture"

    expect(page).to have_content("Choose or upload profile picture")
    expect(current_path).to eq edit_user_path(@user)
  end

  scenario "sees form to add new photo from file" do
    visit edit_user_path(@user)

    expect(page).to have_content("Add new photo from file")
  end

  scenario "adds new photo from file" do
    visit edit_user_path(@user)

    attach_file :user_avatar, "#{Rails.root}/spec/support/images/photo.png"

    click_button "Update User"

    expect(page).to have_content("Profile picture saved successfully.")
    expect(page).to have_css("img[src*='photo.png']")
  end

  scenario "adds incorrect file" do
    visit edit_user_path(@user)

    attach_file :user_avatar, "#{Rails.root}/spec/support/images/testdoc.pages"

    click_button "Update User"

    expect(page).to have_content("Please upload a file format of jpg, jpeg, png,
                                  or gif")
  end

  scenario "selects new default avatar" do
    visit edit_user_path(@user)

    expect(page).to have_content("Change default avatar image")
    previous_avatar = @user.avatar

    click_button "Save"

    expect(@user.avatar).to_not eq(previous_avatar)
    expect(@user.avatar).to eq(Avatars.all[0])
  end

end
