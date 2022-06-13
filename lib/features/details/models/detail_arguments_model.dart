import '../../../common/models/apod_model.dart';

class DetailArguments {
  final AstronomyPictureOfTheDay apod;
  final int? index;

  DetailArguments({
    this.index = 0,
    required this.apod,
  });
}
