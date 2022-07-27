class Museum

    attr_reader :name,
                :exhibits

    def initialize(name)
        @name = name
        @exhibits = []
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
end
