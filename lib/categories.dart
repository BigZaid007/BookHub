import 'dart:math';

import 'package:flutter/material.dart';

import 'fantasy.dart';
import 'fiction.dart';
import 'motivation.dart';
import 'mystery.dart';

class Category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.dark_mode),
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: CurvedBottomClipper(),
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height/2.2,
              child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 90),
                    child: Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 160),
            child: Center(
              child: Text('Explore Your Favorite Kinds of Book',style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 20
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300,left: 20,right: 20),
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Fiction()));

                  },
                  child: myContainer('fiction.png', 'Fiction',Colors.black,context),
                ),
                GestureDetector(onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>motivation()));
                },child: myContainer('motivation.png', 'Self-Help',Colors.blue,context)),
                GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Mystery()));
                },child: myContainer('mystery.png', 'Mystery',Colors.blue,context)),
                GestureDetector(onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>fantasy()));
                },child: myContainer('novel.png', 'Fantasy',Colors.black,context)),

              ],
            ),
          )
        ],
      )
    );
  }

  Widget myContainer(String image, String title,Color borColor,BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        //alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border(
            top: BorderSide(color: borColor,width: 3),
            bottom: BorderSide(color: borColor,width: 3),
            left: BorderSide(color: borColor,width: 3),
            right: BorderSide(color: borColor,width: 3),
          )

        ),
        width: MediaQuery.of(context).size.width/2,
        height: 40,

        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('images/$image'),
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height * 6 / 8;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
    Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -3600, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }


}
