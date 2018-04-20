require 'rspec'
require_relative 'anniversary'
require 'date'

describe Annivesary do
    let (:anniversary) {Anniversary.new("Title", "Description", "month", "day")}
    it "it can update due date to new year" do
        expect{anniversary.duedate}.to 
    end

end
# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: An Anniversary has a month and a day.
# Hint: An Anniversary is a special kind of DueDateTask where the due date changes depending on the current date (override the due_date method to return the next annivesary date).
#
# Story: As a developer, I can print an item for an anniversary with field labels and values.
#
# Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
#
# Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due date
