import Foundation

struct HabitModel: Identifiable, Hashable {
    let id = UUID()
    var apID: Int
    var name: String
    var description: String = ""
    var imageName: String
    var minDescp: String
    var streak: Int
    var completed: Bool
    
    
    static var standartHabits = [
        HabitModel(apID: 0,
                   name: "Meditate",
                   description: "Mindful meditation is something that became very popular in the last few years. Its idea is to focus on breathing and bringing attention to the present without letting any thoughts surround you. We are sure that mindfulness meditation is one of the best possible treatments for anxiety.",
                   imageName: "man-doing-yoga-meditation-svgrepo-com",
                   minDescp: "Learn how to ignore distracting thoughts",
                   streak: 0,
                   completed: false),
        HabitModel(apID: 0,
                   name: "Exercise",
                   description: "Ready to get in shape? Here is a list of benefits of exercising regularly:\n\n - Improved sleep\n - Stress relief\n - Improvement in mood\n - Increase in energy levels\n - Lower levels of cholesterol and smaller risks of cardiovascular diseases\n - Weight reduction\n - Reduced tiredness",
                   imageName: "exercising-svgrepo-com",
                   minDescp: "Improve your mental and physical shape",
                   streak: 0,
                   completed: false),
        HabitModel(apID: 0,
                   name: "Drink enough water",
                   description: "Did you know that the brain is approximately made up of 76% water?\n\nThere is a direct connection between good hydration and decreased levels of             depression and a slightly weaker connection between good hydration and decreased levels of anxiety.",
                   imageName: "glass-of-water-drink-svgrepo-com",
                   minDescp: "Boost your hydration levels",
                   streak: 2,
                   completed: false),
        HabitModel(apID: 0,
                   name: "Avoid vices",
                   description: "The cost of dealing with substance addictions is estimated at 80 billion dollars in the United States. Drinking alcohol, smoking nicotine products, and taking drugs are the 3 main vices that are extremely harmful to your mental well-being.",
                   imageName: "dieting-diet-avoid-fast-food-no-food-allowed-svgrepo-com",
                   minDescp: "No addictive substances from now on",
                   streak: 2,
                   completed: false),
        HabitModel(apID: 0,
                   name: "Limit screen minDescp",
                   description: "Limiting your screen minDescp can rescue you from infinite scrolling on social media. This activity is as addictive as using drugs, drinking alcohol, or playing slot machines.",
                   imageName: "phone-screen-minDescp-svgrepo-com",
                   minDescp: "Save your time from infinite scrolling ",
                   streak: 2,
                   completed: false),
        HabitModel(apID: 0,
                   name: "Eat healthily",
                   description: "- Eat regularly to prevent sugar levels from dropping too low which may make you feel tired\n- Eat the right balance of fats which are very important for normal brain function\n- Make sure to include some protein that contains amino acids that help to regulate your mood\n- Avoid drinking more than 2 cups of coffee per day since caffeine is a chemical that promotes anxiety for some people\n- Avoid high amounts of refined sugars in the diet because it may lead to mood disorders such as depression and anxiety",
                   imageName: "eat-svgrepo-com",
                   minDescp: "Help your body perform day-to-day functions",
                   streak: 2,
                   completed: false),
        HabitModel(apID: 0,
                   name: "Sleep well",
                   description: "People who work night shifts have a greater risk of having cancer and heart disease. Sleep problems are very common among patients with ADHD, anxiety, and depression. We recommend users sleep at least 7 hours every day.",
                   imageName: "sleep-svgrepo-com",
                   minDescp: "Take your regime under control",
                   streak: 2,
                   completed: false)
        
    ]
}
