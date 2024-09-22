import SwiftUI

struct BookView: View {
    @State private var showSampleQuestions = false
    @State private var showPracticeTest = false
    @State private var showProgressTracker = false
    @State private var showQuiz = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                Text("Naturalization Exam Preparation")
                    .font(.largeTitle)
                    .padding(.top)
                    .padding(.horizontal)
                
                // Exam Overview
                Section(header: Text("Exam Overview")
                    .font(.title2)
                    .padding(.horizontal)) {
                        Text("The naturalization exam consists of two components: the civics test and the English test. It is crucial to understand the structure and content of the exam to prepare effectively.")
                            .padding(.horizontal)
                    }
                
                // Study Resources
                Section(header: Text("Study Resources")
                    .font(.title2)
                    .padding(.horizontal)) {
                        Button(action: {
                            showSampleQuestions.toggle()
                        }) {
                            Text("Sample Questions")
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            showPracticeTest.toggle()
                        }) {
                            Text("Practice Tests")
                        }
                        .padding(.horizontal)
                    }
                
                // Tips and Advice
                Section(header: Text("Tips and Advice")
                    .font(.title2)
                    .padding(.horizontal)) {
                        Text("1. Start preparing early and create a study schedule.\n2. Utilize available study guides and resources.\n3. Practice your English skills regularly.")
                            .padding(.horizontal)
                        
                        Text("Language Resources")
                            .padding(.horizontal)
                            .onTapGesture {
                                // Add your action here
                            }
                    }
                
                // Success Stories
                Section(header: Text("Success Stories")
                    .font(.title2)
                    .padding(.horizontal)) {
                        Text("“Passing the naturalization exam was a significant milestone in my life. The preparation was tough, but the resources and community support helped me succeed.” - John Doe")
                            .padding(.horizontal)
                        
                        Text("“I found the practice tests incredibly helpful. They gave me the confidence I needed to pass the exam.” - Jane Smith")
                            .padding(.horizontal)
                    }
                
                // Interactive Elements
                Section(header: Text("Interactive Elements")
                    .font(.title2)
                    .padding(.horizontal)) {
                        Button(action: {
                            showProgressTracker.toggle()
                        }) {
                            Text("Progress Tracker")
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            showQuiz.toggle()
                        }) {
                            Text("Quiz")
                        }
                        .padding(.horizontal)
                    }
                
                // Community Support
                Section(header: Text("Community Support")
                    .font(.title2)
                    .padding(.horizontal)) {
                        Text("Join our forums to ask questions and get support from the community.")
                            .padding(.horizontal)
                        
                        Text("Find local classes to help you prepare for the exam.")
                            .padding(.horizontal)
                            .onTapGesture {
                                // Add your action here
                            }
                    }
            }
            .padding(.bottom)
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
