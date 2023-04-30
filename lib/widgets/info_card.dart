import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallzon/model/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
  });

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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  onTap: () => launchUrl(
                    Uri.parse('www.google.com'),
                  ),
                  child: const Image(
                    height: 30,
                    image: AssetImage('assets/github1.png'),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () => launchUrl(
                    Uri.parse('www.google.com'),
                  ),
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
