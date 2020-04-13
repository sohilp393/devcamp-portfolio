class Portfolio < ApplicationRecord
  validates_presence_of :title , :body , :main_image , :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails_ang , ->{where(subtitle: "Angular")}
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "No image"
    self.thumb_image ||= "No image"
  end
end
