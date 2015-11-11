Alexander Gabriel
Bernhard Steger


- scaffold mit attributen erzeugen
- bundle install
- rake db:migrate
- zombies erstellen
- rails server starten
  - Zombie über webinterface hinzufügen
- rails console starten
  - Zombie über irb hinzufügen
- rails db console starten
  - Sql-Abfragen
- Basis-Operations (create, find, destroy, last, ...)
- Validations


- scaffold mit tweets mit zombie-reference erstellt
- tweet über webinterface erstellt
- tweet über irb erstellt
- Sql-abfragen



- 3 ways to create an new Zombie
  - Tweet.create(:status => "", :zombie => Zombie.find(1))
  - Tweet.new(:status => "", :zombie => Zombie.find(1)).save
  - Tweet.build(:status => "", :zombie => Zombie.find(1)).save

- Nein, ausser man erstellt manuel referencen (cascading)

- Nein, weil rails per standard prepared statements verwendet,
  möglich ist es, wenn man selber raw Sql statements verwendet.