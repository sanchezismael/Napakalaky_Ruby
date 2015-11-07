#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  def initialize(name,level,bc,price)
    @name = name
    @combatLevel = level
    @Prize = price
    @badConsequence = bc
  end
    
  attr_reader :name, :combatLevel, :badConsequence
  
  def getLevelsGained()
    
  end
  
  def getTreasuresGained
    
  end
  
  
  def to_s
    "\nNombre: #{@name} \n Nivel de combate: #{@combatLevel} \n Buen rollo: #{@Prize.to_s} \n #{@BadConsequence.to_s}"
  end
  
end
