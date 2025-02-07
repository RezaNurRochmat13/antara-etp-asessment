class PalindromesController < ApplicationController
    def index
      @result = nil
    end
  
    def check
      input = params[:word].to_s.strip.downcase
      Rails.logger.info "Received input: #{input}" # Debugging log
  
      is_palindrome = input == input.reverse
      @result = is_palindrome ? "#{input} is a palindrome!" : "#{input} is NOT a palindrome."
  
      Rails.logger.info "Palindrome check result: #{@result}" # Debugging log
  
      render :index
    end
end
  