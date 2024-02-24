import 'package:flutter/material.dart';
import 'package:resume_app/ui/model.dart';

class AddEditResumeItemScreen extends StatefulWidget {
  final ResumeItem? resumeItem;

  const AddEditResumeItemScreen({super.key, this.resumeItem});

  @override
  AddEditResumeItemScreenState createState() => AddEditResumeItemScreenState();
}

class AddEditResumeItemScreenState extends State<AddEditResumeItemScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.resumeItem != null) {
      titleController.text = widget.resumeItem!.title;
      contentController.text = widget.resumeItem!.content;
      fullNameController.text = widget.resumeItem!.fullName;
      educationController.text = widget.resumeItem!.education;
      experienceController.text = widget.resumeItem!.experience;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(
              labelText: 'Content',
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: fullNameController,
            decoration: const InputDecoration(
              labelText: 'FullName',
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: educationController,
            decoration: const InputDecoration(
              labelText: 'Education',
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: experienceController,
            decoration: const InputDecoration(
              labelText: 'Experience',
            ),
          ),
          SizedBox(height: 20.0),
          button(context),
        ],
      ),
    );
  }

  ElevatedButton button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _saveItem(context);
      },
      child: Text('Save'),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      title: Text(
        widget.resumeItem == null ? 'Add Item' : 'Edit Item',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _saveItem(BuildContext context) {
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String fullName = fullNameController.text.trim();
    String education = educationController.text.trim();
    String experience = experienceController.text.trim();

    if (title.isNotEmpty && content.isNotEmpty) {
      Navigator.pop(
        context,
        ResumeItem(
            title: title,
            content: content,
            fullName: fullName,
            education: education,
            experience: experience),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Text fileds cannot be empty.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
