# frozen_string_literal: true

module Manager
  class FavoriteSpacesController < BaseController
    before_action :find_favorite_space, only: %i[index edit update]

    def index
      @favorite_spaces = FavoriteSpace.order("created_at DESC")
    end

    def new
      @favorite_space = FavoriteSpace.new
    end

    def create
      @favorite_space = FavoriteSpace.new(favorite_space_params)

      if @favorite_space.save
        flash[:notice] = "Create successfully!!!"
        redirect_to manager_favorite_spaces_path
      else
        flash[:error] = @favorite_space.errors.full_messages
        render :new
      end
    end

    def edit; end

    def update
      if @favorite_space.update(favorite_space_params)
        redirect_to manager_favorite_spaces_path, notice: "Update successfully!!!"
      else
        flash[:error] = @favorite_space.errors.full_messages
        render :edit
      end
    end

    private

    def favorite_space_params
      params.require(:favorite_space).permit(:name)
    end

    def find_favorite_space
      @favorite_space = FavoriteSpace.find_by(params[:id])
    end
  end
end
