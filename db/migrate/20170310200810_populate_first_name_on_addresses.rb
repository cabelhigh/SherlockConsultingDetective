class PopulateFirstNameOnAddresses < ActiveRecord::Migration[5.0]
  #run rake db:migrate to update table
  #if this fucks everything up, run rake db:rollback
  def change
    Address.all.each do |a|
      a2 = a
      a2.first_name = a2.last_name = "" #default
      a2.first_name = a.name.split(", ")[1] if !a.name.split(", ")[1].nil? #adds the words after the comma as first_name
      a2.last_name = a.name.split(", ")[0] if !a.name.split(", ")[0].nil? #adds the words after the comma as first_name
      a2.save
    end
  end
end
