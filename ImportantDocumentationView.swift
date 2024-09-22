import SwiftUI

struct ImportantDocumentationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedCategory: String? = nil // Track selected category
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                // Title and Back Navigation
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Text("Important Documentation for Living in the U.S.")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
                
                // Search Bar (assuming a reusable component)
                SearchBarView()
                    .padding(.bottom, 10)
                
                // Categories
                Text("Categories")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Button(action: {
                        self.selectedCategory = "Residency Papers"
                        // Handle navigation or display relevant information for Residency Papers
                    }) {
                        Text("Residency Papers")
                    }
                    .foregroundColor(.blue)
                    
                    Button(action: {
                        self.selectedCategory = "Work Permits"
                        // Handle navigation or display relevant information for Work Permits
                    }) {
                        Text("Work Permits")
                    }
                    .foregroundColor(.blue)
                    
                    Button(action: {
                        self.selectedCategory = "Social Security Number"
                        // Handle navigation or display relevant information for Social Security Number
                    }) {
                        Text("Social Security Number")
                    }
                    .foregroundColor(.blue)
                    
                    Button(action: {
                        self.selectedCategory = "Driver's License"
                        // Handle navigation or display relevant information for Driver's License
                    }) {
                        Text("Driver's License")
                    }
                    .foregroundColor(.blue)
                    
                    Button(action: {
                        self.selectedCategory = "Health Insurance"
                        // Handle navigation or display relevant information for Health Insurance
                    }) {
                        Text("Health Insurance")
                    }
                    .foregroundColor(.blue)
                }
                .padding(.bottom, 15)
                
                // Display selected category information or navigation
                if let selectedCategory = selectedCategory {
                    DocumentView(category: selectedCategory)
                        .padding(.bottom, 15)
                }
            }
            .padding()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true) // Optional: Hide navigation bar if using NavigationView
    }
}

// Document View Component
struct DocumentView: View {
    var category: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Document View:")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("Title: \(category)")
                .font(.headline)
            
            Text("Description: Overview of the Document")
                .padding(.leading, 10)
            
            Text("Requirements: [List of required Documents]")
                .padding(.leading, 10)
            
            Text("Application Process: [Step-by-Step Process]")
                .padding(.leading, 10)
            
            Text("FAQs: Common Questions with Answers")
                .padding(.leading, 10)
            
            Text("Useful Links: [Links to Official Resources]")
                .padding(.leading, 10)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

// Reusable Search Bar Component
struct SearchBarView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.horizontal)
    }
}

struct DocumentationView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationView()
    }
}

