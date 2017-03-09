class ClueController < ApplicationController

  def show
  return redirect_to '/search', params: 'params[:search]' if params[:id].to_i == 0
  puts "WORK PLZ #{params[:id].to_i}"
  @clue = Clue.find(params[:id].to_i)
  end

end
