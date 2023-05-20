import "package:flutter/material.dart";
import "package:easy_sidemenu/easy_sidemenu.dart";
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController page = PageController();

  SideMenuController sideMenuController = SideMenuController();
  final screenPages = [
    homeScreen(),
    aboutScreen(),
    servicesScreen(),
    projectsScreen(),
    const ContactScreen()
  ];
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 203, 58),
      appBar: null,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenuController,

            // Dito yung sa style ng side menu
            style: SideMenuStyle(
              showTooltip: true,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: const Color.fromARGB(255, 238, 201, 80),
              selectedColor: const Color.fromARGB(255, 255, 255, 255),
              selectedTitleTextStyle:
                  const TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
              unselectedTitleTextStyle:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              selectedIconColor: const Color.fromARGB(255, 255, 72, 0),
              decoration: const BoxDecoration(),
              backgroundColor: const Color.fromARGB(255, 1, 29, 53),
              unselectedIconColor: Colors.white,
            ),

            title: const SizedBox(
              height: 30,
            ),
            items: [
              // FIRST BUTTON PAGE
              SideMenuItem(
                priority: 0,
                title: "Home",
                onTap: (page, controller) {
                  controller.changePage(page);
                  setState(() {
                    currentPageIndex = 0;
                  });
                },
                icon: const Icon(Icons.home),
                // badgeContent: const Text(
                //   "?",
                //   style: TextStyle(color: Colors.white),
                // ),
                tooltipContent: "Home",
              ),

              // SECOND BUTTON PAGE
              SideMenuItem(
                priority: 1,
                title: "About",
                onTap: (page, controller) {
                  controller.changePage(page);
                  setState(() {
                    currentPageIndex = 1;
                  });
                },
                icon: const Icon(Icons.info),
                tooltipContent: "About",
              ),

              // THIRD BUTTON PAGE
              SideMenuItem(
                priority: 3,
                title: "Services",
                onTap: (page, controller) {
                  controller.changePage(page);
                  setState(() {
                    currentPageIndex = 2;
                  });
                },
                icon: const Icon(
                  Icons.settings,
                ),
                tooltipContent: "Services",
              ),

              // FOURTH BUTTON PAGE
              SideMenuItem(
                priority: 4,
                title: "Projects",
                onTap: (page, controller) {
                  controller.changePage(page);
                  setState(() {
                    currentPageIndex = 3;
                  });
                },
                icon: const Icon(Icons.folder),
                tooltipContent: "Projects",
              ),

              // FIFTH BUTTON PAGE
              SideMenuItem(
                priority: 5,
                title: "Contact",
                onTap: (page, controller) {
                  controller.changePage(page);
                  setState(() {
                    currentPageIndex = 4;
                  });
                },
                icon: const Icon(Icons.phone),
                tooltipContent: "Contact",
              ),
            ],
          ),

          // PAGES
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: page,
                children: [
                  screenPages[currentPageIndex],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ScrollController homeScreenController = ScrollController();
ScrollController aboutScreenController = ScrollController();
ScrollController servicesScreenController = ScrollController();
ScrollController projectsScreenController = ScrollController();
ScrollController contactScreenController = ScrollController();

// HOME SCREEEN | PAGES
Widget homeScreen() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/eli9.jpg'),
                maxRadius: 90,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi, I'm Eli",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Student / Programmer / Freelancer",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
      ),
    ),
  );
}

// ABOUT SCREEEN
Widget aboutScreen() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    controller: aboutScreenController,
    child: Card(
      color: Color.fromARGB(166, 255, 255, 255),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 5,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/eli.jpg'),
                maxRadius: 90,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi, I am Eli",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Student at Manuel S. Enverga University",
                style: TextStyle(fontSize: 15, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Passionate to develop innovative solutions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome to my portfolio! My name is Eligio R. Bautista III, I am a student at Manuel S. Enverga University. In this portfolio, you can find my projects and services, which shows my abilities, creativity, and commitment.\n\nThroughout the years that I have done some programming and repairing computers, I have gained considerable amount of knowledge in these fields, and I am constantly pushing myself to learn new techniques and stay up to date in the industry.\n\nI think that showcasing my works is the greatest way to show off my skills, thus I have included a variety of works in this portfolio.\nEvery project I have worked on has presented a different challenge to me that I conquered, and I am proud of the outcomes.\n\nI appreciate you taking the time to look over my portfolio, and I look forward to discuss with you about how we could collaborate in the future.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ]),
      ),
    ),
  );
}

// SERVICES SCREEN
Widget servicesScreen() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          "assets/images/repair8.png",
          fit: BoxFit.contain,
        ),
      ),
    ]),
  );
}

