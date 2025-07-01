# JATSParserPlugin    
PKP OJS 3 Plugin for parsing JATS XML and displaying it on the article detail page.      

Customized version by IU Libraries, upstream source v2.1.9.3 https://github.com/Vitaliy-1/JATSParserPlugin/
   
### Usage
After activation the plugin adds a new item to the publication form:   
* The first select option contains the list of XML files uploaded to the production-ready stage where it is possible to pick the file that will be converted and saved as article's full-text. Before saving, a result of a conversion can be previewed.    
* With this version (compatible with OJS 3.3), the conversion process transforms JATS XML into HTML and saves the results in the database.     
* Publication full-text will be shown on the article landing page under the abstract.    

### Installation   
1. Navigate to `plugins/generic` folder starting from OJS webroot.   
2. `git clone --recursive https://github.com/Vitaliy-1/JATSParserPlugin.git jatsParser`.    
3. To install support for JATS to PDF conversion: `cd jatsParser/JATSParser` and `composer install`.    
   
### Requirements     
* PHP 8.2.x
* OJS 3.3
* Lens Galley Plugin must be turned off

