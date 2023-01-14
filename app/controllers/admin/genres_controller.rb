class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  # 以下を追加
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    genres = Genre.new(genre_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    genres.save
    # 4. トップ画面へリダイレクト
    redirect_to admin_genres_path
  end

  def edit

  end

private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end
end