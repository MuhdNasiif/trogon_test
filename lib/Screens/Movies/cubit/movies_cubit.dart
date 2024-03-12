import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:trogon_test/Model/Moviemodel.dart';
part 'movies_state.dart';

  class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.context) : super(MoviesInitial()){
    getData();
  }
  BuildContext context;
getData()async{
  try{
  final respone = await http.get(Uri.parse("https://api.tvmaze.com/shows"));
  print(respone.body);
  final res = jsonDecode(respone.body);
  List<Moviesmodel> values =List<Moviesmodel>.from(res.map((x) => Moviesmodel.fromJson(x)));
  
emit(ViewAllData(model: values));

  }catch(e){
    debugPrint("$e>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  }
}

}



