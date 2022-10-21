import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/presentation/view/help_view.dart';

class HelpListView extends StatelessWidget {
  const HelpListView({Key? key, required this.help}) : super(key: key);

  final List<HelpModel> help;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => HelpView(
        title: help[index].question,
        desc: help[index].answer,
      ),
      separatorBuilder: (_, index) => const SizedBox(
        height: 27,
      ),
      itemCount: help.length,
    );
  }
}
