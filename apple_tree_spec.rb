require_relative 'apple_tree'
RSpec.describe AppleTree do
    before(:each) do
        @appletree = AppleTree.new
    end
    context "any age" do
        it 'has an age attribute with getter and setter methods' do
            @appletree.age=5
            expect(@appletree.age).to eq(5)
        end
        it 'has a height attribute with a getter method' do
            expect(@appletree.height).to eq(10)
        end
        it 'raises a NoMethodError if height set directly' do
            expect{@appletree.height = 15}.to raise_error(NoMethodError)
        end
        it 'has an apple count attribute with only a getter method' do
            expect(@appletree.apple_count).to eq(0)
        end
        it 'raises a NoMethodError if apple count set directly' do
            expect{@appletree.apple_count = 10}.to raise_error(NoMethodError)
        end
    end
    context "aging" do
        before(:each) do
            @appletree.age=5
            @appletree.year_gone_by
        end
        it 'has year_gone_by that adds one year to the age' do
            expect(@appletree.age).to eq(6)
        end
        it 'has year_gone_by that increases heigth by %10' do
            expect(@appletree.height).to eq(11)
        end
        it 'has year_gone_by that increases apple count by 2' do
            expect(@appletree.apple_count).to eq(2)
        end
    end
    context "under 3" do
        before(:each) do
            @appletree.age=2
            @appletree.year_gone_by
        end
        it 'should not grow apples under three years' do
            expect(@appletree.apple_count).to eq(0)
            @appletree.year_gone_by
            expect(@appletree.apple_count).to eq(2)
        end
        it 'should still increase in age' do
            expect(@appletree.age).to eq(3)
        end
        it 'should still increase in height' do
            expect(@appletree.height).to eq(11)
        end
    end
    context "growing apples" do
        before(:each) do
            @appletree.age=8
            @appletree.year_gone_by
            @appletree.year_gone_by
        end
        it 'should continue to grow apples' do
            expect(@appletree.apple_count).to eq(4)
        end
        it 'has pick_apples that takes all the apples' do
            @appletree.pick_apples
            expect(@appletree.apple_count).to eq(0)
        end
        it 'should not grow apples if older than ten' do
            @appletree.year_gone_by
            expect(@appletree.apple_count).to eq(4)
        end
    end
end