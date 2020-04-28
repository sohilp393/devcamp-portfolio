class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy,:toggle_status]
  layout "blog"
  access all: [:show,:index,:new ,:create ,:update ,:edit,:destroy] ,user:{except: [:toogle_status]},site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def archives
    if  params[:date].nil?
       redirect_to blogs_url
    else
      @blogs = Blog.archives(params[:date])
    end    
  end

  def index
    @blogs = Blog.page(params[:page]).per(5)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.topic = Topic.find(params[:blog][:topic_id])
    
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    debugger
    @blog.topic = Topic.find(params[:blog][:topic_id]) 
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end      
    redirect_to blogs_url,notice: 'Post status has been updated' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      #params[:id] = my-blog-post-3
      # Blog.where(slug:params[:id])
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title,:body,:topic_id)
    end

    def archives_params
      params.require(:archives).permit(:date)
    end
end
