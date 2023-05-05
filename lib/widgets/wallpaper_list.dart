import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallzon/model/constants.dart';
import 'package:wallzon/view/detail_screen.dart';
import 'package:wallzon/widgets/placeholder.dart';

import '../model/photos.dart';

Widget wallpaperList(BuildContext context, VoidCallback fetchData,
    {required List<Photos> photosList}) {
  bool isLoading = false;

  return Builder(builder: (context) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (!isLoading &&
                scrollNotification is ScrollEndNotification &&
                scrollNotification.metrics.extentAfter == 0) {
              fetchData();
            }
            return true;
          },
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: photosList.length,
            itemBuilder: (BuildContext context, int index) {
              final photos = photosList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      maintainState: true,
                      builder: (context) => DetailScreen(photos: photos),
                    ),
                  );
                },
                child: GridTile(
                  child: Hero(
                    tag: photos.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => placeholder,
                        imageUrl: photos.src.portrait,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Visibility(
          visible: photosList.isEmpty,
          child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 2)),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text(
                      'No content available',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: kBaseColor),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        )
      ],
    );
  });
}
