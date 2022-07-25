class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def freebie
        self.freebies
    end

    def company
        self.companies
    end

    def received_one?(item_name)
        freebie.map do |item|
            if item.item_name == item_name
                return true
            end
        end

        return false
    end

    def give_away(dev, item_name)
        give_away_item = freebie.find {|item| item.item_name === item_name}
        if give_away_item != nil
            Freebie.create(item_name: item_name, value: give_away_item.value, company_id: give_away_item.company_id, dev_id: dev.id)
            give_away_item.destroy
        end
    end
end
