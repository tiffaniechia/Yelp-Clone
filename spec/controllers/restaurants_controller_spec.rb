require 'spec_helper'

describe "homepage" do
  before(:each) {Restaurant.create(:name => 'pancakes house')}

  it "should show list of restaurants" do
    visit '/restaurants'
    expect(page).to have_content('pancakes house')
  end  
end


describe "add restaurants/create" do 
  it "should be able to add restaurant" do 
    visit '/restaurants/new' 
    fill_in 'Name', with: 'mcdonalds'
    click_button 'Create Restaurant'
    # redirect_to 'restaurants/index' 
    expect(page).to have_content('mcdonalds')
  end

end  

describe "editing a restaurant" do 
  it "should be able to edit a restaurant" do 
    visit '/restaurants/new' 
    fill_in 'Name', with: 'mcdonalds'
    click_button 'Create Restaurant' 
    expect(page).to have_content('mcdonalds')
    click_link 'edit'
    expect(current_path).to eq('/restaurants/1/edit')
    fill_in 'Name', with: 'mcd'
    click_button 'Update Restaurant'
    expect(page).to have_content('mcd')
  end  
end  