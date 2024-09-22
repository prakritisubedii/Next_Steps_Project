import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
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
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
