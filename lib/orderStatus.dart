import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  var currentAnimation = "8";
  var text;
  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    switch (int.parse(currentAnimation)) {
      case 1:
        {
          text = 'Delago is processing your order,\nWait for confirmation';
        }
        break;

      case 2:
        {
          text = 'Delago \nAccepted Your Order';
        }
        break;

      case 3:
        {
          text = 'Lauco Pilot is on the way \nto collect your Materials';
        }
        break;

      case 4:
        {
          text = 'Lauco Pilot Is\nOn The Way To Delago';
        }
        break;
      case 5:
        {
          text = 'Delago is working\non your Order';
        }
        break;
      case 6:
        {
          text = 'Lauco Pilot is collecting your\n serviced Order from Delago';
        }
        break;
      case 7:
        {
          text = 'Lauco Pilot is \nout for Delivery';
        }
        break;
      case 8:
        {
          text = 'Material Is Delivered';
        }
        break;
      case 9:
        {
          text = 'Oh no! \nSomething went wrong';
        }
        break;
      default:
        {
          text = 'Oh no! \nSomething went wrong';
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: FlareActor("assets/laucoOrder.flr",
                  fit: BoxFit.contain, animation: currentAnimation),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                height: 1.17,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '(Estimated time 15:00 Minutes)',
              style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Number:',
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '459853256',
                  style: TextStyle(
                    fontFamily: 'Gotham',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
