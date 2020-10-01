class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :update, :destroy]

  # GET /collections
  def index
    @collections = Collection.all

    render json: @collections
  end

  def show
    # byebug
    @collection = Collection.all.find_all{ |i| i.user_id == params["id"].to_i}
    render json: @collection
  end

  # POST /collections
  def create
    Collection.create(user_id: params["user_id"], card_id: params["card_id"])
  end


  def update
    if @collection.update(collection_params)
      render json: @collection
    else
      render json: @collection.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @collection =Collection.all.find_all{|c| c.user_id == params["id"].to_i}
    @collection =  @collection.find{ |c| c.card_id == params["_json"]}
    @collection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def collection_params
      params.fetch(:collection, {})
    end
end
