class AIService {
  // Example function to generate insights based on user data
  static String generateInsight(double focusScore) {
    if (focusScore > 80) {
      return "Great job! You're highly focused today.";
    } else if (focusScore > 50) {
      return "You're doing well, but consider taking short breaks to improve focus.";
    } else {
      return "Try minimizing distractions to boost your productivity.";
    }
  }
}