# MMT-B2014-backendDevelopment
## Krabath | Deufemia


## Aufgabe P2:
## a) Rails App for Zombie Tweets
- add table zombies (Name, Graveyard, Day_Of_Death, No_Of_Arms, Description)
- rake db:migrate
- rails server
- add zombies (http://localhost:3000/zombies)
- rails console (just tried some features)



## b) Create Tweets with Ref to Zombies
- creating tweet-model (rails generate scaffold tweet status zombie:references
   rake db:migrate)
- observe rails console during editing data


## c) 
+ 3 ways to create a tweet with an existing zombie:
	* t = Tweet.new, t.status = "foo", t.zombie = 1,
	* Tweet.create(:status => "foo", :zombie => 1)
	* you can create a tweet in the browser
+ if a zombie gets destroyed, will its tweets get destroyed too?
	* this will not work by default; you can make it work manually:
	* has_many :tweets, :dependent => :delete_all
+ do SQL injections work?
	* yes, they do

