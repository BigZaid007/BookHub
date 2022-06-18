
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'fiction.dart';
import 'mystery.dart';

class bookGenre extends StatefulWidget {
  @override
  _bookGenreState createState() => _bookGenreState();
}

class _bookGenreState extends State<bookGenre> {
  @override
  Widget build(BuildContext context) {
    String genreId=FirebaseFirestore.instance.collection('gener').doc().path;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'Books Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Fiction()));

                    },
                    child: myContainer('fiction.png', 'Fiction'),
                  ),
                  myContainer('motivation.png', 'Self-Help'),
                  GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Mystery()));
                  },child: myContainer('mystery.png', 'Mystery')),
                  myContainer('novel.png', 'Novel'),
                ],
              ),
            )
          ],
        ));
  }

  Widget myContainer(String image, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Container(
        //alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width / 2,
        height: 100,

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
