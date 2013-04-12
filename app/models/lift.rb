class Lift < ActiveRecord::Base
  attr_accessible :lift_name

  def as_json(options = {})
    {
      lift_name: self.lift_name
    }
  end
end
