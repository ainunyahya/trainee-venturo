import 'package:flutter/material.dart';

class LevelPicker extends StatelessWidget {
  final String selectedLevel;
  final ValueChanged<String> onLevelSelected;

  const LevelPicker({
    super.key,
    required this.selectedLevel,
    required this.onLevelSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Text(
              'Pilih Level',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: List.generate(5, (index) {
                final level = '${index + 1}';
                return ChoiceChip(
                  label: Text(level),
                  selected: selectedLevel == level,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: selectedLevel == level
                          ? Colors.teal
                          : Colors.teal,
                    ),
                  ),
                  onSelected: (selected) {
                    onLevelSelected(level);
                    Navigator.pop(context);
                  },
                  selectedColor: Colors.teal,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: selectedLevel == level
                        ? Colors.white
                        : Colors.black,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
