
/* @pjs preload="data/catcher.jpg"; */
/* @pjs preload="data/gatsby.jpg"; */
/* @pjs preload="data/jane.jpg"; */
/* @pjs preload="data/macbeth.jpg"; */
/* @pjs preload="data/room.jpg"; */
/* @pjs preload="data/scarletletter.jpg"; */
/* @pjs preload="data/streetcar.jpg"; */
/* @pjs preload="data/theireyes.jpg"; */
/* @pjs preload="data/mockingbird.jpg"; */
/* @pjs preload="data/twelve.jpg"; */


Book catcher;
Book gatsby;
Book jane;
Book macbeth;
Book room;
Book scarletletter;
Book streetcar;
Book theireyes;
Book mockingbird;
Book twelve;

Author salinger;
Author fitzgerald;
Author bronte;
Author shakespeare;
Author forster;
Author hawthorne;
Author williams;
Author hurston;
Author lee;
Author rose;


void initializePairs()
{
  
  catcher = new Book("catcher", 0, "The Catcher in the Rye");
  gatsby = new Book("gatsby", 1, "The Great Gatsby");
  jane = new Book("jane", 2, "Jane Eyre");
  macbeth = new Book("macbeth", 3, "MacBeth");
  room = new Book("room", 4, "A Room with a View");
  scarletletter = new Book("scarletletter", 5, "The Scarlet Letter");
  streetcar = new Book("streetcar", 6, "A Streetcar Named Desire");
  theireyes = new Book("theireyes", 7, "Their Eyes Were Watching God");
  mockingbird = new Book("mockingbird", 8, "To Kill a Mockingbird");
  twelve = new Book("twelve", 9, "Twelve Angry Men");
  
  books.add(catcher);
  books.add(gatsby);
  books.add(jane);
  books.add(macbeth);
  books.add(room);
  books.add(scarletletter);
  books.add(streetcar);
  books.add(theireyes);
  books.add(mockingbird);
  books.add(twelve);
  
  salinger = new Author("J.D. Salinger", 0);
  fitzgerald = new Author("F. Scott Fitzgerald", 1);
  bronte = new Author("Charlotte Bronte", 2);
  shakespeare = new Author("William Shakespeare", 3);
  forster = new Author("E. M. Forster", 4);
  hawthorne = new Author("Nathaniel Hawthorne", 5);
  williams = new Author("Tennessee Williams", 6);
  hurston = new Author("Zora Neale Hurston", 7);
  lee = new Author("Harper Lee", 8);
  rose = new Author("Reginald Rose", 9);
  
  authors.add(salinger);
  authors.add(fitzgerald);
  authors.add(bronte);
  authors.add(shakespeare);
  authors.add(forster);
  authors.add(hawthorne);
  authors.add(williams);
  authors.add(hurston);
  authors.add(lee);
  authors.add(rose);
 
  
}
