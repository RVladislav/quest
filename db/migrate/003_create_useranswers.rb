class CreateUseranswers < ActiveRecord::Migration
  def self.up
    create_table :useranswers do |t|
      t.belongs_to :users #Связь с таблицей Users
      t.belongs_to :answers #Связь с таблицей Answers
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