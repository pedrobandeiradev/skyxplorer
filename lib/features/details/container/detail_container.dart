import 'package:flutter/material.dart';
import 'package:skyxplorer/common/models/apod_model.dart';
import 'package:skyxplorer/common/repositories/skyxplorer_repository.dart';
import '../models/detail_arguments_model.dart';
import '../ui/pages/detail_page.dart';

class DetailContainer extends StatefulWidget {
  const DetailContainer(
      {Key? key,
      required this.repository,
      required this.arguments,
      required this.onBack})
      : super(key: key);
  final ISkyXplorerRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  DetailContainerState createState() => DetailContainerState();
}

class DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  AstronomyPictureOfTheDay? _apod;

  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _apod ??= widget.arguments.apod;
    return DetailsPage(
      apod: _apod!,
      controller: _controller,
    );
  }
}
