part of hexacore;

class Movite {
  void premisti(String position){}
}

class Vozidlo {
  int pocetKol;
  Vozidlo({this.pocetKol: 4});
  Vozidlo.sKolama(int pocet):this(pocetKol: pocet);
}

class Auto extends Vozidlo with Movite {
  Auto():super.sKolama(4);
}



