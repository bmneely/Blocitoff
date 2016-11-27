class ItemsController < ApplicationController
    
    def create
        @user = User.find(params[:user_id])
        @item = current_user.items.create(item_params)
        if @item.save
            redirect_to @user
        else
            flash.now[:alert] = "Unable to create item!"
            redirect_to @user
        end
    end
    
    def destroy
        @user = User.find(params[:user_id])
        @item = @user.items.find(params[:id])
        
        if @item.destroy
            flash[:notice] = "Item was removed!"
        else
            flash.now[:alert] = "Unable to delete item!"
        end
        
        respond_to do |format|
            format.html 
            format.js
        end
    end
    
    private
    def item_params
        params.require(:item).permit(:name)
    end
end
