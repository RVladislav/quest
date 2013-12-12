class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :textQuestion #Таблица Questions с текстовым полем "текст вопроса"
    end
  end
end
