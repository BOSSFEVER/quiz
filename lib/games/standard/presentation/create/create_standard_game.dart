import 'package:bf_theme/bf_theme.dart';
import 'package:flutter/material.dart';
import 'package:quiz/menu/views/screens/create/game/round_card.dart';
import 'package:quiz/menu/views/screens/create/game/settings_card.dart';

class CreateStandardGame extends StatelessWidget {
  const CreateStandardGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int length = 40;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Game'),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 400,
            decoration: BoxDecoration(color: BFColors.background, boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 2,
                blurRadius: 16,
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return BFButton(
                      onPressed: () => {},
                      width: double.infinity,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      trailing: Icons.chevron_right,
                      child: Text('Metadata'),
                    );
                  } else if (index == length - 1) {
                    return BFButton(
                      onPressed: () => {},
                      width: double.infinity,
                      leading: Icons.add,
                      colorPack: BFColorPacks.green,
                      child: Text('Add Round'),
                    );
                  } else {
                    return RoundCard();
                  }
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 8,
                ),
                itemCount: length,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SettingsCard(),
            ),
          ),
        ],
      ),
    );
  }
}