// PROJECTS SCREEEN
Widget projectsScreen() {
  return SingleChildScrollView(
    controller: projectsScreenController,
    scrollDirection: Axis.vertical,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(
        height: 10,
      ),
      Card(
        shadowColor: Colors.black,
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Student Information System\n(Python, Sqlite3, PyQt6)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: "klavika",
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/sis-1.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/sis-2.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                "\nThis application is a platform that helps schools/colleges take student's information for easier management and helps them to communicate with the students via email.",
                style: TextStyle(
                  fontFamily: "klavika",
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () async {
                        launchWeb(
                            "https://github.com/eligiorbautista/python_student_information_system");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 32, 32, 30),
                      ),
                      child: const Text("Repository"),
                    ),
                  ),
                  const Text(" | "),
                  SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        launchWeb(
                            "https://www.mediafire.com/file/boshh73zrvyb6mv/Student_Information_System_Setup.exe/file");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 32, 32, 30),
                      ),
                      child: const Text("Download"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Card(
        shadowColor: Colors.black,
        elevation: 10,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Youtube Video & Audio Downloader\n(Python, Pytube, PyQt6)",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: "klavika",
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/ytd-1.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "\nThis application is a platform that can be use to download video & audio from extracted from YouTube. ",
                style: TextStyle(
                  fontFamily: "klavika",
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () async {
                        launchWeb(
                            "https://github.com/eligiorbautista/python_youtube_video_audio_downloader");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 32, 32, 30),
                      ),
                      child: const Text("Repository"),
                    ),
                  ),
                  const Text(" | "),
                  SizedBox(
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        launchWeb(
                            "https://www.mediafire.com/file/k9r8njukalv5fkt/Youtube_Video_Audio_Downloader_Setup.exe/file");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 32, 32, 30),
                      ),
                      child: const Text("Download"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ]),
  );
}

// CONTACT SCREEEN
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final contactFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: contactScreenController,
      scrollDirection: Axis.vertical,
      child: Card(
        color: const Color.fromARGB(255, 234, 233, 233),
        elevation: 5,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: contactFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SEND MESSAGE

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "SEND MESSAGE",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "klavika",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(fontSize: 16),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )),
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  minLines: 1,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nameController,
                  style: const TextStyle(fontSize: 16),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Name",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )),
                    filled: true,
                  ),
                  keyboardType: TextInputType.name,
                  minLines: 1,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: messageController,
                  style: const TextStyle(fontSize: 16),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Message",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        )),
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  minLines: 5,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (contactFormKey.currentState!.validate()) {
                          sendEmail(nameController.text, emailController.text,
                              messageController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "We appreciate your message and will get back to you as soon as we can.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              backgroundColor: Color.fromARGB(255, 94, 241, 45),
                            ),
                          );

                          nameController.clear();
                          emailController.clear();
                          messageController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 32, 32, 30)),
                      child: const Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),

                // CONTACT INFORMATION
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "CONTACT INFORMATION",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "klavika",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.location_on),
                    Text(
                      " Tayabas, Quezon Province",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "klavika",
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.phone),
                    Text(
                      " +639338629001",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "klavika",
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.mail),
                    Text(
                      "  it.elibautista@gmail.com",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "klavika",
                          color: Colors.black),
                    ),
                  ],
                ),

                // SOCIALS
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      "SOCIALS",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "klavika",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        iconSize: 20,
                        onPressed: () {
                          launchWeb(
                              "https://www.facebook.com/profile.php?id=100090380258398");
                        },
                        icon: Image.asset(
                          "assets/icons/facebook.png",
                          fit: BoxFit.contain,
                        )),
                    IconButton(
                        iconSize: 20,
                        onPressed: () {
                          launchWeb("https://www.instagram.com/gionapagod_/");
                        },
                        icon: Image.asset(
                          "assets/icons/instagram.png",
                          fit: BoxFit.contain,
                        )),
                    IconButton(
                        iconSize: 20,
                        onPressed: () {
                          launchWeb("https://github.com/eligiorbautista");
                        },
                        icon: Image.asset(
                          "assets/icons/github.png",
                          fit: BoxFit.contain,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SEND EMAIL

Future sendEmail(String name, String email, String message) async {
  automatedEmailResponse(name, email, message);
  String userName = "elibautista.portfolio@gmail.com";
  String userPassword = "rfvimzdnpuneudkq";

  final smtpServer = gmail(userName, userPassword);
  final userMessage = Message()
    ..from = Address(userName, "Eli Bautista Portfolio App")
    ..recipients.add("it.elibautista@gmail.com")
    ..ccRecipients.add("it.elibautista@gmail.com")
    ..bccRecipients.add(const Address("it.elibautista@gmail.com"))
    ..subject = "You have a new message from your portfolio app."
    ..text = ""
    ..html = """
Name:
<br>$name<br><br>

Email:
<br>$email<br><br>

Message: 
<br>$message<br><br>

Date & Time:
<br>${DateTime.now()}

""";

  final sendReport = await send(userMessage, smtpServer);
}

Future automatedEmailResponse(String name, String email, String message) async {
  String userName = "elibautista.portfolio@gmail.com";
  String userPassword = "rfvimzdnpuneudkq";

  final smtpServer = gmail(userName, userPassword);
  final userMessage = Message()
    ..from = Address(userName, "Eli Bautista Portfolio App")
    ..recipients.add(email)
    ..ccRecipients.add(email)
    ..bccRecipients.add(Address(email))
    ..subject = "Your message was successfully sent to Eli Bautista."
    ..text = ""
    ..html = """
<br>Hello, $name<br><br>
<br>Your message was successfully sent to Eli Bautista, we will get back to you as soon as we can.<br><br>
- Automated Message from Eli Bautista Portfolio App<br><br>
Date & Time:
<br>${DateTime.now()}

""";
  final sendReport = await send(userMessage, smtpServer);
}

// SOCIALS
launchWeb(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri);
}
