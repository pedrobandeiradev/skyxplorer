import 'package:flutter/material.dart';
import 'package:skyxplorer/common/models/apod_model.dart';

class DetailItemListWidget extends StatelessWidget {
  final bool isDiff;
  final AstronomyPictureOfTheDay apod;

  const DetailItemListWidget({
    Key? key,
    required this.isDiff,
    required this.apod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 200,
        ),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(
            milliseconds: 200,
          ),
          curve: Curves.easeIn,
          tween: Tween<double>(
            end: isDiff ? 100 : 300,
            begin: isDiff ? 300 : 100,
          ),
          builder: (context, value, child) {
            return Image.network(
              apod.mediaType == 'image' ? apod.url : apod.thumbnailUrl!,
              width: value,
              fit: BoxFit.contain,
              color: isDiff ? Colors.black.withOpacity(0.4) : null,
            );
          },
        ),
      ),
    );
  }
}
