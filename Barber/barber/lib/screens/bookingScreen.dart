import 'package:barber/Views/gallerybody.dart';
import 'package:flutter/material.dart';
import 'package:barber/Views/serviceBody.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    // BorderRadiusGeometry radius = BorderRadius.only(
    //   topLeft: Radius.circular(24.0),
    //   topRight: Radius.circular(24.0),
    // );
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.network(
          'https://thumbs.dreamstime.com/b/blue-sky-clouds-abstract-art-background-watercolor-digital-artwork-136551201.jpg',
          fit: BoxFit.fitHeight,
        ),
        Scaffold(
          endDrawer: const Drawer(),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(width: 50,),
                Text(
                  "Booking",
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                color: Theme.of(context).primaryColor,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child: Column(
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 48.0,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80'),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'John Doe',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Thane',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 5000,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Theme.of(context).primaryColor),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0))),
                    title: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white38,
                      controller: _tabController,
                      indicatorColor: Colors.white,
                      tabs: const <Widget>[
                        Tab(
                            child: Text(
                          "Services",
                          style: TextStyle(fontSize: 20),
                        )),
                        Tab(
                            child: Text(
                          "Gallery",
                          style: TextStyle(fontSize: 20),
                        )),
                        Tab(
                            child: Text(
                          "Reviews",
                          style: TextStyle(fontSize: 20),
                        ))
                      ],
                    ),
                  ),
                  body: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ServiceBody(),
                      GalleryBody(),
                      const Text("hello"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
