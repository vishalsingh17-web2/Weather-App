import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather/Backend/backend_service.dart';
import 'package:weather/Pages/homepage.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10.0),
                TypeAheadField(
                  
                  textFieldConfiguration: const TextFieldConfiguration(
                    autofocus: true,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 17),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await BackendService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, Map<String, dynamic> suggestion) {
                    return ListTile(
                      title: Text(suggestion['name']!),
                      subtitle: Text('${suggestion['country']}'),
                    );
                  },
                  onSuggestionSelected: (Map<String, dynamic> suggestion) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => HomePage(
                          place: suggestion['name'],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
