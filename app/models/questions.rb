class Questions < ActiveRecord::Base
  def ans(answer)
	answer == 'true' ? :true : 'false' ? :false : :answer
  end
end
