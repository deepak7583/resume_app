import 'package:flutter/material.dart';
import 'package:resume_app/ui/edit_page.dart';
import 'package:resume_app/ui/model.dart';

class ResumeBuilderScreen extends StatefulWidget {
  const ResumeBuilderScreen({super.key});

  @override
  _ResumeBuilderScreenState createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {
  List<ResumeItem> resumeItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _addResumeItem(context);
      },
      child: const Icon(Icons.add),
    );
  }

  Widget buildBody() {
    return ListView.separated(
      itemCount: resumeItems.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              resumeItems.removeAt(index);
            });
          },
          background: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(resumeItems[index].fullName),
                  SizedBox(height: 10.0),
                  Text(resumeItems[index].title),
                  SizedBox(height: 10.0),
                  Text(resumeItems[index].content),
                  SizedBox(height: 10.0),
                  Text("Education: ${resumeItems[index].education}"),
                  SizedBox(height: 10.0),
                  Text("Experience: ${resumeItems[index].experience}"),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    _editResumeItem(context, index);
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ))
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
        );
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Resume',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );
  }

  void _addResumeItem(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEditResumeItemScreen()),
    );
    if (result != null) {
      setState(() {
        resumeItems.add(result);
      });
    }
  }

  void _editResumeItem(BuildContext context, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditResumeItemScreen(
          resumeItem: resumeItems[index],
        ),
      ),
    );
    if (result != null) {
      setState(() {
        resumeItems[index] = result;
      });
    }
  }
}
