class Museum

    attr_reader :name,
                :exhibits,
                :patrons

    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def reccomend_exhibits(patron)
        reccomendation = []
        @exhibits.each do |exhibit|
            patron.interests.each do |interest|
                if interest == exhibit.name
                    reccomendation << exhibit

                end
            end
        end
        reccomendation
    end

    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interest
        interest_hash = Hash.new

        @exhibits.each do |exhibit|
            interest_patrons = []
            @patrons.each do |patron|
                patron.interests.each do |interest|
                    if interest == exhibit.name
                        interest_patrons << patron
                    end
                end
            end
            interest_hash.store(exhibit, interest_patrons)
        end
        
        interest_hash
    end

    def ticket_lottery_contestants(lottery_exhibit)
        contestants = []
        patrons_by_exhibit_interest.each do |exhibit, patrons|
            patrons.each do |patron|
                if exhibit.name == lottery_exhibit.name
                    if patron.spending_money < exhibit.cost
                        contestants << patron
                    end
                end
            end
        end

        if contestants.count == 0
            nil
        else
            contestants
        end
        
    end

    def draw_lottery_winner(lottery_exhibit)
        winner = ticket_lottery_contestants(lottery_exhibit).sample
        if winner != nil
            winner.name
        else
            nil
        end
        
    end

    def announce_lottery_winner(lottery_exhibit)
        winner = draw_lottery_winner(lottery_exhibit)
        if winner != nil
            puts "#{winner} has won the #{lottery_exhibit.name} exhibit lottery!"
        else
            puts "No winners for this lottery"
        end
    end
end
