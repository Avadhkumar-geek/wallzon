import 'package:flutter/material.dart';
import 'package:wallzon/model/constants.dart';
import 'package:wallzon/view/search_query.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.queryController,
  }) : super(key: key);

  final TextEditingController queryController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kBaseColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: queryController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              // Add an onSubmitted callback to remove the focus when the Enter key is pressed
              onSubmitted: (_) => FocusScope.of(context).unfocus(),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchQuery(queryController: queryController.text)),
              );
            },
            child: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
