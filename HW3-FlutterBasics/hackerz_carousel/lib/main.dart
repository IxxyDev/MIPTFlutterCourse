import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<String> pictures = [
      'assets/hacker1.jpg',
      'assets/hacker2.webp',
      'assets/hacker3.jpg',
      'assets/hacker4.jpeg',
      'assets/hacker5.jpg',
      'assets/hacker6.webp'
    ];

    return Center(
        child: Column(
      children: [
        const Text(String.fromEnvironment('TITLE'),
            style: TextStyle(
                color: String.fromEnvironment('THEME') == 'black'
                    ? Colors.green
                    : Colors.black,
                fontSize: 36)),
        SizedBox(
            height: 500,
            child: InfiniteCarousel.builder(
              itemCount: 6,
              itemExtent: width / 1.5,
              center: true,
              controller: InfiniteScrollController(),
              axisDirection: Axis.horizontal,
              loop: true,
              itemBuilder: (context, itemIndex, realIndex) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 400,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        pictures[itemIndex],
                      ),
                    ),
                  ),
                );
              },
            ))
      ],
    ));
  }
}

void main() {
  Color backgroundColor = const String.fromEnvironment('THEME') == 'black'
      ? Colors.black87
      : Colors.white;
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Old Standard TT',
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const Scaffold(body: AppBody())));
}
