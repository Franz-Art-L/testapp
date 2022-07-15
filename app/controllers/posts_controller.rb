class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        @post = Post.create(title: params[:title])

        render 'posts/create.jbuilder'
    end

    def list_all
        
    end
end
