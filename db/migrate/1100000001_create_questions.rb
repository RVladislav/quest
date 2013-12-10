class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.string :textQuestion


    end

  end
end
