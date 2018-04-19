require 'rspec'
require_relative 'task'

describe Task do
    let (:task) {Task.new("Title", "Description")}
    let (:tasklist) {TaskList.new}
# Story: As a developer, I can create a Task.
    it "it is a task" do
        expect{task}.to_not raise_error
    end
# Story: As a developer, I can give a Task a title and retrieve it.
    it "has a title" do
        expect{task.title}.to_not raise_error
    end
# Story: As a developer, I can give a Task a description and retrieve it.
    it "it has a description" do
        expect{task.description}.to_not raise_error
    end
# Story: As a developer, I can mark a Task done.
    it "it is done" do
        expect{task.markDone}.to change {task.done}.from(false).to(true)
    end
# Story: As a developer, when I print a Task that is done, its status is shown.
    it "a completed task shows as done when status is printed" do
        task.markDone
        expect(task.done).to eq true
    end
# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
    it "can add a task to a task list" do
        tasklist.add_task(task)
        expect(tasklist.list[0]).to eq task
    end
# Story: As a developer with a TaskList, I can get the completed items.
    it "shows me the tasks that are completed" do
        task.markDone
        tasklist.add_task(task)
        tasklist.showDone
        expect(tasklist.doneTitles).to include(task.title)
    end
# Story: As a developer with a TaskList, I can get the incomplete
    it "shows me the task is incomplete" do
        tasklist.add_task(task)
        tasklist.showNotDone
        expect(tasklist.notDoneTitles).to include(task.title)
    end
end
