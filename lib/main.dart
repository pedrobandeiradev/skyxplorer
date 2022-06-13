import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skyxplorer/common/repositories/skyxplorer_repository.dart';
import 'package:skyxplorer/features/route.dart';

void main() {
  runApp(SkyXplorer());
}

class SkyXplorer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkyXplorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SkyXplorerRoute(
        repository: SkyXplorerRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
