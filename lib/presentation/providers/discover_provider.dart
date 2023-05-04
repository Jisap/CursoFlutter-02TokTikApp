import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import '../../domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videosRepository; // El provider necesita un repositorio basado en una clase abstracta

  bool initialLoading = true;

  List<VideoPost> videos = [];  // Inicializamos un [ vacio ] tipo VideoPost

  DiscoverProvider({
    required this.videosRepository
  });  

  Future<void> loadNextPage() async {
  
    // await Future.delayed( const Duration(seconds: 2));  // Esperamos 2 segundos
    //
    //final List<VideoPost> newVideos = videoPosts                            // newVideos será una lista de VideoPost, que vendrán de un json (videoPosts)
    //  .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())  // el json se mapea y devolvera un iterable (video) que se convertirá a videoPost
    //  .toList();                                                            // Cada iterable convertido se metera dentro de una lista y cumplira el tipado

    final newVideos = await videosRepository.getTrendingVideosByPage(1);      // newVideos vendrá del método del repositorio


    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}