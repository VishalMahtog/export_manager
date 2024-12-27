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
end
