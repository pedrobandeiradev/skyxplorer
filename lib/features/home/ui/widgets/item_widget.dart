import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyxplorer/common/models/apod_model.dart';
import '../../../details/models/detail_arguments_model.dart';

class ItemWidget extends StatelessWidget {
  final AstronomyPictureOfTheDay apod;
  final Function(String, DetailArguments) onTap;
  final int index;

  const ItemWidget({
    Key? key,
    required this.apod,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(
        '/details',
        DetailArguments(
          apod: apod,
          index: index,
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(
                24.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: Text(
                      apod.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.1,
                        ),
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: apod.mediaType == 'image'
                                ? apod.url
                                : apod.thumbnailUrl!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                      ),
                      child: Text(
                        'On ${apod.date}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
