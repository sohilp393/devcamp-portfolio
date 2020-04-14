module CurrentUserConcern
  extend ActiveSupport::Concern


  def current_user
    super || guest_user 
  end

  def guest_user
    OpenStruct.new(name:"rails guest",
                  first_name:'rails',
                  last_name:'guest',
                  email:'guest@gmail.com')
  end
end