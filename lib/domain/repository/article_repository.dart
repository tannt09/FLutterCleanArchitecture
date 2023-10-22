import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/data/models/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    //TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}