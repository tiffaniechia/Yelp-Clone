module ReviewsHelper

def star_rating(number)
  return number unless number.respond_to? :round
  average_number = number.round
  ('★' * average_number) + ('☆' * (5 - average_number))  
end  

end
