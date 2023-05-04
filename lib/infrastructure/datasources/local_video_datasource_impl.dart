

import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/shared/data/local_video_post.dart';
import '../models/local_video_model.dart';



class LocalVideoDatasource implements VideoPostDatasource {

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage (int page) async {  // Implementación para videos locales
    
    await Future.delayed( const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts                                          // newVideos será una lista de VideoPost, que vendrán de un json (videoPosts)
            .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())          // el json se mapea y devolvera un iterable (video) que se convertirá a videoPost
            .toList();                                                                    // Cada iterable convertido se metera dentro de una lista y cumplira el tipado
  
    return newVideos;
  }

}