class BuyRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @buy_record_form = BuyRecordForm.new
  end

  def create
    @buy_record_form = BuyRecordForm.new(buy_record_params)
    if @buy_record_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_record_params
    params.require(:buy_record_form).permit(:post_code, :prefecture_id, :area, :address, :build_name, :tel).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
