class OnlySaturdayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, :not_a_saturday unless value.saturday?
  end
end