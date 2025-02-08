import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/core/themes/color_seed.dart';
import 'package:practical_house_manager/app/core/themes/dark_mode.dart';
import 'package:practical_house_manager/app/core/themes/neobrutalism.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const _SettingsContent(),
    );
  }
}

class _SettingsContent extends StatefulWidget {
  const _SettingsContent();

  @override
  State<_SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<_SettingsContent> {
  @override
  Widget build(BuildContext context) {
    // final themeMode = Provider.of<DarkMode>(context);
    // final neobrutalismMode = Provider.of<Neobrutalism>(context);
    // final colorSeed = Provider.of<ColorSeed>(context);

    final themeMode = Modular.get<DarkMode>();
    final neobrutalismMode = Modular.get<Neobrutalism>();
    final colorSeed = Modular.get<ColorSeed>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                AnimatedBuilder(
                    animation: themeMode,
                    builder: (context, _) {
                      return ListTile(
                        leading: const Icon(Icons.dark_mode, size: 35),
                        title: const Text("Dark Mode"),
                        subtitle: const Text("Here you can change your theme."),
                        trailing: Switch(
                          value: themeMode.darkMode,
                          activeTrackColor: Colors.white,
                          activeColor: Colors.grey,
                          onChanged: (value) {
                            themeMode.changeMode();
                          },
                        ),
                      );
                    }),
                ListTile(
                  leading: const Icon(Icons.style, size: 35),
                  title: const Text("Neobrutalism"),
                  subtitle: const Text("Toggle neobrutalism style."),
                  trailing: Switch(
                    value: neobrutalismMode.neobrutalism,
                    activeTrackColor: Colors.white,
                    activeColor: Colors.grey,
                    onChanged: (value) {
                      neobrutalismMode.changeMode();
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.palette, size: 35),
                  title: const Text("Color Seed"),
                  subtitle: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: colorSeed.colorSeed,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      _showColorPicker(context, colorSeed);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showColorPicker(BuildContext context, ColorSeed colorSeed) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: Colors.primaries.length,
          itemBuilder: (context, index) {
            final color = Colors.primaries[index];
            return GestureDetector(
              onTap: () {
                colorSeed.changeColor(color);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: colorSeed.colorSeed == color ? 3 : 1,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
