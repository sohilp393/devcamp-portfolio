class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies

  validates_presence_of :title , :body , :main_image , :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails_ang , ->{where(subtitle: "Angular")}
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '450' ,width: '650')
    self.thumb_image ||= Placeholder.image_generator(height: '250' ,width: '250')
  end
end
