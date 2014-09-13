class Input < ActiveRecord::Base

	belongs_to :food
	belongs_to :user

	validates_presence_of :food_id, :user_id, :date, :name, :quality
	validates_numericality_of :food_id, :user_id, :num_days, greater_than: 0, only_integer: true
	validates_date :date, on_or_after: Date.today
	validates_date :exp_date, on_or_after: Date.today, allow_blank: true
	validates_inclusion_of :quality, in: %w[Excellent, Ok, Bad]

	scope :upcoming, -> { where('date >= ?', Date.today) }
  	scope :rot, -> { where('date < ?', Date.today) }
  	scope :chronological, -> { order('date') }




def date

	if !num_days.nil?
		return Date.today + num_days
	elsif !exp_date.nil? 
		return exp_date
	end
	else
		case self.quality
		when 0 # bad quality
	    	modifier = 0.33
		when 1 # ok quality
	    	modifier = 0.67
	 	else # excellent quality
	    	modifier = 1.0
	  	end
	  	Date.today + self.food.shelf_life*modifier
	  	end
	  end

end


<<<<<<< HEAD
end
=======
>>>>>>> 635a85998a33922da85a16751810f34d6d92ec81
