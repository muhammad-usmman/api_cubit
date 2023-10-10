part of 'album_cubit.dart';

@immutable
abstract class AlbumState {}

class AlbumInitialState extends AlbumState {}

class AlbumLoadingState extends AlbumState{

}

class AlbumResponseState extends AlbumState{
   final List<AlbumModel> albums;
   AlbumResponseState(this.albums);
}


class AlbumErrorState extends AlbumState{
 final String message;
 AlbumErrorState(this.message);

}


