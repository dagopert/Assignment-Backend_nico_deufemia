# Projekt:
##<img src="http://www.deineschmerzgrenze.at/images/logo.png" width="100px" height="100px">Deine Schmerzgrenze.at

### Changes made to P3:
1. **Migration changes:**
  * Polls: edited Field "explicit" from type integer to type boolean
    * changed validate_presence_of to validate_inclusion_of :explicit, in: [true,false]
2. **Seed changes:***
  * updated values of field "explicit" - to "true/false"
3. **Views changes:**
  1. layouts>application edited:
    * inserted Bootstrap-min Stylesheet
    * inserted jQuery
    * created navigation menu
  2. updated all sub index files:
    * inserted jquery script for updating "active" navigation-element
  3. added multiple links from poll view to category view and vise-versa
  4. added field "Number of Polls" in category index html file
  5. added "latest 5 Polls" List in Category_show with 2 possible actions:
    * Show
    * Edit
  6. Changed form-fields in Poll _form html files:
    * created Drop-Down-Menu for Fields:
      * Category - Dropdown from keys of Categories
      * Flag - Enum
      * Genderdep(endency) - Enum
      * Explicit - Boolean
  7. Edited welcome index with fresh content.


```
By Nicola Deufemia,
ndeufemia.mmt-b2014@fh-salzburg.ac.at
Backend-Development
LICENSE: MIT
```