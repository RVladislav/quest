class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :textAnswer #Таблица Answers с полем "текст ответа"
      t.belongs_to :questions #Связь с таблицей Questions
    end
  end
end
