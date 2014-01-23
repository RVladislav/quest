class CreateUseranswers < ActiveRecord::Migration
  def self.up
    create_table :useranswers do |t|
      t.belongs_to :allusers #Связь с таблицей Allusers
      t.belongs_to :answers #Связь с таблицей Answers
      t.string :answer_freeForm
    end
  end
  def self.down
    drop_table :useranswers
  end
end
# Вид таблицы:
#  ______________________
# |id|users_id|answers_id|
# ------------------------