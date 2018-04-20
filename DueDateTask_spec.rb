require 'rspec'
require_relative 'DueDateTask'
require 'date'

 describe DueDateTask do
     let (:duedatetask1) {DueDateTask.new("Title1", "Description1", "20/4/2018")}
     let (:duedatetask2) {DueDateTask.new("Title2", "Description2", "1/4/2018")}
     let (:task) {Task.new("Title3", "Description3")}
     let (:tasklist) {TaskList.new}


     it "it has a due date" do
         expect{duedatetask1.duedate}.to_not raise_error
     end

     it "can add an item with due dates to my tasklist" do
         tasklist.add_task(duedatetask1)
         expect(tasklist.list[0]).to eq duedatetask1
     end
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
     it "can tell me which items due today are still incomplete" do
         tasklist.add_task(duedatetask1)
         tasklist.showTodayIncomplete
         expect(tasklist.stillduetoday).to include(duedatetask1.title)
     end
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
    it "can give me a list of items organized by due date" do
        tasklist.add_task(duedatetask1)
        tasklist.add_task(duedatetask2)
        tasklist.orderIncompleteByDate
        expect(tasklist.orderByDate).to match([duedatetask2.title, duedatetask1.title])
    end
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
    it "orders the incomplete tasks by due date first then lists tasks without due dates" do
        tasklist.add_task(task)
        tasklist.add_task(duedatetask1)
        tasklist.add_task(duedatetask2)
        tasklist.filterIncompleteTasks
        expect(tasklist.filteredTasks).to match([duedatetask2.title, duedatetask1.title, task.title])
    end
 end
