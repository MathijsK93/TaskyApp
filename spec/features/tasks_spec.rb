require 'spec_helper'

describe "creating new task", :type => :feature do
  it "signs me in" do
      fill_in 'new_task_name', :with => 'user@example.com'

    click_button 'Toevoegen'
    expect(page).to have_content 'Success'
  end
end