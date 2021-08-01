import 'package:animator_planet_app/screens/detail_screen.dart';
import "package:flutter/material.dart";

class planetUDF extends StatelessWidget {
  final Animation? rotateAnimation;
  final String? title;
  final String? subTitle;
  final String? image;
  final String? location;
  final String? speed;

  planetUDF(
      {this.rotateAnimation,
      this.title,
      this.subTitle,
      this.image,
      this.location,
      this.speed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailScreen(
            image: image,
            title: title,
            location: location,
            speed: speed,
          );
        }));
      },
      child: SizedBox(
        height: 190,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff434273),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          spreadRadius: -4,
                          blurRadius: 10),
                    ]),
              ),
              left: 65,
            ),
            Positioned(
              left: 10,
              child: Transform.rotate(
                angle: rotateAnimation?.value,
                child: Image.asset(
                  image ?? "0",
                  height: 105,
                ),
              ),
            ),
            Positioned(
              left: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "0",
                    style: TextStyle(
                        fontSize: 29,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subTitle ?? "0",
                    style: TextStyle(
                        fontSize: 17, color: Colors.white.withOpacity(0.6)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/location.png",
                        height: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        location ?? "0",
                        style: TextStyle(
                            fontSize: 12, color: Colors.white.withOpacity(0.6)),
                      ),
                      SizedBox(width: 8),
                      Image.asset(
                        "assets/images/arrow.png",
                        height: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        speed ?? "0",
                        style: TextStyle(
                            fontSize: 12, color: Colors.white.withOpacity(0.6)),
                      ),
                    ],
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
