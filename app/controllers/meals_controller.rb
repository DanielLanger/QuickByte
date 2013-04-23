class MealsController < ApplicationController
  
  before_filter :authenticate
 
  def authenticate
    redirect_to "/" unless current_user!=nil
  end
  
  # GET /meals
  # GET /meals.json
  # Returns viewable meals to user that are > DateTime
  def index

    @meals = Meal.where("privacy_level =? AND start_time > ?", "public", DateTime.now).order("start_time")
    @privateMeals= Private.where("user_id = ?" ,current_user.id)

    if(@privateMeals !=nil)
		@privateMeals.each do |p|
			puts("here wtf")
			@priv= Meal.where("id= ? AND privacy_level =? AND start_time > ?" , p.meal_id,"private", DateTime.now)
			@meals += @priv 
		end
    end

    @meals.sort! { |a,b| a.start_time <=> b.start_time }
    
    @user= current_user
    @part = GroupMealsParticipant.find_all_by_user_id(@user.id)
	@part.each do |f|
		if @businesses == nil
			@businesses = Business.where("id = ?", Meal.find(GroupMeal.find(f.group_meal_id).meal).location)
		else
			@businesses += Business.where("id = ?", Meal.find(GroupMeal.find(f.group_meal_id).meal).location)
		end
	end
	
	@x = Hash.new(0)	
	if @businesses !=nil
		@businesses.each do |b|
			@x[b] += 1
		end
		@ordered= @x.sort_by { |k,v| v }.reverse
	end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meals }
    end
  end
  
  #Starts New Meal
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
  # Creates New Meal and group_meal
  def create
   
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
      if (params[:private] !=nil)
		  @priArray= (params[:private]).split(", ")
		  @priArray.each do |p|

			  @private= Private.new
			  @private.meal_id=@meal.id
			  @private.user_id= p
			  @private.save
		  end
		  			  
		  @private2=Private.new
		  @private2.meal_id=@meal.id
		  @private2.user_id= current_user.id
		  @private2.save
	  end
	  
	  @group_meal = GroupMeal.new
	  @group_meal.meal=@meal.id
	  @group_meal.proposed_start_time= @meal.start_time
	  @group_meal.proposed_end_time= @meal.end_time
	  @group_meal.set_start_time= nil
	  @group_meal.set_start_time= nil
	  @group_meal.save
	  @groupMealParticipant= GroupMealsParticipant.new
	  @groupMealParticipant.user_id=current_user.id
	  @groupMealParticipant.group_meal_id= @group_meal.id
	  @groupMealParticipant.save    
      format.html { redirect_to :controller => 'group_meals', :action => 'show', :id => @group_meal.id, notice: 'Meal was successfully created.' }
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
