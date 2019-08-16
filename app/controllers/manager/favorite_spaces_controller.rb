# frozen_string_literal: true

module Manager
  class FavoriteSpacesController < BaseController
    def index
      @favorite_spaces = FavoriteSpace.order("created_at DESC")
    end

    def new
      @favorite_space = FavoriteSpace.new
    end

    def create
      @favorite_space = FavoriteSpace.new(favorite_space_params)

      if @favorite_space.save
        redirect_to manager_favorite_spaces_path, flash: { success: t(".success") }
      else
        flash[:error] = @favorite_space.errors.full_messages
        render :new
      end
    end

    private

    def favorite_space_params
      params.require(:favorite_space).permit(:name)
    end
  end
end
