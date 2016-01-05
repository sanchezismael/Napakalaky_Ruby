#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module Napakalaki

  require 'singleton'
  require_relative 'treasure.rb'
  require_relative 'treasure_kind.rb'
  require_relative 'monster.rb'
  require_relative 'prize.rb'
  require_relative 'bad_consequence.rb'
  require_relative 'numeric_bad_consequence.rb'
  require_relative 'specific_bad_consequence.rb'
  require_relative 'death_bad_consequence.rb'
  require_relative 'cultist.rb'
  
  class CardDealer

    include Singleton
    
    private
    def initialize
      @unusedTreasures = Array.new
      @usedTreasures = Array.new
      @usedMonsters = Array.new
      @unusedMonsters = Array.new
      @unusedCultists = Array.new
    end

    def initTreasureCardDeck
      @unusedTreasures << Treasure.new("Si mi amo!", 4, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigacion", 3, (TreasureKind::SHOES))
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, (TreasureKind::HELMET))
      @unusedTreasures << Treasure.new("A prueba de babas", 2, (TreasureKind::ARMOR))
      @unusedTreasures << Treasure.new("Botas de lluvia acida", 2, (TreasureKind::ARMOR))
      @unusedTreasures << Treasure.new("Casco minero",2 , (TreasureKind::HELMET))
      @unusedTreasures << Treasure.new("Ametralladora Thomson", 4, (TreasureKind::BOTHHANDS))
      @unusedTreasures << Treasure.new("Camiseta de la UGR", 1, (TreasureKind::ARMOR))
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Fed alopodo", 3, (TreasureKind::HELMET))
      @unusedTreasures << Treasure.new("Hacha prehistorica", 2, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, (TreasureKind::ARMOR))
      @unusedTreasures << Treasure.new("Gaita", 4, (TreasureKind::BOTHHANDS))
      @unusedTreasures << Treasure.new("Insecticida", 2, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, (TreasureKind::BOTHHANDS))
      @unusedTreasures << Treasure.new("Garabato mistico", 2, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("La rebeca metalica", 2, [TreasureKind::ARMOR])
      @unusedTreasures << Treasure.new("Lanzallamas", 4, (TreasureKind::BOTHHANDS))
      @unusedTreasures << Treasure.new("Necrocomicon", 1, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Necronomicon", 5, (TreasureKind::BOTHHANDS))
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, (TreasureKind::BOTHHANDS))
      @unusedTreasures << Treasure.new("Necrognomicon", 2, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Necrotelecom", 2, (TreasureKind::HELMET))
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Necroplayboycon", 3, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Porra preternatural", 2, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Shogulador",1 , (TreasureKind::BOTHHANDS))
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, (TreasureKind::ONEHAND))
      @unusedTreasures << Treasure.new("Tentaculo de pega",2 , (TreasureKind::HELMET))
      @unusedTreasures << Treasure.new("Zapato deja-amigos",1 , (TreasureKind::SHOES))
      
      shuffleTreasures
    end

    def initMonsterCardDeck

      #3 Byakhees de bonanza
      pByakhees = Prize.new(2,1)
      bByakhees = SpecificBadConsequence.new('Pierdes tu armadura visible y otra oculta',0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      @unusedMonsters << Monster.new('3 Byakhees de bonanza', 8, bByakhees, pByakhees)

      #Chibithulhu
      pChibithulhu = Prize.new(1,1)
      bChibithulhu = SpecificBadConsequence.new('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::BOTHHANDS], [])
      @unusedMonsters << Monster.new('Chibithulhu',2,bChibithulhu,pChibithulhu)    

      #El sopor de Dunwich
      pDunwich = Prize.new(1,1)
      bDunwich = SpecificBadConsequence.new('El primordial bostezo contagioso. Pierdes el calzado visible', 0, [TreasureKind::SHOES],[])
      @unusedMonsters << Monster.new('El sopor de Dunwich', 2, bDunwich, pDunwich)

      #Angeles Ibicencos
      pAngeles = Prize.new(4,1)
      bAngeles = SpecificBadConsequence.new('Te atrapan para llevarte de esta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
      @unusedMonsters << Monster.new('Angeles de la noche Ibicenca', 14, bAngeles, pAngeles)

      #El gorrón en el umbral
      pGorron = Prize.new(3,1)
      bGorron = NumericBadConsequence.new('Pierdes todos tus tesoros visibles', 0, BadConsequence.getmaxtreasures, 0)
      @unusedMonsters << Monster.new('El gorrón en el umbral', 10, bGorron, pGorron)

      #H.P. Munchcraft
      pHP = Prize.new(2,1)
      bHP = SpecificBadConsequence.new('Pierdes la armadura visible',0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new('H.P. Munchcraft', 6, bHP, pHP)  

      #Bichgooth
      pBichgooth = Prize.new(1,1)
      bBichgooth = NumericBadConsequence.new('Sientes bichos bajo la ropa. Descartas la armadura visible', 0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.new('Bichgooth', 2, bBichgooth, pBichgooth)

      #El rey de rosa
      pReyRosa = Prize.new(4,2)
      bReyRosa = NumericBadConsequence.new('Pierdes 5 niveles y 3 tesoros visibles', 5, 3, 0)
      @unusedMonsters << Monster.new('El rey de rosa', 13, bReyRosa, pReyRosa)

      #La que redacta en las tinieblas
      pTinieblas = Prize.new(1,1)
      bTinieblas = NumericBadConsequence.new('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
      @unusedMonsters << Monster.new('La que redacta en las tinieblas', 2, bTinieblas, pTinieblas)

      #Los hondos
      pHondos = Prize.new(2,1)
      bHondos = DeathBadConsequence.new('Estos monstruos resultan bastante superdiciales y te aburren mortalmente. Estás muerto')
      @unusedMonsters << Monster.new('Los hondos', 8, bHondos, pHondos)

      #Semillas Cthulhu
      pSemillas = Prize.new(2,1)
      bSemillas = NumericBadConsequence.new('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0, 2)
      @unusedMonsters << Monster.new('Semillas Cthulhu', 4, bSemillas, pSemillas)

      #Dameargo
      pDameargo = Prize.new(2,1)
      bDameargo = SpecificBadConsequence.new('Te intentas escaquear.Pierdes una mano visible', 0, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new('DAmeargo', 1, bDameargo, pDameargo)

      #Pollipólipo volante
      pPollipolito = Prize.new(1,1)
      bPollipolito = NumericBadConsequence.new('Da mucho asquito. Pierdes 3 niveles.', 3, 0, 0)
      @unusedMonsters << Monster.new('Pollipolito volante', 3, bPollipolito, pPollipolito)

      #Yskhtihyssg-Goth
      pYskhtihyssg = Prize.new(3,1)
      bYskhtihyssg = DeathBadConsequence.new('No le hace gracia que pronuncien mal su nombre. Estas muerto')
      @unusedMonsters << Monster.new('Yskhtihyssg-Goth', 12, bYskhtihyssg, pYskhtihyssg)

      #Familia Feliz
      pFamiliaFeliz = Prize.new(4,1)
      bFamiliaFeliz = DeathBadConsequence.new('La familia te atrapa. Estas muerto.')
      @unusedMonsters << Monster.new('Familia Feliz', 1, bFamiliaFeliz, pFamiliaFeliz)

      #Roboggoth
      pRoboggoth = Prize.new(2, 1)
      bRoboggoth = NumericBadConsequence.new('La quinte directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible', 2, [TreasureKind::BOTHHANDS], [])
      @unusedMonsters << Monster.new('Roboggoth', 8, bRoboggoth, pRoboggoth)

      #El Espía
      pEspia = Prize.new(1, 1)
      bEspia = SpecificBadConsequence.new('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], [])
      @unusedMonsters << Monster.new('El Espia', 5, bEspia, pEspia)

      #El Lenguas
      pLenguas = Prize.new(1, 1)
      bLenguas = NumericBadConsequence.new('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
      @unusedMonsters << Monster.new('El Lenguas', 20, bLenguas, pLenguas)

      #Bicéfalo
      pBicefalo = Prize.new(1, 1)
      bBicefalo = SpecificBadConsequence.new('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos', 3,[TreasureKind::BOTHHANDS], [])
      @unusedMonsters << Monster.new('Bicefalo', 20, bBicefalo, pBicefalo)
      
      #El mal indecible impronunciable
      pIndecible = Prize.new(3,1)
      bIndecible = SpecificBadConsequence.new('Pierdes 1 mano visible', 0, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new('El mal indecible impronunciable', 10, bIndecible, pIndecible,-2)
      
      #Testigos Oculares
      pTestigos = Prize.new(2, 1)
      bTestigos = NumericBadConsequence.new('Pierdes tus tesoros visible.Jajaja', 0, 5, 0)
      @unusedMonsters << Monster.new('Testigos Oculares', 6, bTestigos, pTestigos,2)
      
      #El gran Cthulhu
      price = Prize.new(2,5)
      badConsequence = DeathBadConsequence.new('Hoy no es tu día de suerte. Mueres')
      @unusedMonsters << Monster.new('El gran Cthulhu', 20,price, badConsequence, 4)

      #Serpiente político
      price = Prize.new(2,1)
      badConsequence = NumericBadConsequence.new('Tu gobierno te recorta dos niveles',2,0,0)
      @unusedMonsters << Monster.new('Serpiente político', 8, price, badConsequence, -2)

      #Felpuggoth
      price = Prize.new(1,1)
      badConsequence = SpecificBadConsequence.new('Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas', 0, [TreasureKind::HELMET, TreasureKind::ARMOR],
      [TreasureKind::ONEHAND, TreasureKind::BOTHHANDS])
      @unusedMonsters << Monster.new('Felpuggoth', 2, price, badConsequence, 5)

      #Shoggoth
      price = Prize.new(4,2)
      badConsequence = NumericBadConsequence.new('Pierdes 2 niveles', 2, 0, 0,)
      @unusedMonsters << Monster.new('Shoggoth',16, price, badConsequence, -4)

      #Lolitagooth
      price = Prize.new(1,1)
      badConsequence = SpecificBadConsequence.new('Pintalabios negro. Pierdes 2 niveles',2,0,0)
      @unusedMonsters << Monster.new('Lolitagooth', 2, price, badConsequence, 3)
          
      shuffleMonsters
      
    end
    
    def initCultistCardDeck
      @unusedCultists << Cultist.new('Sectario: +1 por cada sectario en juego. No puedes dejar de ser sectario', 1)
      @unusedCultists << Cultist.new('Sectario: +2 por cada sectario en juego. No puedes dejar de ser sectario', 2)
      @unusedCultists << Cultist.new('Sectario: +1 por cada sectario en juego. No puedes dejar de ser sectario', 1)
      @unusedCultists << Cultist.new('Sectario: +2 por cada sectario en juego. No puedes dejar de ser sectario', 2)
      @unusedCultists << Cultist.new('Sectario: +1 por cada sectario en juego. No puedes dejar de ser sectario', 1)
      @unusedCultists << Cultist.new('Sectario: +1 por cada sectario en juego. No puedes dejar de ser sectario', 1)
    end

    def shuffleTreasures
      @unusedTreasures.shuffle
    end

    def shuffleMonsters
      @unusedMonsters.shuffle
    end
    
    def shuffleCultists
      @unusedCultists.shuffle
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
      @unusedMonsters.delete(monstruo)
      
      return monstruo
    end
    
    def nextCultist
      cultist = @unusedCultist.at(0)
      @unusedCultist.delete(cultist)
      
      return cultist
      
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
      initCultistCardDeck
    end
    
    def to_s
      "unusedTreasures: #{@unusedTreasures}
       usedTreasures: #{@usedTreasures}
       usedMonsters: #{@usedMonsters}
       unusedMonsters: #{@unusedMonsters} "
    end
  end

end
