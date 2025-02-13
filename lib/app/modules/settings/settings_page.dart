import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:practical_house_manager/app/core/themes/theme_controller.dart';

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

    final themeController = Modular.get<ThemeController>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
                animation: themeController,
                builder: (context, _) {
                  return ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.dark_mode, size: 35),
                        title: const Text("Dark Mode"),
                        subtitle: const Text("Here you can change your theme."),
                        trailing: Switch(
                          value: themeController.darkMode,
                          activeTrackColor: Colors.white,
                          activeColor: Colors.grey,
                          onChanged: (value) {
                            themeController.toggleDarkMode();
                          },
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.style, size: 35),
                        title: const Text("Neobrutalism"),
                        subtitle: const Text("Toggle neobrutalism style."),
                        trailing: Switch(
                          value: themeController.neobrutalism,
                          activeTrackColor: Colors.white,
                          activeColor: Colors.grey,
                          onChanged: (value) {
                            themeController.toggleNeobrutalism();
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
                            color: themeController.colorSeed,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            _showColorPicker(context, themeController);
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _showColorPicker(BuildContext context, ThemeController themeController) {
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
                themeController.changeColor(color);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                    width: themeController.colorSeed == color ? 3 : 1,
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
