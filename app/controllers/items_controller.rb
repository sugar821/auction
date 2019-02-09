class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end
  
  def new
    @item=Item.new
  end

  def create
    @item = Item.new(item_params)
    # 引数としてメソッドを渡すと先にメソッド内を実行してくれる
    @item.save
    redirect_to @item
  end

  private
  #どのカラムに対して更新許可を出すか
  # ストロングパラメータの作成
    def item_params
      params.require(:item).permit(:name,
                                    :price, 
                                    :seller,
                                    :description,
                                    :email,
                                    :image_url)
    end


end
