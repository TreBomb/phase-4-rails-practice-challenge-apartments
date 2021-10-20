class Tenant < ApplicationRecord
    validates :name, presence: true
    validates :age, length: {minimum: 20}
    
    has_many :leases
    has_many :apartments, through: :leases
end
