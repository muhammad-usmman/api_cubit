import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:api_cubit/model/album_fetch_model/album_fetch_model.dart';
import 'package:http/http.dart' as http;

import '../../utils/repo/album_repo.dart';


part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final AlbumRepo _albumRepo;
  AlbumCubit(this._albumRepo) : super(AlbumInitialState());


  Future<void> fetchAlbum() async {
    emit(AlbumLoadingState());
 try{
   final response = await _albumRepo.fetchAlbumApi();
   emit(AlbumResponseState(response));
 } catch(e){
   emit(AlbumErrorState(e.toString()));
 }

  }
}
