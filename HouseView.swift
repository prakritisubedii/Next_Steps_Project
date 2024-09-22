import SwiftUI

struct HouseView: View {
    @State private var showSearchBar: Bool = false
    @State private var searchQuery: String = ""
    @State private var location: String = ""
    @State private var bedrooms: String = ""
    @State private var bathrooms: String = ""
    @State private var priceRange: String = ""
    @State private var savedListings: [String] = []
    @State private var monthlyIncome: String = ""
    @State private var housingPercentage: String = ""
    @State private var housingBudget: Double?
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    let locationOptions = ["New York", "San Francisco", "Los Angeles" , "Florida", "Texas"]
    let bedroomOptions = ["1", "2", "3", "4+"]
    let bathroomOptions = ["1", "2", "3", "4+"]
    let priceRangeOptions = ["<1000", "1000-2000", "2000-3000", ">3000"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Search Icon
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
                    
                    // Search Bar
                    if showSearchBar {
                        TextField("Search", text: $searchQuery)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    // Dropdown Menus with a bit more spacing
                    VStack(spacing: 20) {
                        HStack(spacing: 10) {
                            DropdownMenu(label: location.isEmpty ? "Location" : location, options: locationOptions, selection: $location)
                            DropdownMenu(label: bedrooms.isEmpty ? "Bedrooms" : bedrooms, options: bedroomOptions, selection: $bedrooms)
                        }
                        HStack(spacing: 10) {
                            DropdownMenu(label: bathrooms.isEmpty ? "Bathrooms" : bathrooms, options: bathroomOptions, selection: $bathrooms)
                            DropdownMenu(label: priceRange.isEmpty ? "Price Range" : priceRange, options: priceRangeOptions, selection: $priceRange)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20) // Add top padding for better spacing
                    
                    // House Listings
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Housing Listings from Websites (ex. Zillow)")
                            .font(.headline)
                        ListingView(title: "Listing 1", savedListings: $savedListings)
                        ListingView(title: "Listing 2", savedListings: $savedListings)
                        ListingView(title: "Listing 3", savedListings: $savedListings)
                    }
                    .padding(.horizontal)
                    
                    // Add some spacing between listings and input fields
                    Spacer()
                        .frame(height: 20)
                    
                    // Input Fields for Budget Calculation
                    VStack(alignment: .leading) {
                        TextField("Monthly Income", text: $monthlyIncome)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        TextField("Percentage of Income Allocated to Housing", text: $housingPercentage)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    // Calculate Button
                    Button(action: calculateBudget) {
                        Text("Calculate")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    // Output Field
                    if let budget = housingBudget {
                        VStack {
                            Text("Housing Budget: $\(String(format: "%.2f", budget))")
                                .font(.title2)
                                .padding()
                            Link("View Listings on Zillow", destination: URL(string: "https://www.zillow.com/homes/for_sale/\(Int(budget))_price/")!)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    
                    // Error Message
                    if showError {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("Housing", displayMode: .inline)
        }
    }
    
    func calculateBudget() {
        guard let income = Double(monthlyIncome), income > 0 else {
            showError = true
            errorMessage = "Please enter a valid positive monthly income."
            return
        }
        guard let percentage = Double(housingPercentage), percentage > 0, percentage <= 100 else {
            showError = true
            errorMessage = "Please enter a valid percentage (1-100)."
            return
        }
        
        housingBudget = (income * percentage) / 100
        showError = false
    }
}

struct DropdownMenu: View {
    var label: String
    var options: [String]
    @Binding var selection: String
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selection = option
                }
            }
        } label: {
            HStack {
                Text(label)
                    .font(.system(size: 14))
                    .padding(5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                Image(systemName: "chevron.down")
                    .padding(5)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ListingView: View {
    var title: String
    @Binding var savedListings: [String]
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Button(action: {
                if savedListings.contains(title) {
                    savedListings.removeAll { $0 == title }
                } else {
                    savedListings.append(title)
                }
            }) {
                Image(systemName: savedListings.contains(title) ? "bookmark.fill" : "bookmark")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct HouseView_Previews: PreviewProvider {
    static var previews: some View {
        HouseView()
    }
}
