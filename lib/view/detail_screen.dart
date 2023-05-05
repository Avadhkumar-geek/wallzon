import 'package:flutter/material.dart';
import 'package:wallzon/api/save.dart';
import 'package:wallzon/model/photos.dart';

class DetailScreen extends StatefulWidget {
  final Photos photos;

  const DetailScreen({Key? key, required this.photos}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('0xFF$hexCode'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Wallpaper',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          AspectRatio(
            aspectRatio: 0.68,
            child: Material(
              color: Colors.black45,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(30),
              child: Hero(
                tag: widget.photos.id,
                child: Image.network(
                  widget.photos.src.portrait,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async =>
                await saveNetworkImageToDownloads(widget.photos.src.original),
            style: ElevatedButton.styleFrom(
              backgroundColor: _colorFromHex(widget.photos.avgColor),
              minimumSize: const Size(150, 50),
            ),
            child: const Text(
              "Download",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
