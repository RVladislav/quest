class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.string :textAnswer

      t.belongs_to :questions


    end

  end
end
