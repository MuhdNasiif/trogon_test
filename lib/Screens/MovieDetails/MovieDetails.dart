import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trogon_test/Model/Moviemodel.dart';
import 'package:trogon_test/Screens/Cast/Cast.dart';
// import 'package:flutter_html/flutter_html.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.data});
  final Moviesmodel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Movie"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade700),
                      image: DecorationImage(
                          image: NetworkImage(data.image!.original.toString()),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.name.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    data.language.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
          const SizedBox(height: 10,),
              
             
               Row(
                 children: [
                   const Icon(Icons.star, color: Colors.white),
                   const SizedBox(width: 2),
                   Text(data.rating!.average.toString(),style: const TextStyle(fontSize: 14, color: Colors.white),),
                 ],
               ),
              const SizedBox(height: 10,),
              
              Row(
                children: [
                  const Icon(Icons.access_time_filled, color: Colors.white),
                  const SizedBox(width: 5),
                  Text(data.runtime.toString(),style: const TextStyle(fontSize: 14, color: Colors.white),),
                ],
              ),
               const SizedBox(height: 10,),
              
             // Padding(
              //   padding: const EdgeInsets.only(left: 15, right: 1fontSize: 14, color: Colors.white5, top: 10),
              //  child:  Html(
              //                   data: data.summary.toString(),
              //                 ),
              Text(
                data.summary.toString(),
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              // ),
              const SizedBox(height: 20,),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 GestureDetector(
                   onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Casting(id: data.id.toString(),),));
                      },
                   child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color:Colors.black,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.grey.shade700)),
                                child: const Center(
                                  child: 
                                Text(
                                          "Cast",
                                          style:TextStyle
                                          
                                          (
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                 ),
               ],
             ),
             const SizedBox(height: 20,)
            ],
            
          ),
        ),
      ),
    );
  }
}
