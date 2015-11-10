# Projekt:
##<img src="http://www.deineschmerzgrenze.at/images/logo.png" width="75px" height="75px">Deine Schmerzgrenze.at

### PROCEDURE in Ruby on Rails:
1. *Determine Models*
  1. Table "Polls"
    * and all of it´s columns and types
  2. Table "Categories"
    * and all of it´s columns and types
2. *Create Tables/Models*
  * Table "Polls": >rails generate scaffold Poll categoryid:integer gender-dependeny:integer explicit:integer question flag:integer
  * Table "Categories": >rails generate scaffold Category name
3. *Determine Relationships, Dependencies and Validations*
  1. Table "Categories" 1:N Table "Polls"
    1. Table "Polls" >belongs_to  :category
    2. Table "Categories" >has_many    :polls
    3. Dependency:  >dependent: :destroy
  2. Validations
    * category.rb >validates   :name,  presence:   true
    * poll.rb
      ```ruby
      validates   :category_id, presence: true
      validates   :explicit,   presence: true
      validates   :question,   presence: true
      validates   :genderdep,   presence: true
      validates   :flag,   presence: true
      ```
  3. Special: Enums (used in Table "Polls" multiply)
  ```ruby
  enum genderdep: [ :independent, :male, :female ]
  enum flag:      [ :waiting, :normal, :reported, :blocked ]
  ```
4. *Fill Tables / Seed Data*
  * seeds.rb

### Table "PollPool" in MySQL:

```sql
CREATE TABLE IF NOT EXISTS `PollPool` (

  `ID` int(10) unsigned NOT NULL,
  `CATEGORYID` tinyint(4) unsigned NOT NULL,
  `gender-dependency` enum('N','M','F','') NOT NULL DEFAULT 'N',
  `explicit` tinyint(1) NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `flag` enum('normal','reported','waiting','blocked') NOT NULL DEFAULT 'waiting'
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
```

### Table "Polls" in Ruby on Rails:

Command: rails generate scaffold Poll categoryid:integer gender-dependeny:integer explicit:integer question flag:integer

Migration:
```ruby
  class CreatePolls < ActiveRecord::Migration
    def change
      create_table :polls do |t|
        t.integer :category_id
        t.integer :gender-dependency, default: 0
        t.integer :explicit
        t.string :question
        t.integer :flag, default: 0

  t.timestamps null: false
  end
  end
  end
```

Model:
```ruby
class Poll < ActiveRecord::Base
                           belongs_to  :category

                           validates   :category_id, presence: true
                           validates   :explicit,   presence: true
                           validates   :question,   presence: true
                           validates   :genderdep,   presence: true
                           validates   :flag,   presence: true

                           enum genderdep: [ :independent, :male, :female ]
enum flag:      [ :waiting, :normal, :reported, :blocked ]
end
```

### Table PollCategories in MySQL:

```sql
CREATE TABLE IF NOT EXISTS `PollCategories` (

  `ID` tinyint(4) unsigned NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
```

### Table Categories in Ruby on Rails:

Command: rails generate scaffold Category name

Migration:
```ruby
class CreateCategories < ActiveRecord::Migration
                                     def change
                                       create_table :categories do |t|
                                        t.string :name

t.timestamps null: false
end
end
end
```

Model:
```ruby
class Category < ActiveRecord::Base
                               has_many    :polls, dependent: :destroy
                               validates   :name,  presence:   true
end
```

### Seed Table (befüllen) in Ruby on Rails:

editting seeds.rb:
```ruby
  Poll.delete_all
  Poll.create!( id: 1, category_id: 1, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du deine Religion aufgeben?", flag: 0)
  Poll.create!( id: 2, category_id: 1, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du dein Haustier verkaufen?", flag: 0)
  Poll.create!( id: 3, category_id: 1, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du dich sterilisieren/kastrieren lassen?", flag: 0)
  Poll.create!( id: 4, category_id: 2, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du eine Niere verkaufen?", flag: 0)
  Poll.create!( id: 5, category_id: 2, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du einen Tag im Gefängnis verbringen?", flag: 0)
  Poll.create!( id: 6, category_id: 3, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du für immer auswandern?", flag: 0)

  Category.delete_all
  Category.create!( id: 1, name: "Standard" )
  Category.create!( id: 2, name: "Ethic" )
  Category.create!( id: 3, name: "Ugly" )
  Category.create!( id: 4, name: "Scary" )
```

