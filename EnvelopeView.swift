import SwiftUI

struct EnvelopeView: View {
    @EnvironmentObject var userData: UserData
    @State private var showSearchBar = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Welcome, \(userData.name)")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showSearchBar.toggle()
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                    }
                }
                .padding()
                
                if showSearchBar {
                    TextField("Search...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading, .trailing])
                }
                
                Spacer().frame(height: 30) // Reduced space
                
                Text("TABLE OF CONTENTS")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 5)
                
                Text("(Select the page you want to navigate to)")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 10) // Reduced space
                
                List {
                    NavigationLink(destination: StepByStepGuideView()) {
                        Text("Step-by-Step Visa Application Guide")
                    }
                    NavigationLink(destination: VisaStatusView()) {
                        Text("Check Your Visa Status")
                    }
                    NavigationLink(destination: FindLegalAssistanceView()) {
                        Text("Find Legal Assistance")
                    }
                    NavigationLink(destination: ImportantDocumentationView()) {
                        Text("Important Documentation for Living in the U.S.")
                    }
                    NavigationLink(destination: RecentUpdatesView()) {
                        Text("Recent Updates/Latest Immigration News")
                    }
                }
            }
            //.navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

//struct StepByStepGuideView: View {
  //  var body: some View {
      //  Text("Step-by-Step Visa Application Guide Content")
          //  .navigationBarTitle("Visa Application Guide", displayMode: .inline)
  //  }
//}

struct CheckVisaStatusView: View {
    var body: some View {
        Text("Check Your Visa Status Content")
            .navigationBarTitle("Visa Status", displayMode: .inline)
    }
}

struct FindLegalAssistantView: View {
    var body: some View {
        Text("Find Legal Assistance Content")
            .navigationBarTitle("Legal Assistance", displayMode: .inline)
    }
}

struct ImportantDocumentationnView: View {
    var body: some View {
        Text("Important Documentation Content")
            .navigationBarTitle("Documentation", displayMode: .inline)
    }
}

struct RecentUpdatesView: View {
    var body: some View {
        Text("Recent Updates/Latest Immigration News Content")
            .navigationBarTitle("Immigration News", displayMode: .inline)
    }
}

struct EnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeView().environmentObject(UserData())
    }
}
