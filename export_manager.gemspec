require_relative "lib/export_manager/version"

Gem::Specification.new do |spec|
  spec.name        = "export_manager"
  spec.version     = ExportManager::VERSION
  spec.authors     = [ "Vishal Mahto" ]
  spec.email       = [ "vishalgmahto@proton.me" ]
  spec.homepage    = "https://github.com/VishalMahtog/export_manager"
  spec.summary     = "ExportManager handles the dynamic export of table data to CSV format."
  spec.description = "The ExportManager allows users to export data from dynamic tables with dynamic columns. The system provides flexibility in selecting the data to be exported and generates a CSV, JSON, Excel, or XML file accordingly."
  spec.license     = "MIT"
  spec.metadata["homepage_uri"] = 'https://github.com/VishalMahtog/export_manager'
  spec.metadata["source_code_uri"] = "https://github.com/VishalMahtog/export_manager"
  spec.metadata["changelog_uri"] = "http://mygemserver.com"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0"
end
