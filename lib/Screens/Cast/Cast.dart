import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trogon_test/Screens/Cast/cubit/cast_cubit.dart';
import 'package:intl/intl.dart';

class Casting extends StatelessWidget {
  const Casting({super.key,required this.id});
final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Casting"),
      ),
      body: BlocProvider(
        create: (context) => CastCubit(id,context),
        child: BlocBuilder<CastCubit, CastState>(
          builder: (context, state) {
            if(state is ViewAllCastData){
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 10/13
                ),
                itemCount: state.models.length,
                itemBuilder: (BuildContext context, int index) {
              String date=DateFormat("yyyy-MM-dd").format(state.models[index].person!.birthday!);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child:Image.network(state.models[index].person!.image!.original.toString(), fit: BoxFit.fill,) ,
                              ),
                            ),
                             Row(
                              children: [
                                Text(
                                  state.models[index].person!.name.toString(),
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                             Text(
                                  state.models[index].person!.gender.toString(),
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                            const Spacer(),

                             Text(
                               "Country :${state.models[index].person!.country!.name}",
                               style: const TextStyle(
                                 fontSize: 8,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.white,
                               ),
                             ),
                            const Spacer(),

                             Text(
                               "BIRTHDAY :$date",
                               style: const TextStyle(
                                 fontSize: 9,
                                 fontWeight: FontWeight.w600,
                                 color: Colors.white,
                               ),
                             ),
                            const Spacer(),
                             Text(
                                  "DEATHDAY :${state.models[index].person!.deathday}",
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                            // Text(state.model[index].name!,  overflow: TextOverflow.ellipsis,
                    
                            // )
                          ],
                        ),
                      ),
                    ),
                  );
                });
            }else{
              return const Center(child: CupertinoActivityIndicator(color: Colors.white,),);
            }
          },
        ),
      ),
    );
  }
}
