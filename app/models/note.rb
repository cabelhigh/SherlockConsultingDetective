class Note < ApplicationRecord
  #has_paper_trail
  validates :text, length: {minimum: 2}
end
