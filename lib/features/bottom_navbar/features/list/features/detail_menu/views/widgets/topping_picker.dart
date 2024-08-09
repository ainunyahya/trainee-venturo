import 'package:flutter/material.dart';

class ToppingPicker extends StatelessWidget {
  final String selectedTopping;
  final ValueChanged<String> onToppingSelected;

  const ToppingPicker({
    super.key,
    required this.selectedTopping,
    required this.onToppingSelected,
  });

  @override
  Widget build(BuildContext context) {
    final toppings = ['Dimsum', 'Sausage', 'Mozarella'];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Text(
              'Pilih Topping',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: toppings.map((topping) {
                return ChoiceChip(
                  label: Text(topping),
                  selected: selectedTopping == topping,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: selectedTopping == topping
                          ? Colors.teal
                          : Colors.teal,
                    ),
                  ),
                  onSelected: (selected) {
                    onToppingSelected(topping);
                    Navigator.pop(context);
                  },
                  selectedColor: Colors.teal,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: selectedTopping == topping
                        ? Colors.white
                        : Colors.black,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
