#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Napakalaki
  require_relative "prize.rb"
  require_relative "bad_consequence.rb"
  require_relative "monster.rb"
  require_relative "treasure_kind.rb"
  require_relative "dice.rb"
  require_relative "player.rb"
  require_relative "card_dealer.rb"

  
  class PruebaNapakalaki
    
   monster = Array.new 
    
    #3 Byakhees de bonanza
    pByakhees = Prize.new(2,1)
    bByakhees = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    monster << Monster.new('3 Byakhees de bonanza', 8, bByakhees, pByakhees)
    
    #Chibithulhu
    pChibithulhu = Prize.new(1,1)
    bChibithulhu = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::BOTHHANDS], nil)
    monster << Monster.new('Chibithulhu',2,bChibithulhu,pChibithulhu)    

    #El sopor de Dunwich
    pDunwich = Prize.new(1,1)
    bDunwich = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES],nil)
    monster << Monster.new('El sopor de Dunwich', 2, bDunwich, pDunwich)
    
    #Angeles Ibicencos
    pAngeles = Prize.new(4,1)
    bAngeles = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de esta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
    monster << Monster.new('Angeles de la noche Ibicenca', 14, bAngeles, pAngeles)
    
    #El gorrón en el umbral
    pGorron = Prize.new(3,1)
    bGorron = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles', 0, 5, 0)
    monster << Monster.new('El gorrón en el umbral', 10, bGorron, pGorron)
    
    #H.P. Munchcraft
    pHP = Prize.new(2,1)
    bHP = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',0, [TreasureKind::ARMOR], nil)
    monster << Monster.new('H.P. Munchcraft', 6, bHP, pHP)  
    
    #Bichgooth
    pBichgooth = Prize.new(1,1)
    bBichgooth = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descartas la armadura visible', 0, [TreasureKind::ARMOR], nil)
    monster << Monster.new('Bichgooth', 2, bBichgooth, pBichgooth)
    
    #El rey de rosa
    pReyRosa = Prize.new(4,2)
    bReyRosa = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles', 5, 3, 0)
    monster << Monster.new('El rey de rosa', 13, bReyRosa, pReyRosa)
    
    #La que redacta en las tinieblas
    pTinieblas = Prize.new(1,1)
    bTinieblas = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
    monster << Monster.new('La que redacta en las tinieblas', 2, bTinieblas, pTinieblas)
    
    #Los hondos
    pHondos = Prize.new(2,1)
    bHondos = BadConsequence.newDeath('Estos monstruos resultan bastante superdiciales y te aburren mortalmente. Estás muerto',true)
    monster << Monster.new('Los hondos', 8, bHondos, pHondos)
    
    #Semillas Cthulhu
    pSemillas = Prize.new(2,1)
    bSemillas = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0, 2)
    monster << Monster.new('Semillas Cthulhu', 4, bSemillas, pSemillas)
    
    #Dameargo
    pDameargo = Prize.new(2,1)
    bDameargo = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear.Pierdes una mano visible', 0, [TreasureKind::ONEHAND], nil)
    monster << Monster.new('DAmeargo', 1, bDameargo, pDameargo)
        
    #Pollipólipo volante
    pPollipolito = Prize.new(1,1)
    bPollipolito = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles.', 3, 0, 0)
    monster << Monster.new('Pollipolito volante', 3, bPollipolito, pPollipolito)
    
    #Yskhtihyssg-Goth
    pYskhtihyssg = Prize.new(3,1)
    bYskhtihyssg = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre. Estas muerto',true)
    monster << Monster.new('Yskhtihyssg-Goth', 12, bYskhtihyssg, pYskhtihyssg)
    
    #Familia Feliz
    pFamiliaFeliz = Prize.new(4,1)
    bFamiliaFeliz = BadConsequence.newDeath('La familia te atrapa. Estas muerto.',true)
    monster << Monster.new('Familia Feliz', 1, bFamiliaFeliz, pFamiliaFeliz)
    
    #Roboggoth
    pRoboggoth = Prize.new(2, 1)
    bRoboggoth = BadConsequence.newLevelSpecificTreasures('La quinte directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible', 2, [TreasureKind::BOTHHANDS], nil)
    monster << Monster.new('Roboggoth', 8, bRoboggoth, pRoboggoth)
    
    #El Espía
    pEspia = Prize.new(1, 1)
    bEspia = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], nil)
    monster << Monster.new('El Espia', 5, bEspia, pEspia)
    
    #El Lenguas
    pLenguas = Prize.new(1, 1)
    bLenguas = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
    monster << Monster.new('El Lenguas', 20, bLenguas, pLenguas)
    
    #Bicéfalo
    pBicefalo = Prize.new(1, 1)
    bBicefalo = BadConsequence.newLevelSpecificTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos', 3,[TreasureKind::BOTHHANDS], nil)
    monster << Monster.new('Bicefalo', 20, bBicefalo, pBicefalo)
        
    #Esto es una prueba de que funciona
