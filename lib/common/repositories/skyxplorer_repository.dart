// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:skyxplorer/common/consts/api_consts.dart';
import 'package:skyxplorer/common/error/failure.dart';
import 'package:skyxplorer/common/models/apod_model.dart';

abstract class ISkyXplorerRepository {
  Future<List<AstronomyPictureOfTheDay>>? getLatestPictures(
    int count,
  );
  Future<AstronomyPictureOfTheDay>? getPictureOfTheDay(
    String date,
  );
}

class SkyXplorerRepository implements ISkyXplorerRepository {
  final Dio dio;

  SkyXplorerRepository({
    required this.dio,
  });

  @override
  Future<List<AstronomyPictureOfTheDay>>? getLatestPictures(
    int count,
  ) async {
    try {
      dio.interceptors.add(HttpFormatter());

      final Response<String> response = await dio.get(
        ApiConsts.baseURL,
        queryParameters: {
          'api_key': ApiConsts.apiKey,
          'thumbs': true,
          'count': count,
        },
      );

      final json = jsonDecode(response.data ?? '') as List<dynamic>;
      final List<AstronomyPictureOfTheDay> list = json
          .map(
            (element) => AstronomyPictureOfTheDay.fromMap(
              element,
            ),
          )
          .toList();
      return list;
    } catch (e) {
      throw Failure(
        message: 'Failure to load latest pictures',
      );
    }
  }

  @override
  Future<AstronomyPictureOfTheDay> getPictureOfTheDay(
    String date,
  ) async {
    try {
      dio.interceptors.add(HttpFormatter());
      final response = await dio.get(
        ApiConsts.baseURL,
        queryParameters: {
          'api_key': ApiConsts.apiKey,
        },
      );
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      return AstronomyPictureOfTheDay.fromMap(json);
    } catch (e) {
      throw Failure(
        message: 'Failure to load picture of the day',
      );
    }
  }
}
