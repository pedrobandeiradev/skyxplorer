import 'package:flutter/material.dart';
import 'package:skyxplorer/common/repositories/skyxplorer_repository.dart';

import 'details/container/detail_container.dart';
import 'details/models/detail_arguments_model.dart';
import 'home/container/home_container.dart';

class SkyXplorerRoute extends StatelessWidget {
  const SkyXplorerRoute({Key? key, required this.repository}) : super(key: key);
  final SkyXplorerRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
      },
    );
  }
}
