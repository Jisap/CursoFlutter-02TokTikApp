import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import '../../domain/repositories/video_posts_repository.dart';

// infrastructure/repositories            domain/repository
class VideoPostsRepositoryImpl implements VideoPostRepository{    // Se sobrescribiran los métodos de una clase abstracta

       //domain/datasources
  final VideoPostDatasource videosDatasource; // Esta clase necesita recibir un dataSource

  VideoPostsRepositoryImpl({
    required this.videosDatasource
  });
  
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) { // Sobrescribimos el método del repository con 
     return videosDatasource.getTrendingVideosByPage(page); // el del datasource que es el que obtiene los datos
  }  

}