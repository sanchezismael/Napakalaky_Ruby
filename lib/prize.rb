#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module Napakalaki
  class Prize
    def initialize(un_treasures,un_level)
      @treasures= un_treasures
      @level = un_level
    end
    attr_reader :treasures, :level
    
    def to_s
      "Tesoros ganados: #{@treasures} / Niveles ganados: #{@level}"
    end
  end


end