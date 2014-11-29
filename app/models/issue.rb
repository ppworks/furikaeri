class Issue < ActiveRecord::Base
  include RankedModel
  ranks :priority
  extend Enumerize

  KPT = %w(keep problem try)
  enumerize :status, in: KPT, scope: true, default: KPT.first

  validates :title, presence: true
  belongs_to :project
end
