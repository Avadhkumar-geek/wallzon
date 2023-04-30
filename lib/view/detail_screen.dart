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
  bool _showAppBar = true;

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('0xFF$hexCode'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTapDown: (_) => setState(() => _showAppBar = !_showAppBar),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Hero(
                      tag: widget.photos.id,
                      child: Image.network(
                        widget.photos.src.portrait,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () async =>
                              await saveNetworkImageToDownloads(
                                  widget.photos.src.original),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _colorFromHex(widget.photos.avgColor),
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text(
                            "Download",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_showAppBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text(
                  'Wallpaper',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
            ),
        ],
      ),
    );
  }
}
