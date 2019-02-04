

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
  imush = loadImage("mush.png");
  imush.resize(50, 0);
  mush = new Food(imush, 5);
  foods.add(mush);
  
  icheetos = loadImage("cheetos.png");
  icheetos.resize(50, 0);
  cheetos = new Food(icheetos, 5);
  foods.add(cheetos);
  
  icompletecookie = loadImage("completecookie.png");
  icompletecookie.resize(50, 0);
  completecookie = new Food(icompletecookie, 1);
  foods.add(completecookie);
  
  ihint = loadImage("hint.png");
  ihint.resize(50, 0);
  hint = new Food(ihint, 3);
  foods.add(hint);
  
  iizze = loadImage("izze.png");
  iizze.resize(50, 0);
  izze = new Food(iizze, 15);
  foods.add(izze);
  
  ikettlecookedchips = loadImage("kettlecookedchips.png");
  ikettlecookedchips.resize(50, 0);
  kettlecookedchips = new Food(ikettlecookedchips, 5);
  foods.add(kettlecookedchips);
  
  imash = loadImage("mash.png");
  imash.resize(50, 0);
  mash = new Food(imash, 3);
  foods.add(mash);
  
  imissvickies = loadImage("missvickies.png");
  imissvickies.resize(50, 0);
  missvickies = new Food(imissvickies, 30);
  foods.add(missvickies);
  
  iperrier = loadImage("perrier.png");
  iperrier.resize(50, 0);
  perrier = new Food(iperrier, 15);
  foods.add(perrier);
  
  ipurity = loadImage("purity.png");
  ipurity.resize(50, 0);
  purity = new Food(ipurity, 10);
  foods.add(purity);
  
  iricekrispies = loadImage("ricekrispies.png");
  iricekrispies.resize(50, 0);
  ricekrispies = new Food(iricekrispies, 10);
  foods.add(ricekrispies);
  
  ispindrift = loadImage("spindrift.png");
  ispindrift.resize(50, 0);
  spindrift = new Food(ispindrift, 5);
  foods.add(spindrift);
  
  itea = loadImage("tea.png");
  itea.resize(50, 0);
  tea = new Food(itea, 15);
  foods.add(tea);
  
  itrailmix = loadImage("trailmix.png");
  itrailmix.resize(50, 0);
  trailmix = new Food(itrailmix, 1);
  foods.add(trailmix);
  
  iyogurtpretzels = loadImage("yogurtpretzels.png");
  iyogurtpretzels.resize(50, 0);
  yogurtpretzels = new Food(iyogurtpretzels, 5);
  foods.add(yogurtpretzels);
}
