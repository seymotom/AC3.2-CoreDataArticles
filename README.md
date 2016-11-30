# Core Data Articles

The master branch has a working project that (at the moment) is pulling in all the 
opinion articles.

**NB**: As of now it does not do uniquing so multiple runs of the app will double up records. 
I'll get back to you on this one. (Pulling hair out.)

## Fun stuff for KIDS (to keep them out of trouble)

1. Complete the Article object in the data modeler without including any nested structures.
   I.e. no "*_facet" fields and no "multimedia". We'll do that next time.

2. Add a Search bar to the TableView and implement its delegate methods to accept input
from it. [Search Bar Delegate](https://developer.apple.com/reference/uikit/uisearchbardelegate).

3. Alter the ```initializeFetchedResultsController``` function so that it can be re-reun
with new parameters. You want to pass in a predicate and a sort. This will be done via the search
bar input from the user. ~~Ooh~~ input from the user is bad. This hearkens back to the 
pre Battleship era where we processed input from the user on the command line. You should:
	1. Get the string from the search bar.
	2. Parse out a predicate string and a sort, probably using ```components(separatedBy: String)```. 
		E.g. user
		
		```
		p=abstract/environment s=title
		```

		After plucking out "abstract", "environment" and "title" you can update these lines accordingly:

		```
		let sort = NSSortDescriptor(key: "title", ascending: true)
        .
        .
        .
        
        // current line
        // let predicate = NSPredicate(format: "title < %@", "M")

        let predicate = NSPredicate(format: "@K contains[c] %@", field, search)

		```
		Note, in this example for the predicate I'm making both the field and its value controllable
		by the user. It might be easier to start with just the value and then add the field.

		```swift
        let predicate = NSPredicate(format: "abstract contains[c] %@", search)
        ```

4. Add sections as per the ```sectionNameKeyPath``` parameter of:

```swift
NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
```

If you're feeling ambitious, you can also accept input from the user for this sectonNameKeyPath, either as another 
part of the search bar input or from more elaborate input (e.g. a settings VC with a picker).