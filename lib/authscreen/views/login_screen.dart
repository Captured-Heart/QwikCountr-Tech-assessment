import '../../app.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';
  LoginScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).primaryColorLight, width: 0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.045,
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        loginTitle,
                        textScaleFactor: 1.3,
                      ),
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return loginErrorText;
                          } else {
                            return '';
                          }
                        },
                        decoration: InputDecoration(
                            // hintText: 'input name',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: 12),
                            filled: true,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            labelText: name,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(
                                    fontWeight: AppFontWeight.thin,
                                    fontSize: 13),
                            // isDense: true,
                            errorStyle: const TextStyle(
                              fontWeight: AppFontWeight.light,
                              letterSpacing: 1,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (nameController.text.isNotEmpty) {
                              SharedPreferencesHelper.setPrefName(
                                  name: nameController.text);
                              push(context, const MainScreen());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Theme.of(context).primaryColorLight),
                          )),
                          child: const Text(login),
                        ),
                      )
                    ]
                        .expand((element) => [
                              element,
                              const SizedBox(
                                height: 10,
                              ),
                            ])
                        .toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
