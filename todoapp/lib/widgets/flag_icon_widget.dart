import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common.dart';
import 'package:todoapp/common/localizasi.dart';
import 'package:todoapp/provider/localizationsprovider.dart';

class FlagIconWidget extends StatelessWidget {
  const FlagIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: const Icon(Icons.flag),
        items: AppLocalizations.supportedLocales.map((Locale locale) {
          final flag = Localizasi.getFlag(locale.languageCode);
          return DropdownMenuItem(
            value: locale,
            child: Center(
              child: Text(flag),
            ),
            onTap: () {
              final provider = Provider.of<LocalizationsProvider>(context, listen: false);
              provider.setLocale(locale);
            },
          );
        }).toList(),
        onChanged: (Locale? value) {  },
      ),

    );
  }
}
