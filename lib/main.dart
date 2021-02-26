import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lauco Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int initialRating = 0;
  var value = 0;
  var direction;
  var rating = 0;
  double _value = 1;
  var currentValue = 0;
  String text = 'Love It';
  String currentAnimation = '0';
  String defaultAnimation = 'add';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Are you satisfied with delago?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color(0xffffffff),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 240,
              width: 240,
              child: FlareActor("assets/rating.flr",
                  fit: BoxFit.contain, animation: currentAnimation),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Color(0xffffffff),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color(0xff626262),
                  inactiveTrackColor: Color(0xff626262),
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 8,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: Color(0xff00ffff),
                  overlayColor: Color(0xff00ffff).withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Color(0xff626262),
                  inactiveTickMarkColor: Color(0xff626262),
                ),
                child: Slider(
                  value: _value,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  onChanged: (value) {
                    setState(
                      () {
                        direction = _value < currentValue ? "+" : "-";
                        _value = value;
                        currentValue = _value.round();
                        currentAnimation = "$currentValue$direction";
                        switch (currentValue) {
                          case 1:
                            {
                              text = 'Love It!';
                            }
                            break;

                          case 2:
                            {
                              text = 'Like It!';
                            }
                            break;

                          case 3:
                            {
                              text = 'Fine';
                            }
                            break;

                          case 4:
                            {
                              text = 'Bad';
                            }
                            break;
                          case 5:
                            {
                              text = 'Very Bad';
                            }
                            break;

                          default:
                            {
                              text = "";
                            }
                            break;
                        }
                        print(text);
                        print(currentValue);
                        print(currentAnimation);
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color(0xff626262).withOpacity(0),
                  inactiveTrackColor: Color(0xff626262).withOpacity(0),
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 16,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                  thumbColor: Color(0xff00ffff).withOpacity(0),
                  overlayColor: Color(0xff00ffff).withOpacity(0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                  tickMarkShape: RoundSliderTickMarkShape(),
                  activeTickMarkColor: Color(0xff626262),
                  inactiveTickMarkColor: Color(0xff626262),
                ),
                child: Slider(
                  value: _value,
                  min: 0,
                  max: 5,
                  divisions: 4,
                  onChanged: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Color(0xff282828),
          height: MediaQuery.of(context).size.height * 0.08,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset("assets/Home Button.svg")),
                Container(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset("assets/Search Button.svg")),
                Container(
                  width: 60,
                  child: Container(
                    height: 50,
                    child: FlareActor("assets/LaucoFAB.flr",
                        animation: defaultAnimation),
                  ),
                ),
                Container(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset("assets/Orders Button.svg")),
                Container(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset("assets/Lauco Coins.svg")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
