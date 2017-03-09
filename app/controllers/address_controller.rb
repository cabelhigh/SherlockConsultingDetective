class AddressController < ApplicationController

  #  @wc = Address.where("address ~ '[0-9]WC'")
  def search
    session[:search] = "" if session[:search].nil?
    session[:search] = params[:search] unless params[:search].nil?
    @your_search = Address.where("\"search_string\" ~ '#{session[:search].downcase}'")
    render 'index.html.erb'
  end

  def show
    @a = Address.find(params[:id].to_i)
  end
end
