class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :key, uniqueness: true
  before_validation :set_key
  has_many :issues, dependent: :destroy

  def to_param
    key
  end

  private

  def set_key
    self.key = SecureRandom.hex
  end
end
