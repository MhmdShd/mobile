import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/Widgets/image_input.dart';
import 'package:mobile/Widgets/text_field.dart';


class Report extends StatefulWidget {
  const Report(this.submitReport, {super.key});
  final void Function(Report report) submitReport;
  @override
  State<StatefulWidget> createState() {
    return _Report();
  }
}

class _Report extends State<Report> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _fileController = TextEditingController();
  XFile? _selectedImage;
  void _submitReport() {
    if (_descriptionController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please make sure valid data were input!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
      //widget.submitReport();
    }
  }
  void _getImageData(XFile image){
    setState(() {
      _selectedImage = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          CustomTextField(
            controller: _titleController,
            customIcon: Image.asset(
              'assets/icons/note.png',
              width: 30,
              height: 30,
            ),
            label: 'Title',
          ),CustomTextField(
            controller: _descriptionController,
            customIcon: Image.asset(
              'assets/icons/note.png',
              width: 30,
              height: 30,
            ),
            label: 'Descritption',
            maxlines: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: imageInput(passFunction: _getImageData,)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      onPressed: _submitReport,
                      child: const Text('Send'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
