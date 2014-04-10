require 'spec_helper'

describe ReviewsController do

   before(:each) {Restaurant.create(:name => 'mcdonalds',
                                    :location => 'london',
                                    :category => 'fastfood')}

  describe "reviews " do 
    it "should be able to set reviews" do 
      visit '/restaurants' 
      click_link  'add review'
      # save_and_open_page
      expect(current_path).to eq('/restaurants/1/reviews/new')
      fill_in 'Comment', with: 'whyyyyy'
      select '4', from: 'Rating'
      click_button 'Create Review'
      expect(page).to have_content('4')
    end  

    it "should be able to average reviews" do 
      visit '/restaurants' 
      click_link  'add review'
      fill_in 'Comment', with: 'whyyyyy'
      select '4', from: 'Rating'
      click_button 'Create Review'
      expect(page).to have_content('4')
      click_link  'add review'
      fill_in 'Comment', with: 'meh'
      select '2', from: 'Rating'
      click_button 'Create Review'
      expect(page).to have_content('3')
    end  


    it "should display errors if bad data is given" do 
      visit '/restaurants' 
      click_link  'add review'
      expect(current_path).to eq('/restaurants/1/reviews/new')
      click_button 'Create Review'
      expect(current_path).to eq('/restaurants/1/reviews')
      expect(page).to have_content('error')
    end  


  end  

end
