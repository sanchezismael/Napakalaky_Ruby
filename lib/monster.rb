# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  def initialize(name,level,bc,price)
    @name = name
    @combatLevel = level
    @Prize = price
    @BadConsequence = bc
  end
    
    attr_accessor :name, :combatLevel
    
    def to_s
      "Nombre: #{@name} \n Nivel de combate: #{@combatLevel} \n Buen rollo: 
        #{@Prize.to_s} \n Mal rollo: #{@BadConsequence.to_s}"
    end
  
end
