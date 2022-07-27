require './lib/exhibit'

RSpec.describe Exhibit do 
    before :each do 
        @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end

    it 'exists' do
        expect(@exhibit).to be_a(Exhibit)
    end

    it 'can return the exhibit name' do
        expect(@exhibit.name).to eq("Gems and Minerals")
    end

    it 'can return the exhibit cost' do 
        expect(@exhibit.cost).to eq(0)
    end

end