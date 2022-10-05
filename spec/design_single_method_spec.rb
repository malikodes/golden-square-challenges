require 'design_single_method'

RSpec.describe 'check_todo' do
    it 'returns an error when string is empty' do
        expect { check_todo("") }.to raise_error "Not a valid text"
    end

    it 'returns false when string includes todo' do
        expect(check_todo("Walk the dog: todo")).to eq false
    end

    it 'returns false when string includes #todo' do
        expect(check_todo("Walk the dog: #todo")).to eq false
    end

    it 'returns false when string includes TODO' do
        expect(check_todo("Walk the dog: TODO")).to eq false
    end

    it 'returns true when string includes #TODO' do
        expect(check_todo("Walk the dog #TODO")).to eq true 
    end

end