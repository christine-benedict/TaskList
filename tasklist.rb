require 'date'

class TaskList

    attr_reader :list, :doneTitles, :notDoneTitles, :stillduetoday, :orderByDate, :filteredTasks

    def initialize
        @list = []
        @doneTitles = []
        @notDoneTitles = []
        @stillduetoday = []
        @orderByDate = []
        @filteredTasks = []
    end

    def add_task(onetask)
        @list << onetask
    end

    def showDone
        completed = @list.select {|eachTask| eachTask.done == true }
        @doneTitles = completed.map { |e| e.title  }
        print @doneTitles
    end

    def showNotDone
        incompleted = @list.select {|eachTask| eachTask.done == false }
        @notDoneTitles = incompleted.map { |x| x.title }
        print @notDoneTitles
    end

    def showTodayIncomplete
        incompleted = @list.select {|eachTask| eachTask.done == false }
        incompleteForToday = incompleted.select {|each| each.duedate == Date.today}
        @stillduetoday = incompleteForToday.map { |y| y.title }
        print @stillduetoday
    end

    def orderIncompleteByDate
        incompleted = @list.select { |eachTask| eachTask.done == false }
        ordered = incompleted.sort_by{ |z| z.duedate }
        @orderByDate = ordered.map{ |q| q.title }
        print @orderByDate
    end

    def filterIncompleteTasks
        incompleted = @list.select { |eachTask| eachTask.done == false }
        newArray = incompleted.select {|eachTask| eachTask.class.to_s == "DueDateTask" }
        @filteredTasks = newArray.sort_by{ |z| z.duedate }
        newArray2 = incompleted.select {|eachTask| eachTask.class.to_s != "DueDateTask" }
        @filteredTasks.concat(newArray2)
        @filteredTasks.map!{ |q| q.title }
        print @filteredTasks
    end

    def printList
        print "#{@list} \n"
    end

end
