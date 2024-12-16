import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:trogon_test/Model/Castmodel.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this.id,this.context) : super(CastInitial()){
    getCastData();
  }


String id;
BuildContext context;
getCastData()async{
 try{
  final respone = await http.get(Uri.parse("https://api.tvmaze.com/shows/$id/cast"));
  print(respone.body);
 final res = jsonDecode(respone.body);
   List<Castmodel> value =List<Castmodel>.from(res.map((x) => Castmodel.fromJson(x)));

  emit(ViewAllCastData(models: value));
 }catch(e){
  print(e);
 }
}


}
 

 