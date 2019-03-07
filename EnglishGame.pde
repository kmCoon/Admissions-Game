import java.util.ArrayList;

ArrayList<Book> books;
ArrayList<Author> authors;

int englishgameState=0;

int currentBook;

int score = 0;

void englishsetup()
{
  books = new ArrayList<Book>();
  authors = new ArrayList<Author>();
  initializePairs();
  shuffle(books);
  shuffle(authors);
  currentBook=0;
}

void englishdrawStart()
{
  for (Book b : books)
    b.resize();

  cursor(ARROW);
  background(38, 8, 89);
  fill(255);
  textSize(30);
  score=0;
  
  textAlign(CENTER, CENTER);
  text("Match each book with its author.\n\nPress space to start.", width/2, height/2);
  
  /*text("Select the author/playwright who wrote the given book/play. " + 
       "You will gain one point for every correct answer, " + 
       "and lose one point for every wrong answer.\n\n" + 
       "Press space to start.", width/2, height/2, 5*width/6, height/2);*/
}

void englishdrawGame() {
  textSize(20);
  background(255);
  if (mouseOver())
    cursor(HAND);
  else
    cursor(ARROW);
  
  for (int i=0; i<authors.size(); i++)
  {
    Author a = authors.get(i);
    a.display((i+1)*height/(authors.size()+1));
  }
  
  books.get(currentBook).display();
  fill(0);
  text("Score: " + score, width-100, 30);
  
  
  
}

boolean mouseOver()
{
  for (Author a : authors)
  {
    if (a.mouseOn())
      return true;
  }
  return false;
}


void englishdrawEnd()
{
  cursor(ARROW);
  background(255);
  fill(0);
  textSize(40);
  text("You got " + score + " points. " + 
       "To play again, press space. To exit this minigame, press E.",
         width/2, height/2, width/1.25, height/2);
}

void englishdraw()
{
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  if (englishgameState==0)
    englishdrawStart();
  if (englishgameState==1)
    englishdrawGame();
  if (englishgameState==2)
    englishdrawEnd();
  
  escButton.display();
}

void englishmouseClicked()
{
  if (englishgameState == 0)
    englishgameState = 1;

  for (Author a : authors)
  {
    if (a.mouseOn())
      a.isClicked();
  }
}

void englishkeyPressed()
{

  if (key==' ' && englishgameState==0){englishgameState=1;}
  if (key==' ' && englishgameState==2)
  {
    shuffle(books);
    shuffle(authors);
    currentBook=0;
    englishgameState=0;
  }
  if (key=='e' && englishgameState==2)
  {
    gameState=10;
    englishgameState=0;
    shuffle(books);
    shuffle(authors);
    currentBook=0;
  }
}


//
// shuffle implementation, to avoid Collections for processing.js
//


<T> void swap(ArrayList<T> things, int i, int j)
{
    T temp = things.get(i);
    things.set(i, things.get(j));
    things.set(j, temp);
}


<T> void shuffle(ArrayList<T> things)
{
    for (int i=0; i<things.size()-1; i++)
    {
        int index = (int)random(i, things.size());
        swap(things, i, index);
    }
}
