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
thingy = DueDateTask.new("Buy flowers for Mom", "she likes tulips", "20/4/2018")
otherthingy = Task.new("Title3", "Description3")
lastthingy = DueDateTask.new("Title1", "Description1", "1/4/2018")

print thingy.duedate.class
# thursday.add_task(thingy)
# thursday.add_task(otherthingy)
# thursday.add_task(lastthingy)
# thursday.filterIncompleteTasks
