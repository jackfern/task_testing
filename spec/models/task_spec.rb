require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has title and description" do
    t = Task.new
    t.title = "Groceries"
    t.description = "Bananas"
    expect(t.save).to be true
  end
  it "can list many tasks" do
    t = Task.new
    t.title = "Groceries"
    t.description = "Oranges"
    t2 = Task.new
    t2.title = "Garden"
    t2.description = "Get Seeds"
    expect(t.title).to eq "Groceries"
    expect(t.description).to eq "Oranges"
    expect(t2.title).to eq "Garden"
    expect(t2.description).to eq "Get Seeds"
  end
  it "can set a task record to done" do
    t = Task.new
    t.done = false
    t.save
    expect(t.done).to be false
  end
  it "can list all the records that are done" do
    t = Task.new
    t2 = Task.new
    t3 = Task.new
    t.description = "Oranges"
    t2.description = "Get Seeds"
    t3.description = "Get hummus"
    t.done = true
    t2.done = true
    t3.done = false
    t.save
    Task.where("done=true")
    expect(t.description).to eq "Oranges"
    expect(t2.description).to eq "Get Seeds"
  end
  it "can list all the records that are not done" do
    t = Task.new
    t2 = Task.new
    t3 = Task.new
    t.description = "Oranges"
    t2.description = "Get Seeds"
    t3.description = "Get hummus"
    t.done = true
    t2.done = true
    t3.done = false
    t.save
    Task.where("done=false")
    expect(t3.description).to eq "Get hummus"
  end

  it "I can update the title and description" do
    t = Task.new
    t.description = "Oranges"
    t.title = "Groceries"
    t.save
    t= Task.new
    t.description = "Hummus"
    t.title = "Groceries"
    t.save
    t= Task.new
    t.description = "Hummus"
    t.title = "Grocery list"
    t.save
    expect(t.description).to eq "Hummus"
    expect(t.title).to eq "Grocery list"
  end


   it "I can destroy a Task record" do
     t = Task.new
     t2 = Task.new
     t.description = "Oranges"
     t2.description = "Get Seeds"
     t.save
     t2.save
     t.destroy
     notdestroyed = Task.all.pluck(:description)
     expect(notdestroyed).to eq ["Get Seeds"]
    end

    it "can set a Task record with a due date" do
      t = Task.new
      t2 = Task.new
      t.description = "Oranges"
      t2.description = "Get Seeds"
      t.due_date = "2012-09-20 14:00:00"
      t.save
      Task.where("due_date= '2012-09-20 14:00:00'")
      expect(t.description).to eq "Oranges"
    end

end #end of rspec
