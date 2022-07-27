require './lib/patron'

RSpec.describe Patron do
    before :each do
        @patron_1 = Patron.new("Bob", 20)
    end

    it 'exists' do
        expect(@patron_1).to be_a(Patron)
    end

    it 'can return the patron name' do
        expect(@patron_1.name).to eq("Bob")
    end

    it 'can return the spending_money available' do
        expect(@patron_1.spending_money).to eq(20)
    end

    it 'can return the current empty array of interests' do
        expect(@patron_1.interests).to eq([])
    end

    it 'can add and return the array of current interests' do 
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_1.add_interest("Gems and Minerals")
        expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
end