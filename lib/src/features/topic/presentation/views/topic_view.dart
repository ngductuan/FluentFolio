import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluentfolio/src/constants/theme.dart';
import 'package:flutter/material.dart';

class TopicView extends StatefulWidget {
  const TopicView({super.key});

  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: colorsByTheme(context).hintTextColor ?? Colors.black,
                  blurRadius: isDarkThemeHold ? 5 : 2,
                ),
              ],
            ),
            // leading: const Icon(Icons.arrow_back),
            child: AppBar(
              backgroundColor: colorsByTheme(context).backgroundTheme,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              leading: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Icon(
                  Icons.arrow_back,
                  color: colorsByTheme(context).defaultFont,
                ),
              ),
              title: const Text(TextDoc.txtFluentFolioTitle),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Handle the onPressed event for the settings icon
                    print('Settings icon pressed');
                  },
                ),
                
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Topic 2 Content'),
            ),
          ),
        ],
      ),
    );
  }
}
