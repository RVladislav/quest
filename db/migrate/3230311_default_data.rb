# encoding: utf-8
class DefaultData < ActiveRecord::Migration
  def up
  	q = Questions.create(:textQuestion => "Планируете ли Вы поехать на Красное Озеро?")
  	Answers.create(:textAnswer => "Я поеду", :questions_id => q.id)
    Answers.create(:textAnswer => "Поеду с семьей (Члены семьи оплачиваются отдельно)", :questions_id => q.id)
    Answers.create(:textAnswer => "Я не поеду", :questions_id => q.id)

    q = Questions.create(:textQuestion => "Как Вы планируете добираться?")
    Answers.create(:textAnswer => "Со всеми на автобусе от Петергофского офиса", :questions_id => q.id)
    Answers.create(:textAnswer => "Со всеми на автобусе от пр.Ветеранов", :questions_id => q.id)
    Answers.create(:textAnswer => "На своем а/м", :questions_id => q.id)
    Answers.create(:textAnswer => "Не планирую", :questions_id => q.id)

	  q = Questions.create(:textQuestion => "Планируете ли пользоваться услугами проката?")
    Answers.create(:textAnswer => "Планирую брать в прокат лыжи/cноуборд", :questions_id => q.id)
    Answers.create(:textAnswer => "Планирую воспользоваться услугами инструктора", :questions_id => q.id)

    q = Questions.create(:textQuestion => "Пожелания по проживанию в коттедже:")
    Answers.create(:questions_id => q.id)
  end

  def down
  end
end
