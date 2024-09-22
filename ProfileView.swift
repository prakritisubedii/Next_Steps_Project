import SwiftUI

struct ProfileView: View {
    @AppStorage("email") var email: String = ""
    @AppStorage("name") var name: String = ""
    @AppStorage("dob") var dob: String = ""
    
    @State private var showSearchBar = false
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        showSearchBar.toggle()
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .padding()
                }
            }
            
            if showSearchBar {
                TextField("Search...", text: $searchText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    .transition(.move(edge: .top))
            }
            
            HStack(alignment: .top) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text("Name: \(name)")
                    Text("DOB: \(dob)")
                    Text("Email: \(email)")
                    Text("Status: ")
                }
                .padding(.top, 5)
                
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Reminders and Checklist")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Divider()
                    Text("• Task 1\n• Task 2\n• Task 3")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text("News and Updates")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Divider()
                    Text("• Update 1\n• Update 2\n• Update 3")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack {
                NavigationLink(destination: BriefcaseView()) {
                    Image(systemName: "briefcase.fill")
                }
                Spacer()
                NavigationLink(destination: EnvelopeView()) {
                    Image(systemName: "envelope.fill")
                }
                Spacer()
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.fill").scaleEffect(1.5)
                }
                Spacer()
                NavigationLink(destination: HouseView()) {
                    Image(systemName: "house.fill")
                }
                Spacer()
                NavigationLink(destination: BookView()) {
                    Image(systemName: "book.fill")
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(5)
        }
        .padding()
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // Load user data when ProfileView appears
            if let storedEmail = UserDefaults.standard.string(forKey: "email") {
                email = storedEmail
            }
            if let storedName = UserDefaults.standard.string(forKey: "name") {
                name = storedName
            }
            if let storedDob = UserDefaults.standard.string(forKey: "dob") {
                dob = storedDob
            }
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
