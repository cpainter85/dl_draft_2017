class User < ApplicationRecord
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def team_abbr
    self[:team_abbr].try(:upcase) || team_name.split(' ').map(&:first).reject {|char| char.upcase != char }.join('') 
  end
end
