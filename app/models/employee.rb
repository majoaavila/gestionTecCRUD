class Employee < ApplicationRecord
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    def salary
       if self[:admin]
        self[:salary] = 12300
       else
        self[:salary] = 7700
       end
    end
end
