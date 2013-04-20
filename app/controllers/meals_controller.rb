class MealsController < ApplicationController
  
  before_filter :authenticate
 
  def authenticate
    redirect_to "/" unless current_user!=nil
  end
  
  # GET /meals
  # GET /meals.json
  def index
    @meals = Meal.where("privacy_level =? AND start_time > ?", "public", DateTime.now).order("start_time")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end
  
  def eatHere
  	@meal= Meal.new
	@meal.location=(params[:business])
  	render 'new'
  end
  
  # GET /meals/1
  # GET /meals/1.json
  def show
    @meal = Meal.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/new
  # GET /meals/new.json
  def new
    @meal = Meal.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meal }
    end
  end

  # GET /meals/1/edit
  def edit
    @meal = Meal.find(params[:id])
  end
  
  # POST /meals
  # POST /meals.json
  def create

   puts("paramTest")
   puts((params[:meal][:location]).class)
    if((params[:meal][:location]).to_s.numeric?)
      bId=params[:meal][:location]
    else
      bId=Business.find_by_name(params[:meal][:location]).id
    end
    @meal = Meal.new(params[:meal])
    @meal.location=bId
    @meal.host=current_user.id
    respond_to do |format|
      if @meal.save
        format.html { redirect_to meals_url, notice: 'Meal was successfully created.' }
        format.json { render json: @meal, status: :created, location: @meal }
      else
        format.html { render action: "new" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PUT /meals/1
  # PUT /meals/1.json
  def update
    @meal = Meal.find(params[:id])

    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to meals_url, notice: 'Meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end
end
