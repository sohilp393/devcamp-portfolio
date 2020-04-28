class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies , dependent: :delete_all
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: lambda {|attr| attr['name'].blank?}
  #Portfolio.create!(title:"Web app",subtitle:"asdcdzc",body:"scdcf",
  #technologies_attributes:[{name: 'Ruby' },{name: 'Rails'},{name:'Icnoic'}])
  
  validates_presence_of :title , :body 

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: "Angular")
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_ang , -> {where(subtitle: "Angular")} 
end
