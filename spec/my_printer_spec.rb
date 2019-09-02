require_relative '../my_printer'
describe 'My printer' do
  
    it 'is a Singleton' do
        expect(My_printer.get_instance()).to be My_printer.get_instance()
    end

    it 'can use different char codes' do
        printer = My_printer.get_instance()
        printer.use(:UTF8)
        expect(printer.char_code).to equal :UTF8
    end

    it 'blocks when printing' do
        printer = My_printer.get_instance()
        printer.use(:UTF8)   
        printer.print(:job)
        expect{printer.print(:another_job)}.to raise_error(/busy/)
    end

    it 'informs status' do
        My_printer.reset
        printer = My_printer.get_instance()  
        printer.print(:a_job)
        expect(printer.status).to match(/printing/)
    end
end