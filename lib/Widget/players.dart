class Player {
  final String name;
  final String position;
  final String image;

  Player({required this.name, required this.position, required this.image});
}

final List<Player> itemss = [
  Player(name: 'Ronaldo', position: 'CF', image: 'assets/images/cristiano.png'),
  Player(name: 'messi', position: 'rmf', image: 'assets/images/Messi.png'),
  Player(name: 'mababi', position: 'cf', image: 'assets/images/img1.png'),
  Player(name: 'vardy', position: 'CF', image: 'assets/images/vardy.png'),
  Player(name: 'Ramos', position: 'cb', image: 'assets/images/ramos.png'),
  Player(name: 'salah', position: 'rmf', image: 'assets/images/salah.png'),
  Player(name: 'neymar', position: 'lmf', image: 'assets/images/neymar.png'),
  Player(
      name: 'maradona', position: 'amf', image: 'assets/images/maradona.png'),
  Player(
      name: 'ronaldinho',
      position: 'amf',
      image: 'assets/images/ronaldinho.png'),
  Player(name: 'Zizo', position: 'cmf', image: 'assets/images/Zizo.jpg'),
  Player(name: 'medo', position: 'CF', image: 'assets/images/Mohamed.png'),
];
