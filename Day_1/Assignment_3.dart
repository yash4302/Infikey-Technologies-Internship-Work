void main()
{
    solarSystem obj = solarSystem();
    obj.display();
}

class solarSystem
{
    int galaxies=0, planets=0, stars=0;
  
    solarSystem() {
        galaxies = 10;
        planets = 9;
        stars = 1;
    }
  
    void display() {
        print("Galaxies : $galaxies");
        print("Stars : $stars");
        print("Planets : $planets");
    }
}