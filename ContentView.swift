import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var dob: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Welcome to")
                    .font(.title)
                
                Text("NEXT STEPS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 10)
                
                TextField("Name (First Last)", text: $name)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 10)
                
                TextField("DOB", text: $dob)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .padding(.bottom, 10)
                
                NavigationLink(destination: WalkthroughView()) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding(.bottom, 5)
                
                NavigationLink(destination: ProfileView()) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding(.bottom, 5)
                
                Button(action: {
                    // Forgot Password action
                }) {
                    Text("Forgot Password?")
                }
                
                Spacer()
                
                Button(action: {
                    // Change Language action
                }) {
                    HStack {
                        Image(systemName: "flag.fill")
                        Text("Change Language")
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct WalkthroughView: View {
    var body: some View {
        Text("Automatic Walkthrough")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