### Various Calls in Ruby and SQL-Equivalent:
```ruby
c = Category.find(1)    SELECT "categories".* FROM "categories" WHERE "categories"."id" = ? LIMIT 1 [["id", 1]]
=> #<Category id: 1, name: "Standard", created_at: "2015-11-10 23:03:52", updated_at: "2015-11-10 23:03:52">

c.polls                 SELECT "polls".* FROM "polls" WHERE "polls"."category_id" = ?  [["category_id", 1]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Poll id: 1, category_id: 1, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du deine Religion aufgeb...", flag: 0, created_at: "2015-11-10 23:10:34", updated_at: "2015-11-10 23:10:34">, #<Poll id: 2, category_id: 1, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du dein Haustier verkauf...", flag: 0, created_at: "2015-11-10 23:10:34", updated_at: "2015-11-10 23:10:34">, #<Poll id: 3, category_id: 1, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du dich sterilisieren/ka...", flag: 0, created_at: "2015-11-10 23:10:34", updated_at: "2015-11-10 23:10:34">]>

c.polls.last            no SQL required anymore
=> #<Poll id: 3, category_id: 1, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du dich sterilisieren/ka...", flag: 0, created_at: "2015-11-10 23:10:34", updated_at: "2015-11-10 23:10:34">

poll = Poll.new do |p|
p.category_id = 1
p.genderdep = 0
p.explicit = 0
p.question = "If a Block is provided, both create and new will yield the new object to that block for initialization"
end
=> #<Poll id: nil, category_id: 1, genderdep: 0, explicit: 0, question: "If a block is provided, both create and new will y...", flag: 0, created_at: nil, updated_at: nil>
poll.save
(0.0ms)  begin transaction
  SQL (0.0ms)  INSERT INTO "polls" ("category_id", "explicit", "question", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["category_id", 1], ["explicit", 0], ["question", "If a block is provided, both create and new will yield the new object to that block for initialization"], ["created_at", "2015-11-10 23:19:16.835447"], ["updated_at", "2015-11-10 23:19:16.835447"]]
(15.6ms)  commit transaction
=> true

Poll.last
  Poll Load (0.0ms)  SELECT  "polls".* FROM "polls"  ORDER BY "polls"."id" DESC LIMIT 1
=> #<Poll id: 7, category_id: 1, genderdep: 0, explicit: 0, question: "If a block is provided, both create and new will y...", flag: 0, created_at: "2015-11-10 23:19:16", updated_at: "2015-11-10 23:19:16">

Poll.last.destroy
  Poll Load (0.0ms)  SELECT  "polls".* FROM "polls"  ORDER BY "polls"."id" DESC LIMIT 1
(0.0ms)  begin transaction
SQL (0.0ms)  DELETE FROM "polls" WHERE "polls"."id" = ?  [["id", 7]]
(15.6ms)  commit transaction
=> #<Poll id: 7, category_id: 1, genderdep: 0, explicit: 0, question: "If a block is provided, both create and new will y...", flag: 0, created_at: "2015-11-10 23:19:16", updated_at: "2015-11-10 23:19:16">

Poll.last
  Poll Load (0.0ms)  SELECT  "polls".* FROM "polls"  ORDER BY "polls"."id" DESC LIMIT 1
=> #<Poll id: 6, category_id: 3, genderdep: 0, explicit: 0, question: "Für wie viel Geld würdest du für immer auswandern?", flag: 0, created_at: "2015-11-10 23:10:34", updated_at: "2015-11-10 23:10:34">
```
