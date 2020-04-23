class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  def self.findall
    Topic.all
  end
end
