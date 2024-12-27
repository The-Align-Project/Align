class Goal {
  bool isCompleted;

  Goal(this.isCompleted);
}

class AIService {
  // Example function to generate insights based on focus score
  static String generateFocusInsight(double focusScore) {
    if (focusScore > 80) {
      return "Great job! You're highly focused today. Keep up the good work!";
    } else if (focusScore > 50) {
      return "You're doing well, but consider taking short breaks to improve focus.";
    } else {
      return "Try minimizing distractions and setting specific goals to boost your productivity.";
    }
  }

  // Function to generate insights based on progress towards goals
  static String generateGoalInsight(List<Goal> goals) {
    int completedGoals = goals.where((goal) => goal.isCompleted).length;
    int totalGoals = goals.length;

    if (completedGoals == totalGoals) {
      return "All your goals are completed! Great work, keep aiming high!";
    } else if (completedGoals > 0) {
      return "You're making progress! You have completed $completedGoals out of $totalGoals goals.";
    } else {
      return "You haven't completed any goals yet. Start by focusing on the most important ones.";
    }
  }

  // Generate insights based on user focus and productivity over time
  static String generateTimeBasedInsight(DateTime currentTime, double focusScore) {
    int hour = currentTime.hour;

    if (hour >= 6 && hour < 12) {
      if (focusScore > 80) {
        return "Good morning! You're starting your day strong. Keep the focus!";
      } else {
        return "Morning energy is key! Take a quick break if you’re losing focus.";
      }
    } else if (hour >= 12 && hour < 18) {
      if (focusScore > 80) {
        return "You're staying productive this afternoon. Keep it going!";
      } else {
        return "Afternoon slump is normal. Stay hydrated and take a break if needed.";
      }
    } else {
      if (focusScore > 80) {
        return "Great work this evening! Wind down for a productive end to the day.";
      } else {
        return "Late night focus can be tough. Consider resting to recharge for tomorrow.";
      }
    }
  }

  // Weekly/Monthly progress insights
  static String generateLongTermInsight(double weeklyFocusScore, double monthlyFocusScore) {
    if (weeklyFocusScore > 80 && monthlyFocusScore > 80) {
      return "You're on fire! Keep up the excellent work both this week and this month!";
    } else if (weeklyFocusScore > 50 || monthlyFocusScore > 50) {
      return "Good job! You're maintaining steady progress. Keep pushing for even better results!";
    } else {
      return "There’s room for improvement. Let’s analyze your habits and set some new goals!";
    }
  }
}