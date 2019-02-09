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

  # 先にEDITがあってこれをUPDATEする
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
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
