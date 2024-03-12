import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trogon_test/Screens/MovieDetails/MovieDetails.dart';
import 'package:trogon_test/Screens/Movies/cubit/movies_cubit.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: BlocProvider(
        create: (context) => MoviesCubit(context),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if(state is ViewAllData){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.model.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(data: state.model[index]),));
                      },
                      child: Container(
                        height: 195,
                        width: 168,
                        decoration: BoxDecoration(color: Colors.white,  borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Container(
                                height: 140,
                                width: 160,
                                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
                                child:Image.network(state.model[index].image!.original.toString(), fit: BoxFit.fill,) ,
                              ),
                            ),
                            Text(state.model[index].name!,  overflow: TextOverflow.ellipsis,
                            
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
            }else{
              return Center(child: CupertinoActivityIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
