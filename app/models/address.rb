class Address < ApplicationRecord
  #has_paper_trail

  def to_s
    "#{self.name} -- #{self.address}"
  end

  #gets the clue in the current case that's associate with the address (if any)
  def get_clue_id
    current_case = Case.where("current = true").first.case_id
    return 0 if Clue.where(address: self.address, case_id: current_case).first.nil?
    Clue.where(address: self.address, case_id: current_case).first.id
  end

  def comma_name_swap
    swap = self.name.split(", ")
    ret = swap[0]
    swap[0]=swap[1]
    swap[1]=ret
    swap.join(" ")
  end
end
