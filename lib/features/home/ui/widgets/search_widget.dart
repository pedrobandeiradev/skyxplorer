import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function callback;
  String? searchText;

  SearchBar({
    Key? key,
    required this.callback,
    required this.searchController,
  }) : super(key: key);

  void _onSearchTextSubmission(String text) async {
    if (text.isEmpty) {
      return;
    }
    searchText = text;
    callback();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          24.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            child: _searchTextField(),
          ),
        ],
      ),
    );
  }

  TextField _searchTextField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.all(
            Radius.circular(
              32.0,
            ),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              32.0,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(
            32.0,
          ),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: 'Search by title or date',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey.shade700,
        ),
      ),
      onChanged: (text) {
        searchText = text;
        _onSearchTextSubmission(text);
      },
      onSubmitted: (text) {
        searchText = text;
        _onSearchTextSubmission(text);
      },
    );
  }
}
