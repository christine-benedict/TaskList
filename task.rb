require_relative 'tasklist'

class Task

    attr_reader :title, :description, :done

    def initialize (title, description)
        @title = title
        @description = description
        @done = false
    end

    def markDone
        @done = true
    end

end

thursday = TaskList.new

task_one = Task.new("Get Groceries","need eggs, bacon, hash browns")
task_two = Task.new("Do laundry","remember to wash your underwear")

thursday.add_task(task_one)
thursday.add_task(task_two)


task_one.markDone
task_two.markDone
