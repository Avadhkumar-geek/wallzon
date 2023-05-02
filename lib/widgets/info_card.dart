import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallzon/model/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kForegroundColor,
      title: Image.asset('assets/babg_logo.png'),
      content: SizedBox(
        height: 69,
        child: Column(
          children: [
            Text.rich(
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              TextSpan(
                text: 'Made with ',
                children: [
                  WidgetSpan(
                    child: Image.asset(
                      'assets/heart.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const TextSpan(text: ' by ∆VADH'),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () =>
                      _launchUrl('https://github.com/Avadhkumar-geek/wallzon'),
                  child: const Image(
                    height: 30,
                    image: AssetImage('assets/github1.png'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () => _launchUrl(
                      'https://www.linkedin.com/in/avadhkumar-kachhadiya-022175204/'),
                  child: const Image(
                    height: 30,
                    image: AssetImage('assets/linkedin.png'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
