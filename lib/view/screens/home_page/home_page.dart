import 'package:api_cubit/controller/cubit/album_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<AlbumCubit>();
      cubit.fetchAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Api"),
        centerTitle: true,
      ),
      body: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          if (state is AlbumInitialState || state is AlbumLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AlbumResponseState) {
            final albums = state.albums;
            return ListView.builder(
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  final album = albums[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(' Title: ${album.title}'),
                      subtitle: Column(
                        children: [
                          Text('AlbumTitle: ${album.albumId.toString()}'),
                          Text('ID:  ${album.id.toString()}'),
                        ],
                      ),
                      leading: CachedNetworkImage(
                        imageUrl: album.url.toString(),
                        height: 70.w,
                        width: 70.w,
                        errorWidget: (context, url, error) =>
                            Image.network(album.thumbnailUrl.toString()),
                      ),
                      // Image.network(album.url.toString()),
                    ),
                  );
                });
          } else if (state is AlbumErrorState) {
            return Text(state.message);
          }
          return Center(
            child: Text(state.toString()),
          );
        },
      ),
    );
  }
}
