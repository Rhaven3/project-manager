import 'package:flutter/material.dart';

import '../model/project.dart';

class ProjectForm extends StatefulWidget {
  Function(Project) submit;
  Project project;

  ProjectForm({super.key, required this.project, required this.submit});

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final List<DropdownMenuItem> dropdownStatusList = ProjectEnum.values
      .map(
        (stateEnum) => DropdownMenuItem<String>(
          value: stateEnum.name,
          child: Text(stateEnum.text),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.project.title,
              style: inputStyle,
              onSaved: (value) {
                widget.project.title = value!;
              },
              validator: _nullValidator,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "titre du projet",
                hintText: "ex: Projet MK-Ultra",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              initialValue: widget.project.desc,
              style: inputStyle,
              onSaved: (value) {
                widget.project.desc = value!;
              },
              validator: _nullValidator,
              textAlign: TextAlign.start,
              maxLines: 3,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Description",
                hintText: "ex: faut que ça reste secret ça",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              style: inputStyle,
              dropdownColor: Colors.white,
              focusColor: Colors.black,
              onSaved: (value) {
                widget.project.status =
                    ProjectEnum.fromName(value) ?? ProjectEnum.forthcomming;
              },
              initialValue: widget.project.status.name,
              decoration: InputDecoration(
                labelText: "Statut",
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.grey,
                ),
              ),
              items: dropdownStatusList,
              onChanged: (value) {},
            ),
            SizedBox(height: 8),
            TextFormField(
              style: inputStyle,
              readOnly: true,
              controller: TextEditingController(
                text: widget.project.date != null
                    ? "${widget.project.date!.day}/${widget.project.date!.month}/${widget.project.date!.year}"
                    : "",
              ),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  widget.project.date = pickedDate;
                  setState(() {});
                }
              },
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Date",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  widget.submit(widget.project);
                }
              },
              label: Text("Soumettre"),
              icon: Icon(Icons.send),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).primaryColor,
                ),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _nullValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "champ obligatoire !";
    }
    return null;
  }
}

TextStyle inputStyle = TextStyle(color: Colors.black);
