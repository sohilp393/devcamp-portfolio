class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                 reject_if: lambda {|attr| attr['name'].blank?}
  #Portfolio.create!(title:"Web app",subtitle:"asdcdzc",body:"scdcf",
  #technologies_attributes:[{name: 'Ruby' },{name: 'Rails'},{name:'Icnoic'}])

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
