// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inshorts_assignment_karan/common/colors.dart';
import 'package:inshorts_assignment_karan/common/typography/text_styles.dart';
import 'package:inshorts_assignment_karan/controller/settings.dart';
import 'package:inshorts_assignment_karan/global/global.dart';
import 'package:inshorts_assignment_karan/l10n/l10n.dart';
import 'package:provider/provider.dart';

// Project imports:

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          context.l10n.settings,
          style: InShortTextStyle.appBarTitle.copyWith(
            fontSize: 18,
            color: Provider.of<SettingsProvider>(context, listen: false)
                    .isDarkThemeOn
                ? InShortColors.background
                : InShortColors.onBackground,
          ),
        ),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, settingsProvider, child) => ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.access_alarm),
              title: Text(context.l10n.dark_theme),
              subtitle: Text(context.l10n.darktheme_message),
              onTap: () {
                settingsProvider.darkTheme(!settingsProvider.isDarkThemeOn);
              },
              trailing: Switch(
                  activeColor: InShortColors.accent,
                  value: settingsProvider.isDarkThemeOn,
                  onChanged: (status) {
                    settingsProvider.darkTheme(status);
                  }),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.language),
              title: Text(context.l10n.language),
              trailing: DropdownButton(
                  underline: Container(),
                  value: settingsProvider.activeLanguge,
                  items: Global.lang.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (v) {
                    settingsProvider.setLang((v as String));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
