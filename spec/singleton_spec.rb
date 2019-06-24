require_relative '../my_singleton'

describe 'A Singleton' do
  
    it 'hides its constructor' do
        expect{My_singleton.new()}.to raise_error NoMethodError 
    end

    it 'has a method to get the instance' do
        expect(My_singleton.get_instance()).to be_an_instance_of My_singleton
    end

    it 'gives always the same instance' do
        expect(My_singleton.get_instance()).to be My_singleton.get_instance()
    end

end