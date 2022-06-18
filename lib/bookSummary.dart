import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class bookSummary extends StatelessWidget {
  String name;
  String type;
  String des;
  String image;
  String author;
  bookSummary(this.name, this.type, this.des, this.image,this.author);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue,
              )),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: NetworkImage(image)),
                Text(
                  name,
                  style: GoogleFonts.roboto(
                    fontSize: 26,
                    fontWeight: FontWeight.w900
                  )
                ),
                SizedBox(height: 5,),
                Text('By $author',style: GoogleFonts.lato(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 8,),
                Text(
                  'Genre: $type',
                  style: TextStyle(fontSize: 16, color: Colors.black45),
                ),
                SizedBox(height: 10,),
                Text('Summary',

                  style: GoogleFonts.recursive(
                    fontWeight: FontWeight.w700,
                    fontSize:25,
                    letterSpacing: 1.3
                  )),
                SizedBox(height: 10,),
                Text(
                  _textSelect(des),
                  style: GoogleFonts.lato(
                    fontSize: 17,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _textSelect(String str) {
    str = str.replaceAll('Mr. ', 'Mr.');
    str = str.replaceAll('Mrs. ', 'Mrs.');
    str = str.replaceAll(' .', '.\n');
    str = str.replaceAll(': ', ':\n');
    str = str.replaceAll('. ', '.\n');
    str = str.replaceAll('  ', '');
    str = str.replaceAll('The ', '𝒯𝒽𝑒 ');
    str = str.replaceAll('of ', '𝑜𝒻  ');
    return str;
  }
}
