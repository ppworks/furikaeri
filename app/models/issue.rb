class Issue < ActiveRecord::Base
  include RankedModel
  ranks :priority
  extend Enumerize

  KPT = %w(keep problem try)
  enumerize :status, in: KPT, scope: true, default: KPT.first

  validates :title, presence: true
  belongs_to :project
  after_save :post_to_pusher
  after_destroy :post_to_pusher

  def post_to_pusher
    Pusher["presence-furikaeri_#{self.project.key}"].trigger('updated', nil) unless Rails.env.test?
  end
end
