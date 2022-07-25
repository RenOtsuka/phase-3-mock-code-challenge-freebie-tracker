class Freebie < ActiveRecord::Base
    belongs_to :company 
    belongs_to :dev
    
    def devs
        self.dev
    end

    def companies
        self.company
    end

    def print_details
        "#{devs.name} owns a #{self.item_name} from #{companies.name}"
    end


end
