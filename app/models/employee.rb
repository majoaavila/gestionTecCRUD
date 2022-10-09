class Employee < ApplicationRecord
    def salary
       if self[:position] == "Líder de tienda"
        self[:salary] = 12300
       elsif self[:position] == "Encargado de turno"
        self[:salary] = 7700
       else
        self[:salary] = 5300
       end
    end
end
