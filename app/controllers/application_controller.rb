class ApplicationController < ActionController::Base
end

def destroy
 blog = Blog.find(params[:id])
 blog.destroy
 ridirect_to blogs_path
 
end