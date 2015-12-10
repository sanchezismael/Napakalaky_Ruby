# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki
  class Cultist
    attr_reader :gainedLevels
    def initialize(n,g)
      @name = n
      @gainedLevels = g
    end 
  end
end