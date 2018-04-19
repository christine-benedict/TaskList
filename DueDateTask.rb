require_relative 'tasklist'
require_relative 'task'
require 'date'

class DueDateTask < Task

    attr_reader :duedate

    def initialize (title, description, duedate)
        super(title, description)
        @duedate = Date.parse(duedate)
    end

    def getData
        print "Title: #{@title} \nDescription: #{@description} \nCompleted: #{@done} \nDue Date: #{@duedate}\n"

    end



end

thursday = TaskList.new
thingy = DueDateTask.new("Buy flowers for Mom", "she likes tulips", "4 19 2018")
thursday.add_task(thingy)
thursday.showTodayIncomplete
