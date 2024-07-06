require 'cupsffi'

class Printer < ApplicationRecord
  def print(dispatch)
    # Generate the data to be printed
    data = "Dispatch ID: #{dispatch.id}\nTruck: #{dispatch.truck_id}\nLocation: #{dispatch.location.barangay}, #{dispatch.location.town}\nPlanter: #{dispatch.planter.name}\nReceive Date: #{dispatch.receive_date}\nGross Weight: #{dispatch.gross_weight}\nStatus: #{dispatch.status}\nDescription: #{dispatch.description}"

    # Create a temporary file with the dispatch data
    file_path = Rails.root.join('tmp', "dispatch_#{dispatch.id}.txt")
    File.open(file_path, 'w') { |file| file.write(data) }

    # Print the file using CUPS
    print_with_cups(file_path)

    # Remove the temporary file
    File.delete(file_path) if File.exist?(file_path)
  end

  private

  def print_with_cups(file_path)
    # Define your printer name here (as recognized by CUPS)
    printer_name = 'Your_Printer_Name'

    # Print the file
    CupsFFI::PrintJob.print_file(file_path, printer_name)
  end
end