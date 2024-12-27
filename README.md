# ExportManager
ExportManager handles the dynamic export of table data to CSV, JSON, EXCEL and XML format.

## Usage
The ExportManager allows users to export data from dynamic tables with dynamic columns. The system provides flexibility in choosing the data to be exported and generates a CSV, JSON, EXCEL and XML file accordingly.

## Quick Start
```ruby
1) gem "export_manager"
2) Add on config/routes.rb -> mount ExportManager::Engine, at: '/'
3) Add manifest.js
    //= link export_manager/application.css
    //= link export_manager/application.js
4) rails assets:precompile (on console)
```

## Worked on DATABASE
```ruby
1) postgres
2) mysql
```


## Installation
Add this line to your application's Gemfile:

```ruby
gem "export_manager"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install export_manager
```


Remove the table name from the select box. (Note: Please create a global.rb file in the config/initializers/global.rb directory and add the necessary code inside this file.)
```ruby
config/initializers/global.rb

REMOVE_TABLE_NAME = ['ActiveStorageBlobs'] # remove table
```

Add the custom file name in global.rb
```ruby
config/initializers/global.rb

CSV_FILE_NAME = "CSV_EXPORT_#{Date.today}.csv"
EXCEL_FILE_NAME = "EXCEL_EXPORT_#{Date.today}.xlsx"
JSON_FILE_NAME =  "JSON_EXPORT_#{Date.today}.json"
XML_FILE_NAME =  "XML_EXPORT_#{Date.today}.xml"
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
