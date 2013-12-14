class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|      
      t.string :textQuestion #Таблица Questions с текстовым полем "текст вопроса"
    end
  end
  def self.down
    drop_table :questions
  end
end
