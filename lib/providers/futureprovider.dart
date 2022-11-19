// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Cities { kathmandu, banepa, bhaktapur }

typedef Widgetmoji = String;

Future<Widgetmoji> fetchmoji(Cities city) async {
  return Future.delayed(
      const Duration(seconds: 2),
      () =>
          {
            Cities.kathmandu: '🌨️',
            Cities.bhaktapur: '☀️',
            Cities.banepa: '🌦️',
          }[city] ??
          'unknown');
}

final currentcityprovider = StateProvider<Cities?>((ref) => null);

final weatherProvider = FutureProvider<Widgetmoji>(((ref) {
  final city = ref.watch(currentcityprovider);
  if (city != null) {
    return fetchmoji(city);
  } else {
    return Future.value('Unknwon');
  }
}));

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currenweather = ref.watch(weatherProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Future provider'),
      ),
      body: Column(children: [
        currenweather.when(
            data: (data) => Text(
                  data.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
            error: (_, __) => Text("error"),
            loading: () => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )),
        Expanded(
            child: ListView.builder(
                itemCount: Cities.values.length,
                itemBuilder: ((context, index) {
                  final mycity = Cities.values[index];
                  final isSelected = mycity == ref.watch(currentcityprovider);
                  return ListTile(
                    title: Text(mycity.name),
                    trailing: isSelected? Icon(Icons.check):SizedBox.shrink(),
                    onTap: ()=> isSelected ? ref.read(currentcityprovider.notifier).state = null:ref.read(currentcityprovider.notifier).state = mycity
                  );
                })))
      ]),
    );
  }
}
