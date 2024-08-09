import 'package:flutter/material.dart';

class NoteInput extends StatelessWidget {
  final TextEditingController noteController;
  final VoidCallback onSave;

  const NoteInput({
    super.key,
    required this.noteController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Buat Catatan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: noteController,
            decoration: const InputDecoration(
              hintText: 'Masukkan catatan Anda',
              suffixIcon: Icon(Icons.check_circle, color: Colors.teal),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '10/100',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              ElevatedButton(
                onPressed: onSave,
                child: const Text('Simpan'),
              ),
            ],
          ),
          const SizedBox(height: 400,)
        ],
      ),
    );
  }
}