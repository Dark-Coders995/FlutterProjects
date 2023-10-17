import 'package:flutter/material.dart';


class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: height / 2.4,
          child: Image.asset(
            'assets/new-york.jpeg',
            height: height,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height / 2.4,
            width: width,
            color: const Color(0xFF2D2C35),
          ),
        ),
        const Foreground()
      ],
    );
  }
}

class Foreground extends StatelessWidget {
   const Foreground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var inputBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (
              ) {},
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.black26,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Hello Siti',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 5),
              const Text(
                'Check the weather by the city',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 35),
              TextField(
                decoration: InputDecoration(
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  hintText: 'Search city',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  suffixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
              const SizedBox(height: 80),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'My locations',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white, side: const BorderSide(width: 1, color: Colors.white),
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.more_horiz),
                )
              ]),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var location in locations)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.black45,
                              BlendMode.darken,
                            ),
                            child: Image.asset(
                              location.imageUrl,
                              height: height * 0.35,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                location.text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(location.timing),
                              const SizedBox(height: 40),
                              Text(
                                '${location.temperature}°',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 50),
                              Text(location.weather),
                            ],
                          )
                        ],
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Location {
  final String text;
  final String timing;
  final int temperature;
  final String weather;
  final String imageUrl;

  Location({
    required this.text,
    required this.timing,
    required this.temperature,
    required this.weather,
    required this.imageUrl,
  });
}

final locations = [
  Location(
    text: 'New York',
    timing: '10:44 am',
    temperature: 15,
    weather: 'Cloudy',
    imageUrl: 'assets/new-york.jpeg',
  ),
  Location(
    text: 'San Francisco',
    timing: '7:44 am',
    temperature: 6,
    weather: 'Raining',
    imageUrl: 'assets/new-york.jpeg',
  ),
];