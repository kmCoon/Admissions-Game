import java.util.ArrayList;
import java.util.Collections;

ArrayList<Book> books;
ArrayList<Author> authors;

int englishgameState=0;

int currentBook;

int score = 0;

void englishsetup()
{
  fullScreen();
  books = new ArrayList<Book>();
  authors = new ArrayList<Author>();
  initializePairs();
  Collections.shuffle(books);
  Collections.shuffle(authors);
  currentBook=0;
  
  
}

void englishdrawStart()
{
  cursor(ARROW);
  background(255);
  fill(0);
  textSize(40);
  score=0;
  text("Select the author/playwright who wrote the given book/play. " + 
       "You will gain one point for every correct answer, " + 
       "and lose one point for every wrong answer. " + 
       "Press space to start.", width/2, height/2, width/1.25, height/2);
}

void englishdrawGame()
{
  textSize(30);
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
  
}

void englishmouseClicked()
{
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
    Collections.shuffle(books);
    Collections.shuffle(authors);
    currentBook=0;
    englishgameState=0;
  }
  if (key=='e' && englishgameState==2)
  {
    gameState=10;
    englishgameState=0;
    Collections.shuffle(books);
    Collections.shuffle(authors);
    currentBook=0;
  }
}
