class ClueController < ApplicationController

  def show
  a = Address.find(params[:id].to_i)
  a.visited = true
  a.save
  return redirect_to '/search', params: 'params[:search]' if a.get_clue_id == 0
  a
  end

end
