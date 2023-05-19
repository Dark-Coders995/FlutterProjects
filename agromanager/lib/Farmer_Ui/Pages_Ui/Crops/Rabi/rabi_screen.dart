import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:agromanager/Farmer_Ui/Pages_Ui/Crops/Rabi/rabi_model.dart';
import 'rabi_details.dart';

class RabiScreen extends StatefulWidget {
  const RabiScreen({Key? key}) : super(key: key);

  @override
  _RabiScreenState createState() => _RabiScreenState();
}

class _RabiScreenState extends State<RabiScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  _cropSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index);
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CropRabiScreen(crop: crop[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF32A060),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: crop[index].imageUrl,
                      child: Image(
                        height: 300.0,
                        width: 300.0,
                        image: AssetImage(
                          'assets/rabi/crop$index.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'FROM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '\$${crop[index].price}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          crop[index].category.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          crop[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4.0,
              child: RawMaterialButton(
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.black,
                onPressed: () {  },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,
              size: 20,
              color: Colors.black
          ),

        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  /*Icon(
                    Icons.menu,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 30.0,
                    color: Colors.black,
                  ),*/
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Welcome To Rabi Section',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                itemCount: crop.length,
                itemBuilder: (BuildContext context, int index) {
                  return _cropSelector(index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    crop[_selectedPage].description,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}