# app/services/print_service.rb
class PrintService
    def self.print(dispatch)
      # Find the printer by name (adjust as necessary)
      printer = Printer.find_by(name: 'POS-80')
  
      if printer
        printer.print(dispatch)
      else
        Rails.logger.error("Printer not found")
      end
    end
  end
  