require 'rspec'
require_relative 'DueDateTask'

 describe DueDateTask do
     let (:duedatetask) {DueDateTask.new("Title", "Description", "4/2/2018")}
     let (:tasklist) {TaskList.new}


     it "it has a due date" do
         expect{duedatetask.duedate}.to_not raise_error
     end

     it "can add an item with due dates to my tasklist" do
         tasklist.add_task(duedatetask)
         expect(tasklist.list[0]).to eq duedatetask
     end

     it "can tell me which items due today are still incomplete" do
         tasklist.add_task(duedatetask)
         expect(tasklist.stillduetoday).to include(duedatetask.title)
     end

 end
