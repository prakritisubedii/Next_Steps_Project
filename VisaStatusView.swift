import SwiftUI

struct VisaStatusView: View {
    @State private var applicationNumber: String = ""
    @State private var notificationsEnabled: Bool = true
    
    var body: some View {
        VStack {
            // Header
            Text("Check Your Visa Status")
                .font(.title)
                .padding(.top)
            
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Enter Application Number", text: $applicationNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            // Status Overview
            VStack(alignment: .leading, spacing: 10) {
                Text("Status Overview")
                    .font(.headline)
                
                Text("Application Number: \(applicationNumber)")
                Text("Visa Type: [Visa Type]") // Replace with actual visa type
                Text("Current Status: [Status]") // Replace with actual status
                Text("Last Updated: [Date]") // Replace with actual date
                Text("Next Steps: [What to Expect Next]") // Replace with next steps
            }
            .padding()
            
            // Notifications and Status History
            VStack(alignment: .leading, spacing: 10) {
                Toggle(isOn: $notificationsEnabled) {
                    Text("Notifications: Toggle for Real-Time Updates")
                }
                
                Text("Status History: View History of Status Changes")
                    .foregroundColor(.blue)
                    .onTapGesture {
                        // Action for viewing status history
                    }
            }
            .padding()
            
            Spacer()
            
            // Navigation Bar
            HStack {
                NavigationLink(destination: EnvelopeView()) {
                    Text("T.O.C")
                }
                
                Spacer()
                
                NavigationLink(destination: StepByStepGuideView()) {
                    Text("Guides")
                }
                
                Spacer()
                
                NavigationLink(destination: FindLegalAssistanceView()) {
                    Text("Legal Aid")
                }
                
                Spacer()
                
                // Remove the NavigationLink for current page to avoid redundancy
                Text("Visa Status")
                    .foregroundColor(.gray)
                
                Spacer()
                
                NavigationLink(destination: ImportantDocumentationView()) {
                    Text("Docs")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
        }
        .navigationBarHidden(true) // Optional: Hide navigation bar if using NavigationView
    }
}

// Placeholder Views for Navigation Links
struct TOCView: View {
    var body: some View {
        Text("TOC Page")
    }
}

struct GuidesView: View {
    var body: some View {
        Text("Guides Page")
    }
}

struct FindLegalAssistanttView: View {
    var body: some View {
        Text("Legal Aid Page")
    }
}

struct DocumentationView: View {
    var body: some View {
        Text("Docs Page")
    }
}

struct VisaStatusView_Previews: PreviewProvider {
    static var previews: some View {
        VisaStatusView()
    }
}
