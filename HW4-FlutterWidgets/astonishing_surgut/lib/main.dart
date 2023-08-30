import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Surgut',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Stack(children: [Background(), CardList()])),
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(), child: NavFooter()),
    );
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cards = <Map<String, String>>[];

    bool isTablet = MediaQuery.of(context).size.width > 600;

    cards.add({
      'title': 'Развлечения на любой вкус',
      'description':
          'Один из мощнейших козырей Сургута — белые ночи побелее, чем в самом Санкт-Петербурге: видеть ночь, гулять всю ночь можно и в нашем городе.',
      'photoUrl': 'surgut1.jpeg',
    });

    cards.add({
      'title': 'VIP услуги',
      'description':
          'Возможность сфотографироваться на фоне школы иностранных языков и небрежно закинуть селфачок в инстаграм или тикток с подписью: «Биг Бен, ребятки».',
      'photoUrl': 'surgut2.jpeg',
    });

    cards.add({
      'title': 'Чистый город',
      'description':
          '"Господин президент, мы даже не просим, а требуем: приезжайте в Сургут"',
      'photoUrl': 'surgut3.jpeg',
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 400),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
              scrollDirection: isTablet ? Axis.horizontal : Axis.vertical,
              itemCount: cards.length,
              itemBuilder: (BuildContext context, int index) {
                return InfoCard(card: cards[index]);
              }),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({
    super.key,
    required this.card,
  });

  final Map<String, String> card;

  final titleStyle =
      TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto');
  final descriptionStyle = TextStyle(
      fontWeight: FontWeight.normal, fontFamily: 'Roboto', fontSize: 10);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isTablet = MediaQuery.of(context).size.width > 600;

    return SizedBox(
      height: isTablet ? 250 : 200,
      width: 300,
      child: Card(
          elevation: 8.0,
          color: theme.colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Flexible(
                flex: 4,
                child: Image.asset(
                  'assets/${card['photoUrl']}',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(card['title']!,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 24)),
                    Text(card['description']!),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Image.asset(
          "assets/dark-gray-background.jpg",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  theme.primaryColor,
                  Colors.white.withOpacity(0.5)
                ],
                tileMode: TileMode.decal,
              ).createShader(bounds);
            },
            child: Image.asset("assets/main_pic.jpeg",
                fit: BoxFit.cover, width: double.infinity, height: 400)),
        Text('Welcome to Surgut',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Gloomy',
                fontSize: 72,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}

class NavFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> navItems = ['Заведения', 'Отели', 'Пляжи'];

    return Row(children: [
      for (var navItem in navItems)
        Row(children: [NavItem(navItem: navItem), SizedBox(width: 10)])
    ]);
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.navItem,
  });

  final String navItem;

  @override
  Widget build(BuildContext context) {
    IconData icon;

    switch (navItem) {
      case 'Заведения':
        icon = Icons.local_drink;
        break;
      case 'Отели':
        icon = Icons.hotel;
        break;
      case 'Пляжи':
        icon = Icons.beach_access;
        break;
      default:
        throw UnimplementedError('No icon for $navItem');
    }
    return Column(
      children: [Icon(icon), Text(navItem)],
    );
  }
}
