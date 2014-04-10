require 'spec_helper'

describe ReviewsHelper do
  
  describe "star_rating number to star" do 
    it "should return 5 empty stars if the star rating is 0" do 
      expect(star_rating(0)).to eq('☆☆☆☆☆')
    end  

    it "should return 5 full stars if the star rating is 5" do 
      expect(star_rating(5)).to eq('★★★★★')
    end  

    it "should return 3 full stars and 2 empty stars if the star rating is 3" do 
      expect(star_rating(3)).to eq('★★★☆☆')
    end  

  end  


end