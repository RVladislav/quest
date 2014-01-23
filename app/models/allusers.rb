class Allusers < ActiveRecord::Base
  has_many :useranswer #1 запись таблицы Allusers соответствует n записям таблицы UserAnswer 
end
