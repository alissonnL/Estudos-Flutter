import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(CountryInfoApp());
}

class CountryInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountryListScreen(),
    );
  }
}

class CountryListScreen extends StatefulWidget {
  @override
  _CountryListScreenState createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Country> fetchedCountries = (data as List)
          .map((countryData) => Country.fromJson(countryData))
          .toList();

      setState(() {
        countries = fetchedCountries;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações dos Países')),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(countries[index].flag),
            title: Text(countries[index].name),
            subtitle: Text(
              'Capital: ${countries[index].capital}\nPopulação: ${countries[index].population.toString()}',
            ),
          );
        },
      ),
    );
  }
}

class Country {
  final String name;
  final String? capital;
  final int? population;
  final String flag;

  Country(this.name, this.capital, this.population, this.flag);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      json['name']['common'],
      json['capital'] != null ? json['capital'][0] : 'N/A',
      json['population'] != null ? json['population'] : 0,
      json['flags']['png'],
    );
  }
}
