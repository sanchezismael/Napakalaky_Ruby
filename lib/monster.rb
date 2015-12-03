#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
    attr_reader :name, :combatLevel, :badConsequence
  def initialize(name,level,bc,prize)
    @name = name
    @combatLevel = level
    @prize = prize
    @badConsequence = bc
  end
  
  def getLevelsGained()
    @prize.levels
  end
  
  def getTreasuresGained
    @badConsequece.levels
  end
  
  
  def to_s
    "Nombre: #{@name}
     Nivel de combate: #{@combatLevel}
    Buen rollo: #{@prize.to_s}
    Mal rollo: #{@badConsequence.to_s}"
  end
  
end
