import 'package:flutter/material.dart';

import '../homepage.dart';
import '../providers/basics_provider.dart';
import '../providers/futureprovider.dart';
import '../providers/stream_provider.dart';

class Constant {
  static final List<Map<String, dynamic>> routesList = [

    {
      'title': 'Home',
      'route': '/',
      'page': const Homepage(),
      'subtitle': 'This is the home page',
    },
    {
      'title': 'Basics Provider',
      'route': '/basics_provider',
      'page': const BasicProviderExample(),
      'subtitle': 'This is the basics provider page returns DateTime',
    },
    {
      'title': 'Future Provider',
      'route': '/future_provider',
      'page': const FutureProviderExample(),
      'subtitle':
          'This is the future provider page simulates network request and returns String',
    },
    {
      'title': 'Stream Provider',
      'route': '/stream_provider',
      'page': const StreamProviderExample(),
      'subtitle':
          'This is the stream provider page simulates network request and returns String',
    }
  ];
}
