class ClueController < ApplicationController

  def show
  if is_i? params[:id]
    a = Address.find(params[:id].to_i)
  else
    a = Address.find_by_address(params[:id])
  end
  a.visited = true
  a.save
  return redirect_to '/search', params: 'params[:search]' if a.get_clue_id == 0
  @clue = Clue.find(a.get_clue_id)
  end

  def is_i? str
     /\A[-+]?\d+\z/ === str
  end

end
