class NoteController < ApplicationController
  def new
  end

  def create
    @note=Note.new
    @note.text = parseText(params[:note])
    @note.save
    render "show.html.erb"
  end

  def show
  end

  def edit
  end

  def parseText(text)
    spl = text.split(" ")
    out = ""
    spl.each_with_index.map do |word, i|
      if word =~ /[0-9][a-z]|[0-9][A-Z]/ #it's an address
        potAddress = Address.where(address: word.upcase).first #potential Address
        word= "<a href='/clues/#{potAddress.id}' title='#{potAddress.comma_name_swap}'>#{word}</a>" if !potAddress.nil? #if an address matches, make it a link
      elsif !Address.where(last_name: word.camelcase).empty?
        potAddresses = Address.where(last_name: word.camelcase) #list of potential addresses
        address=potAddresses.first #defaults address to the first
        if potAddresses.size>1 && i-1>=0 #if there are multiple names that match AND there is a first name in the previous word
          address=Address.where(first_name: spl[i-1].camelcase, last_name: word.camelcase).first unless Address.where(first_name: spl[i-1].camelcase, last_name: word.camelcase).empty? #checks if the previous word is a first name, and if the first name and last name match more specific address, set address to it
        end
        puts address
        word= "<a href='/clues/#{address.id}' title='#{address.comma_name_swap}, #{address.address}'>#{word}</a>"

      else
        word
      end
    end.join(" ")
  end
end
