class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    total_costs = []
    @activities.each do |activity|
      total_costs << activity.total_cost
    end
    total_costs.inject(0) do |sum, cost|
      sum += cost
    end
  end

  # def breakout
  #   owed = @activities.map do |activity|
  #     activity.owed
  #   end
  #   breakout = owed.zip(owed[0], owed[1]) ???
  # end


end
