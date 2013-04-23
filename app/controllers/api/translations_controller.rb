class Api::TranslationsController < Api::ApplicationController
  def index
    @search = I18n::Backend::ActiveRecord::Translation.ransack params[:q]
    @translations = @search.result #.page(params[:page]).per(40)
  end

  def reload
    I18n.reload!
    render json: { status: :ok }
  end

  def show
    @translation = I18n::Backend::ActiveRecord::Translation.find params[:id]
  end

  def create
    @translation = I18n::Backend::ActiveRecord::Translation.new params[:translation]
    @translation.save
  end

  def update
    @translation = I18n::Backend::ActiveRecord::Translation.find params[:id]
    @translation.update_attributes params[:translation]
  end

  def destroy
    @translation = I18n::Backend::ActiveRecord::Translation.find params[:id]
    @translation.destroy
  end
end