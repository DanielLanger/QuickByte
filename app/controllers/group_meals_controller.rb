class GroupMealsController < ApplicationController
  # GET /group_meals
  # GET /group_meals.json
  def index
    @group_meals = GroupMeal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_meals }
    end
  end

  # GET /group_meals/1
  # GET /group_meals/1.json
  def show
    @group_meal = GroupMeal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_meal }
    end
  end

  def getUserGroups
  	@group_meals=GroupMealParticipant.find_all_by_user_id(current_user.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_meal }
    end
  end

  def joinGroup
  puts("here now!")
  puts(params)
    if GroupMeal.where("meal = ?", params[:meal]) == []
      @meal=Meal.find(params[:meal])
      @group_meal = GroupMeal.new
      @group_meal.meal=params[:meal]
      @group_meal.proposed_start_time= @meal.start_time
      @group_meal.proposed_end_time= @meal.end_time
      @group_meal.set_start_time= nil
      @group_meal.set_start_time= nil
      @group_meal.save
      redirect_to(@group_meal)
    else
     if(Meal.find(params[:meal]).host!=current_user.id)
       puts("in if statement")
       puts(current_user.name)
       @groupMealParticipant= GroupMealParticipant.new
       @groupMealParticipant.user_id=current_user.id
       @groupMealParticipant.group_meal_id= GroupMeal.find_by_meal(params[:meal]).id
       @groupMealParticipant.save
     end
     
     redirect_to(GroupMeal.find_by_meal(params[:meal]))
     end
  end

  # GET /group_meals/new
  # GET /group_meals/new.json
  def new
    @group_meal = GroupMeal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_meal }
    end
  end

  # GET /group_meals/1/edit
  def edit
    @group_meal = GroupMeal.find(params[:id])
  end

  # POST /group_meals
  # POST /group_meals.json
  def create
    @group_meal = GroupMeal.new(params[:group_meal])

    respond_to do |format|
      if @group_meal.save
        format.html { redirect_to @group_meal, notice: 'Group meal was successfully created.' }
        format.json { render json: @group_meal, status: :created, location: @group_meal }
      else
        format.html { render action: "new" }
        format.json { render json: @group_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_meals/1
  # PUT /group_meals/1.json
  def update
    @group_meal = GroupMeal.find(params[:id])

    respond_to do |format|
      if @group_meal.update_attributes(params[:group_meal])
         @meal= Meal.find(@group_meal.meal)

        if params[:group_meal]["proposed_start_time(2i)"] !=nil
        	@meal.start_time= DateTime.new(params[:group_meal]["proposed_start_time(1i)"].to_i, 
                        params[:group_meal]["proposed_start_time(2i)"].to_i,
                        params[:group_meal]["proposed_start_time(3i)"].to_i,
                        params[:group_meal]["proposed_start_time(4i)"].to_i,
                        params[:group_meal]["proposed_start_time(5i)"].to_i)
            @meal.end_time= DateTime.new(params[:group_meal]["proposed_end_time(1i)"].to_i, 
                        params[:group_meal]["proposed_end_time(2i)"].to_i,
                        params[:group_meal]["proposed_end_time(3i)"].to_i,
                        params[:group_meal]["proposed_end_time(4i)"].to_i,
                        params[:group_meal]["proposed_end_time(5i)"].to_i)
        	@meal.save
        end
        if params[:group_meal]["set_start_time(2i)"] !=nil
        	@meal.start_time= DateTime.new(params[:group_meal]["set_start_time(1i)"].to_i, 
                        params[:group_meal]["set_start_time(2i)"].to_i,
                        params[:group_meal]["set_start_time(3i)"].to_i,
                        params[:group_meal]["set_start_time(4i)"].to_i,
                        params[:group_meal]["set_start_time(5i)"].to_i)
            @meal.end_time= DateTime.new(params[:group_meal]["set_end_time(1i)"].to_i, 
                        params[:group_meal]["set_end_time(2i)"].to_i,
                        params[:group_meal]["set_end_time(3i)"].to_i,
                        params[:group_meal]["set_end_time(4i)"].to_i,
                        params[:group_meal]["set_end_time(5i)"].to_i)
        	@meal.save
        end
        format.html { redirect_to @group_meal, notice: 'Group meal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_meals/1
  # DELETE /group_meals/1.json
  def destroy
    @group_meal = GroupMeal.find(params[:id])
    @group_meal.destroy

    respond_to do |format|
      format.html { redirect_to group_meals_url }
      format.json { head :no_content }
    end
  end
end
