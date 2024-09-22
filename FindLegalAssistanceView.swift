import SwiftUI

struct FindLegalAssistanceView: View {
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
                    Text("Find Legal Assistant")
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
                        self.selectedCategory = "Immigration Lawyers"
                        // Handle navigation or display relevant information for Immigration Lawyers
                    }) {
                        Text("Immigration Lawyers")
                    }
                    .foregroundColor(.blue)
                    
                    Button(action: {
                        self.selectedCategory = "Legal Aid Organizations"
                        // Handle navigation or display relevant information for Legal Aid Organizations
                    }) {
                        Text("Legal Aid Organizations")
                    }
                    .foregroundColor(.blue)
                    
                    Button(action: {
                        self.selectedCategory = "Pro Bono Services"
                        // Handle navigation or display relevant information for Pro Bono Services
                    }) {
                        Text("Pro Bono Services")
                    }
                    .foregroundColor(.blue)
                }
                .padding(.bottom, 15)
                
                // Display selected category information or navigation
                if let selectedCategory = selectedCategory {
                    Text("Selected Category: \(selectedCategory)")
                        .font(.headline)
                        .padding(.bottom, 10)
                }
                
                // Service Listings (dummy example)
                Text("Service Listings")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    ServiceListingView(name: "Lawyer/Service Name", specialty: "Immigration Law, Family Visa, etc", location: "City, State", contact: "Phone number, Email", ratings: "User Ratings and Feedback")
                    
                    // Additional Service Listings can be added here
                }
                .padding(.bottom, 15)
                
                // Featured Services (dummy example)
                Text("Featured Services")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("- Highly Rated Services 1")
                    Text("- Highly Rated Services 2")
                    Text("- Highly Rated Services 3")
                    
                    // Add more featured services as needed
                }
            }
            .padding()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true) // Optional: Hide navigation bar if using NavigationView
    }
}

// Reusable Component for Service Listings
struct ServiceListingView: View {
    var name: String
    var specialty: String
    var location: String
    var contact: String
    var ratings: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Name: \(name)")
            Text("Specialty: \(specialty)")
            Text("Location: \(location)")
            Text("Contact: \(contact)")
            Text("Ratings: \(ratings)")
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

// Reusable Search Bar Component
struct SearchBarVieew: View {
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

struct FindLegalAssistanceView_Previews: PreviewProvider {
    static var previews: some View {
        FindLegalAssistanceView()
    }
}
