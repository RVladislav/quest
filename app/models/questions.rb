class Questions < ActiveRecord::Base
  has_many :answers #1 запись таблицы Questions соответствует n записям таблицы Answers 
end
