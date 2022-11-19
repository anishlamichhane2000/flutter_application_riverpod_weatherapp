// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const List<String> names = [
  'John',
  'Paul',
  'George',
  'Ringo',
  'Alex',
  'Pete',
  'Stuart',
  'Mick',
  'Kurt',
  'Dave',
  'Chris',
  'Matt',
  'Tom',
  'Mike',
  'Dave',
  'Ian',
];

final tickerProvider = StreamProvider(((ref) {
  return Stream.periodic(const Duration(seconds: 1), (number) {
    number = number >= names.length ? names.length : number;
    return number;
  });
}));

final nameProvider = StreamProvider(((ref) {
  final ourstream = ref.watch(tickerProvider.stream);
  return ourstream.map((count) => names.getRange(0, count));
}));

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameList = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stream Provider Example'),
      ),
      // ignore: prefer_const_constructors
      body: nameList.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
              
              final name = data.toList()[index];
              return ListTile(
                title:  Text(name),
              );
            }));
          },
          error: (error, stack) => const Center(
                child: Text("something went wrong"),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
