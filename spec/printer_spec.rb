require_relative '../printer'
describe 'A printer' do

    it 'can use different char codes' do
        printer = Printer.new()
        printer.use(:UTF8)
        expect(printer.char_code).to equal :UTF8
    end

    it 'blocks when printing' do
        printer = Printer.new()
        printer.use(:UTF8)   
        printer.print(:job)
        expect{printer.print(:another_job)}.to raise_error(/busy/)
    end

    it 'informs status' do
        printer = Printer.pristine()  
        printer.print(:a_job)
        expect(printer.status).to match(/printing/)
    end
end