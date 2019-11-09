class Voter < ApplicationRecord
  before_save :capitalize_usn

  private

  def capitalize_usn
    usn.upcase!  
  end
end
