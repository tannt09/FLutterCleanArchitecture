import 'dart:io';

import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/data/models/article.dart';
import 'package:clean_architecture/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService)

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
    final httpResponse = await _newsApiService.getNewsArticles(
      apiKey: 'newApiKey',
      category: 'newCategory',
      country: 'newCountry'
    );

    if(httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(
        DioError(
          error: httpResponse.response.statusCode,
          response: httpResponse.response,
          type: DioErrorType.badResponse,
          requestOptions: httpResponse.response.requestOptions
        )
      );
    }
    } on DioError catch(e) {
      return DataFailed(e);
    }
  }
}