import 'package:flutter/material.dart';
import 'package:skyxplorer/common/models/apod_model.dart';

class DetailAppBarWidget extends StatelessWidget {
  final AstronomyPictureOfTheDay apod;
  final VoidCallback onBack;
  final bool isOnTop;

  const DetailAppBarWidget({
    Key? key,
    required this.apod,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(
          Icons.chevron_left,
        ),
      ),
      centerTitle: false,
      title: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 300,
        ),
        opacity: isOnTop ? 0 : 1,
        child: Text(
          apod.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