#    @tre = Array.new([TreasureKind::ARMOR])
#    price = Prize.new(4,1)
#    un_bad = BadConsequence.newLevelSpecificTreasures("Malo", 2,[TreasureKind::ARMOR] , nil)
#    monstruo = Monster.new("Mi monstruo", 50, un_bad, price)
#    
#    puts monstruo.to_s
    
    
    #############################################################
    #
    # BATERÍA DE PRUEBAS
    #
    #############################################################
    
    # Mostrar los monstruos que tienen un nivel de combate superior a 10
    
    puts "Mostrar todos los monstruos  que tengan un nivel de combate superior a 10."
    monster.each do |i|
      if i.combatLevel > 10
        puts i
      end
    end
    
    # Mostrar los monstruos que tengan un mal rollo que implique sólo pérdida de niveles
    
    puts "\n\nMostrar todos los monstruos que tengan un mal rollo que implique sólo pérdida de niveles"
    monster.each do |i|
      if i.badConsequence.levels > 0
        if i.badConsequence.nVisibleTreasures == 0
          if i.badConsequence.nHiddenTreasures == 0
            if i.badConsequence.death == false
              if i.badConsequence.specificHiddenTreasures == nil
                if i.badConsequence.specificVisibleTreasures == nil
                  puts i
                end
              end
            end
          end
        end
      end
    end
    
    # Mostrar los monstruos cuyo buen rollo indique una ganancia de niveles superior a 1
    

    
    # Mostrar los monstruos cuyo mal rollo suponga la pérdidas de un determinado tipo de tesoros, ya sea
    # visibles y/u ocultos

    puts "\n\nMostrar todos los monstruos que tengan un mal rollo que suponga la pérdida de un determinado  tipo  de  tesoros  ya  sea   visibles  y/o  ocultos.  Debe  mostrarse   el nombre, nivel de combate, buen rollo y mal rollo de cada monstruo."
    monster.each do |i|
      if i.badConsequence.specificHiddenTreasures != nil || i.badConsequence.specificVisibleTreasures != nil
        puts i        
      end
    end
    
    #####################################################
    puts "\nEJ EXAMEN - Monstruo con mayor nivel"
    
    
   maxlevel = monster[0]
   pos = 0
   tamanio = monster.size
   

    for i in(0..tamanio-1)
      if monster[i].combatLevel >= maxlevel.combatLevel
        maxlevel = monster[i]
        pos = i
      end 
    end
    
    puts "\nPosición: #{pos}"
    puts maxlevel
    
    ###################################
    m = monster[0]
    maximo = 0
    pos = 0
    n = 0
    monster.each do |i|
      if(i.combatLevel > maximo)
        maximo = i.combatLevel
        m = i
        pos = n
      end
      n = n+1
    end
    puts "El monstruo con maximo nivel que esta en la posicion: #{pos} es: #{m}"
    ##################################
    dc = Dice.getInstance
    puts dc.nextNumber
    end
    
  jugador = Player.new('Pepe')
  puts jugador.name
  #puts jugador.enemy
  
  puts CardDealer.instance
    
  end
    
