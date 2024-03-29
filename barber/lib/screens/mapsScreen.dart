import 'package:barber/Provider/map_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Mappage extends StatefulWidget {
  const Mappage({Key? key}) : super(key: key);

  @override
  _MappageState createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  bool first = true;
  late MapDataProvider obj;
  bool loading = true;

  void getData() async {
    obj = Provider.of<MapDataProvider>(context);
      print(obj);
      print(obj.mapDataList);
    bool l = await obj.loadData();
    if (l) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      getData();
    }
    return SafeArea(
      child: Scaffold(
        body: loading
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : MapBody(obj),
      ),
    );
  }
}

// ignore: must_be_immutable
class MapBody extends StatefulWidget {
  MapDataProvider obj;
  MapBody(this.obj, {Key? key}) : super(key: key);
  @override
  _MapBodyState createState() => _MapBodyState(obj);
}

class _MapBodyState extends State<MapBody> {
  MapDataProvider obj;
  _MapBodyState(this.obj);

  final PanelController _pc = PanelController();

  final MapType _mapType = MapType.normal;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(12.922270, 77.584290),
    zoom: 16.0,
  );

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      for (int i = 0; i < obj.mapDataList.length; i++) {
        print(obj.mapDataList[i]);
        final MarkerId markerId = MarkerId((markers.length + 1).toString());
        List cd = obj.mapDataList[i].location.split(",");
        LatLng markerPos = LatLng(double.parse(cd[0]), double.parse(cd[1]));
        final Marker marker = Marker(
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            markerId: markerId,
            infoWindow: InfoWindow(
              title: obj.mapDataList[i].name,
              snippet: "Rating: ${obj.mapDataList[i].rating}",
            ),
            position: markerPos);
        markers[markerId] = marker;
      }
      setState(() {});
    }

    return SlidingUpPanel(
      controller: _pc,
      color: Colors.blueGrey,
      backdropEnabled: true,
      backdropColor: Colors.transparent,
      backdropOpacity: 0,
      maxHeight: MediaQuery.of(context).devicePixelRatio * 150,
      borderRadius: radius,
      collapsed: InkWell(
        onTap: () {
          _pc.open();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0)),
              color: Colors.blueGrey[900]),
          child: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Colors.purple),
                height: 10,
              ),
              Container(
                color: Colors.blueGrey[900],
                child: const Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white70,
                        size: 30,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Explore Nearby",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Barbers",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 140,
                color: Colors.white38,
                height: 4,
              ),
            ],
          ),
        ),
      ),
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0)),
                color: Colors.purple),
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Nearby Barbers",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 120,
                  color: Colors.white38,
                  height: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 80,
                  color: Colors.white38,
                  height: 4,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: obj.mapDataList.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.black,
                      elevation: 1,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                        fontSize: 23.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Thane',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white54),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '3.6',
                                  style: TextStyle(
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  'mtrs.',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapToolbarEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            mapType: _mapType,
            markers: Set<Marker>.of(markers.values),
            initialCameraPosition: _kInitialPosition,
            onMapCreated: _onMapCreated,
          ),
          Positioned(
            left: 300,
            top: 400,
            right: 15,
            bottom: 30,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  elevation: 15,
                  child: const Icon(
                    Icons.tune,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  elevation: 15,
                  child: const Icon(
                    Icons.my_location,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Card(
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.white,
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.grey[200]),
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      padding: const EdgeInsets.all(10),
                      height: 50,
                      width: MediaQuery.of(context).devicePixelRatio * 100,
                      child: const Text(
                        "Search Here ...",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
