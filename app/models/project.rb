class Project < ActiveRecord::Base
  validates :key, uniqueness: true
  before_validation :set_key

  def to_param
    key
  end

  private

  def set_key
    self.key = SecureRandom.hex
  end
end
