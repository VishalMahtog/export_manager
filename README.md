# ExportManager
The ExportManager handles the dynamic export of table data to CSV, JSON, Excel, and XML formats.

## Usage
The ExportManager allows users to export data from dynamic tables with dynamic columns. The system provides flexibility in selecting the data to be exported and generates a **CSV, JSON, Excel, or XML** file accordingly.

## Demo
[Screencast from 27-12-24 04:09:24 PM IST.webm](https://github.com/user-attachments/assets/17d245c3-5234-4171-b349-6cc1a74ea847)

## Quick Start
```ruby
1) Add the following gems to your Gemfile
   gem "export_manager"
   gem "caxlsx"
   gem "caxlsx_rails"
2) In config/routes.rb, add
   mount ExportManager::Engine, at: '/'

3) Add the following lines to manifest.js
   //= link export_manager/application.css
   //= link export_manager/application.js

4) Run rails assets:precompile in the console
```

## Database Support
```ruby
1) PostgreSQL
2) MySQL
```


## Installation
Add this line to your application's Gemfile:

```ruby
gem "export_manager"
gem "caxlsx"
gem "caxlsx_rails"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install export_manager
```


Remove a specific table name from the select box by creating a **global.rb** file in the **config/initializers** directory and adding the following code
```ruby
config/initializers/global.rb

REMOVE_TABLE_NAME = ['ActiveStorageBlobs'] # remove table
```

Add the custom file name in **global.rb**
```ruby
config/initializers/global.rb

CSV_FILE_NAME = "CSV_EXPORT_#{Date.today}.csv"
EXCEL_FILE_NAME = "EXCEL_EXPORT_#{Date.today}.xlsx"
JSON_FILE_NAME =  "JSON_EXPORT_#{Date.today}.json"
XML_FILE_NAME =  "XML_EXPORT_#{Date.today}.xml"
```

If an authenticated user has the **admin?** method returning **true**, they can access the ExportManager engine at /.
```ruby
  authenticated :user, ->(user) { user.admin? } do
    mount ExportManager::Engine, at: '/'
  end
```
## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
