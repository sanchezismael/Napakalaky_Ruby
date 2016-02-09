# encoding: utf-8

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
class Dice
  include Singleton
  
  def initialize  
  end
  
#  def self.getInstance()
#    Dice.instance
#  end
  
  def nextNumber()
    r = Random.new
    r.rand(6..6)
  end
end
