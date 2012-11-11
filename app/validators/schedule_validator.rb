class ScheduleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
  	if !["08:30","09:00","09:30","10:00","10:30","11:00","11:30","12:00","12:30","13:00","13:30","14:00","14:30","15:00","15:30","16:00","16:30","17:00","17:30","18:00","18:30"].include? value.to_s[11..16]
		  record.errors.add attribute, :not_on_schedule
    end 
  end
end