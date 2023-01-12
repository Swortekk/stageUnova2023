import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formkey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom conférence',
                  hintText: 'Entrez le nom de la conférence',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez remplir tous les champs";
                  }
                  return null;
                },
                controller: confNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nom de l'animateur de la conférence ",
                  hintText: 'Entrez le nom',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Veuillez remplir tous les champs";
                  }
                  return null;
                },
                controller: speakerNameController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: 'talk', child: Text("Talk show")),
                  DropdownMenuItem(value: 'demo', child: Text("Demo code")),
                  DropdownMenuItem(value: 'partner', child: Text("Partner"))
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: selectedConfType,
                onChanged: (value) {
                  setState(() {
                    selectedConfType = value!;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Choisir une date',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedConfDate = value;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    final confName = confNameController.text;
                    final speakerName = speakerNameController.text;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Envoi en cours..."),
                    ));
                    FocusScope.of(context).requestFocus(FocusNode());
                    print("Ajout de la conférence $confName par $speakerName");
                    print("Type de conférence : $selectedConfType");
                    print("Date de la conf : $selectedConfDate");
                  }
                },
                child: const Text("Envoyer"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
