class Answers < ActiveRecord::Base
  has_many :useranswer #1 запись таблицы Answers соответствует n записям таблицы UserAnswer 
end
