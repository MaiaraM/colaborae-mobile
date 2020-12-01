import 'package:colaborae/app/modules/user/controllers/user_controller.dart';
import 'package:colaborae/app/modules/user/models/user_model.dart';
import 'package:colaborae/app/shared/components/big_button.dart';
import 'package:colaborae/app/shared/components/field.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final userController = Modular.get<UserController>();

  bool createNewUser = false;

  @override
  void initState() {
    super.initState();
    if (userController.user == null)
      createNewUser = true;
    else {
      nomeController.text = userController.user.firstName;
    }
  }

  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final cpfController = TextEditingController();
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();
  final descricaoController = TextEditingController();

  Future<UserModel> createUser() async {
    Address address = new Address(
        address: ruaController.text,
        city: cidadeController.text,
        state: estadoController.text);
    UserModel newUser = new UserModel(
        firstName: nomeController.text,
        lastName: sobrenomeController.text,
        email: emailController.text,
        username: emailController.text,
        document: cpfController.text,
        address: address,
        description: descricaoController.text,
        password: senhaController.text);

    bool createUser = await userController.createUser(newUser);
    if (createUser) {
      Modular.to.pushNamed("/login");
    } else {
      print("Erro");
    }
  }

  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/imagens/gift_50px.png',
                ),
                Spacing(10.0),
                Text(
                  createNewUser ? 'Faça seu cadastro' : 'Edite seus daddos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                  ),
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dados pessoais',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacing(15.0),
                Field(
                  label: 'Nome',
                  hint: 'Digite seu primeiro nome',
                  icon: Icon(
                    Icons.person,
                    color: gray,
                  ),
                  lines: 1,
                  controller: nomeController,
                  keyboardInputType: TextInputType.name,
                ),
                Spacing(20.0),
                Field(
                  label: 'Sobrenome',
                  hint: 'Digite seu sobrenome',
                  icon: Icon(
                    Icons.person,
                    color: gray,
                  ),
                  lines: 1,
                  controller: sobrenomeController,
                  keyboardInputType: TextInputType.name,
                ),
                Spacing(20.0),
                Field(
                  label: 'E-mail',
                  hint: 'Digite seu e-mail',
                  icon: Icon(
                    Icons.alternate_email,
                    color: gray,
                  ),
                  lines: 1,
                  controller: emailController,
                  keyboardInputType: TextInputType.emailAddress,
                ),
                Spacing(20.0),
                Field(
                  label: 'CPF',
                  hint: 'Digite seu CPF',
                  icon: Icon(
                    Icons.accessibility,
                    color: gray,
                  ),
                  lines: 1,
                  controller: cpfController,
                  keyboardInputType: TextInputType.number,
                ),
                Spacing(20.0),
                Field(
                  label: 'Senha',
                  icon: Icon(
                    Icons.lock,
                    color: gray,
                  ),
                  lines: 1,
                  hint: 'Digite uma nova senha',
                  controller: senhaController,
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Endereço',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Spacing(20.0),
                Row(
                  children: [
                    Expanded(
                      child: Field(
                        label: 'Rua',
                        hint: 'Digite a rua da sua casa',
                        lines: 1,
                        controller: ruaController,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Field(
                        label: 'Bairro',
                        hint: 'Digite o seu bairro',
                        lines: 1,
                        controller: bairroController,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                Spacing(20.0),
                Row(
                  children: [
                    Expanded(
                      child: Field(
                        label: 'Cidade',
                        hint: 'Ex: Rio de Janeiro',
                        controller: cidadeController,
                        lines: 1,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Field(
                        label: 'Estado',
                        hint: 'Ex: SP',
                        controller: estadoController,
                        lines: 1,
                        keyboardInputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Adicione uma descrição ao seu perfil',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Spacing(20.0),
                Field(
                  label: 'Descrição',
                  hint:
                      'Escreva uma descrição rápida sobre você que aparecerá aos outros usuários.',
                  lines: 4,
                  controller: descricaoController,
                  keyboardInputType: TextInputType.multiline,
                ),
                Spacing(20.0),
                BigButton(
                  text: 'CADASTRAR',
                  onPressed: () async => await createUser(),
                ),
                Spacing(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui uma conta?',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    FlatButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Entre agora.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainPurple,
                          fontSize: 18.0,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacing(20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
