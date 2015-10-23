#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Napakalaki
  require_relative "prize.rb"
  require_relative "bad_consequence.rb"
  require_relative "monster.rb"
  require_relative "treasure_kind.rb"
  class PruebaNapakalaki
    
   monster = Array.new 
   
    #El rey de rosa
    pReyRosa = Prize.new(4,2)
    bReyRosa = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 
                tesoros visibles', 5, 3, 0)
    monster << Monster.new('El rey de rosa', 13, bReyRosa, pReyRosa)
    
    #Angeles Ibicencos
    pAngeles = Prize.new(4,1)
    bAngeles = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte
                de esta y te dejan caer en mitad del vuelo. Descarta 1 mano visible
                y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
    
    #3 Byakhees de bonanza
    pByakhees = Prize.new(2,1)
    bByakhees = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura 
                visible y otra oculta',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    monster << Monster.new('3 Byakhees de bonanza', 8, bByakhees, pByakhees)
    
    #
    
    
    #Esto es una prueba de que funciona
    @tre = Array.new([TreasureKind::ARMOR])
    price = Prize.new(4,1)
    un_bad = BadConsequence.newLevelSpecificTreasures("Malo", 2,[TreasureKind::ARMOR] , nil)
    monstruo = Monster.new("Mi monstruo", 50, un_bad, price)
    
    puts monstruo.to_s
  end
  
end


