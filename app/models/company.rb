class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def freebie
        self.freebies
    end

    def dev
        self.devs
    end

    def give_freebie(dev, item_name, value)
        item = Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
        item.save
    end

    def self.oldest_company
        Company.find_by(founding_year:  Company.minimum(:founding_year))

    end
end
