import 'package:flutter/material.dart';
import 'package:flutter_application_riverpod/constant/const.dart';
import 'package:flutter_application_riverpod/widgets/routebutton.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Examples'),
      ),
      body: ListView.builder(
          itemCount: Constant.routesList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final route = Constant.routesList[index];

            if (index == 0) return const SizedBox();
            return RouteButton(
                title: route['title'],
                routeName: route['route'],
                subtitle: route['route']);
          }),
    );
  }
}
