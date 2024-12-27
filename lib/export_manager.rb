require "export_manager/version"
require "export_manager/engine"

module ExportManager
  def self.generate_csv(records, columns)
    CSV.generate(headers: true) do |csv|
      csv << columns.map(&:capitalize)
      records.each do |record|
        csv << columns.map { |column| record.public_send(column) }
      end
    end
  end

  def self.generate_excel(records, columns)
    wb = Axlsx::Package.new
    wb.workbook.add_worksheet(name: "Users Report") do |sheet|
      sheet.add_row columns

      records.each do |record|
        sheet.add_row columns.map { |column| record.public_send(column) }
      end
    end
    wb.to_stream.read
  end
end
