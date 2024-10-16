
import 'package:flutter/material.dart';
import 'package:portfolio/components/app_extensions.dart';
import 'package:portfolio/responsive_layout.dart';
import 'package:universal_html/html.dart' as html;
import '../../components/default_button.dart';
import '../../components/section_title.dart';
import '../../constants.dart';
import 'components/socal_card.dart';


class ContactSection extends StatelessWidget {
  const ContactSection({super.key}); // Add this line
  @override
  Widget build(BuildContext context) {
    return Container(
      // this height only for demo
      // height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFE8F0F9),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg_img_2.png"),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(height: kDefaultPadding * 2.5),
          SectionTitle(
            title: "Contact Me",
            subTitle: "For Project inquiry and information",
            color: Color(0xFF07E24A),
          ),
          ContactBox()
        ],
      ),
    );
  }
}

class ContactBox extends StatelessWidget {
  const ContactBox({super.key
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          size.width > DeviceType.ipad.getMaxWidth()? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocalCard(
                color: const Color(0xFFD9FFFC),
                iconSrc: "assets/images/skype.png",
                name: 'Skype',
                press: () {
                  html.window.open(
                      SocialLinks.skype,
                      '_blank');

                },
              ),
              SocalCard(
                color: const Color(0xFFE4FFC7),
                iconSrc: "assets/images/fiverr.png",
                name: 'Fiverr',
                press: () {
                  html.window.open(
                      SocialLinks.fiverr,
                      '_blank');

                },
              ),
              SocalCard(
                color: const Color(0xFFE8F0F9),
                iconSrc: "assets/images/linkdein.png",
                name: 'Linkdein',
                press: () {
                  html.window.open(
                      SocialLinks.linkedin,
                      '_blank');

                },
              ),
            ],
          ):Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SocalCard(
                color: const Color(0xFFD9FFFC),
                iconSrc: "assets/images/skype.png",
                name: 'Skype',
                press: () {
                  html.window.open(
                      SocialLinks.skype,
                      '_blank');

                },
              ),
              SizedBox(height: 20),
              SocalCard(
                color: const Color(0xFFE4FFC7),
                iconSrc: "assets/images/fiverr.png",
                name: 'Fiverr',
                press: () {
                  html.window.open(
                    SocialLinks.fiverr,
                    '_blank');

                },
              ),
              SizedBox(height: 20),
              SocalCard(
                color: const Color(0xFFE8F0F9),
                iconSrc: "assets/images/linkdein.png",
                name: 'Linkdein',
                press: () {
                  html.window.open(
                      SocialLinks.linkedin,
                      '_blank');

                },
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding * 2),
          const ContactForm(),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key
  });

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _projectTypeController = TextEditingController();
  final TextEditingController _projectBudgetController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Send Mail function
 /* void sendMail({
    required String recipientEmail,
    required String mailMessage,
  }) async {
    // change your email here
    String username = 'sweetyrawat1310@gmail.com';
    // change your password here
    String password = 'bxjypygthpyvfmln';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Mail Service')
      ..recipients.add(recipientEmail)
      ..subject = 'Mail '
      ..text = 'Message: $mailMessage';

    try {
      await send(message, smtpServer);
      showSnackbar('Email sent successfully');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FittedBox(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );}*/
  void send() {
    final subject = Uri.encodeComponent("Quotation form a client");
    final body = Uri.encodeComponent( " Hi Developer, \n\n My name is ${_nameController.text} and my email is ${_emailController.text}"
        " i want  to build my project and there info is${_descriptionController.text}and it type of ${_projectTypeController.text}"
        "My budget for this project is  ${_projectBudgetController.text} \n \nThanks \n${_nameController.text}",);
    final email = _emailController.text;

    final url = 'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=$subject&body=$body';
    html.window.open(url, "_blank");
  }
/*
  Future<void> send() async {
    final Email email = Email(
      body: " Hi Developer, \n My name is ${_nameController.text} and my email is ${_emailController.text}"
          " i want  to build my project and there info is${_descriptionController.text}and it type of ${_projectTypeController.text}"
          " and my budget is ${_projectBudgetController.text} \n Thanks \n${_nameController.text}",
      subject: "Quotation form a client",
      recipients: [_emailController.text],
      bcc: ["sweetyrawat1310@gmail.com"],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          TextFormField(
            controller: _nameController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Your Name",
              hintText: "Enter Your Name",
            ),
          ),
          TextFormField(
            controller: _emailController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Email Address",
              hintText: "Enter your email address",
            ),
          ),
          TextFormField(
            controller: _projectTypeController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Project Type",
              hintText: "Select Project Type",
            ),
          ),
          TextFormField(
            controller: _projectBudgetController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Project Budget",
              hintText: "Select Project Budget",
            ),
          ),
          TextFormField(
            controller: _descriptionController,
            onChanged: (value) {},
            decoration: InputDecoration(
              labelText: "Description",
              hintText: "Write some description",
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "assets/images/contact_icon.png",
                text: "Contact Me!",
                press: () {
                  setState(() {
                 send();
                  });
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
