module ExportManager
  class ExportManagerController < ApplicationController
    before_action :set_global_variable, only: %i[download]

    def export
      remove_table = defined?(REMOVE_TABLE_NAME) ? REMOVE_TABLE_NAME : []

      @model_name = ActiveRecord::Base.connection.tables.map do |t|
        next if remove_table.include?(t.downcase)

        formatted_name = t.gsub("_", " ").titleize.gsub(" ", "")
        [ formatted_name, t ]
      end.compact

      if remove_table.present?
        @model_name.delete_if { |item| remove_table.any? { |target| item.include?(target) } }
      end

      @model_name
    end

    def send_coloum_name
      columns = ActiveRecord::Base.connection.columns(params["table"]).map(&:name)
      render json: columns
    end

    def download
      begin
        request_params = params.except("action", "controller", "table", "select-all", "type")
        model_name = params["table"].singularize.camelize
        columns = request_params.keys
        records = model_name.constantize.all
        export_data(records, columns, @file_name)

      rescue => e
        redirect_to export_path
        logger.error "Error generating CSV: #{e.message}"
        flash[:error] = "An error occurred while generating the CSV file - #{e.message}"
      end
    end

    private

    def set_global_variable
      case params[:type]
      when "csv"
        @file_name = defined?(CSV_FILE_NAME) ? CSV_FILE_NAME : "export_#{Date.today}.csv"
      when "excel"
        @file_name = defined?(EXCEL_FILE_NAME) ? EXCEL_FILE_NAME : "export_#{Date.today}.xlsx"
      end
    end

    def export_data(records, columns, file_name)
      case params[:type]
      when "csv"
        csv_data = ExportManager.generate_csv(records, columns)
        send_csv(csv_data, file_name)
      when "excel"
        excel_data = ExportManager.generate_excel(records, columns)
        send_excel(excel_data, file_name)
      end
    end

    def send_csv(csv_data, file_name)
      send_data csv_data, filename: file_name, type: "text/csv"
    end

    def send_excel(excel_data, file_name)
      send_data excel_data,
                filename: file_name,
                type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                disposition: "attachment"
    end
  end
end
