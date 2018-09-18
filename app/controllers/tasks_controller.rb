TASKS = [
  { name: "CS Fun 1", description: "Complete reverse sentence", completion_date: "2018-09-21" },
  { name: "Weekend Warrior", description: "Complete 05 Alouette", completion_date: "2018-09-24" },
  { name: "Hotel", description: "Revisit and refactor", completion_date: "2018-10-01" },
  { name: "POODR", description: "Read chapter 4", completion_date: "2018-10-01" },
  { name: "Video", description: "Watch live Code of Job Board", completion_date: "2018-10-01" },
  { name: "CS Fun 2", description: "Complete palindrome Check", completion_date: "2018-10-01" },
  { name: "Optional: Ada Zoo", description: "Complete assignment", completion_date: "2018-10-01" }
]

WEEK = "2018-09-24"

require 'date'

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end

  def show
    name = params[:name]
    @task = TASKS.find do |task|
      task[:name] == name
    end
  end
end
