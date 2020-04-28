class Blog < ApplicationRecord
  enum status: {draft: 0 , published: 1}
  extend FriendlyId
  friendly_id :title , use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic
  has_many :comments ,dependent: :destroy

  
  def self.archives archivedate    
    blogsbetweendates(archivedate)
  end

  def self.blogscount date
    blogsbetweendates(date).count  
  end

  def self.blogsbetweendates date
    start_date = date.to_date.at_beginning_of_month
    end_date = date.to_date.at_end_of_month
    where(:created_at => start_date..end_date)
  end
end
