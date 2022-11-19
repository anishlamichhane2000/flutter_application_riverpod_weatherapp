// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final datetimeProvider = Provider<DateTime>(((ref) {
  return DateTime.now();
}));

class BasicProviderExample extends ConsumerWidget {
  const BasicProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Datetime = ref.watch(datetimeProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Riverpod Examples'),
      ),
      body: Center(
        child: Text(
          Datetime.toIso8601String(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      
    );
  }
}
