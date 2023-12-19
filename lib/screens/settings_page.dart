import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text('Theme Settings'),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .setTheme(value);
              },
            ),
            const SizedBox(height: 20),
            const Text('Font Size'),
            Slider(
              value: Provider.of<ThemeProvider>(context).fontSize,
              min: 10.0,
              max: 30.0,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .setFontSize(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
