import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bookSummary.dart';

class fantasy extends StatefulWidget {
  @override
  _fantasyState createState() => _fantasyState();
}

class _fantasyState extends State<fantasy> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String bookdoc='SMOrDIC1GOBh2RBJGTJ4';
    String generdoc='jtWHreDKbMh2L1YB8xPI';
    String name='';
    var stream;

    //String genreIdd=firestore.collection('book').doc().collection('gener').doc().id;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Fantasy',style: GoogleFonts.pacifico(
            fontSize: 30,
            fontWeight: FontWeight.w700
        ),),
      ),
      body:Column(
          children: [

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: (name != "" && name != null)
                    ?stream.snapshots()
                    : FirebaseFirestore.instance.collection('book/$bookdoc/gener/$generdoc/novel').snapshots(),
                // stream: FirebaseFirestore.instance.collection('book/$bookdoc/gener/$generdoc/fiction').snapshots(),
                builder: (context, snapshot) {
                  print(name);
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doc = snapshot.data!.docs[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>bookSummary(doc['name'], doc['genre'], doc['summary'], doc['cover'],doc['author'])));
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(29),
                              ),
                              margin: const EdgeInsets.all(5),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 190,
                                decoration: const BoxDecoration(
                                  //borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(

                                  children: [
                                    Container(
                                      width: 120,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage('${doc['cover']}'),
                                            fit: BoxFit.fill,
                                            //alignment: AlignmentDirectional.centerStart

                                          )
                                      ),
                                    ),
                                    const SizedBox(width: 22,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 6),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width:230,
                                            child: Text(
                                              doc['name'],
                                              //softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              softWrap: true,

                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7,
                                          ),
                                          Text(
                                            'By ${doc['author']}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.grey, fontSize: 18),
                                          ),
                                          //Icon(Icons.cancel,color: Colors.red,),
                                          Container(
                                              height: 60,
                                              width: 200,
                                              child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: doc['rating'],
                                                  itemBuilder: (context,index){
                                                    return const Icon(Icons.star,color: Colors.amber,);
                                                  }))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }

                  else  {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),])
      ,
    );
  }
}
