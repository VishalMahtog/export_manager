ExportManager::Engine.routes.draw do
  get "export", to: "export_manager#export", as: :export_export_manager_index
  get "send_coloum_name", to: "export_manager#send_coloum_name"
  get "download", to: "export_manager#download"
end
