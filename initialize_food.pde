

Food cheetos;
PImage icheetos;
Food completecookie;
PImage icompletecookie;
Food hint;
PImage ihint;
Food izze;
PImage iizze;
Food kettlecookedchips;
PImage ikettlecookedchips;
Food mash;
PImage imash;
Food missvickies;
PImage imissvickies;
Food mush;
PImage imush;
Food perrier;
PImage iperrier;
Food purity;
PImage ipurity;
Food ricekrispies;
PImage iricekrispies;
Food spindrift;
PImage ispindrift;
Food tea;
PImage itea;
Food trailmix;
PImage itrailmix;
Food yogurtpretzels;
PImage iyogurtpretzels;

void initializefood()
{
  imush = loadImage("data/mush.png");
  mush = new Food(imush, 5);
  foods.add(mush);
  
  icheetos = loadImage("data/cheetos.png");
  cheetos = new Food(icheetos, 5);
  foods.add(cheetos);
  
  icompletecookie = loadImage("data/completecookie.png");
  completecookie = new Food(icompletecookie, 1);
  foods.add(completecookie);
  
  ihint = loadImage("data/hint.png");
  hint = new Food(ihint, 3);
  foods.add(hint);
  
  iizze = loadImage("data/izze.png");
  izze = new Food(iizze, 15);
  foods.add(izze);
  
  ikettlecookedchips = loadImage("data/kettlecookedchips.png");
  kettlecookedchips = new Food(ikettlecookedchips, 5);
  foods.add(kettlecookedchips);
  
  imash = loadImage("data/mash.png");
  mash = new Food(imash, 3);
  foods.add(mash);
  
  imissvickies = loadImage("data/missvickies.png");
  missvickies = new Food(imissvickies, 30);
  foods.add(missvickies);
  
  iperrier = loadImage("data/perrier.png");
  perrier = new Food(iperrier, 15);
  foods.add(perrier);
  
  ipurity = loadImage("data/purity.png");
  purity = new Food(ipurity, 10);
  foods.add(purity);
  
  iricekrispies = loadImage("data/ricekrispies.png");
  ricekrispies = new Food(iricekrispies, 10);
  foods.add(ricekrispies);
  
  ispindrift = loadImage("data/spindrift.png");
  spindrift = new Food(ispindrift, 5);
  foods.add(spindrift);
  
  itea = loadImage("data/tea.png");
  tea = new Food(itea, 15);
  foods.add(tea);
  
  itrailmix = loadImage("data/trailmix.png");
  trailmix = new Food(itrailmix, 1);
  foods.add(trailmix);
  
  iyogurtpretzels = loadImage("data/yogurtpretzels.png");
  yogurtpretzels = new Food(iyogurtpretzels, 5);
  foods.add(yogurtpretzels);

  resizeFoodImages();
}


void resizeFoodImages()
{
  imush.resize(50, 0);
  icheetos.resize(50, 0);
  icompletecookie.resize(50, 0);
  ihint.resize(50, 0);
  iizze.resize(50, 0);
  ikettlecookedchips.resize(50, 0);
  imash.resize(50, 0);
  imissvickies.resize(50, 0);
  iperrier.resize(50, 0);
  ipurity.resize(50, 0);
  iricekrispies.resize(50, 0);
  ispindrift.resize(50, 0);
  itea.resize(50, 0);
  itrailmix.resize(50, 0);
  iyogurtpretzels.resize(50, 0);
}


