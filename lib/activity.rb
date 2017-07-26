require 'pry'
class Activity
  attr_reader :name,
              :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.inject(0) do |sum, cost|
      sum += cost
    end
  end

  def split
    total_cost/@participants.keys.count
  end

  def owed
    owed = {}
    @participants.each do |key, value|
      owed[key] = (30 - value)
    end
    owed
  end
end
