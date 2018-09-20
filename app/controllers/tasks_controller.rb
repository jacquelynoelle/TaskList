# TASKS = [
#   { name: "CS Fun 1", description: "Complete reverse sentence", completion_date: "2018-09-21" },
#   { name: "Weekend Warrior", description: "Complete 05 Alouette", completion_date: "2018-09-24" },
#   { name: "Hotel", description: "Revisit and refactor", completion_date: "2018-10-01" },
#   { name: "POODR", description: "Read chapter 4", completion_date: "2018-10-01" },
#   { name: "Video", description: "Watch live Code of Job Board", completion_date: "2018-10-01" },
#   { name: "CS Fun 2", description: "Complete palindrome Check", completion_date: "2018-10-01" },
#   { name: "Optional: Ada Zoo", description: "Complete assignment", completion_date: "2018-10-01" }
# ]

WEEK = "2018-09-24"

require 'date'

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order('completion_date DESC, due_date')
  end

  def show
    id = params[:id]
    @task = Task.find_by(id: id)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], due_date: Date.parse(params[:task][:due_date]).to_s) #instantiate a new book
    if @task.save # save returns true if the database insert succeeds
      redirect_to root_path # go to the index so we can see the task in the list
    else # save failed :(
      render :new # show the new task form view again
    end
  end

  def new
    @task = Task.new
  end

  def edit
    id = params[:id]
    @task = Task.find_by(id: id)
  end

  def update
    id = params[:id]
    @task = Task.find_by(id: id)
    @task.update(name: params[:task][:name], description: params[:task][:description], due_date: Date.parse(params[:task][:due_date]).to_s)
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path # go to the task detail page so we can see the updates
    else # save failed :(
      render :new # show the new task form view again
    end
  end

  def destroy
    id = params[:id]
    task = Task.find_by(id: id) # does not need @task because does not need a view
    if Task.delete(task)
      redirect_to root_path # go to the index so we can see the refreshed list
    else # delete failed :(
      render :not_found # show the new task form view again
    end
  end

  def complete
    id = params[:id]
    @task = Task.find_by(id: id)
    if @task.completion_date == nil
      @task.update(completion_date: Date.today.to_s)
    else
      @task.update(completion_date: nil)
    end
    redirect_to root_path # go to the task detail page so we can see the updates
  end
end
