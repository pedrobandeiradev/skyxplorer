import 'package:flutter/material.dart';
import 'package:skyxplorer/common/models/apod_model.dart';
import 'package:skyxplorer/features/home/ui/pages/home_text.dart';
import '../../../details/models/detail_arguments_model.dart';
import '../widgets/item_widget.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  final List<AstronomyPictureOfTheDay> listOfApod;
  final Function(String, DetailArguments) onItemTap;

  const HomePage({
    Key? key,
    required this.listOfApod,
    required this.onItemTap,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  late List<AstronomyPictureOfTheDay> filteredListOfApod;

  void _setFilteredList() {
    filteredListOfApod = widget.listOfApod;
  }

  void _searchByTerm(String? term) {
    setState(() {
      if (term == null || term.isEmpty) {
        _setFilteredList();
        return;
      }
      filteredListOfApod = widget.listOfApod
          .where(
            (apod) =>
                apod.title.toLowerCase().contains(term.toLowerCase()) ||
                apod.date.contains(term),
          )
          .toList();
    });
  }

  Future<void> _refresh() async {
    // _requestInitial();
  }

  @override
  void initState() {
    _setFilteredList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(
            left: 12.0,
          ),
          child: Text(
            HomeText.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: _content(),
    );
  }

  Column _content() {
    return Column(
      children: [
        SearchBar(
          searchController: _searchController,
          callback: () => _searchByTerm(
            _searchController.text,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredListOfApod.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 24.0,
                  ),
                  child: ItemWidget(
                    apod: filteredListOfApod[index],
                    onTap: widget.onItemTap,
                    index: int.tryParse(filteredListOfApod[index].date) ?? 0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
