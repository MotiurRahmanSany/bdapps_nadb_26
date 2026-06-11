import 'package:flutter/material.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int currentQuestionIndex = 0;
  // Store selected option index for each question
  final Map<int, int> selectedAnswers = {};

  final List<Map<String, dynamic>> questions = [
    {
      'text': 'What is Flutter?',
      'options': ['Framework', 'Database', 'Language', 'IDE'],
    },
    {
      'text': 'What is Dart?',
      'options': ['Programming Language', 'Database', 'Framework', 'Tool'],
    },
    {
      'text': 'Which widget is used for a scrollable list?',
      'options': ['Column', 'ListView', 'Container', 'Row'],
    },
    {
      'text': 'What is the purpose of setState()?',
      'options': ['Rebuild UI', 'Fetch data', 'Navigate', 'Style widget'],
    },
    {
      'text': 'Which function is the entry point of a Flutter app?',
      'options': ['start()', 'runApp()', 'main()', 'init()'],
    },
    {
      'text': 'What is a StatelessWidget?',
      'options': ['Mutable UI', 'Immutable UI', 'Stateful UI', 'Dynamic UI'],
    },
    {
      'text': 'What does "hot reload" do?',
      'options': [
        'Restart app',
        'Update UI without losing state',
        'Clear cache',
        'Rebuild everything',
      ],
    },
    {
      'text': 'Which package is used for HTTP requests?',
      'options': ['http', 'dio', 'both', 'requests'],
    },
    {
      'text': 'What is the default database in Flutter?',
      'options': ['SQLite', 'Firebase', 'MongoDB', 'SharedPreferences'],
    },
    {
      'text': 'Which command creates a new Flutter project?',
      'options': [
        'flutter new',
        'flutter create',
        'flutter init',
        'flutter start',
      ],
    },
  ];

  // Helper to get current question data
  Map<String, dynamic> get currentQuestion => questions[currentQuestionIndex];
  List<String> get currentOptions =>
      List<String>.from(currentQuestion['options']);
  int? get currentSelectedIndex => selectedAnswers[currentQuestionIndex];

  void goToPrevious() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void goToNext() {
    if (selectedAnswers[currentQuestionIndex] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.warning_amber_rounded, color: Colors.white, size: 20),
              SizedBox(width: 12),
              Expanded(
                child: Text('Please select an option before proceeding'),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.orange.shade700,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    // If last question, submit quiz
    if (currentQuestionIndex == questions.length - 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Quiz completed!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
      return;
    }

    // Move to next question
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> options = currentOptions;
    final int? selectedIndex = currentSelectedIndex;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Quiz',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Question ${currentQuestionIndex + 1}/${questions.length}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                currentQuestion['text'],
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 28),
              // Options list
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswers[currentQuestionIndex] = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF7366FF)
                                : const Color(0xFFEAEAEA),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: isSelected
                                  ? const Color(0xFF7366FF)
                                  : Colors.black54,
                              size: 20,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                options[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.info_outline,
                              color: Colors.black54,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Previous & Next buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: currentQuestionIndex == 0
                            ? null
                            : goToPrevious,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF7366FF),
                          side: const BorderSide(color: Color(0xFF7366FF)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Previous'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: goToNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7366FF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          currentQuestionIndex == questions.length - 1
                              ? 'Submit'
                              : 'Next',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
