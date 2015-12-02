#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki

  require 'singleton'
  require_relative 'treasure.rb'
  class CardDealer

    include Singleton
    
    private
    def initialize
      @unusedTreasures = Array.new
      @usedTreasures = Array.new
      @usedMonsters = Array.new
      @unusedMonsters = Array.new
    end

    def initTreasureCardDeck
      @unusedTreasures << Treasure.new("¡Sí mi amo!", 4, [TreasureKind::HELMET])
      @unusedTreasures << Treasure.new("Botas de investigación", 3, [TreasureKind::SHOES])
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, [TreasureKind::HELMET])
      @unusedTreasures << Treasure.new("A prueba de babas", 2, [TreasureKind::ARMOR])
      @unusedTreasures << Treasure.new("Botas de lluvia ácida", 2, [TreasureKind::ARMOR])
      @unusedTreasures << Treasure.new("Casco minero",2 , [TreasureKind::HELMET])
      @unusedTreasures << Treasure.new("Ametralladora Thomson", 4, [TreasureKind::BOTHHANDS])
      @unusedTreasures << Treasure.new("Camiseta de la UGR", 1, [TreasureKind::ARMOR])
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Fed alópodo", 3, [TreasureKind::HELMET])
      @unusedTreasures << Treasure.new("Hacha prehistórica", 2, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, [TreasureKind::ARMOR])
      @unusedTreasures << Treasure.new("Gaita", 4, [TreasureKind::BOTHHANDS])
      @unusedTreasures << Treasure.new("Insecticida", 2, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, [TreasureKind::BOTHHANDS])
      @unusedTreasures << Treasure.new("Garabato místico", 2, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("La rebeca metálica", 2, [TreasureKind::ARMOR])
      @unusedTreasures << Treasure.new("Lanzallamas", 4, [TreasureKind::BOTHHANDS])
      @unusedTreasures << Treasure.new("Necrocomicón", 1, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Necronomicón", 5, [TreasureKind::BOTHHANDS])
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, [TreasureKind::BOTHHANDS])
      @unusedTreasures << Treasure.new("Necrognomicón", 2, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Necrotelecom", 2, [TreasureKind::HELMET])
      @unusedTreasures << Treasure.new("Mazo d elos antiguos", 3, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Necroplayboycón", 3, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Porra preternatural", 2, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Shogulador",1 , [TreasureKind::BOTHHAND])
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, [TreasureKind::ONEHAND])
      @unusedTreasures << Treasure.new("Tentáculo de pega",2 , [TreasureKind::HELMET])
      @unusedTreasures << Treasure.new("Zapato deja-amigos",1 , [TreasureKind::SHOES])
    end

    def initMonsterCardDeck

      #3 Byakhees de bonanza
      pByakhees = Prize.new(2,1)
      bByakhees = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      @unusedMonsters << Monster.new('3 Byakhees de bonanza', 8, bByakhees, pByakhees)

      #Chibithulhu
      pChibithulhu = Prize.new(1,1)
      bChibithulhu = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::BOTHHANDS], nil)
      @unusedMonsters << Monster.new('Chibithulhu',2,bChibithulhu,pChibithulhu)    

      #El sopor de Dunwich
      pDunwich = Prize.new(1,1)
      bDunwich = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES],nil)
      @unusedMonsters << Monster.new('El sopor de Dunwich', 2, bDunwich, pDunwich)

      #Angeles Ibicencos
      pAngeles = Prize.new(4,1)
      bAngeles = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de esta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
      @unusedMonsters << Monster.new('Angeles de la noche Ibicenca', 14, bAngeles, pAngeles)

      #El gorrón en el umbral
      pGorron = Prize.new(3,1)
      bGorron = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles', 0, BadConsequence.MAXTREASURES, 0)
      @unusedMonsters << Monster.new('El gorrón en el umbral', 10, bGorron, pGorron)

      #H.P. Munchcraft
      pHP = Prize.new(2,1)
      bHP = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible',0, [TreasureKind::ARMOR], nil)
      @unusedMonsters << Monster.new('H.P. Munchcraft', 6, bHP, pHP)  

      #Bichgooth
      pBichgooth = Prize.new(1,1)
      bBichgooth = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descartas la armadura visible', 0, [TreasureKind::ARMOR], nil)
      @unusedMonsters << Monster.new('Bichgooth', 2, bBichgooth, pBichgooth)

      #El rey de rosa
      pReyRosa = Prize.new(4,2)
      bReyRosa = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles', 5, 3, 0)
      @unusedMonsters << Monster.new('El rey de rosa', 13, bReyRosa, pReyRosa)

      #La que redacta en las tinieblas
      pTinieblas = Prize.new(1,1)
      bTinieblas = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
      @unusedMonsters << Monster.new('La que redacta en las tinieblas', 2, bTinieblas, pTinieblas)

      #Los hondos
      pHondos = Prize.new(2,1)
      bHondos = BadConsequence.newDeath('Estos monstruos resultan bastante superdiciales y te aburren mortalmente. Estás muerto',true)
      @unusedMonsters << Monster.new('Los hondos', 8, bHondos, pHondos)

      #Semillas Cthulhu
      pSemillas = Prize.new(2,1)
      bSemillas = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0, 2)
      @unusedMonsters << Monster.new('Semillas Cthulhu', 4, bSemillas, pSemillas)

      #Dameargo
      pDameargo = Prize.new(2,1)
      bDameargo = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear.Pierdes una mano visible', 0, [TreasureKind::ONEHAND], nil)
      @unusedMonsters << Monster.new('DAmeargo', 1, bDameargo, pDameargo)

      #Pollipólipo volante
      pPollipolito = Prize.new(1,1)
      bPollipolito = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles.', 3, 0, 0)
      @unusedMonsters << Monster.new('Pollipolito volante', 3, bPollipolito, pPollipolito)

      #Yskhtihyssg-Goth
      pYskhtihyssg = Prize.new(3,1)
      bYskhtihyssg = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre. Estas muerto',true)
      @unusedMonsters << Monster.new('Yskhtihyssg-Goth', 12, bYskhtihyssg, pYskhtihyssg)

      #Familia Feliz
      pFamiliaFeliz = Prize.new(4,1)
      bFamiliaFeliz = BadConsequence.newDeath('La familia te atrapa. Estas muerto.',true)
      @unusedMonsters << Monster.new('Familia Feliz', 1, bFamiliaFeliz, pFamiliaFeliz)

      #Roboggoth
      pRoboggoth = Prize.new(2, 1)
      bRoboggoth = BadConsequence.newLevelSpecificTreasures('La quinte directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible', 2, [TreasureKind::BOTHHANDS], nil)
      @unusedMonsters << Monster.new('Roboggoth', 8, bRoboggoth, pRoboggoth)

      #El Espía
      pEspia = Prize.new(1, 1)
      bEspia = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], nil)
      @unusedMonsters << Monster.new('El Espia', 5, bEspia, pEspia)

      #El Lenguas
      pLenguas = Prize.new(1, 1)
      bLenguas = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
      @unusedMonsters << Monster.new('El Lenguas', 20, bLenguas, pLenguas)

      #Bicéfalo
      pBicefalo = Prize.new(1, 1)
      bBicefalo = BadConsequence.newLevelSpecificTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos', 3,[TreasureKind::BOTHHANDS], nil)
      @unusedMonsters << Monster.new('Bicefalo', 20, bBicefalo, pBicefalo)


    end

    def shuffleTreasures
      @unusedTreasures.shuffle
    end

    def shuffleMonsters
      @unusedMonsters.shuffle
    end

    public

    def nextTreasure
      if @unusedTreasures.size == 0
        @usedTreasures.each do |i|
          @unusedTreasures << i
        end
        shuffleTreasures
        @usedTreasures.clear
      end
      
      tesoro = @unusedTreasures.at(0)
      @usedTreasures << tesoro
      @unusedTreasures.delete(tesoro)
      
      return tesoro
    end

    def nextMonster
      if @unusedMonsters.size == 0
        @usedMonsters.each do |i|
          @unusedMonsters << i
        end
        shuffleMonsters
        @usedMonsters.clear
      end
      
      monstruo = @unusedMonsters.at(0)
      @usedMonsters << monstruo
      @unusedTreasures.delete(monstruo)
      
      return monstruo
    end

    def giveTreasureBack(t)
      @usedTreasures << t
    end

    def giveMonsterBack(m)
      @usedMonsters << m
    end

    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
    end

  end

end
