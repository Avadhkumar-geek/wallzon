import 'package:flutter/material.dart';
import 'package:wallzon/api/fetch_api.dart';
import 'package:wallzon/model/constants.dart';
import 'package:wallzon/model/photos.dart';
import 'package:wallzon/widgets/logo.dart';
import 'package:wallzon/widgets/wallpaper_list.dart';

class SearchQuery extends StatefulWidget {
  final String queryController;

  const SearchQuery({super.key, required this.queryController});

  @override
  State<SearchQuery> createState() => _SearchQueryState();
}

class _SearchQueryState extends State<SearchQuery> {
  // final TextEditingController queryController = queryController;
  late List<Photos> photosList;
  int page = 1;
  bool isLoading = false;

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<Photos> fetchedPhotos =
          await DataService.fetchQuery(page, widget.queryController);
      if (mounted) {
        setState(() {
          photosList.addAll(fetchedPhotos);
          page = page + 1;
        });
      }
    } catch (e) {
      throw "Error: $e";
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    photosList = [];
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: logo(),
      ),
      body: Column(
        children: [
          // SearchBar(queryController: widget.queryController),
          const SizedBox(height: 25),
          Expanded(
            child: wallpaperList(context, _fetchData, photosList: photosList),
          ),
        ],
      ),
    );
  }
}
