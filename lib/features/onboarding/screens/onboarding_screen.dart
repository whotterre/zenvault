import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    const OnboardingPage(
      title: 'Save Without Hassle',
      description:
      'Build savings effortlessly, so you can focus on what matters most',
      imageIcon: Image(image: AssetImage("assets/images/onboarding/image_one.png")),
    ),
    const OnboardingPage(
      title: 'Investment With High Returns',
      description: 'Maximize your profits and make your money work for you',
      imageIcon: Image(image: AssetImage("assets/images/onboarding/image_two.png")),
    ),
    const OnboardingPage(
      title: 'Saving and investing just got easier',
      description: 'Simplify your life and let us handle all the heavy lifting and hard work.',
      imageIcon: Image(image: AssetImage("assets/images/onboarding/image_three.jpg")),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _pages[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dot indicators
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          _pages.length,
                          (index) => buildDot(index),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Next/Get Started button
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xFF10b982),
                          ),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                        ),
                        onPressed: () {
                          // Go to next page
                          if (_currentPage < _pages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            // Navigate to main app
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(builder: (_) => MainScreen()),
                            // );
                          }
                        },
                        child: Text(
                          _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    // Skip or Login button
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.transparent,
                        ),
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Colors.grey[700]!,
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage == _pages.length - 1) {
                          // Navigate to login
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(builder: (_) => LoginScreen()),
                          // );
                        } else {
                          // Skip to last page
                          _pageController.animateToPage(
                            _pages.length - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? 'Already have an account? Login'
                            : 'Skip',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: _currentPage == index
            ? BorderRadius.circular(5)
            : BorderRadius.circular(1),
        color: _currentPage == index
            ? const Color(0xFF10b982)
            : Colors.grey.shade300,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final Image imageIcon;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 24,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: imageIcon,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black54,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}