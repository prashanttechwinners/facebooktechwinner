class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    # before_action :authenticate_user!,except:[:index]

    def index
      @posts = Post.all.order(created_at: :desc)
      @post = Post.new
      #if user logged in, show this, else, redirect to login page
      # if params[:search]
      #   @post = Post.search(params[:search]).paginate(:page => params[:page],:per_page => 4)
      # else
      #   @post = Post.paginate(:page => params[:page], :per_page => 4)
    end

    # def new
    #   @post = Post.new
    # end

    def prashant
      # @post = Post.edit
      #    @post = Post.find(params[:id])
      # @post.edit #change
      # respond_to do |format|
      # format.html { redirect_to post_path }
      # format.json { head :no_content }
      # format.js   { render :layout => false }
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to posts_path 
      else
        render "new"
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end

    def update
      @post = Post.find(params[:id])  
      if @post.update(post_params)
        redirect_to posts_path

      else
        render 'edit'
      end
    end

    # def format_duration(total_minutes)
    #  hours = total_minutes/60
    #  minutes = total_minutes%60
    #  "#{hours}h #{minutes}min"
    # end

    
   private
    def post_params
      params.require(:post).permit(:user_id, :description, :photo)
    end  
end

