module SetSource
  extend ActiveSupport::Concern

  included do 
    before_action :set_source
  end

  #http://localhost:3000/blogs?q=twitter
  def set_source
  session[:source] = params[:q] if params[:q]
  end
end

