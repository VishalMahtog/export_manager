module ExportManager
  class ExportManagerController < ApplicationController
    def export
      @model_name = ActiveRecord::Base.connection.tables.map do |t|
        formatted_name = t&.gsub("_", " ")&.titleize&.gsub(" ", "")
        [ formatted_name, t ]
      end
    end

    def send_coloum_name
      columns = ActiveRecord::Base.connection.columns(params["table"]).map(&:name)
      render json: columns
    end

    def download
      begin
        request = params
        model_name = request["table"].singularize.camelize
        dataes = "#{model_name}".constantize.all

        request.delete("action")
        request.delete("controller")
        request.delete("table")
        request.delete("select-all")
        column = request.keys

        csv_data = CSV.generate(headers: true) do |csv|
          csv << column.map(&:capitalize)
          dataes.each do |data|
            csv << column.map { |col| data.send(col) }
          end
        end

        send_data csv_data, filename: "export_#{Date.today}.csv", type: "text/csv"

      rescue => e
        redirect_to export_export_manager_index_path
        logger.error "Error generating CSV: #{e.message}"
        flash[:error] = "An error occurred while generating the CSV file - #{e.message}"
      end
    end
  end
end
