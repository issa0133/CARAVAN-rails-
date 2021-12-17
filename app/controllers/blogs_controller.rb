class BlogsController < ApplicationController
  def index
  end

  def show
    @blog = Blog.find(params[:id])

  end

  def index
    @blogs = Blog.all
    p "標準出力のみに反映"
    logger.debug("標準出力とログファイルに記録される")

  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    binding.pry
    
    if @blog.save
      redirect_to blog_path(@blog.id)
    else
      render :new
      
    end

  end

  def edit
    @blog = Blog.find(params[:id])

  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)

  end

  def destroy
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end

end
