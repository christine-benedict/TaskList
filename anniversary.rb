require 'date'
require_relative 'DueDateTask'
require_relative 'tasklist'

class Anniversary < DueDateTask
    attr_reader :duedate
    def initialize(title, description, duedate)
        super(title, description, duedate)
        @duedate = newdate(duedate)
    end

    def newdate duedate
        parseddate = Date.parse(duedate)
        if parseddate < Date.today
            @duedate = "#{parseddate.day}/#{parseddate.month}/#{Date.today.next_year.year}"
        else
            @duedate = parseddate.to_s
        end
    end
end

my_birthday = Anniversary.new("My Birthday", "Happy Birthday to Me!", "Feb 13, 1985")


print my_birthday.duedate
