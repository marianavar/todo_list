require "rails_helper"

RSpec.describe "sub_task destruction", type: :system, js: true do
  it "destroys the sub_task" do
    task = Task.create(description: "Learn Rails")
    sub_task = task.sub_tasks.create(description: "Learn Models", completed: false)
    visit task_sub_tasks_path(task)

    within 'tbody' do
      accept_confirm do
        click_link "Destroy"
      end
    end

    expect(page).to have_text("SubTask was successfully destroyed")
  end
end
