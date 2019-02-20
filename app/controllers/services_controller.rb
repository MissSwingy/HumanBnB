class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_service, only: [:show] # pending :edit, :update, :destroy

  def index
    @services = Service.all
  end

  def method_name

  end

  def new
    @user = current_user # pour tester le formulaire, à surement remplacer/supprimer
    @service = Service.new
  end

  def show # GET user_service     /users/:user_id/services/:id                                                   services#show
    set_service
    @user = @service.user
  end

  def create # POST /services
    @service = Service.new(service_params)
    @service.user = current_user
    @service.save
    redirect_to user_service_path(current_user, @service)
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :price, :details, :city, :event_type)
  end
end
