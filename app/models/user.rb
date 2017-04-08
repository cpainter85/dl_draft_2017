class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_numericality_of :finals_order, greater_than_or_equal_to: 0
  validates_numericality_of :semifinals_order, greater_than_or_equal_to: 0

  has_many :draft_picks
  has_many :categories, through: :draft_picks
  has_many :votes

  scope :finalists, -> { where('finals_order > ?', 0).order(:finals_order) }
  scope :semifinalists, -> { where('semifinals_order > ?', 0).order(:semifinals_order) }

  def default_round
    self.draft_picks.empty? ? 1 : (self.draft_picks.size/2)+1
  end

  def first_pick_of_round(round_num)
    self.ordered_picks(round_num).first
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_finalist?
    finals_order > 0
  end

  def is_semifinalist?
    semifinals_order > 0
  end

  def opposing_teams
    User.where.not(id: self)
  end

  def ordered_picks(round_num)
    self.draft_picks.where(round_drafted: round_num).order(:created_at)
  end

  def second_pick_of_round(round_num)
    self.ordered_picks(round_num)[1]
  end

  def team_abbr
    self[:team_abbr].try(:upcase) || team_name.split(' ').map(&:first).reject {|char| char.upcase != char }.join('')
  end

  def team_abbr_and_name
    "#{team_abbr} (#{first_name})"
  end
end
