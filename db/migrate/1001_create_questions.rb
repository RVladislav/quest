class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :answer, :default => false
      t.string :other
    end
  end
end