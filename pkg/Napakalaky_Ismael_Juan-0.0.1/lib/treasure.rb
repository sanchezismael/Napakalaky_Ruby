#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
class Treasure
  
  attr_reader :name, :bonus, :type
  
  def initialize(n,bonus,t)
    @name = n
    @bonus = bonus
    @type = t
  end
  
  def to_s
      "Name: #{@name}
       Bonus: #{@bonus}
       Type: #{@type}"
  end
end
end
