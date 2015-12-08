#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
    attr_reader :name, :combatLevel, :badConsequence, :levelChangeAgainstCultisPlayer
  def initialize(name,level,bc,prize,lc = 0)
    @name = name
    @combatLevel = level
    @prize = prize
    @badConsequence = bc
    @levelChangeAgainstCultisPlayer = lc
  end
  
  def self.newMonster(n,l,bc,p,lc)
    new(n,l,bc,p,lc)
  end
  
  def getLevelsGained()
    @prize.levels
  end
  
  def getTreasuresGained
    @badConsequence.levels
  end
  
  def to_s
    "Nombre: #{@name}
     Nivel de combate: #{@combatLevel}
    Buen rollo: #{@prize.to_s}
    Mal rollo: #{@badConsequence.to_s}"
  end
  
end
