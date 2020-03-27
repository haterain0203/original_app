class ConditionsController < ApplicationController
  before_action :set_condition, only: [:show, :edit, :update, :destroy]
  
  # GET /conditions
  # GET /conditions.json
  def index
    # 月別選択の処理 
    cal_date(params[:data])

    # フィルター処理
    unless params[:graph_keys] == ""
      @graph_keys = params[:graph_keys]
    end  
    
    #graph表示の処理
    graph
  end

  def index_table
    cal_date(params[:data])
  end
  
  # GET /conditions/1
  # GET /conditions/1.json
  def show
  end

  # GET /conditions/new
  def new
    @condition = Condition.new
    #肌の状態との相関を見たいが、以下だと相関がわかりづらい？1=最悪、5=最高という流れに統一すべき？
    @skin_condition_selects = { 1 => "非常に良い", 2 => "まあまあ良い" , 3 => "普通" , 4 => "まあまあ悪い" , 5 => "非常に悪い" }
    @meal_selects = { 1 => "非常に良い食事", 2 => "良い食事" , 3 => "普通に食べた" , 4 => "少し偏った食事" , 5 => "食べすぎ/食べなすぎ" }
    @defecation_selects = { 1 => "良質な排便複数", 2 => "良質な排便あり" , 3 => "排便あり" , 4 => "質悪な排便あり" , 5 => "排便なし" }
    @sleep_selects = { 1 => "最高の睡眠", 2 => "良質な睡眠" , 3 => "普通" , 4 => "あまり良くない" , 5 => "最悪な睡眠" } 
    @alcohol_selects = { 1 => "飲酒なし", 2 => "缶1本未満" , 3 => "缶1本程度" , 4 => "缶2本程度" , 5 => "缶3本以上" } 
    @exercise_selects = { 1 => "がっつり運動", 2 => "しっかり運動", 3 => "運動あり", 4 => "少しは動いた", 5 => "運動ゼロ"}
    @stress_selects = { 1 => "ストレスなし", 2 => "少しあり", 3 => "あり", 4 => "結構あり", 5 => "しんどい"}
  end

  # GET /conditions/1/edit
  def edit
    @skin_condition_selects = { 1 => "非常に良い", 2 => "まあまあ良い" , 3 => "普通" , 4 => "まあまあ悪い" , 5 => "非常に悪い" }
    @meal_selects = { 1 => "食べなさすぎ", 2 => "少なめ" , 3 => "適量" , 4 => "少し食べすぎた" , 5 => "食べすぎ" }
    @defecation_selects = { 1 => "良質な排便複数あり", 2 => "良質な排便あり" , 3 => "排便あり" , 4 => "質悪な排便あり" , 5 => "排便なし" }
    @sleep_selects = { 1 => "最高の睡眠", 2 => "良質な睡眠" , 3 => "普通" , 4 => "あまり良くない" , 5 => "最悪な睡眠" } 
    @alcohol_selects = { 1 => "飲酒なし", 2 => "缶1本未満" , 3 => "缶1本程度" , 4 => "缶2本程度" , 5 => "缶3本以上" } 
    @alcohol_selects = { 1 => "飲酒なし", 2 => "缶1本未満" , 3 => "缶1本程度" , 4 => "缶2本程度" , 5 => "缶3本以上" } 
    @exercise_selects = { 1 => "がっつり運動", 2 => "しっかり運動", 3 => "運動あり", 4 => "少しは動いた", 5 => "運動ゼロ"}
    @stress_selects = { 1 => "ストレスなし", 2 => "少しあり", 3 => "あり", 4 => "結構あり", 5 => "しんどい"}
  end

  # POST /conditions
  # POST /conditions.json
  def create
    @condition = Condition.new(condition_params)
    @skin_condition_selects = { 1 => "非常に良い", 2 => "まあまあ良い" , 3 => "普通" , 4 => "まあまあ悪い" , 5 => "非常に悪い" }
    @meal_selects = { 1 => "食べなさすぎ", 2 => "少なめ" , 3 => "適量" , 4 => "少し食べすぎた" , 5 => "食べすぎ" }
    @defecation_selects = { 1 => "良質な排便複数あり", 2 => "良質な排便あり" , 3 => "排便あり" , 4 => "質悪な排便あり" , 5 => "排便なし" }
    @sleep_selects = { 1 => "最高の睡眠", 2 => "良質な睡眠" , 3 => "普通" , 4 => "あまり良くない" , 5 => "最悪な睡眠" } 
    @alcohol_selects = { 1 => "飲酒なし", 2 => "缶1本未満" , 3 => "缶1本程度" , 4 => "缶2本程度" , 5 => "缶3本以上" } 

    respond_to do |format|
      if @condition.save
        format.html { redirect_to conditions_path, notice: 'Condition was successfully created.' }
        format.json { render :index, status: :created, location: @condition }
      else
        format.html { render :new }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conditions/1
  # PATCH/PUT /conditions/1.json
  def update
    respond_to do |format|
      if @condition.update(condition_params)
        format.html { redirect_to conditions_path, notice: 'Condition was successfully updated.' }
        format.json { render :index, status: :ok, location: @condition }
      else
        format.html { render :edit }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conditions/1
  # DELETE /conditions/1.json
  def destroy
    @condition.destroy
    respond_to do |format|
      format.html { redirect_to conditions_url, notice: 'Condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condition_params
      params.require(:condition).permit(:condition_date,:skin_condition, :meal, :defecation, :sleep, :alcohol, :exercise, :stress, :user_id, :text)
    end

    def cal_date(data)
      if !data.nil?
        if data.to_i == 0
          @conditions = Condition.active(current_user.id).current_month.sorted
        elsif data.to_i == 1
          @conditions = Condition.active(current_user.id).sorted
        else
          @conditions = Condition.active(current_user.id).where(condition_date: (Date.today + data.to_i.month).all_month).sorted
        end
      else
        @conditions = Condition.active(current_user.id).current_month.sorted
      end
    end
end