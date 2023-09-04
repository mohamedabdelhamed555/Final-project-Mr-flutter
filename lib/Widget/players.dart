class Player {
  final String name;
  final String position;
  final String image;
  final String yellow_cards;
  final String red_cards;
  final String Number;
  final String Country;
  final String Goals;
  final String Assists;
  final String Age;

  Player(
      {required this.name,
      required this.position,
      required this.image,
      required this.yellow_cards,
      required this.red_cards,
      required this.Number,
      required this.Country,
      required this.Goals,
      required this.Assists,
      required this.Age});
}

final List<Player> itemss = [
  Player(
      name: 'Ronaldo',
      position: 'CF',
      image: 'assets/images/cristiano.png',
      yellow_cards: '12',
      red_cards: '1',
      Goals: '780',
      Assists: '226',
      Age: '36',
      Number: '7',
      Country: 'portugal'),
  Player(
      name: 'messi',
      position: 'rmf',
      image: 'assets/images/Messi.png',
      yellow_cards: '19',
      red_cards: '0',
      Goals: '672',
      Assists: '305',
      Age: '34',
      Number: '10',
      Country: 'Argentina'),
  Player(
      name: 'neymar',
      position: 'lmf',
      image: 'assets/images/neymar.png',
      yellow_cards: '30',
      red_cards: '2',
      Goals: '258',
      Assists: '174',
      Age: '29',
      Number: '10',
      Country: 'Brazil'),
  Player(
      name: 'Ramos',
      position: 'cb',
      image: 'assets/images/ramos.png',
      yellow_cards: '183',
      red_cards: '26',
      Goals: '101',
      Assists: '40',
      Age: '35',
      Number: '4',
      Country: 'spain'),
  Player(
      name: 'mababi',
      position: 'cf',
      image: 'assets/images/img1.png',
      yellow_cards: '25',
      red_cards: '2',
      Goals: '320',
      Assists: '120',
      Age: '25',
      Number: '7',
      Country: 'Faransa'),
  Player(
      name: 'vardy',
      position: 'CF',
      image: 'assets/images/vardy.png',
      yellow_cards: '35',
      red_cards: '10',
      Goals: '240',
      Assists: '95',
      Age: '37',
      Number: '9',
      Country: 'hgfce'),
  Player(
      name: 'salah',
      position: 'rmf',
      image: 'assets/images/salah.png',
      yellow_cards: '10',
      red_cards: '0',
      Goals: '530',
      Assists: '210',
      Age: '32',
      Number: '11',
      Country: 'Egypt'),
  Player(
      name: 'maradona',
      position: 'amf',
      image: 'assets/images/maradona.png',
      yellow_cards: '20',
      red_cards: '600',
      Goals: '780',
      Assists: '226',
      Age: '70',
      Number: '10',
      Country: 'Argentina'),
  Player(
      name: 'ronaldinho',
      position: 'amf',
      image: 'assets/images/ronaldinho.png',
      yellow_cards: '5',
      red_cards: '1',
      Goals: '520',
      Assists: '290',
      Age: '46',
      Number: '10',
      Country: 'Brazil'),
  Player(
      name: 'Zizo',
      position: 'cmf',
      image: 'assets/images/Zizo.jpg',
      yellow_cards: '11',
      red_cards: '11',
      Goals: '120',
      Assists: '100',
      Age: '55',
      Number: '5',
      Country: 'Faransa'),
  Player(
      name: 'medo',
      position: 'Rb',
      image: 'assets/images/Mohamed.png',
      yellow_cards: '6',
      red_cards: '0',
      Goals: '15',
      Assists: '100',
      Age: '21',
      Number: '17',
      Country: 'Egypt'),
];
