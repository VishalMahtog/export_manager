ExportManager::Engine.routes.draw do
  get "export", to: "export_manager#export", as: :export_export_manager_index
  get "send_coloum_name", to: "export_manager#send_coloum_name"
  get "dowload_csv", to: "export_manager#dowload_csv"
end
