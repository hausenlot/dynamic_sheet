class MainController < ApplicationController
  require 'axlsx'
  
  # FIRST
  def index
    @tables = ActiveRecord::Base.connection.tables - ["schema_migrations", "ar_internal_metadata"] 
    
    @models = models_for_tables(@tables)
  end

  # SECOND
  def show_columns
    removed_columns = params[:removed_columns] || []
    @model_name = params[:model]
    @col_name = fetch_columns(@model_name)
    respond_to do |format|
      format.html { render partial: 'column_contents' }
    end
  end

  # THIRD
  def preview
    @model_name = params[:model]
    @remaining_columns = fetch_columns(@model_name) - params[:removed_columns].split(",")
    @records = fetch_records(@model_name, @remaining_columns)
    respond_to do |format|
      format.html { render partial: 'table_contents' }
    end
  end

  # FOURTH
  def generate_excel
    @records = fetch_records(params[:model], params[:remaining_columns])
    respond_to do |format|
      format.xlsx {
        p = Axlsx::Package.new
        wb = p.workbook
        headers = params[:remaining_columns]
        wb.add_worksheet(name: "Sample Data") do |sheet|
          sheet.add_row headers
          @records.each do |record|
            row = headers.map do |header|
              record.send(header)
            end
            sheet.add_row row
          end
        end

        send_data p.to_stream.read, 
                  type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
                  filename: "sample_report.xlsx"
      }
    end
  end

  # FUNCTIONS
  def remove_column
    @model_name = params[:model]
    params[:removed_columns] = params[:removed_columns].is_a?(String) ? params[:removed_columns].split(",") : (params[:removed_columns] || [])
    params[:removed_columns] << params[:column] unless params[:removed_columns].include?(params[:column])
    @col_name = fetch_columns(@model_name) - params[:removed_columns]
    respond_to do |format|
      format.html { render partial: 'column_contents', locals: { col_name: @col_name, removed_columns: params[:removed_columns] } }
    end
  end

  # FETCHES
  def models_for_tables(tables)
    tables.map do |table_name|
      model_name = table_name.singularize.camelize
    end.compact
  end

  def fetch_columns(model_name)
    model_class = model_name.constantize
    model_class.column_names
  rescue NameError
    []
  end

  def fetch_records(model_name, remaining_columns)
    model_class = model_name.constantize
    model_class.select(remaining_columns)
  rescue NameError
    []
  end
end
