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
    
    #Chibithulhu
    pChibithulhu = Prize.new(1,1)
    bChibithulhu = BadConsequence.newLevelSpecificTreasures('Embobados con el
                lindo primigenio te descartas de tu casco visible', 0, 
                [TreasureKind::BOTHHANDS], nil)
    monster << Monster.new('Chibithulhu',2,bChibithulhu,pChibithulhu)    

    #El sopor de Dunwich
    pDunwich = Prize.new(1,1)
    bDuncwich = BadConsequence.newLevelSpecificTreasures('El primordial bostezo 
                contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES],
                nil)
    monster << Monster.new('El sopor de Dunwich', 2, bDunwich, pDunwich)
    
    #El gorrón en el umbral
    pGorron = Prize.new(3,1)
    bGorron = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus 
              tesoros visibles', 0, 5, 0)
    monster << Monster.new('El gorrón en el umbral', 10, bGorron, pGorron)
    
    #H.P. Munchcraft
    pHP = Prize.new(2,1)
    bHP = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',
          0, [TreasureKind::ARMOR], nil)
    monster << Monster.new('H.P. Munchcraft', 6, bHP, pHP)  
    
    #Bichgooth
    pBichgooth = Prize.new(1,1)
    bBichgooth = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la
                 ropa. Descartas la armadura visible', 0, [TreasureKind::ARMOR], nil)
    monster << Monster.new('Bichgooth', 2, bBichgooth, pBichgooth)
    
    #La que redacta en las tinieblas
    pTinieblas = Prize.new(1,1)
    bTienieblas = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y
                  pierdes 2 niveles', 2, 0, 0)
    monster << Monster.new('La que redacta en las tinieblas', 2, bTinieblas, pTinieblas)
    
    #Los hondos
    pHondos = Prize.new(2,1)
    bHondos = BadConsequence.newDeath('Estos monstruos resultan bastante 
              superdiciales y te aburren mortalmente. Estás muerto')
    monster << Monster.new('Los hondos', 8, bHondos, pHondos)
    
    #Semillas Cthulhu
    pSemillas = Prize.new(2,1)
    bSemillas = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 
                tesoros ocultos', 2, 0, 2)
    monster << Monster.new('Semillas Cthulhu', 4, bSemillas, pSemillas)
    
    #Dameargo
    pDameargo = Prize.new(2,1)
    bDameargo = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear.
                Pierdes una mano visible', 0, [TreasureKind::ONEHAND], nil)
    monster << Monster.new('DAmeargo', 1, bDameargo, pDameargo)
    
    
    
    #Esto es una prueba de que funciona
    @tre = Array.new([TreasureKind::ARMOR])
    price = Prize.new(4,1)
    un_bad = BadConsequence.newLevelSpecificTreasures("Malo", 2,[TreasureKind::ARMOR] , nil)
    monstruo = Monster.new("Mi monstruo", 50, un_bad, price)
    
    puts monstruo.to_s
  end
  
end


