class PalindromesController < ApplicationController
    def index
      @result = params[:result]
    end
  
    def check
      input = params[:word].to_s.strip.downcase
  
      is_palindrome = input == input.reverse
      result = is_palindrome ? "#{input} is a palindrome!" : "#{input} is NOT a palindrome."
  
      redirect_to root_path(result: result)
    end
end
  