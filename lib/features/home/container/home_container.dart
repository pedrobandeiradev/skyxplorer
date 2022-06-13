import 'package:flutter/material.dart';
import 'package:skyxplorer/common/error/failure.dart';
import 'package:skyxplorer/common/models/apod_model.dart';
import 'package:skyxplorer/common/repositories/skyxplorer_repository.dart';

import '../ui/pages/home_error.dart';
import '../ui/pages/home_loading.dart';
import '../ui/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  final ISkyXplorerRepository repository;
  final Function(String, dynamic) onItemTap;

  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AstronomyPictureOfTheDay>>(
      future: repository.getLatestPictures(
        30,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            listOfApod: snapshot.data!,
            onItemTap: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
