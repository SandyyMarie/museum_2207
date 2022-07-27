require './lib/patron'
require './lib/exhibit'
require './lib/museum'

RSpec.describe Museum do
    before :each do
        @dmns = Museum.new("Denver Museum of Nature and Science")
        @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})
        @patron_1 = Patron.new("Bob", 20)
        @patron_2 = Patron.new("Sally", 20)
    end

    it 'exists' do 
        expect(@dmns).to be_a(Museum)
    end

    it 'can return the museum name' do
        expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end

    it 'can return the current empty array of exhibits at the museum' do
        expect(@dmns.exhibits).to eq([])
    end

    it 'can add and return an array of exhibits' do
        @dmns.add_exhibit(@gems_and_minerals)
        @dmns.add_exhibit(@dead_sea_scrolls)
        @dmns.add_exhibit(@imax)
        expect(@dmns.exhibits.count).to eq(3)
    end

    it 'can return the interest patrons have' do
        @dmns.add_exhibit(@gems_and_minerals)
        @dmns.add_exhibit(@dead_sea_scrolls)
        @dmns.add_exhibit(@imax)
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_1.add_interest("Gems and Minerals")
        @patron_2.add_interest("IMAX")
        expect(@dmns.reccomend_exhibits(@patron_1).count).to eq(2)
        expect(@dmns.reccomend_exhibits(@patron_2).count).to eq(1)
    end

    it 'can return a hash of each patron that has interest in a given exhibit' do
        expect(@dmns.patrons_by_exhibit_interest).to be_a(Hash)
    end

    it 'can return an array of patrons that cant afford exhibit but are interested' do
        expect(@dmns.ticket_lottery_contestants).to eq([])
    end

    it 'can return a lottery winner from the #ticket_lottery_contestants' do
        expect(@dmns.draw_lottery_winnder).to be_a(Patron) #change to stub
    end

    it 'can announce the lottery winner' do
        expect(@dmns.announce_lottery_winner).to be_a(Patron) #change to stub
    end

end